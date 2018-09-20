/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * max17260.c: Driver for MAX17260 1-cell fuel gauge
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "max17260.h"
#include "bq24195.h"

#include "bricklib2/bootloader/bootloader.h"
#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/os/coop_task.h"

#include "configs/config_max17260.h"
#include "configs/config_bq24195.h"

#define MAX17260_LEARNED_PARAMETER_SAVE_INTERVAL 1000*60*60*8 // Save learned parameters every 8 hours
#define MAX17260_OFFLINE_RETRY_INTERVAL 250 // Try again in 250ms if max17260 is not reachable
#define MAX17260_BATTERY_DETECT_INVERVAL 1000 // Find out if battery is still connected very 1000ms


MAX17260 max17260;
CoopTask max17260_task;

typedef int32_t (*MAX17260RegFunc)(uint8_t*);

typedef struct {
	uint8_t reg;
	int32_t *data;
	MAX17260RegFunc func;
} MAX17260ReadRegister;

int32_t max17260_reg_to_capacity(uint8_t data[2]) { // in mAh
	return (data[0] | (data[1] << 8))/2;
}

int32_t max17260_reg_to_percentage(uint8_t data[2]) { // in 0.01%
	return (data[0] | (data[1] << 8))*100/256;
}

int32_t max17260_reg_to_voltage(uint8_t data[2]) { // in mV
	uint64_t voltage_nv = ((uint64_t)78125)*((uint64_t)(data[0] | (data[1] << 8)));
	return voltage_nv / (1000*1000);
}

int32_t max17260_reg_to_current(uint8_t data[2]) { // in mA
	int16_t signed_data = *((int16_t*)data);
	return signed_data*15625 / (1000*100);
}

int32_t max17260_reg_to_temperature(uint8_t data[2]) { // in 0.01°C
	int16_t signed_data = *((int16_t*)data);
	return signed_data*100/256;
}

int32_t max17260_reg_to_resistance(uint8_t data[2]) { // in mOhm
	return (data[0] | (data[1] << 8))*1000/4096;
}

int32_t max17260_reg_to_time(uint8_t data[2]) { // in min
	return (data[0] | (data[1] << 8))*5625/60000;
}

int32_t max17260_reg_to_status(uint8_t data[2]) {
	return (data[0] | (data[1] << 8));
}

const MAX17260ReadRegister max17260_read[] = {
	{MAX17260_REG_DESIGN_CAP,   &max17260.capacity_nominal,    max17260_reg_to_capacity},
	{MAX17260_REG_REP_CAP,      &max17260.capacity_remaining,  max17260_reg_to_capacity},
	{MAX17260_REG_REP_SOC,      &max17260.percentage_charge,   max17260_reg_to_percentage},
	{MAX17260_REG_FULL_CAP_REP, &max17260.capacity_full,       max17260_reg_to_capacity},
	{MAX17260_REG_TTE,          &max17260.time_to_emtpy,       max17260_reg_to_time},
	{MAX17260_REG_TTF,          &max17260.time_to_full,        max17260_reg_to_time},
	{MAX17260_REG_STATUS,       &max17260.status,              max17260_reg_to_status},
	{MAX17260_REG_AVG_V_CELL,   &max17260.voltage_battery,     max17260_reg_to_voltage},
	{MAX17260_REG_AVG_CURRENT,  &max17260.current_flow,        max17260_reg_to_current},
	{MAX17260_REG_TEMP,         &max17260.temperature_battery, max17260_reg_to_temperature}
};

uint32_t max17260_write_register(const uint8_t reg, uint16_t data) {
	uint32_t error = 0;
	while(true) {
		error = i2c_fifo_coop_write_register(&max17260.i2c_fifo, reg, 2, (uint8_t*)&data, true);
		if(error == I2C_FIFO_STATUS_MUTEX) {
			coop_task_yield();
			continue;
		}

		break;
	}

	return error;
}

uint32_t max17260_read_register(const uint8_t reg, uint16_t *data) {
	uint32_t error = 0;
	while(true) {
		error = i2c_fifo_coop_read_register(&max17260.i2c_fifo, reg, 2, (uint8_t*)data);

		if(error == I2C_FIFO_STATUS_MUTEX) {
			coop_task_yield();
			continue;
		}

		break;
	}

	return error;
}

