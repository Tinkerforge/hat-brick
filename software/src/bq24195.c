/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * bq24195.c: Driver for BQ24195 power management IC
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

#include "bq24195.h"
#include "max17260.h"
#include "voltage.h"
#include "rpi.h"

#include "configs/config_bq24195.h"
#include "configs/config_rpi.h"

#include "bricklib2/os/coop_task.h"

#include "bricklib2/logging/logging.h"

#include "xmc_gpio.h"


#define BQ24195_MAX_BATTERY_TEMPERATURE_OFF 6000 // Turn charging off if battery temperature > 60°
#define BQ24195_MAX_BATTERY_TEMPERATURE_ON  4500 // Turn charging on again if battery temperature < 45°

#define BQ24195_THRESHOLD_DETECTION_DEBOUNCE 500 // 500ms debounce
#define BQ24195_STATUS_UPDATE_INTERVAL       500

extern MAX17260 max17260;
BQ24195 bq24195;
CoopTask bq24195_task;

uint32_t bq24195_read_register(uint8_t reg, uint8_t *value) {
	uint32_t error = 0;
	while(true) {
		// FIXME: Overwrite i2c_fifo struct with correct address. This is a bit of a hack...
		uint8_t old_address = max17260.i2c_fifo.address;
		if(!max17260.i2c_fifo.mutex) {
			max17260.i2c_fifo.address = BQ24195_I2C_ADDRESS;
		}
		error = i2c_fifo_coop_read_register(&max17260.i2c_fifo, reg, 1, value);

		if(!max17260.i2c_fifo.mutex) {
			max17260.i2c_fifo.address = old_address;
		}

		if(error == I2C_FIFO_STATUS_MUTEX) {
			coop_task_yield();
			continue;
		}

		break;
	}

	return error;
}

uint32_t bq24195_write_register(uint8_t reg, uint8_t value) {
	uint32_t error = 0;
	while(true) {
		// FIXME: Overwrite i2c_fifo struct with correct address. This is a bit of a hack...
		uint8_t old_address = max17260.i2c_fifo.address;
		if(!max17260.i2c_fifo.mutex) {
			max17260.i2c_fifo.address = BQ24195_I2C_ADDRESS;
		}
		error = i2c_fifo_coop_write_register(&max17260.i2c_fifo, reg, 1, &value, true);

		if(!max17260.i2c_fifo.mutex) {
			max17260.i2c_fifo.address = old_address;
		}

		if(error == I2C_FIFO_STATUS_MUTEX) {
			coop_task_yield();
			continue;
		}

		break;
	}

	return error;
}

// Turn charging off if battery temperature > 60°C
// If off, turn charging on again if battery temperature < 45°C
void bq24195_handle_overtemperature(void) {
	if(!max17260.battery_connected) {
		return;
	}

	const bool charge_enabled = !XMC_GPIO_GetInput(BQ24195_NCE_PIN);
	if(charge_enabled) {
		if(max17260.temperature_battery > BQ24195_MAX_BATTERY_TEMPERATURE_OFF) {
			XMC_GPIO_SetOutputHigh(BQ24195_NCE_PIN);
		}
	} else {
		if(max17260.temperature_battery < BQ24195_MAX_BATTERY_TEMPERATURE_ON) {
			XMC_GPIO_SetOutputLow(BQ24195_NCE_PIN);
		}
	}
}

void bq24195_handle_input_current_limit(void) {
	static uint32_t last_raw_dc_voltage = 0;
	const uint32_t raw_dc_voltage       = voltage_get_dc_voltage_raw();
	const uint32_t raw_usb_voltage      = voltage_get_usb_voltage_raw();

	uint8_t value;
	uint32_t err = bq24195_read_register(BQ24195_REG_INPUT_SOURCE, &value);
	if(err != 0) {
		return;
	}

	if((last_raw_dc_voltage > RPI_VOLTAGE_DC_UNDERVOLTAGE) &&
	   (raw_dc_voltage      < RPI_VOLTAGE_DC_UNDERVOLTAGE) &&
	   (raw_usb_voltage     > RPI_VOLTAGE_USB_UNDERVOLTAGE)) {
		// If USB is connected and DC was removed, we force a D+/D- detection
		// to find out what power the USB port can deliver.
		bq24195_write_register(BQ24195_REG_MISC, 0b11001000);
	} else if(raw_dc_voltage > RPI_VOLTAGE_DC_UNDERVOLTAGE) {
		if((value & 0b00000111) != 0b00000111) {
			// If DC voltage is connected, we always use 3A current limit
			bq24195_write_register(BQ24195_REG_INPUT_SOURCE, 0b00110111);
		}
	} else if(raw_usb_voltage > RPI_VOLTAGE_USB_UNDERVOLTAGE) {
		if((value & 0b00000111) == 0b00000000) {
			// If USB is connected and the auto-detection did not detect anything,
			// the current limit is set to 100mA. We can be 100% sure that the connected
			// power supply can do more then that, since otherwise the system would not
			// be running.
			// In this case we assume that a general purpose power supply is connected
			// that does not support the USB bc 1.2 protocol and we set it to
			// the full 3A. If the power supply does not deliver this much, it will
			// be automatically regulated by the BQ24195 when the voltage starts to drop.
			bq24195_write_register(BQ24195_REG_INPUT_SOURCE, 0b00110111);
		}
	}

	last_raw_dc_voltage = raw_dc_voltage;
}

