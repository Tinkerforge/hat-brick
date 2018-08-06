/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * bq24075.h: Config for BQ24075 power management IC
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


#ifndef CONFIG_BQ24075_H
#define CONFIG_BQ24075_H

#include "xmc_gpio.h"



#define BQ24075_NPGOOD_PIN   P1_0 // Input voltage high enough
#define BQ24075_NCHG_PIN     P1_1 // Is charging
#define BQ24075_EN1_PIN      P1_2 // config v
#define BQ24075_EN2_PIN      P1_3 // config ^
#define BQ24075_NEN_PIN      P1_4 // Charging enable/disable
#define BQ24075_NSYSOFF_PIN  P1_5 // Output of BQ24075 enable/disable


#endif