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

#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "configs/config_max17260.h"


MAX17260 max17260;

const uint8_t max17260_read_registers[] = {
	MAX17260_REG_DESIGN_CAP, MAX17260_REG_REP_CAP, MAX17260_REG_REP_SOC, 
	MAX17260_REG_FULL_CAP_REP, MAX17260_REG_TTE, MAX17260_REG_TTF, 
	MAX17260_REG_STATUS, MAX17260_REG_V_CELL, MAX17260_REG_CURRENT, 
	MAX17260_REG_TEMP
};

void max17260_init_state(void) {
	max17260.current_read_index = 0;

	i2c_fifo_init(&max17260.i2c_fifo);
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

	max17260_init_state();
}

int32_t max17260_reg_to_capacity(uint8_t data[2]) { // in mAh
	return (data[0] | (data[1] << 8))/2;
}

int32_t max17260_reg_to_percentage(uint8_t data[2]) { // in 0.01%
	return (data[0] | (data[1] << 8))*256/1000;
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

void max17260_tick(void) {
	I2CFifoState state = i2c_fifo_next_state(&max17260.i2c_fifo);

	if(state & I2C_FIFO_STATE_ERROR) {
		loge("MAX17260 I2C error: %d\n\r", state);
		max17260_init_state();
		return;
	}

    if(system_timer_is_time_elapsed_ms(max17260.last_read, 250)) {
		uartbb_printf("status:              %d\n\r", max17260.status);
		uartbb_printf("capacity_full:       %d\n\r", max17260.capacity_full);
		uartbb_printf("capacity_nominal:    %d\n\r", max17260.capacity_nominal);
		uartbb_printf("capacity_remaining:  %d\n\r", max17260.capacity_remaining);
		uartbb_printf("percentage_charge:   %d\n\r", max17260.percentage_charge);
		uartbb_printf("time_to_emtpy:       %d\n\r", max17260.time_to_emtpy);
		uartbb_printf("time_to_full:        %d\n\r", max17260.time_to_full);
		uartbb_printf("voltage_battery:     %d\n\r", max17260.voltage_battery);
		uartbb_printf("current_flow:        %d\n\r", max17260.current_flow);
		uartbb_printf("temperature_battery: %d\n\r", max17260.temperature_battery);
		uartbb_printf("\n\r");
		max17260.last_read = system_timer_get_ms();
	}

	switch(state) {
		case I2C_FIFO_STATE_READ_REGISTER_READY: {
			uint8_t data[16];
			uint8_t length = i2c_fifo_read_fifo(&max17260.i2c_fifo, data, 16);

			if(length != 2) {
				loge("MAX17260 unexpected I2C read length: %d\n\r", length);
				max17260_init_state();
				return;
			}

			switch(max17260_read_registers[max17260.current_read_index]) {
				case MAX17260_REG_DESIGN_CAP:   max17260.capacity_nominal    = max17260_reg_to_capacity(data);    break;
				case MAX17260_REG_REP_CAP:      max17260.capacity_remaining  = max17260_reg_to_capacity(data);    break; 
				case MAX17260_REG_REP_SOC:      max17260.percentage_charge   = max17260_reg_to_percentage(data);  break;
				case MAX17260_REG_FULL_CAP_REP: max17260.capacity_full       = max17260_reg_to_capacity(data);    break;
				case MAX17260_REG_TTE:          max17260.time_to_emtpy       = max17260_reg_to_time(data);        break;
				case MAX17260_REG_TTF:          max17260.time_to_full        = max17260_reg_to_time(data);        break;
				case MAX17260_REG_STATUS:       max17260.status              = (data[0] | (data[1] << 8));        break;
				case MAX17260_REG_V_CELL:       max17260.voltage_battery     = max17260_reg_to_voltage(data);     break;
				case MAX17260_REG_CURRENT:      max17260.current_flow        = max17260_reg_to_current(data);     break;
				case MAX17260_REG_TEMP:         max17260.temperature_battery = max17260_reg_to_temperature(data); break;
				default: {
					loge("MAX17260 unexpected read register: %d\n\r", max17260_read_registers[max17260.current_read_index]);
					max17260_init_state();
					return;
				}
			}

			break;
		}

		default: {
			// If we end up in a ready state that we don't handle, something went wrong
			if (state & I2C_FIFO_STATE_READY) {
				loge("MAX17260 unrecognized I2C ready state: %d\n\r", state);
				max17260_init_state();
				return;
			}
		}
	}

	if(state == I2C_FIFO_STATE_IDLE || (state & I2C_FIFO_STATE_READY) != 0) {
		max17260.current_read_index++;
		if(max17260.current_read_index >= sizeof(max17260_read_registers)) {
			max17260.current_read_index = 0;
		}

		i2c_fifo_read_register(&max17260.i2c_fifo, max17260_read_registers[max17260.current_read_index], 2);
	}
}