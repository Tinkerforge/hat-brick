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

#include "configs/config_bq24195.h"
#include "configs/config_rpi.h"

#include "bricklib2/os/coop_task.h"

#include "bricklib2/logging/logging.h"

extern MAX17260 max17260;
BQ24195 bq24195;
CoopTask bq24195_task;

void bq24195_tick_task(void) {
	while(true) {
		// Print all 0xA registers for testing
		for(uint8_t reg = 0; reg <= 0xA; reg++) {
			uint8_t value = 0;
			i2c_fifo_coop_read_register(&max17260.i2c_fifo, reg, 1, &value);

			uartbb_printf("Register %x: %b\n\r", reg, value);
		}
		uartbb_printf("\n\r");

		coop_task_sleep_ms(1000);
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

	XMC_GPIO_Init(BQ24195_NCE_PIN, &output_low);
	XMC_GPIO_Init(BQ24195_INT_PIN, &input);
	XMC_GPIO_Init(BQ24195_STAT_PIN, &input);
	coop_task_init(&bq24195_task, bq24195_tick_task);
}

void bq24195_tick(void) {
	coop_task_tick(&bq24195_task);
}
