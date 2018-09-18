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

#include "configs/config_bq24195.h"
#include "configs/config_rpi.h"

#include "bricklib2/os/coop_task.h"

#include "bricklib2/logging/logging.h"

#define BQ24195_RAW_USB_VOLTAGE_THRESHOLD (35*VOLTAGE_MAX_LENGTH*4*4095/(33*2))
#define BQ24195_RAW_DC_VOLTAGE_THRESHOLD  (60*VOLTAGE_MAX_LENGTH*4*4095/(33*11))

extern MAX17260 max17260;
BQ24195 bq24195;
CoopTask bq24195_task;

uint32_t bq24195_read_register(uint8_t reg, uint8_t *value) {
	// FIXME: Overwrite i2c_fifo struct with correct address. This is a bit of a hack...
	uint8_t old_address = max17260.i2c_fifo.address;
	if(!max17260.i2c_fifo.mutex) {
		max17260.i2c_fifo.address = BQ24195_I2C_ADDRESS;
	}
	uint32_t error = i2c_fifo_coop_read_register(&max17260.i2c_fifo, reg, 1, value);

	if(!max17260.i2c_fifo.mutex) {
		max17260.i2c_fifo.address = old_address;
	}

	return error;
}

uint32_t bq24195_write_register(uint8_t reg, uint8_t value) {
	// FIXME: Overwrite i2c_fifo struct with correct address. This is a bit of a hack...
	uint8_t old_address = max17260.i2c_fifo.address;
	if(!max17260.i2c_fifo.mutex) {
		max17260.i2c_fifo.address = BQ24195_I2C_ADDRESS;
	}
	uint32_t error = i2c_fifo_coop_write_register(&max17260.i2c_fifo, reg, 1, &value, true);

	if(!max17260.i2c_fifo.mutex) {
		max17260.i2c_fifo.address = old_address;
	}

	return error;
}

void bq24195_tick_task(void) {
	if(max17260.new_init) {
		i2c_fifo_init(&max17260.i2c_fifo);
		max17260.new_init = false;
	}
	bq24195_write_register(BQ24195_REG_INPUT_SOURCE,       0b00110111); // Input current limit 3A
	bq24195_write_register(BQ24195_REG_CHARGE_CURRENT,     0b00100000); // Fast charge current limit 512mA
	bq24195_write_register(BQ24195_REG_CHARGE_TERMINATION, 0b10001010); // Turn watchdog off

	uint32_t print_time = 0;
	bool last_usb_low = true;
	uint32_t last_usb_time = 0;
	bool last_dc_low = true;
	uint32_t last_dc_time = 0;
	uint32_t wait_time = 0;
	while(true) {
		if(max17260.new_init) {
			i2c_fifo_init(&max17260.i2c_fifo);
			max17260.new_init = false;
		}

		if((wait_time == 0) || (system_timer_is_time_elapsed_ms(wait_time, 500))) {
			wait_time = 0;
			uint32_t raw_usb_voltage = voltage_get_usb_voltage_raw();
			if(last_usb_low && (raw_usb_voltage > BQ24195_RAW_USB_VOLTAGE_THRESHOLD)) {
				last_usb_low = false;
				last_usb_time = system_timer_get_ms();
			} else if(!last_usb_low && (raw_usb_voltage > BQ24195_RAW_USB_VOLTAGE_THRESHOLD) && (last_usb_time != 0)) {
				if(system_timer_is_time_elapsed_ms(last_usb_time, 500)) {
					last_usb_time = 0;
					XMC_GPIO_SetOutputHigh(BQ24195_NCE_PIN);
					coop_task_sleep_ms(2);
					XMC_GPIO_SetOutputLow(BQ24195_NCE_PIN);
				}
			} else if(!last_usb_low && (raw_usb_voltage <= BQ24195_RAW_USB_VOLTAGE_THRESHOLD)) {
				last_usb_low = true;
				last_usb_time = 0;
				wait_time = system_timer_get_ms();
			}

			uint32_t raw_dc_voltage = voltage_get_dc_voltage_raw();
			if(last_dc_low && (raw_dc_voltage > BQ24195_RAW_DC_VOLTAGE_THRESHOLD)) {
				last_dc_low = false;
				last_dc_time = system_timer_get_ms();
			} else if(!last_dc_low && (raw_dc_voltage > BQ24195_RAW_DC_VOLTAGE_THRESHOLD) && (last_dc_time != 0)) {
				if(system_timer_is_time_elapsed_ms(last_dc_time, 500)) {
					last_dc_time = 0;
					XMC_GPIO_SetOutputHigh(BQ24195_NCE_PIN);
					coop_task_sleep_ms(2);
					XMC_GPIO_SetOutputLow(BQ24195_NCE_PIN);
				}
			} else if(!last_dc_low && (raw_dc_voltage <= BQ24195_RAW_DC_VOLTAGE_THRESHOLD)) {
				last_dc_low = true;
				last_dc_time = 0;
				wait_time = system_timer_get_ms();
			}
		}

		if(system_timer_is_time_elapsed_ms(print_time, 1000)) {
			print_time = system_timer_get_ms();
			uint8_t value;
			bq24195_read_register(BQ24195_REG_SYSTEM_STATUS, &value);
			uartbb_printf("Status: %b\n\r", value);
			bq24195_read_register(BQ24195_REG_FAULT, &value);
			uartbb_printf("Fault: %b\n\r", value);
			uartbb_puts("\n\r");
		}

		coop_task_yield();
	}
}

void bq24195_init(void) {
	XMC_GPIO_CONFIG_t output_low = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
	};

	XMC_GPIO_CONFIG_t output_high = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
	};

	XMC_GPIO_CONFIG_t input = {
		.mode = XMC_GPIO_MODE_INPUT_TRISTATE,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_LARGE
	};

	XMC_GPIO_Init(BQ24195_NCE_PIN, &output_high);
	XMC_GPIO_Init(BQ24195_INT_PIN, &input);
	XMC_GPIO_Init(BQ24195_STAT_PIN, &input);
	coop_task_init(&bq24195_task, bq24195_tick_task);
}

void bq24195_tick(void) {
	coop_task_tick(&bq24195_task);
}
