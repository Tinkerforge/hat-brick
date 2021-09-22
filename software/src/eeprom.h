/* hat-brick
 * Copyright (C) 2018, 2021 Olaf Lüke <olaf@tinkerforge.com>
 *
 * eeprom.h: EEPROM Emulation
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

#ifndef EEPROM_H
#define EEPROM_H

#include <stdint.h>


#define CALIBRATION_PAGE 1
#define CALIBRATION_MAGIC 0x12345678
#define CALIBRATION_MAGIC_POS 0
#define CALIBRATION_RTC_POS 1

typedef struct {
    uint8_t rtc_driver;
} EEPROM;

extern EEPROM eeprom;

void eeprom_settings_write(void);
void eeprom_settings_read(void);
void eeprom_init(void);

#endif