uint32_t max17260_write_and_verify_register(const uint8_t reg, uint16_t data) {
	uint16_t data_read;
	uint32_t retr;
	uint32_t retw;

	// We try with up to three attempts
	for(uint8_t i = 0; i < 3; i++) {
		retw = max17260_write_register(reg, data);
		coop_task_sleep_ms(1);
		if(retw != 0) {
			continue;
		}
		retr = max17260_read_register(reg, &data_read);

		if((retr != 0) || (data_read == data)) {
			return 0;
		}
	}

	return retw != 0 ? retw : retr;
}

int32_t max17260_read_learned_parameters_from_eeprom(MAX17260LearnedParameters *learned_paramters) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];
	bootloader_read_eeprom_page(MAX17260_PARAMETER_PAGE, page);

	if(page[MAX17260_PARAMETER_MAGIC_POS] != MAX17260_PARAMETER_MAGIC) {
		return -1;
	}

	uint32_t checksum = page[MAX17260_PARAMETER_START_POS + 0] ^
	                    page[MAX17260_PARAMETER_START_POS + 1] ^
						page[MAX17260_PARAMETER_START_POS + 2] ^
						page[MAX17260_PARAMETER_START_POS + 3] ^
						page[MAX17260_PARAMETER_START_POS + 4] ^
						page[MAX17260_PARAMETER_START_POS + 5] ^
						page[MAX17260_PARAMETER_START_POS + 6] ^
						page[MAX17260_PARAMETER_START_POS + 7];

	if(checksum != page[MAX17260_PARAMETER_CHECKSUM_POS]) {
		return -2;
	}

	learned_paramters->rcomp0     = page[MAX17260_PARAMETER_START_POS + 0];
	learned_paramters->tempco     = page[MAX17260_PARAMETER_START_POS + 1];
	learned_paramters->fullcaprep = page[MAX17260_PARAMETER_START_POS + 2];
	learned_paramters->cycles     = page[MAX17260_PARAMETER_START_POS + 3];
	learned_paramters->fullcapnom = page[MAX17260_PARAMETER_START_POS + 4];
	learned_paramters->designcap  = page[MAX17260_PARAMETER_START_POS + 5];
	learned_paramters->vempty     = page[MAX17260_PARAMETER_START_POS + 6];
	learned_paramters->ichgterm   = page[MAX17260_PARAMETER_START_POS + 7];

	return 0;
}

int32_t max17260_write_learned_parameters_to_eeprom(MAX17260LearnedParameters *learned_paramters) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];

	page[MAX17260_PARAMETER_MAGIC_POS]     = MAX17260_PARAMETER_MAGIC;
	page[MAX17260_PARAMETER_START_POS + 0] = learned_paramters->rcomp0;
	page[MAX17260_PARAMETER_START_POS + 1] = learned_paramters->tempco;
	page[MAX17260_PARAMETER_START_POS + 2] = learned_paramters->fullcaprep;
	page[MAX17260_PARAMETER_START_POS + 3] = learned_paramters->cycles;
	page[MAX17260_PARAMETER_START_POS + 4] = learned_paramters->fullcapnom;
	page[MAX17260_PARAMETER_START_POS + 5] = learned_paramters->designcap;
	page[MAX17260_PARAMETER_START_POS + 6] = learned_paramters->vempty;
	page[MAX17260_PARAMETER_START_POS + 7] = learned_paramters->ichgterm;
	page[MAX17260_PARAMETER_CHECKSUM_POS]  = page[MAX17260_PARAMETER_START_POS + 0] ^
	                                         page[MAX17260_PARAMETER_START_POS + 1] ^
											 page[MAX17260_PARAMETER_START_POS + 2] ^
											 page[MAX17260_PARAMETER_START_POS + 3] ^
											 page[MAX17260_PARAMETER_START_POS + 4] ^
											 page[MAX17260_PARAMETER_START_POS + 5] ^
											 page[MAX17260_PARAMETER_START_POS + 6] ^
											 page[MAX17260_PARAMETER_START_POS + 7];

	if(!bootloader_write_eeprom_page(MAX17260_PARAMETER_PAGE, page)) {
		return -1;
	}

	return 0;
}

