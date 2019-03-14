/* hat-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * voltage.c: Driver for measuring input voltages
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

#include "voltage.h"

#include "configs/config_voltage.h"

#include "xmc_vadc.h"

#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/logging/logging.h"

Voltage voltage;

#define VOLTAGE_MAX_ADC_VALUE ((1  << 12) - 1)

#define voltage_adc_irq_handler IRQ_Hdlr_15


static volatile uint32_t voltage_adc_value_dc_sum = 0;
static volatile uint32_t voltage_adc_value_dc_num = 0;

static volatile uint32_t voltage_adc_value_usb_sum = 0;
static volatile uint32_t voltage_adc_value_usb_num = 0;

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) voltage_adc_irq_handler(void) {
	const uint32_t value = VADC->GLOBRES;
	const uint32_t channel = (value >> 20) & 0b1111;
	if(channel == VOLTAGE_ADC_DC_CHANNEL) {
		voltage_adc_value_dc_sum += (value & 0xFFFF);
		voltage_adc_value_dc_num++;
	} else {
		voltage_adc_value_usb_sum += (value & 0xFFFF);
		voltage_adc_value_usb_num++;
	}
}


void voltage_init(void) {
	memset(&voltage, 0, sizeof(Voltage));

	// This structure contains the Global related Configuration.
	const XMC_VADC_GLOBAL_CONFIG_t adc_global_config = {
		.boundary0 = (uint32_t) 0, // Lower boundary value for Normal comparison mode
		.boundary1 = (uint32_t) 0, // Upper boundary value for Normal comparison mode

		.class0 = {
			.sample_time_std_conv     = 31,                      // The Sample time is (2*tadci)
			.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT, // 12bit conversion Selected

		},
		.class1 = {
			.sample_time_std_conv     = 31,                      // The Sample time is (2*tadci)
			.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT, // 12bit conversion Selected

		},

		.data_reduction_control         = 0b11, // Accumulate 4 result values
		.wait_for_read_mode             = 0, // GLOBRES Register will not be overwritten until the previous value is read
		.event_gen_enable               = 1, // Result Event from GLOBRES is enabled
		.disable_sleep_mode_control     = 0  // Sleep mode is enabled
	};


	// Global iclass0 configuration
	const XMC_VADC_GLOBAL_CLASS_t adc_global_iclass_config = {
		.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT,
		.sample_time_std_conv	  = 31,
	};

	// Global Result Register configuration structure
	XMC_VADC_RESULT_CONFIG_t adc_global_result_config = {
		.data_reduction_control = 0, //0b11, // Accumulate 4 result values
		.post_processing_mode   = XMC_VADC_DMM_REDUCTION_MODE,
		.wait_for_read_mode  	= 1, // Enabled
		.part_of_fifo       	= 0, // No FIFO
		.event_gen_enable   	= 1  // Enable Result event
	};

	// LLD Background Scan Init Structure
	const XMC_VADC_BACKGROUND_CONFIG_t adc_background_config = {
		.conv_start_mode   = XMC_VADC_STARTMODE_CIR,       // Conversion start mode selected as cancel inject repeat
		.req_src_priority  = XMC_VADC_GROUP_RS_PRIORITY_1, // Priority of the Background request source in the VADC module
		.trigger_signal    = XMC_VADC_REQ_TR_A,            // If Trigger needed then this denotes the Trigger signal
		.trigger_edge      = XMC_VADC_TRIGGER_EDGE_NONE,   // If Trigger needed then this denotes Trigger edge selected
		.gate_signal       = XMC_VADC_REQ_GT_A,			   // If Gating needed then this denotes the Gating signal
		.timer_mode        = 0,							   // Timer Mode Disabled
		.external_trigger  = 0,                            // Trigger is Disabled
		.req_src_interrupt = 0,                            // Background Request source interrupt Disabled
		.enable_auto_scan  = 1,
		.load_mode         = XMC_VADC_SCAN_LOAD_OVERWRITE
	};


	XMC_VADC_GLOBAL_Init(VADC, &adc_global_config);
	XMC_VADC_GLOBAL_StartupCalibration(VADC);

	// Initialize the Global Conversion class 0
	XMC_VADC_GLOBAL_InputClassInit(VADC, adc_global_iclass_config, XMC_VADC_GROUP_CONV_STD, 0);
	// Initialize the Global Conversion class 1
	XMC_VADC_GLOBAL_InputClassInit(VADC, adc_global_iclass_config, XMC_VADC_GROUP_CONV_STD, 1);

	// Initialize the Background Scan hardware
	XMC_VADC_GLOBAL_BackgroundInit(VADC, &adc_background_config);

	// Initialize the global result register
	XMC_VADC_GLOBAL_ResultInit(VADC, &adc_global_result_config);

	XMC_VADC_GLOBAL_BackgroundAddChannelToSequence(VADC, 0, VOLTAGE_ADC_USB_CHANNEL);
	XMC_VADC_GLOBAL_BackgroundAddChannelToSequence(VADC, 0, VOLTAGE_ADC_DC_CHANNEL);
	XMC_VADC_GLOBAL_SetResultEventInterruptNode(VADC, XMC_VADC_SR_SHARED_SR0);

	XMC_VADC_GLOBAL_BackgroundTriggerConversion(VADC);

    NVIC_SetPriority(VOLTAGE_ADC_IRQ, VOLTAGE_ADC_IRQ_PRIORITY);
    NVIC_EnableIRQ(VOLTAGE_ADC_IRQ);
}

void voltage_tick(void) {
	if(system_timer_is_time_elapsed_ms(voltage.last_measurement, 100)) {
		voltage.last_measurement = system_timer_get_ms();

		NVIC_DisableIRQ(VOLTAGE_ADC_IRQ);

		// resistor divider 1k/10k,  12 bit -> mV => 3300*11/4095 = 2420/273 ~ 44/5
		//voltage.voltage_dc        = ((uint64_t)voltage_adc_value_dc_sum)*2420 / (voltage_adc_value_dc_num * 273);
		voltage.voltage_dc        = (voltage_adc_value_dc_sum * 44) / (voltage_adc_value_dc_num * 5);
		// resistor divider 10k/10k, 12 bit -> mV => 3300*2/4095 = 440/273 ~ 29/18
		//voltage.voltage_usb       = ((uint64_t)voltage_adc_value_usb_sum)*440 / (voltage_adc_value_usb_num * 273);
		voltage.voltage_usb       = (voltage_adc_value_usb_sum * 29) / (voltage_adc_value_usb_num * 18);

		voltage_adc_value_dc_sum  = 0;
		voltage_adc_value_dc_num  = 0;
		voltage_adc_value_usb_sum = 0;
		voltage_adc_value_usb_num = 0;

//		uartbb_printf("Vol: %d %d\n\r", voltage.voltage_dc, voltage.voltage_usb);

    	NVIC_EnableIRQ(VOLTAGE_ADC_IRQ);
	}
}