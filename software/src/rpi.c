/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * rpi.c: Driver for Raspberry PI eeprom simulation and IO
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

#include "rpi.h"

#include "eeprom.h"

#include "configs/config_rpi.h"

#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/utility/led_flicker.h"

RPI rpi;

void rpi_init(void) {
    logd("RPi init\n\r");
    memset(&rpi, 0, sizeof(RPI));
    XMC_GPIO_CONFIG_t output_high = {
	    .mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
        .output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
    };

    XMC_GPIO_CONFIG_t output_low = {
	    .mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
        .output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
    };

	XMC_GPIO_Init(RPI_BOOST_EN_PIN, &output_high);
	XMC_GPIO_Init(RPI_BRICKLET_EN_PIN, &output_high);
	XMC_GPIO_Init(RPI_RPI_EN_PIN, &output_high);

	XMC_GPIO_Init(RPI_LED_LOW_PIN, &output_low);
	XMC_GPIO_Init(RPI_LED_MID_PIN, &output_low);
	XMC_GPIO_Init(RPI_LED_HIGH_PIN, &output_low);
    rpi.leds[0].config = LED_FLICKER_CONFIG_EXTERNAL;
    rpi.leds[1].config = LED_FLICKER_CONFIG_EXTERNAL;
    rpi.leds[2].config = LED_FLICKER_CONFIG_EXTERNAL;

    eeprom_init();
}

void rpi_tick(void) {
    for(uint8_t i = 0; i < RPI_NUM_LEDS; i++) {
        if(rpi.leds[i].config == LED_FLICKER_CONFIG_EXTERNAL) {
            // TODO
        } else {
            LEDFlickerState *state = &rpi.leds[i];
            uint32_t ms = system_timer_get_ms();
            switch(i) {
                case RPI_LED_LOW:  led_flicker_tick(state, ms, RPI_LED_LOW_PIN);  break;
                case RPI_LED_MID:  led_flicker_tick(state, ms, RPI_LED_MID_PIN);  break;
                case RPI_LED_HIGH: led_flicker_tick(state, ms, RPI_LED_HIGH_PIN); break;
                default:           loge("RPI: Unexpected LED: %d\n\r", i);        break;
            }
        }
    }
}