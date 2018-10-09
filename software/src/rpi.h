/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * rpi.h: Driver for Raspberry PI eeprom simulation and IO
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

#ifndef RPI_H
#define RPI_H

#include "bricklib2/utility/led_flicker.h"

// Voltages for turning BOOST off:
// Battery < 3.3V && USB < 4.4V && DC < 8.0V
#define RPI_VOLTAGE_BATTERY_UNDERVOLTAGE 3300
#define RPI_VOLTAGE_USB_UNDERVOLTAGE     (44*VOLTAGE_MAX_LENGTH*4*4095/(33*2))   // we compare with raw voltage to save CPU time
#define RPI_VOLTAGE_DC_UNDERVOLTAGE      (80*VOLTAGE_MAX_LENGTH*4*4095/(33*11))  // we compare with raw voltage to save CPU time

#define RPI_LED_LOW  0
#define RPI_LED_MID  1
#define RPI_LED_HIGH 2
#define RPI_NUM_LEDS 3

typedef struct {
    LEDFlickerState leds[RPI_NUM_LEDS];

    uint32_t power_off_delay_start;
    uint32_t power_off_duration_start;
    uint32_t power_off_delay;
	uint32_t power_off_duration;
	bool raspberry_pi_off;
	bool bricklets_off;
	bool enable_sleep_indicator;

    uint32_t last_flicker_time;

    bool led_state_before_turned_off[4];
    bool irq_state_before_turned_off[32];

    bool bricklet_en_before_undervoltage;
    bool rpi_en_before_undervoltage;
} RPI;

extern RPI rpi;

void rpi_init(void);
void rpi_tick(void);
void rpi_tick_sleep(void);

#endif