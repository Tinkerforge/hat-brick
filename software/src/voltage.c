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

#define voltage_usb_irq_handler IRQ_Hdlr_15
#define voltage_dc_irq_handler  IRQ_Hdlr_16

static volatile uint32_t voltage_usb = 0;
static volatile uint32_t voltage_dc  = 0;
static uint32_t voltage_usb_sum      = 0;
static uint32_t voltage_dc_sum       = 0;
static uint32_t voltage_usb_length   = 0;
static uint32_t voltage_dc_length    = 0;

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) voltage_usb_irq_handler(void) {
	voltage_usb_sum += XMC_VADC_GROUP_GetDetailedResult(VOLTAGE_USB_ADC_GROUP, VOLTAGE_USB_ADC_RESULT_REG) & 0xFFFF;

	voltage_usb_length++;
	if(voltage_usb_length >= VOLTAGE_MAX_LENGTH) {
		voltage_usb        = voltage_usb_sum;
		voltage_usb_sum    = 0;
		voltage_usb_length = 0;
	}
}

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) voltage_dc_irq_handler(void) {
	voltage_dc_sum += XMC_VADC_GROUP_GetDetailedResult(VOLTAGE_DC_ADC_GROUP, VOLTAGE_DC_ADC_RESULT_REG) & 0xFFFF;

	voltage_dc_length++;
	if(voltage_dc_length >= VOLTAGE_MAX_LENGTH) {
		voltage_dc        = voltage_dc_sum;
		voltage_dc_sum    = 0;
		voltage_dc_length = 0;
	}
}

void voltage_adc_channel_init(uint32_t result_reg, uint32_t channel, int32_t alias, XMC_VADC_SR_t sr, uint32_t irq, XMC_VADC_GROUP_t *vadc, int32_t group_index) {
	XMC_VADC_CHANNEL_CONFIG_t  channel_config = {
		.input_class                =  XMC_VADC_CHANNEL_CONV_GLOBAL_CLASS0,    // Global ICLASS 0 selected
		.lower_boundary_select 	    =  XMC_VADC_CHANNEL_BOUNDARY_GROUP_BOUND0,
		.upper_boundary_select 	    =  XMC_VADC_CHANNEL_BOUNDARY_GROUP_BOUND0,
		.event_gen_criteria         =  XMC_VADC_CHANNEL_EVGEN_NEVER,           // Channel Event disabled
		.sync_conversion  		    =  0,                                      // Sync feature disabled
		.alternate_reference        =  XMC_VADC_CHANNEL_REF_INTREF,            // Internal reference selected
		.result_reg_number          =  result_reg,                             // GxRES[x] selected
		.use_global_result          =  0, 				                       // Use Group result register
		.result_alignment           =  XMC_VADC_RESULT_ALIGN_RIGHT,            // Result alignment - Right Aligned
		.broken_wire_detect_channel =  XMC_VADC_CHANNEL_BWDCH_VAGND,           // No Broken wire mode select
		.broken_wire_detect		    =  0,    		                           // No Broken wire detection
		.bfl                        =  0,                                      // No Boundary flag
		.channel_priority           =  0,                   		           // Lowest Priority 0 selected
		.alias_channel              =  alias                                   // Channel is aliased
	};

	XMC_VADC_RESULT_CONFIG_t channel_result_config = {
		.data_reduction_control = 0b11,                         // Accumulate 4 result values
		.post_processing_mode   = XMC_VADC_DMM_REDUCTION_MODE,  // Use reduction mode
		.wait_for_read_mode  	= 1,                            // Enabled
		.part_of_fifo       	= 0,                            // No FIFO
		.event_gen_enable   	= 1                             // Disable Result event
	};

	// Initialize for configured channels
	XMC_VADC_GROUP_ChannelInit(vadc, channel, &channel_config);

	// Initialize for configured result registers
	XMC_VADC_GROUP_ResultInit(vadc, result_reg, &channel_result_config);

	XMC_VADC_GLOBAL_BackgroundAddChannelToSequence(VADC, group_index, channel);
	NVIC_SetPriority(irq, VOLTAGE_ADC_IRQ_PRIORITY);

	XMC_VADC_GLOBAL_BackgroundSetReqSrcEventInterruptNode(VADC, sr);
	XMC_VADC_GROUP_SetResultInterruptNode(vadc, result_reg, sr);

	NVIC_EnableIRQ(irq); 
}

