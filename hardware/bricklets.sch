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
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CON-SENSOR2 P?
U 1 1 5B35278B
P 1700 1600
F 0 "P?" H 1550 2000 60  0000 C CNN
F 1 "CON-SENSOR2" V 1850 1600 60  0000 C CNN
F 2 "" H 1800 1450 60  0000 C CNN
F 3 "" H 1800 1450 60  0000 C CNN
	1    1700 1600
	-1   0    0    -1  
$EndComp
Text Notes 4000 2400 0    39   ~ 0
74ahc244
$Comp
L GND #PWR?
U 1 1 5B352ACB
P 8000 1700
F 0 "#PWR?" H 8000 1700 30  0001 C CNN
F 1 "GND" H 8000 1630 30  0001 C CNN
F 2 "" H 8000 1700 60  0000 C CNN
F 3 "" H 8000 1700 60  0000 C CNN
	1    8000 1700
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR?
U 1 1 5B352AE7
P 8000 1400
F 0 "#PWR?" H 8000 1500 40  0001 C CNN
F 1 "3V3" H 8000 1525 40  0000 C CNN
F 2 "" H 8000 1400 60  0000 C CNN
F 3 "" H 8000 1400 60  0000 C CNN
	1    8000 1400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