int32_t max17260_read_learned_parameters_from_chip(MAX17260LearnedParameters *learned_paramters) {
	if(max17260_read_register(MAX17260_REG_RCOMP0,       &learned_paramters->rcomp0)     != 0) { return -1; }
	if(max17260_read_register(MAX17260_REG_TEMP_CO,      &learned_paramters->tempco)     != 0) { return -2; }
	if(max17260_read_register(MAX17260_REG_FULL_CAP_REP, &learned_paramters->fullcaprep) != 0) { return -3; }
	if(max17260_read_register(MAX17260_REG_CYCLES,       &learned_paramters->cycles)     != 0) { return -4; }
	if(max17260_read_register(MAX17260_REG_FULL_CAP_NOM, &learned_paramters->fullcapnom) != 0) { return -5; }
	if(max17260_read_register(MAX17260_REG_DESIGN_CAP,   &learned_paramters->designcap)  != 0) { return -6; }
	if(max17260_read_register(MAX17260_REG_VEMPTY,       &learned_paramters->vempty)     != 0) { return -7; }
	if(max17260_read_register(MAX17260_REG_ICH_G_TERM,   &learned_paramters->ichgterm)   != 0) { return -8; }

	return 0;
}

int32_t max17260_write_learned_parameters_to_chip(MAX17260LearnedParameters *learned_paramters) {
	if(max17260_write_and_verify_register(MAX17260_REG_DESIGN_CAP,   learned_paramters->designcap)  != 0) { return -1; }
	if(max17260_write_and_verify_register(MAX17260_REG_VEMPTY,       learned_paramters->vempty)     != 0) { return -2; }
	if(max17260_write_and_verify_register(MAX17260_REG_ICH_G_TERM,   learned_paramters->ichgterm)   != 0) { return -3; }
	if(max17260_write_and_verify_register(MAX17260_REG_RCOMP0,       learned_paramters->rcomp0)     != 0) { return -4; }
	if(max17260_write_and_verify_register(MAX17260_REG_TEMP_CO,      learned_paramters->tempco)     != 0) { return -5; }
	if(max17260_write_and_verify_register(MAX17260_REG_FULL_CAP_REP, learned_paramters->fullcaprep) != 0) { return -6; }
	if(max17260_write_and_verify_register(MAX17260_REG_CYCLES,       learned_paramters->cycles)     != 0) { return -7; }
	if(max17260_write_and_verify_register(MAX17260_REG_FULL_CAP_NOM, learned_paramters->fullcapnom) != 0) { return -8; }

	return 0;
}

