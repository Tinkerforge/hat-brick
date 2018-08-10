/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * rtc.c: Driver for real-time clock
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

#include "rtc.h"

#include <sys/time.h>
#include <time.h>
#include <stdio.h>

#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/logging/logging.h"

#include "xmc_rtc.h"
#define RTC_DIVIDERVALUE 0x7FFF

void rtc_init(void) {
	const XMC_RTC_CONFIG_t config = {
		{
			.seconds = 0,
  			.minutes = 0,
  			.hours = 0,
  			.days = 0,
  			.daysofweek = XMC_RTC_WEEKDAY_THURSDAY,
			.month = XMC_RTC_MONTH_JANUARY,
  			.year = 1970
		}, {
  			.seconds = 0,
  			.minutes = 0,
  			.hours = 0,
  			.days = 0,
  			.month = XMC_RTC_MONTH_JANUARY,
  			.year = 1970
		},
		.prescaler = RTC_DIVIDERVALUE
	};

	XMC_RTC_Init(&config);

	XMC_RTC_Start();
}

uint32_t tmp = 0;
void rtc_tick(void) {
	if(system_timer_is_time_elapsed_ms(tmp, 1000)) {
		struct tm t;
		XMC_RTC_GetTimeStdFormat(&t);
		uartbb_printf("time: %d-%d-%d %d:%d:%d\n\r", t.tm_year, t.tm_mon, t.tm_mday, t.tm_hour, t.tm_min, t.tm_sec);

		tmp = system_timer_get_ms();
	}
}