void bq24195_tick_task(void) {
	if(max17260.new_init) {
		i2c_fifo_init(&max17260.i2c_fifo);
		max17260.new_init = false;
	}

	bq24195_write_register(BQ24195_REG_INPUT_SOURCE,       0b00110000); // Input current limit 100mA (updated in the loop)
	bq24195_write_register(BQ24195_REG_CHARGE_CURRENT,     0b00100000); // Fast charge current limit 512mA + 512mA = ~1A
	bq24195_write_register(BQ24195_REG_CHARGE_TERMINATION, 0b10001010); // Turn watchdog off
	bq24195_write_register(BQ24195_REG_MISC,               0b11001000); // Force a D+/D- detection

	uint32_t status_update_time = 0;
	bool last_usb_low = true;
	uint32_t last_usb_time = 0;
	bool last_dc_low = true;
	uint32_t last_dc_time = 0;
	uint32_t wait_time = 0;
	uint32_t input_current_limit_time = 0;
	while(true) {
		bq24195_handle_overtemperature();

		// Update input current limit at most every 500ms
		if(system_timer_is_time_elapsed_ms(input_current_limit_time, 500)) {
			input_current_limit_time = system_timer_get_ms();
			bq24195_handle_input_current_limit();
		}

		if(max17260.new_init) {
			i2c_fifo_init(&max17260.i2c_fifo);
			max17260.new_init = false;
		}

		// Only test thresholds if we are not currently in an overtemperature event
		const bool charge_enabled = !XMC_GPIO_GetInput(BQ24195_NCE_PIN);
		const bool temperature_ok = (charge_enabled && (max17260.temperature_battery < BQ24195_MAX_BATTERY_TEMPERATURE_OFF)) || (!charge_enabled && (max17260.temperature_battery < BQ24195_MAX_BATTERY_TEMPERATURE_ON));
		if(max17260.battery_connected && temperature_ok && ((wait_time == 0) || (system_timer_is_time_elapsed_ms(wait_time, BQ24195_THRESHOLD_DETECTION_DEBOUNCE)))) {
			wait_time = 0;
			uint32_t raw_usb_voltage = voltage_get_usb_voltage_raw();
			if(last_usb_low && (raw_usb_voltage > RPI_VOLTAGE_USB_UNDERVOLTAGE)) {
				last_usb_low = false;
				last_usb_time = system_timer_get_ms();
			} else if(!last_usb_low && (raw_usb_voltage > RPI_VOLTAGE_USB_UNDERVOLTAGE) && (last_usb_time != 0)) {
				if(system_timer_is_time_elapsed_ms(last_usb_time, BQ24195_THRESHOLD_DETECTION_DEBOUNCE)) {
					last_usb_time = 0;
					XMC_GPIO_SetOutputHigh(BQ24195_NCE_PIN);
					coop_task_sleep_ms(2);
					XMC_GPIO_SetOutputLow(BQ24195_NCE_PIN);
				}
			} else if(!last_usb_low && (raw_usb_voltage <= RPI_VOLTAGE_USB_UNDERVOLTAGE)) {
				last_usb_low = true;
				last_usb_time = 0;
				wait_time = system_timer_get_ms();
			}

			uint32_t raw_dc_voltage = voltage_get_dc_voltage_raw();
			if(last_dc_low && (raw_dc_voltage > RPI_VOLTAGE_DC_UNDERVOLTAGE)) {
				last_dc_low = false;
				last_dc_time = system_timer_get_ms();
			} else if(!last_dc_low && (raw_dc_voltage > RPI_VOLTAGE_DC_UNDERVOLTAGE) && (last_dc_time != 0)) {
				if(system_timer_is_time_elapsed_ms(last_dc_time, BQ24195_THRESHOLD_DETECTION_DEBOUNCE)) {
					last_dc_time = 0;
					XMC_GPIO_SetOutputHigh(BQ24195_NCE_PIN);
					coop_task_sleep_ms(2);
					XMC_GPIO_SetOutputLow(BQ24195_NCE_PIN);
				}
			} else if(!last_dc_low && (raw_dc_voltage <= RPI_VOLTAGE_DC_UNDERVOLTAGE)) {
				last_dc_low = true;
				last_dc_time = 0;
				wait_time = system_timer_get_ms();
			}
		}

		if(system_timer_is_time_elapsed_ms(status_update_time, BQ24195_STATUS_UPDATE_INTERVAL)) {
			status_update_time = system_timer_get_ms();
			uint8_t value;
			uint32_t err = bq24195_read_register(BQ24195_REG_SYSTEM_STATUS, &value);
			if(err == 0) {
				bq24195.status = value;
			}
			uartbb_printf("Status: %b (err %d)\n\r", value, err);

			err = bq24195_read_register(BQ24195_REG_FAULT, &value);
			if(err == 0) {
				bq24195.fault = value;
			}
			uartbb_printf("Fault: %b (err %d)\n\r", value, err);

			err = bq24195_read_register(BQ24195_REG_INPUT_SOURCE, &value);
			uartbb_printf("Input Source: %b (err %d)\n\r", value, err);

			err = bq24195_read_register(BQ24195_REG_CHARGE_TERMINATION, &value);
			uartbb_printf("Charge Termination: %b (err %d)\n\r", value, err);
			uartbb_puts("\n\r");
		}

		coop_task_yield();
	}
}

void bq24195_init(void) {
	XMC_GPIO_CONFIG_t output_high = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
	};

	XMC_GPIO_Init(BQ24195_NCE_PIN, &output_high);
	coop_task_init(&bq24195_task, bq24195_tick_task);
}

void bq24195_tick(void) {
	coop_task_tick(&bq24195_task);
}