int32_t max17260_set_config(bool i2c_init) {
	uint16_t reg_data;
	if(i2c_init) {
		i2c_fifo_init(&max17260.i2c_fifo);
	}

	uint16_t config1 = (MAX17260_CONFIG1_TSEL     << 15) |
	                   (MAX17260_CONFIG1_SS       << 14) |
	                   (MAX17260_CONFIG1_TS       << 13) |
	                   (MAX17260_CONFIG1_VS       << 12) |
	                   (MAX17260_CONFIG1_IS       << 11) |
	                   (MAX17260_CONFIG1_THSH     << 10) |
	                   (MAX17260_CONFIG1_TEN      <<  9) |
	                   (MAX17260_CONFIG1_TEX      <<  8) |
	                   (MAX17260_CONFIG1_SHDN     <<  7) |
	                   (MAX17260_CONFIG1_COMMSH   <<  6) |
	                   (MAX17260_CONFIG1_D5       <<  5) |
	                   (MAX17260_CONFIG1_ETHRM    <<  4) |
	                   (MAX17260_CONFIG1_FTHRM    <<  3) |
	                   (MAX17260_CONFIG1_AEN      <<  2) |
	                   (MAX17260_CONFIG1_BEI      <<  1) |
	                   (MAX17260_CONFIG1_BER      <<  0);
	
	uint16_t config2 = (MAX17260_CONFIG2_D15      << 15) |
	                   (MAX17260_CONFIG2_D14      << 14) |
	                   (MAX17260_CONFIG2_ATRATEEN << 13) |
	                   (MAX17260_CONFIG2_DPEN     << 12) |
	                   (MAX17260_CONFIG2_PWR      <<  8) |
	                   (MAX17260_CONFIG2_DSOCEN   <<  7) |
	                   (MAX17260_CONFIG2_TAIRTEN  <<  6) |
	                   (MAX17260_CONFIG2_LDMDI    <<  5) |
	                   (MAX17260_CONFIG2_D4       <<  4) |
	                   (MAX17260_CONFIG2_DRCFG    <<  2) |
	                   (MAX17260_CONFIG2_CPMODE   <<  1) |
	                   (MAX17260_CONFIG2_D0       <<  0);

	uint16_t model   = (MAX17260_MODEL_REFRESH    << 15) |
	                   (MAX17260_MODEL_D14        << 14) |
	                   (MAX17260_MODEL_R100       << 13) |
	                   (MAX17260_MODEL_D12        << 12) |
	                   (MAX17260_MODEL_D11        << 11) |
	                   (MAX17260_MODEL_VCHG       << 10) |
	                   (MAX17260_MODEL_D9         <<  9) |
	                   (MAX17260_MODEL_D8         <<  8) |
	                   (MAX17260_MODEL_MODELLID   <<  4) |
	                   (MAX17260_MODEL_D3         <<  3) |
	                   (MAX17260_MODEL_CSEL       <<  2) |
	                   (MAX17260_MODEL_D1         <<  1) |
	                   (MAX17260_MODEL_D0         <<  0);

	
	if(max17260_read_register(MAX17260_REG_STATUS, &reg_data) != 0) {
		return -1;
	}

	// This is taken from software implementation guide, it is not described in the datasheet!
	if(reg_data & MAX17260_STATUS_POR) {
		do {
			coop_task_sleep_ms(10);
			if(max17260_read_register(MAX17260_REG_FSTAT, &reg_data) != 0) {
				return -2;
			}
		} while(reg_data & MAX17260_FSTAT_DNR); // Wait until DNR bit of FSTAT register is set
		max17260.fully_qualified = reg_data & MAX17260_FSTAT_FQ;

		// Write standard configuration
		if(max17260_write_register(MAX17260_REG_CONFIG1,   config1) != 0) { return -3; }
		if(max17260_write_register(MAX17260_REG_CONFIG2,   config2) != 0) { return -4; }
		if(max17260_write_register(MAX17260_REG_MODEL_CFG, model)   != 0) { return -5; }

		// Write learned parameters
		if(!max17260.learned_paramters_valid) {
			if(max17260_write_register(MAX17260_REG_VEMPTY,     MAX17260_VEMPTY)      != 0) { return -6; }
			if(max17260_write_register(MAX17260_REG_DESIGN_CAP, MAX17260_DESIGN_CAP)  != 0) { return -7; }
			if(max17260_write_register(MAX17260_REG_ICH_G_TERM, MAX17260_ICH_G_TERM)  != 0) { return -8; }
		} else {
			if(max17260_write_learned_parameters_to_chip(&max17260.learned_paramters) != 0) { return -9; }
		}

		// Read current status
		if(max17260_read_register(MAX17260_REG_STATUS, &reg_data) != 0) { 
			return  -10;
		}
		// Clear POR bit
		if(max17260_write_and_verify_register(MAX17260_REG_STATUS, reg_data & 0xFFFD) != 0) {
			return -11;
		}
	}

	return 0;
}

