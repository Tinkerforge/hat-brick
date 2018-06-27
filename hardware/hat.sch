EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:hat-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "HAT Bricklet"
Date "2018-06-26"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2018, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5750 6650 1000 1000
U 5B31E6A8
F0 "Power Supply" 60
F1 "power_supply.sch" 60
$EndSheet
Text GLabel 5850 4900 2    39   Output ~ 0
CHG-ACIN
Text GLabel 5850 5000 2    39   Output ~ 0
CHG-EN
Text GLabel 5850 5100 2    39   Output ~ 0
CHG-CHGLEV
Text GLabel 5850 4550 2    39   Input ~ 0
BATTERY-ALRT
Text GLabel 5850 4650 2    39   BiDi ~ 0
BATTERY-SDA
Text GLabel 5850 4750 2    39   Output ~ 0
BATTERY-SCL
Text GLabel 5850 5200 2    39   Input ~ 0
CHG-BLV1
Text GLabel 5850 5300 2    39   Input ~ 0
CHG-BLV2
Text GLabel 5850 5400 2    39   Input ~ 0
CHG-ACOK
Text GLabel 5850 5500 2    39   Input ~ 0
CHG-STAT3
Text GLabel 5850 5600 2    39   Input ~ 0
CHG-STAT2
Text GLabel 5850 5700 2    39   Input ~ 0
CHG-STAT1
Text GLabel 5850 5800 2    39   Output ~ 0
BOOST-EN
Text GLabel 5850 5900 2    39   Input ~ 0
DC-IN-VOLTAGE
Text GLabel 5850 6000 2    39   Input ~ 0
USB-IN-VOLTAGE
$Comp
L XMC1XXX48 U?
U 1 1 5B351B68
P 1200 1500
F 0 "U?" H 1050 2450 60  0000 C CNN
F 1 "XMC1404" H 1200 550 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 1350 1750 60  0001 C CNN
F 3 "" H 1350 1750 60  0000 C CNN
	1    1200 1500
	-1   0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U?
U 2 1 5B351C5B
P 1200 3850
F 0 "U?" H 1050 4800 60  0000 C CNN
F 1 "XMC1404" H 1200 2900 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 1350 4100 60  0001 C CNN
F 3 "" H 1350 4100 60  0000 C CNN
	2    1200 3850
	-1   0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U?
U 3 1 5B351D55
P 1200 5900
F 0 "U?" H 1050 6400 60  0000 C CNN
F 1 "XMC1404" H 1200 5400 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 1350 6150 60  0001 C CNN
F 3 "" H 1350 6150 60  0000 C CNN
	3    1200 5900
	-1   0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U?
U 4 1 5B351E5E
P 3550 1200
F 0 "U?" H 3400 1850 60  0000 C CNN
F 1 "XMC1404" H 3550 250 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 3700 1450 60  0001 C CNN
F 3 "" H 3700 1450 60  0000 C CNN
	4    3550 1200
	-1   0    0    -1  
$EndComp
$Comp
L XMC1XXX48 U?
U 5 1 5B351FE8
P 3550 3400
F 0 "U?" H 3400 3850 60  0000 C CNN
F 1 "XMC1404" H 3550 2850 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 3700 3650 60  0001 C CNN
F 3 "" H 3700 3650 60  0000 C CNN
	5    3550 3400
	-1   0    0    -1  
$EndComp
$Comp
L Raspberry_Pi_2_3 J?
U 1 1 5B35250F
P 9150 2400
F 0 "J?" H 9850 1150 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 8750 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 10150 3650 50  0001 C CNN
F 3 "" H 9200 2250 50  0001 C CNN
	1    9150 2400
	1    0    0    -1  
$EndComp
$Sheet
S 4600 6650 1000 1000
U 5B352770
F0 "Bricklets" 39
F1 "bricklets.sch" 39
$EndSheet
Text GLabel 7950 1050 0    39   Input ~ 0
VRASP
Text Notes 9550 4050 0    39   ~ 0
RASP GP ON/OFF
Text Notes 9550 4150 0    39   ~ 0
RASP MOSFET ON/OFF
Text Notes 9550 4250 0    39   ~ 0
Bricklet MOSFET ON/OFF
$EndSCHEMATC
