/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * bq24075.c: Driver for BQ24075 power management IC
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

#include "bq24075.h"

#include "configs/config_bq24075.h"
#include "configs/config_rpi.h"

void bq24075_init(void) {
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

	XMC_GPIO_Init(BQ24075_NEN_PIN, &output_low);
	XMC_GPIO_Init(BQ24075_NPGOOD_PIN, &input);
}

void bq24075_tick(void) {
	if(XMC_GPIO_GetInput(BQ24075_NPGOOD_PIN)) {
		XMC_GPIO_SetOutputLow(RPI_BOOST_EN_PIN);
	} else {
		XMC_GPIO_SetOutputHigh(RPI_BOOST_EN_PIN);
	}
}