void max17260_tick_task(void) {
	if(max17260_read_learned_parameters_from_eeprom(&max17260.learned_paramters) == 0) {
		max17260.learned_paramters_valid = true;
	} else {
		max17260.learned_paramters_valid = false;
	}

	bool new_set_config = true;
	max17260.new_init = true;
	uint32_t battery_detect_time = 0;
	while(true) {
		if(new_set_config) {
			// If we land here there was an I2C error. Most likely the battery is disconnected
			// and the MAX17260 IC is not powered anymore. In this case we try to reconfigure
			// the I2C state machine as well as the MAX17260 every 250ms
			max17260.battery_connected = false;
			coop_task_sleep_ms(MAX17260_OFFLINE_RETRY_INTERVAL);
			if(max17260_set_config(max17260.new_init) < 0) {
				new_set_config = true;
				max17260.new_init = true;
			} else {
				new_set_config = false;
				max17260.new_init = false;
			}
		}
			
		coop_task_sleep_ms(50);

		if(system_timer_is_time_elapsed_ms(battery_detect_time, MAX17260_BATTERY_DETECT_INVERVAL)) {
			battery_detect_time = system_timer_get_ms();

			const bool charge_enabled = !XMC_GPIO_GetInput(BQ24195_NCE_PIN);
			if(charge_enabled) {
				if((bq24195.status & 0b00110000) == 0b00110000) { // If charge termination done
					// Turn charging off
					XMC_GPIO_SetOutputHigh(BQ24195_NCE_PIN); 
					coop_task_sleep_ms(25);

					// Check if MAX17260 is still reachable, if not there is no battery connected 
					uint16_t tmp;
					if(max17260_read_register(MAX17260_REG_STATUS, &tmp) == 0) {
						XMC_GPIO_SetOutputLow(BQ24195_NCE_PIN); 
					} else {
						max17260.battery_connected = false;
					}
				}
			}
		}

		// Before we read new fuel gauge data, we first check if the chip did have a reset.
		// We do this by calling set_config with false. It will _not_ reset the i2c_state machine,
		// but check the status register for POR. If POR is set it will set the config again.
		if(max17260_set_config(false) < 0) {
			new_set_config = true;
			max17260.new_init = true;
			continue;
		}

		for(uint8_t i = 0; i < sizeof(max17260_read)/sizeof(MAX17260ReadRegister); i++) {
			uint16_t data;
			if(max17260_read_register(max17260_read[i].reg, &data) != 0) {
				new_set_config = true; 
				max17260.new_init = true;
				break;
			}
			(*(max17260_read[i].data)) = max17260_read[i].func((uint8_t*)&data);
		}

		max17260.battery_connected = true;

		if(max17260.new_learned_paramters_valid) {
			if(max17260_write_learned_parameters_to_chip(&max17260.new_learned_paramters) == 0) {
				if(max17260_write_learned_parameters_to_eeprom(&max17260.new_learned_paramters) == 0) {
					max17260.learned_paramters = max17260.new_learned_paramters;
					max17260.new_learned_paramters_valid = false;
				}
			}
		}

		// Write newly learned parameters to EEPROM every 8 hours
		if(system_timer_is_time_elapsed_ms(max17260.learned_paramters_time, MAX17260_LEARNED_PARAMETER_SAVE_INTERVAL)) {
			max17260.learned_paramters_time = system_timer_get_ms();
			MAX17260LearnedParameters new_parameters;
			if(max17260_read_learned_parameters_from_chip(&new_parameters) == 0) {
				max17260.learned_paramters = new_parameters;
				max17260_write_learned_parameters_to_eeprom(&max17260.learned_paramters);
			}
		}
	}
}

void max17260_tick(void) {
	coop_task_tick(&max17260_task);
}

void max17260_init(void) {
	logd("MAX17260 init\n\r");

	memset(&max17260, 0, sizeof(MAX17260));

	max17260.i2c_fifo.baudrate         = MAX17260_I2C_BAUDRATE;
	max17260.i2c_fifo.address          = MAX17260_I2C_ADDRESS;
	max17260.i2c_fifo.i2c              = MAX17260_I2C;

	max17260.i2c_fifo.scl_port         = MAX17260_SCL_PORT;
	max17260.i2c_fifo.scl_pin          = MAX17260_SCL_PIN;
	max17260.i2c_fifo.scl_mode         = MAX17260_SCL_PIN_MODE;
	max17260.i2c_fifo.scl_input        = MAX17260_SCL_INPUT;
	max17260.i2c_fifo.scl_source       = MAX17260_SCL_SOURCE;
	max17260.i2c_fifo.scl_fifo_size    = MAX17260_SCL_FIFO_SIZE;
	max17260.i2c_fifo.scl_fifo_pointer = MAX17260_SCL_FIFO_POINTER;

	max17260.i2c_fifo.sda_port         = MAX17260_SDA_PORT;
	max17260.i2c_fifo.sda_pin          = MAX17260_SDA_PIN;
	max17260.i2c_fifo.sda_mode         = MAX17260_SDA_PIN_MODE;
	max17260.i2c_fifo.sda_input        = MAX17260_SDA_INPUT;
	max17260.i2c_fifo.sda_source       = MAX17260_SDA_SOURCE;
	max17260.i2c_fifo.sda_fifo_size    = MAX17260_SDA_FIFO_SIZE;
	max17260.i2c_fifo.sda_fifo_pointer = MAX17260_SDA_FIFO_POINTER;

	max17260.i2c_fifo.mutex            = false;

	coop_task_init(&max17260_task, max17260_tick_task);
}