void voltage_adc_init(void) {
	// This structure contains the Global related Configuration.
	const XMC_VADC_GLOBAL_CONFIG_t adc_global_config = {
		.boundary0 = 0, // Lower boundary value for Normal comparison mode
		.boundary1 = 0, // Upper boundary value for Normal comparison mode

		.class0 = {
			.sample_time_std_conv     = 31,                      // The Sample time is (2*tadci)
			.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT, // 12bit conversion Selected
		},
		.class1 = {
			.sample_time_std_conv     = 31,                      // The Sample time is (2*tadci)
		},

		.data_reduction_control       = 0b11, // Accumulate 4 result values
		.wait_for_read_mode           = 0, // GLOBRES Register will not be overwritten until the previous value is read
		.event_gen_enable             = 0, // Result Event from GLOBRES is disabled
		.disable_sleep_mode_control   = 0  // Sleep mode is enabled
	};

	// Global iclass0 configuration
	const XMC_VADC_GLOBAL_CLASS_t adc_global_iclass_config = {
		.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT,
		.sample_time_std_conv	  = 31,
	};

	// Global Result Register configuration structure
	XMC_VADC_RESULT_CONFIG_t adc_global_result_config = {
		.data_reduction_control = 0b11,  // Accumulate 4 result values
		.post_processing_mode   = XMC_VADC_DMM_REDUCTION_MODE,
		.wait_for_read_mode  	= 1, // Enabled
		.part_of_fifo       	= 0, // No FIFO
		.event_gen_enable   	= 1  // Disable Result event
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
		.req_src_interrupt = 0,                            // Background Request source interrupt Enabled 
		.enable_auto_scan  = 1,
		.load_mode         = XMC_VADC_SCAN_LOAD_OVERWRITE
	};

	const XMC_VADC_GROUP_CONFIG_t group_init_handle0 = {
		.emux_config = {
			.stce_usage                  = 0, 					           // Use STCE when the setting changes
			.emux_mode                   = XMC_VADC_GROUP_EMUXMODE_SWCTRL, // Mode for Emux conversion
			.emux_coding                 = XMC_VADC_GROUP_EMUXCODE_BINARY, // Channel progression - binary format
			.starting_external_channel   = 0,                              // Channel starts at 0 for EMUX
			.connected_channel           = 0                               // Channel connected to EMUX
		},
		.class0 = {
			.sample_time_std_conv        = 31,                             // The Sample time is (2*tadci)
			.conversion_mode_standard    = XMC_VADC_CONVMODE_12BIT,        // 12bit conversion Selected
			.sampling_phase_emux_channel = 0,                              // The Sample time is (2*tadci)
			.conversion_mode_emux        = XMC_VADC_CONVMODE_12BIT         // 12bit conversion Selected
		},
		.class1 = {
			.sample_time_std_conv        = 31,                             // The Sample time is (2*tadci)
			.conversion_mode_standard    = XMC_VADC_CONVMODE_12BIT,        // 12bit conversion Selected
			.sampling_phase_emux_channel = 0,                              // The Sample time is (2*tadci)
			.conversion_mode_emux        = XMC_VADC_CONVMODE_12BIT         // 12bit conversion Selected
		},

		.boundary0                       = 0,                              // Lower boundary value for Normal comparison mode
		.boundary1	                     = 0,                              // Upper boundary value for Normal comparison mode
		.arbitration_round_length        = 0,                              // 4 arbitration slots per round selected (tarb = 4*tadcd) */
		.arbiter_mode                    = XMC_VADC_GROUP_ARBMODE_ALWAYS,  // Determines when the arbiter should run.
	};

	XMC_VADC_GLOBAL_Init(VADC, &adc_global_config);

	XMC_VADC_GROUP_Init(VADC_G0, &group_init_handle0);
	XMC_VADC_GROUP_Init(VADC_G1, &group_init_handle0);
	XMC_VADC_GROUP_SetPowerMode(VADC_G0, XMC_VADC_GROUP_POWERMODE_NORMAL);
	XMC_VADC_GROUP_SetPowerMode(VADC_G1, XMC_VADC_GROUP_POWERMODE_NORMAL);
	XMC_VADC_GLOBAL_DisablePostCalibration(VADC, 0);
	XMC_VADC_GLOBAL_DisablePostCalibration(VADC, 1);
	XMC_VADC_GLOBAL_SHS_EnableAcceleratedMode(SHS0, XMC_VADC_GROUP_INDEX_0);
	XMC_VADC_GLOBAL_SHS_EnableAcceleratedMode(SHS0, XMC_VADC_GROUP_INDEX_1);
	XMC_VADC_GLOBAL_SHS_SetClockDivider(SHS0, 0);
	XMC_VADC_GLOBAL_SHS_SetAnalogReference(SHS0, XMC_VADC_GLOBAL_SHS_AREF_EXTERNAL_VDD_UPPER_RANGE);

	XMC_VADC_GLOBAL_StartupCalibration(VADC);

	// Initialize the Global Conversion class 0
	XMC_VADC_GLOBAL_InputClassInit(VADC, adc_global_iclass_config, XMC_VADC_GROUP_CONV_STD, 0);

	// Initialize the Background Scan hardware
	XMC_VADC_GLOBAL_BackgroundInit(VADC, &adc_background_config);

	voltage_adc_channel_init(VOLTAGE_USB_ADC_RESULT_REG, VOLTAGE_USB_ADC_CHANNEL, VOLTAGE_USB_ADC_ALIAS, XMC_VADC_SR_SHARED_SR0, VOLTAGE_USB_ADC_IRQ, VOLTAGE_USB_ADC_GROUP, VOLTAGE_USB_ADC_GROUP_INDEX);
	voltage_adc_channel_init(VOLTAGE_DC_ADC_RESULT_REG,  VOLTAGE_DC_ADC_CHANNEL,  VOLTAGE_DC_ADC_ALIAS,  XMC_VADC_SR_SHARED_SR1, VOLTAGE_DC_ADC_IRQ,  VOLTAGE_DC_ADC_GROUP,  VOLTAGE_DC_ADC_GROUP_INDEX);

	XMC_VADC_GLOBAL_BackgroundTriggerConversion(VADC);
}

