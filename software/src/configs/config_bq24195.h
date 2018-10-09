/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * bq24195.h: Config for BQ24195 power management IC
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


#ifndef CONFIG_BQ24195_H
#define CONFIG_BQ24195_H

#include "xmc_gpio.h"

#define BQ24195_NCE_PIN              P1_3 // Charging enable/disable

#define BQ24195_I2C_BAUDRATE         100000

#define BQ24195_I2C_ADDRESS          0b1101011 // 0x6b
#define BQ24195_I2C                  XMC_I2C1_CH1

#define BQ24195_SCL_PORT             XMC_GPIO_PORT2
#define BQ24195_SCL_PIN              12
#define BQ24195_SCL_PIN_MODE         XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN_ALT4
#define BQ24195_SCL_INPUT            XMC_USIC_CH_INPUT_DX1
#define BQ24195_SCL_SOURCE           1
#define BQ24195_SCL_FIFO_SIZE        XMC_USIC_CH_FIFO_SIZE_16WORDS
#define BQ24195_SCL_FIFO_POINTER     32

#define BQ24195_SDA_PORT             XMC_GPIO_PORT2
#define BQ24195_SDA_PIN              13
#define BQ24195_SDA_PIN_MODE         XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN_ALT7
#define BQ24195_SDA_INPUT            XMC_USIC_CH_INPUT_DX0
#define BQ24195_SDA_SOURCE           3
#define BQ24195_SDA_FIFO_SIZE        XMC_USIC_CH_FIFO_SIZE_16WORDS
#define BQ24195_SDA_FIFO_POINTER     48

#endif
