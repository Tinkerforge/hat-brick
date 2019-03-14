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

typedef struct {
    uint32_t power_off_delay_start;
    uint32_t power_off_duration_start;
    uint32_t power_off_delay;
	uint32_t power_off_duration;
	bool raspberry_pi_off;
	bool bricklets_off;
	bool enable_sleep_indicator;

    uint32_t last_flicker_time;

    bool led_state_before_turned_off;
    uint32_t irq_state_before_turned_off;

    bool bricklet_power;
} RPI;

extern RPI rpi;

void rpi_init(void);
void rpi_tick(void);
void rpi_tick_sleep(void);

#endif