/* hat-brick
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * voltage.h: Driver for measuring input voltages
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

#ifndef VOLTAGE_H
#define VOLTAGE_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
	uint32_t voltage_dc;
	uint32_t voltage_usb;

	uint32_t last_measurement;

	uint32_t period;
	bool value_has_to_change;
} Voltage;

extern Voltage voltage;

void voltage_init(void);
void voltage_tick(void);

#endif