void voltage_disable(void) {
	NVIC_DisableIRQ(VOLTAGE_USB_ADC_IRQ);
	NVIC_DisableIRQ(VOLTAGE_DC_ADC_IRQ);
}

void voltage_enable(void) {
	NVIC_EnableIRQ(VOLTAGE_USB_ADC_IRQ);
	NVIC_EnableIRQ(VOLTAGE_DC_ADC_IRQ);
}

void voltage_init(void) {
	const XMC_GPIO_CONFIG_t voltage_pin_config = {
		.mode             = XMC_GPIO_MODE_INPUT_TRISTATE,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_LARGE,
	};

	XMC_GPIO_Init(VOLTAGE_USB_ADC_PIN, &voltage_pin_config);
	XMC_GPIO_Init(VOLTAGE_DC_ADC_PIN, &voltage_pin_config);

	voltage_adc_init();
}

// resistor divider 10k/10, 4x reduction, 12 bit -> mV
uint32_t voltage_get_usb_voltage(void) {
	uint32_t v = (((uint64_t)voltage_usb)*3300*2)/(VOLTAGE_MAX_LENGTH*4*4095);
	return v < 2500 ? 0 : v;
}

// resistor divider 1k/10k, 4x reduction, 12 bit -> mV
uint32_t voltage_get_dc_voltage(void) {
	uint32_t v = (((uint64_t)voltage_dc)*3300*11)/(VOLTAGE_MAX_LENGTH*4*4095);
	return v < 2500 ? 0 : v;
}

uint32_t voltage_get_usb_voltage_raw(void) {
	return voltage_usb;
}

uint32_t voltage_get_dc_voltage_raw(void) {
	return voltage_dc;
}