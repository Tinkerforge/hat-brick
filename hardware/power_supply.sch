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
Sheet 2 3
Title "HAT Bricklet"
Date "2018-06-28"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2018, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7750 3450 0    40   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L GND #PWR021
U 1 1 4D776A2F
P 2100 3050
F 0 "#PWR021" H 2100 3050 30  0001 C CNN
F 1 "GND" H 2100 2980 30  0001 C CNN
F 2 "" H 2100 3050 60  0001 C CNN
F 3 "" H 2100 3050 60  0001 C CNN
	1    2100 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 4D776078
P 1150 3050
F 0 "#PWR022" H 1150 3050 30  0001 C CNN
F 1 "GND" H 1150 2980 30  0001 C CNN
F 2 "" H 1150 3050 60  0001 C CNN
F 3 "" H 1150 3050 60  0001 C CNN
	1    1150 3050
	1    0    0    -1  
$EndComp
Text Notes 2300 1550 0    60   ~ 0
Divider 1/11
$Comp
L DIODESCH D206
U 1 1 4D263E79
P 9750 1850
F 0 "D206" H 9750 1950 40  0000 C CNN
F 1 "PMEG4050BEP" H 9750 1750 40  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 9750 1850 60  0001 C CNN
F 3 "" H 9750 1850 60  0001 C CNN
	1    9750 1850
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH D204
U 1 1 4D263E66
P 5300 2250
F 0 "D204" H 5300 2350 40  0000 C CNN
F 1 "PMEG4050BEP" H 5300 2150 40  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 5300 2250 60  0001 C CNN
F 3 "" H 5300 2250 60  0001 C CNN
	1    5300 2250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR023
U 1 1 4D25E7A2
P 6750 3050
F 0 "#PWR023" H 6750 3050 30  0001 C CNN
F 1 "GND" H 6750 2980 30  0001 C CNN
F 2 "" H 6750 3050 60  0001 C CNN
F 3 "" H 6750 3050 60  0001 C CNN
	1    6750 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 4D25E7A1
P 6450 3050
F 0 "#PWR024" H 6450 3050 30  0001 C CNN
F 1 "GND" H 6450 2980 30  0001 C CNN
F 2 "" H 6450 3050 60  0001 C CNN
F 3 "" H 6450 3050 60  0001 C CNN
	1    6450 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 4D25E7A0
P 6200 3050
F 0 "#PWR025" H 6200 3050 30  0001 C CNN
F 1 "GND" H 6200 2980 30  0001 C CNN
F 2 "" H 6200 3050 60  0001 C CNN
F 3 "" H 6200 3050 60  0001 C CNN
	1    6200 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 4D25E79F
P 5300 3050
F 0 "#PWR026" H 5300 3050 30  0001 C CNN
F 1 "GND" H 5300 2980 30  0001 C CNN
F 2 "" H 5300 3050 60  0001 C CNN
F 3 "" H 5300 3050 60  0001 C CNN
	1    5300 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 4D25E79C
P 5050 3050
F 0 "#PWR027" H 5050 3050 30  0001 C CNN
F 1 "GND" H 5050 2980 30  0001 C CNN
F 2 "" H 5050 3050 60  0001 C CNN
F 3 "" H 5050 3050 60  0001 C CNN
	1    5050 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 4D25E79B
P 4150 3050
F 0 "#PWR028" H 4150 3050 30  0001 C CNN
F 1 "GND" H 4150 2980 30  0001 C CNN
F 2 "" H 4150 3050 60  0001 C CNN
F 3 "" H 4150 3050 60  0001 C CNN
	1    4150 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 4D25E799
P 3700 3050
F 0 "#PWR029" H 3700 3050 30  0001 C CNN
F 1 "GND" H 3700 2980 30  0001 C CNN
F 2 "" H 3700 3050 60  0001 C CNN
F 3 "" H 3700 3050 60  0001 C CNN
	1    3700 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 4D25E798
P 3400 3050
F 0 "#PWR030" H 3400 3050 30  0001 C CNN
F 1 "GND" H 3400 2980 30  0001 C CNN
F 2 "" H 3400 3050 60  0001 C CNN
F 3 "" H 3400 3050 60  0001 C CNN
	1    3400 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 4D25E796
P 3050 3050
F 0 "#PWR031" H 3050 3050 30  0001 C CNN
F 1 "GND" H 3050 2980 30  0001 C CNN
F 2 "" H 3050 3050 60  0001 C CNN
F 3 "" H 3050 3050 60  0001 C CNN
	1    3050 3050
	1    0    0    -1  
$EndComp
Text Notes 700  850  0    60   ~ 0
max 27V\n5A
Text Notes 3700 1600 0    60   ~ 0
max. 25V
$Comp
L C C208
U 1 1 4CCC05D3
P 3700 2250
F 0 "C208" H 3750 2350 50  0000 L CNN
F 1 "1µF/10V" H 3700 2150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 3700 2250 60  0001 C CNN
F 3 "" H 3700 2250 60  0001 C CNN
	1    3700 2250
	1    0    0    -1  
$EndComp
$Comp
L C C212
U 1 1 4CCC05AB
P 5250 1550
F 0 "C212" V 5100 1500 50  0000 L CNN
F 1 "100nF" V 5400 1450 50  0000 L CNN
F 2 "kicad-libraries:C0603E" H 5250 1550 60  0001 C CNN
F 3 "" H 5250 1550 60  0001 C CNN
	1    5250 1550
	0    1    1    0   
$EndComp
$Comp
L AOZ1212 U203
U 1 1 4CCC016E
P 4650 2150
F 0 "U203" H 4350 2700 60  0000 C CNN
F 1 "AOZ1212" H 4650 2150 60  0000 C CNN
F 2 "kicad-libraries:SO-8" H 4650 2150 60  0001 C CNN
F 3 "" H 4650 2150 60  0001 C CNN
	1    4650 2150
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P201
U 1 1 4CCA03E4
P 800 1250
F 0 "P201" V 750 1250 40  0000 C CNN
F 1 "Black" V 850 1250 40  0000 C CNN
F 2 "kicad-libraries:OQ_2P" H 800 1250 60  0001 C CNN
F 3 "" H 800 1250 60  0001 C CNN
	1    800  1250
	-1   0    0    -1  
$EndComp
$Comp
L CP1 C206
U 1 1 4CC9FEDA
P 3050 2250
F 0 "C206" H 3100 2350 50  0000 L CNN
F 1 "220µF/35V" H 2850 2150 50  0000 L CNN
F 2 "kicad-libraries:ELKO_83" H 3050 2250 60  0001 C CNN
F 3 "" H 3050 2250 60  0001 C CNN
	1    3050 2250
	1    0    0    -1  
$EndComp
$Comp
L C C207
U 1 1 4CC9FE9E
P 3400 2250
F 0 "C207" H 3450 2350 50  0000 L CNN
F 1 "100nF" H 3400 2150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 3400 2250 60  0001 C CNN
F 3 "" H 3400 2250 60  0001 C CNN
	1    3400 2250
	1    0    0    -1  
$EndComp
$Comp
L R R212
U 1 1 4CC9FE69
P 4150 2300
F 0 "R212" V 4050 2300 50  0000 C CNN
F 1 "10k" V 4150 2300 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 4150 2300 60  0001 C CNN
F 3 "" H 4150 2300 60  0001 C CNN
	1    4150 2300
	-1   0    0    1   
$EndComp
$Comp
L C C209
U 1 1 4CC9FE2D
P 4150 2800
F 0 "C209" H 4200 2900 50  0000 L CNN
F 1 "1nF" H 4150 2700 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 4150 2800 60  0001 C CNN
F 3 "" H 4150 2800 60  0001 C CNN
	1    4150 2800
	1    0    0    -1  
$EndComp
$Comp
L C C216
U 1 1 4CC9FDEE
P 6450 2250
F 0 "C216" H 6500 2350 50  0000 L CNN
F 1 "100nF" H 6450 2150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6450 2250 60  0001 C CNN
F 3 "" H 6450 2250 60  0001 C CNN
	1    6450 2250
	1    0    0    -1  
$EndComp
$Comp
L R R204
U 1 1 4CB54095
P 2100 1100
F 0 "R204" V 2180 1100 50  0000 C CNN
F 1 "10k" V 2100 1100 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 2100 1100 60  0001 C CNN
F 3 "" H 2100 1100 60  0001 C CNN
	1    2100 1100
	1    0    0    -1  
$EndComp
$Comp
L R R205
U 1 1 4CB5408F
P 2100 1900
F 0 "R205" V 2000 1900 50  0000 C CNN
F 1 "1k" V 2100 1900 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 2100 1900 60  0001 C CNN
F 3 "" H 2100 1900 60  0001 C CNN
	1    2100 1900
	1    0    0    -1  
$EndComp
$Comp
L R R214
U 1 1 4CB2E991
P 6200 2700
F 0 "R214" V 6100 2700 50  0000 C CNN
F 1 "10k" V 6200 2700 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 6200 2700 60  0001 C CNN
F 3 "" H 6200 2700 60  0001 C CNN
	1    6200 2700
	1    0    0    -1  
$EndComp
$Comp
L R R213
U 1 1 4CB2E96D
P 6200 2100
F 0 "R213" V 6100 2100 50  0000 C CNN
F 1 "TBD" V 6200 2100 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 6200 2100 60  0001 C CNN
F 3 "" H 6200 2100 60  0001 C CNN
	1    6200 2100
	1    0    0    -1  
$EndComp
$Comp
L CP1 C217
U 1 1 4CB2E8D7
P 6750 2250
F 0 "C217" H 6800 2350 50  0000 L CNN
F 1 "470µF/16V" H 6800 2150 50  0000 L CNN
F 2 "kicad-libraries:ELKO_83" H 6750 2250 60  0001 C CNN
F 3 "" H 6750 2250 60  0001 C CNN
	1    6750 2250
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH D203
U 1 1 4CB2E89F
P 2600 850
F 0 "D203" H 2600 950 40  0000 C CNN
F 1 "PMEG4050BEP" H 2600 750 40  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 2600 850 60  0001 C CNN
F 3 "" H 2600 850 60  0001 C CNN
	1    2600 850 
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L201
U 1 1 4CB2E88E
P 5750 1850
F 0 "L201" H 5700 1950 40  0000 C CNN
F 1 "10µH" H 5750 1750 40  0000 C CNN
F 2 "kicad-libraries:SRP7030" H 5750 1850 60  0001 C CNN
F 3 "SRP7030-100M" H 5750 1850 60  0001 C CNN
	1    5750 1850
	1    0    0    -1  
$EndComp
Text Notes 5950 1750 0    39   ~ 0
Programmed Voltage: 5.6V
$Comp
L DIODESCH D207
U 1 1 5B3239B4
P 9750 4350
F 0 "D207" H 9750 4450 40  0000 C CNN
F 1 "PMEG4050BEP" H 9750 4500 40  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 9750 4350 60  0001 C CNN
F 3 "" H 9750 4350 60  0001 C CNN
	1    9750 4350
	1    0    0    -1  
$EndComp
$Comp
L CP1 C224
U 1 1 5B323D27
P 10500 4550
F 0 "C224" H 10550 4650 50  0000 L CNN
F 1 "470µF/16V" H 10550 4450 50  0000 L CNN
F 2 "kicad-libraries:ELKO_83" H 10500 4550 60  0001 C CNN
F 3 "" H 10500 4550 60  0001 C CNN
	1    10500 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 5B3240C1
P 10500 4850
F 0 "#PWR032" H 10500 4850 30  0001 C CNN
F 1 "GND" H 10500 4780 30  0001 C CNN
F 2 "" H 10500 4850 60  0001 C CNN
F 3 "" H 10500 4850 60  0001 C CNN
	1    10500 4850
	1    0    0    -1  
$EndComp
$Comp
L C C223
U 1 1 5B324264
P 10050 4550
F 0 "C223" H 10100 4650 50  0000 L CNN
F 1 "100nF/16V" H 10050 4450 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 10050 4550 60  0001 C CNN
F 3 "" H 10050 4550 60  0001 C CNN
	1    10050 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 5B324574
P 10050 4850
F 0 "#PWR033" H 10050 4850 30  0001 C CNN
F 1 "GND" H 10050 4780 30  0001 C CNN
F 2 "" H 10050 4850 60  0001 C CNN
F 3 "" H 10050 4850 60  0001 C CNN
	1    10050 4850
	1    0    0    -1  
$EndComp
$Comp
L MIC2253 U204
U 1 1 5B324E3C
P 7500 5250
F 0 "U204" H 7100 5650 60  0000 C CNN
F 1 "MIC2253" H 7500 5250 60  0000 C CNN
F 2 "kicad-libraries:MLF12-3x3mm" H 7500 5300 60  0001 C CNN
F 3 "" H 7500 5300 60  0001 C CNN
	1    7500 5250
	1    0    0    -1  
$EndComp
$Comp
L D D201
U 1 1 5B324F83
P 2100 3850
F 0 "D201" H 2100 3950 50  0000 C CNN
F 1 "D" H 2100 3750 50  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 2100 3850 50  0001 C CNN
F 3 "" H 2100 3850 50  0000 C CNN
	1    2100 3850
	-1   0    0    1   
$EndComp
$Comp
L USB-MINI-B-SMD J201
U 1 1 5B3250C2
P 750 4600
F 0 "J201" H 450 5000 60  0000 C CNN
F 1 "USB Power In" H 600 4200 60  0000 C CNN
F 2 "kicad-libraries:MICRO_USB_SMD" H 750 4600 60  0001 C CNN
F 3 "" H 750 4600 60  0000 C CNN
	1    750  4600
	-1   0    0    -1  
$EndComp
$Comp
L DIODESCH D202
U 1 1 5B325250
P 2100 4350
F 0 "D202" H 2100 4450 40  0000 C CNN
F 1 "PMEG4050BEP" H 2100 4250 40  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 2100 4350 60  0001 C CNN
F 3 "" H 2100 4350 60  0001 C CNN
	1    2100 4350
	1    0    0    -1  
$EndComp
NoConn ~ 1400 4450
NoConn ~ 1400 4550
NoConn ~ 1400 4650
$Comp
L GND #PWR034
U 1 1 5B32560E
P 1550 5000
F 0 "#PWR034" H 1550 5000 30  0001 C CNN
F 1 "GND" H 1550 4930 30  0001 C CNN
F 2 "" H 1550 5000 60  0001 C CNN
F 3 "" H 1550 5000 60  0001 C CNN
	1    1550 5000
	1    0    0    -1  
$EndComp
$Comp
L Cs C201
U 1 1 5B325CA3
P 1550 4550
F 0 "C201" H 1575 4625 31  0000 L CNN
F 1 "100nF/16V" V 1600 4250 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 1550 4550 60  0001 C CNN
F 3 "" H 1550 4550 60  0000 C CNN
	1    1550 4550
	1    0    0    -1  
$EndComp
Text Notes 1750 4150 0    39   ~ 0
Input Voltage < Vout*(1-0.1)\n<5.4*(1-0.1)=4.86V
$Comp
L MAX17260_LS U201
U 1 1 5B3271B2
P 2400 6450
F 0 "U201" H 2150 6900 60  0000 C CNN
F 1 "MAX17260_LS" H 2600 6900 60  0000 C CNN
F 2 "kicad-libraries:TDFN14-3x3" H 2250 6900 60  0001 C CNN
F 3 "" H 2250 6900 60  0001 C CNN
	1    2400 6450
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L202
U 1 1 5B327B78
P 7450 4350
F 0 "L202" H 7400 4450 40  0000 C CNN
F 1 "2.2µH NRS5030T2R2NMGJ" H 7450 4250 40  0000 C CNN
F 2 "kicad-libraries:NRS5030" H 7450 4350 60  0001 C CNN
F 3 "" H 7450 4350 60  0001 C CNN
	1    7450 4350
	1    0    0    -1  
$EndComp
$Comp
L R R206
U 1 1 5B3282F3
P 2400 7300
F 0 "R206" V 2300 7300 50  0000 C CNN
F 1 "TBD" V 2400 7300 50  0000 C CNN
F 2 "kicad-libraries:R1210" H 2400 7300 60  0001 C CNN
F 3 "" H 2400 7300 60  0001 C CNN
	1    2400 7300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR035
U 1 1 5B32871D
P 2650 7450
F 0 "#PWR035" H 2650 7450 30  0001 C CNN
F 1 "GND" H 2650 7380 30  0001 C CNN
F 2 "" H 2650 7450 60  0001 C CNN
F 3 "" H 2650 7450 60  0001 C CNN
	1    2650 7450
	1    0    0    -1  
$EndComp
$Comp
L C C215
U 1 1 5B3292E3
P 6350 5200
F 0 "C215" H 6400 5300 50  0000 L CNN
F 1 "2.2uF/16V" V 6400 4750 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6350 5200 60  0001 C CNN
F 3 "" H 6350 5200 60  0001 C CNN
	1    6350 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 5B3297A7
P 7500 5950
F 0 "#PWR036" H 7500 5950 30  0001 C CNN
F 1 "GND" H 7500 5880 30  0001 C CNN
F 2 "" H 7500 5950 60  0001 C CNN
F 3 "" H 7500 5950 60  0001 C CNN
	1    7500 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 5B329BDD
P 6350 5950
F 0 "#PWR037" H 6350 5950 30  0001 C CNN
F 1 "GND" H 6350 5880 30  0001 C CNN
F 2 "" H 6350 5950 60  0001 C CNN
F 3 "" H 6350 5950 60  0001 C CNN
	1    6350 5950
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH D205
U 1 1 5B32A1E8
P 8250 4350
F 0 "D205" H 8250 4450 40  0000 C CNN
F 1 "PMEG4050BEP" H 8250 4250 40  0000 C CNN
F 2 "kicad-libraries:SOD-128" H 8250 4350 60  0001 C CNN
F 3 "" H 8250 4350 60  0001 C CNN
	1    8250 4350
	1    0    0    -1  
$EndComp
$Comp
L R R216
U 1 1 5B32A5D2
P 8750 4750
F 0 "R216" V 8650 4750 50  0000 C CNN
F 1 "TBD" V 8750 4750 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 8750 4750 60  0001 C CNN
F 3 "" H 8750 4750 60  0001 C CNN
	1    8750 4750
	1    0    0    -1  
$EndComp
$Comp
L R R217
U 1 1 5B32A826
P 8750 5400
F 0 "R217" V 8650 5400 50  0000 C CNN
F 1 "10k" V 8750 5400 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 8750 5400 60  0001 C CNN
F 3 "" H 8750 5400 60  0001 C CNN
	1    8750 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 5B32ABDC
P 8750 5950
F 0 "#PWR038" H 8750 5950 30  0001 C CNN
F 1 "GND" H 8750 5880 30  0001 C CNN
F 2 "" H 8750 5950 60  0001 C CNN
F 3 "" H 8750 5950 60  0001 C CNN
	1    8750 5950
	1    0    0    -1  
$EndComp
$Comp
L C C220
U 1 1 5B32B0D5
P 8950 4750
F 0 "C220" H 9000 4850 50  0000 L CNN
F 1 "100pF" H 8950 4650 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 8950 4750 60  0001 C CNN
F 3 "" H 8950 4750 60  0001 C CNN
	1    8950 4750
	1    0    0    -1  
$EndComp
$Comp
L R R215
U 1 1 5B32BBBD
P 8300 5350
F 0 "R215" V 8200 5350 50  0000 C CNN
F 1 "620" V 8300 5350 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 8300 5350 60  0001 C CNN
F 3 "" H 8300 5350 60  0001 C CNN
	1    8300 5350
	0    1    1    0   
$EndComp
$Comp
L C C219
U 1 1 5B32BEC5
P 8550 5650
F 0 "C219" H 8600 5750 50  0000 L CNN
F 1 "10nF" H 8550 5550 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 8550 5650 60  0001 C CNN
F 3 "" H 8550 5650 60  0001 C CNN
	1    8550 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR039
U 1 1 5B32C27C
P 8550 5950
F 0 "#PWR039" H 8550 5950 30  0001 C CNN
F 1 "GND" H 8550 5880 30  0001 C CNN
F 2 "" H 8550 5950 60  0001 C CNN
F 3 "" H 8550 5950 60  0001 C CNN
	1    8550 5950
	1    0    0    -1  
$EndComp
NoConn ~ 7750 5700
$Comp
L C C218
U 1 1 5B32C68F
P 6850 5550
F 0 "C218" H 6900 5650 50  0000 L CNN
F 1 "TBD" H 6850 5450 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6850 5550 60  0001 C CNN
F 3 "" H 6850 5550 60  0001 C CNN
	1    6850 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 5B32C8B6
P 6850 5950
F 0 "#PWR040" H 6850 5950 30  0001 C CNN
F 1 "GND" H 6850 5880 30  0001 C CNN
F 2 "" H 6850 5950 60  0001 C CNN
F 3 "" H 6850 5950 60  0001 C CNN
	1    6850 5950
	1    0    0    -1  
$EndComp
$Comp
L C C221
U 1 1 5B32CC5F
P 9250 4550
F 0 "C221" H 9300 4650 50  0000 L CNN
F 1 "10uF/16V" V 9350 4100 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 9250 4550 60  0001 C CNN
F 3 "" H 9250 4550 60  0001 C CNN
	1    9250 4550
	1    0    0    -1  
$EndComp
$Comp
L C C222
U 1 1 5B32D46E
P 9500 4550
F 0 "C222" H 9550 4650 50  0000 L CNN
F 1 "10uF/16V" V 9600 4100 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 9500 4550 60  0001 C CNN
F 3 "" H 9500 4550 60  0001 C CNN
	1    9500 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR041
U 1 1 5B32DAAD
P 9500 4800
F 0 "#PWR041" H 9500 4800 30  0001 C CNN
F 1 "GND" H 9500 4730 30  0001 C CNN
F 2 "" H 9500 4800 60  0001 C CNN
F 3 "" H 9500 4800 60  0001 C CNN
	1    9500 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR042
U 1 1 5B32DB39
P 9250 4800
F 0 "#PWR042" H 9250 4800 30  0001 C CNN
F 1 "GND" H 9250 4730 30  0001 C CNN
F 2 "" H 9250 4800 60  0001 C CNN
F 3 "" H 9250 4800 60  0001 C CNN
	1    9250 4800
	1    0    0    -1  
$EndComp
Text GLabel 6850 5050 0    39   Input ~ 0
BOOST-EN
$Comp
L R_PACK4 RP202
U 1 1 5B32FB67
P 2600 5050
F 0 "RP202" H 2600 5500 50  0000 C CNN
F 1 "10k" H 2600 5250 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 2600 5050 50  0001 C CNN
F 3 "" H 2600 5050 50  0000 C CNN
	1    2600 5050
	0    -1   -1   0   
$EndComp
Text Notes 1900 3700 0    39   ~ 0
No Schottky Diode -> 0.7V Voltage Drop
$Comp
L Cs C203
U 1 1 5B330C05
P 2750 4450
F 0 "C203" H 2775 4525 31  0000 L CNN
F 1 "10uF/16V" V 2850 4200 31  0000 L CNN
F 2 "kicad-libraries:C1206" H 2750 4450 60  0001 C CNN
F 3 "" H 2750 4450 60  0000 C CNN
	1    2750 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 5B3312F3
P 2750 4600
F 0 "#PWR043" H 2750 4600 30  0001 C CNN
F 1 "GND" H 2750 4530 30  0001 C CNN
F 2 "" H 2750 4600 60  0001 C CNN
F 3 "" H 2750 4600 60  0001 C CNN
	1    2750 4600
	1    0    0    -1  
$EndComp
$Comp
L Cs C205
U 1 1 5B33172D
P 3000 4450
F 0 "C205" H 3025 4525 31  0000 L CNN
F 1 "100nF/16V" V 3100 4200 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 3000 4450 60  0001 C CNN
F 3 "" H 3000 4450 60  0000 C CNN
	1    3000 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR044
U 1 1 5B331A73
P 3000 4600
F 0 "#PWR044" H 3000 4600 30  0001 C CNN
F 1 "GND" H 3000 4530 30  0001 C CNN
F 2 "" H 3000 4600 60  0001 C CNN
F 3 "" H 3000 4600 60  0001 C CNN
	1    3000 4600
	1    0    0    -1  
$EndComp
$Comp
L Cs C210
U 1 1 5B332139
P 5150 4450
F 0 "C210" H 5175 4525 31  0000 L CNN
F 1 "100nF/16V" V 5250 4200 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 5150 4450 60  0001 C CNN
F 3 "" H 5150 4450 60  0000 C CNN
	1    5150 4450
	1    0    0    -1  
$EndComp
$Comp
L Cs C214
U 1 1 5B3323C8
P 5400 4450
F 0 "C214" H 5425 4525 31  0000 L CNN
F 1 "10uF/16V" V 5500 4200 31  0000 L CNN
F 2 "kicad-libraries:C1206" H 5400 4450 60  0001 C CNN
F 3 "" H 5400 4450 60  0000 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR045
U 1 1 5B332694
P 5150 4600
F 0 "#PWR045" H 5150 4600 30  0001 C CNN
F 1 "GND" H 5150 4530 30  0001 C CNN
F 2 "" H 5150 4600 60  0001 C CNN
F 3 "" H 5150 4600 60  0001 C CNN
	1    5150 4600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR046
U 1 1 5B33361A
P 5400 4600
F 0 "#PWR046" H 5400 4600 30  0001 C CNN
F 1 "GND" H 5400 4530 30  0001 C CNN
F 2 "" H 5400 4600 60  0001 C CNN
F 3 "" H 5400 4600 60  0001 C CNN
	1    5400 4600
	1    0    0    -1  
$EndComp
Text GLabel 3150 4800 0    39   Input ~ 0
CHG-EN
$Comp
L Rs R207
U 1 1 5B335F73
P 3200 5550
F 0 "R207" V 3250 5550 31  0000 C CNN
F 1 "10k" V 3200 5550 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 3200 5550 60  0001 C CNN
F 3 "" H 3200 5550 60  0000 C CNN
	1    3200 5550
	1    0    0    -1  
$EndComp
Text GLabel 3150 4900 0    39   Input ~ 0
CHG-EN1
$Comp
L GND #PWR047
U 1 1 5B3381D2
P 3200 5700
F 0 "#PWR047" H 3200 5700 30  0001 C CNN
F 1 "GND" H 3200 5630 30  0001 C CNN
F 2 "" H 3200 5700 60  0001 C CNN
F 3 "" H 3200 5700 60  0001 C CNN
	1    3200 5700
	1    0    0    -1  
$EndComp
$Comp
L Cs C211
U 1 1 5B33AD9D
P 5150 4900
F 0 "C211" H 5175 4975 31  0000 L CNN
F 1 "100nF/16V" V 5250 4650 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 5150 4900 60  0001 C CNN
F 3 "" H 5150 4900 60  0000 C CNN
	1    5150 4900
	1    0    0    -1  
$EndComp
$Comp
L Cs C213
U 1 1 5B33AE63
P 5350 4900
F 0 "C213" H 5375 4975 31  0000 L CNN
F 1 "10uF/16V" V 5450 4650 31  0000 L CNN
F 2 "kicad-libraries:C1206" H 5350 4900 60  0001 C CNN
F 3 "" H 5350 4900 60  0000 C CNN
	1    5350 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR048
U 1 1 5B33AF96
P 5150 5050
F 0 "#PWR048" H 5150 5050 30  0001 C CNN
F 1 "GND" H 5150 4980 30  0001 C CNN
F 2 "" H 5150 5050 60  0001 C CNN
F 3 "" H 5150 5050 60  0001 C CNN
	1    5150 5050
	1    0    0    -1  
$EndComp
Text GLabel 5500 4800 2    39   Input ~ 0
BATTERY-OUT
Text GLabel 2850 5850 2    39   Output ~ 0
BATTERY-OUT
$Comp
L AGND #PWR049
U 1 1 5B340887
P 2150 7400
F 0 "#PWR049" H 2150 7150 50  0001 C CNN
F 1 "AGND" H 2150 7250 50  0000 C CNN
F 2 "" H 2150 7400 50  0000 C CNN
F 3 "" H 2150 7400 50  0000 C CNN
	1    2150 7400
	1    0    0    -1  
$EndComp
NoConn ~ 2000 6600
NoConn ~ 2000 6500
NoConn ~ 2000 6400
NoConn ~ 2000 6300
$Comp
L Cs C202
U 1 1 5B341766
P 1800 6200
F 0 "C202" H 1825 6275 31  0000 L CNN
F 1 "100nF/16V" V 1900 5950 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 1800 6200 60  0001 C CNN
F 3 "" H 1800 6200 60  0000 C CNN
	1    1800 6200
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR050
U 1 1 5B341D29
P 1800 6350
F 0 "#PWR050" H 1800 6100 50  0001 C CNN
F 1 "AGND" H 1800 6200 50  0000 C CNN
F 2 "" H 1800 6350 50  0000 C CNN
F 3 "" H 1800 6350 50  0000 C CNN
	1    1800 6350
	1    0    0    -1  
$EndComp
$Comp
L Rs R201
U 1 1 5B342589
P 1650 6600
F 0 "R201" V 1700 6600 31  0000 C CNN
F 1 "DNP" V 1650 6600 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 1650 6600 60  0001 C CNN
F 3 "" H 1650 6600 60  0000 C CNN
	1    1650 6600
	-1   0    0    1   
$EndComp
$Comp
L CONN_3 K201
U 1 1 5B343116
P 800 6200
F 0 "K201" V 750 6200 50  0000 C CNN
F 1 "CONN_3" V 850 6200 40  0000 C CNN
F 2 "kicad-libraries:JST-PH-3-THT" H 800 6200 60  0001 C CNN
F 3 "" H 800 6200 60  0000 C CNN
	1    800  6200
	-1   0    0    -1  
$EndComp
$Comp
L AGND #PWR051
U 1 1 5B3433FC
P 1150 6350
F 0 "#PWR051" H 1150 6100 50  0001 C CNN
F 1 "AGND" H 1150 6200 50  0000 C CNN
F 2 "" H 1150 6350 50  0000 C CNN
F 3 "" H 1150 6350 50  0000 C CNN
	1    1150 6350
	1    0    0    -1  
$EndComp
Text GLabel 3600 6550 2    39   Output ~ 0
BATTERY-ALRT
Text GLabel 3600 6650 2    39   BiDi ~ 0
BATTERY-SDA
Text GLabel 3600 6750 2    39   Input ~ 0
BATTERY-SCL
$Comp
L R_PACK4 RP201
U 1 1 5B344B9D
P 3200 6250
F 0 "RP201" H 3200 6700 50  0000 C CNN
F 1 "10k" H 3200 6450 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 3200 6250 50  0001 C CNN
F 3 "" H 3200 6250 50  0000 C CNN
	1    3200 6250
	0    1    -1   0   
$EndComp
NoConn ~ 3350 6450
$Comp
L 3V3 #PWR052
U 1 1 5B345A6F
P 3400 6050
F 0 "#PWR052" H 3400 6150 40  0001 C CNN
F 1 "3V3" H 3400 6175 40  0000 C CNN
F 2 "" H 3400 6050 60  0000 C CNN
F 3 "" H 3400 6050 60  0000 C CNN
	1    3400 6050
	1    0    0    -1  
$EndComp
$Comp
L Cs C204
U 1 1 5B347CD7
P 2950 6100
F 0 "C204" V 2850 6100 31  0000 L CNN
F 1 "470nF" V 3050 6050 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 2950 6100 60  0001 C CNN
F 3 "" H 2950 6100 60  0000 C CNN
	1    2950 6100
	0    1    1    0   
$EndComp
$Comp
L AGND #PWR053
U 1 1 5B3486FA
P 3100 6100
F 0 "#PWR053" H 3100 5850 50  0001 C CNN
F 1 "AGND" H 3100 5950 50  0000 C CNN
F 2 "" H 3100 6100 50  0000 C CNN
F 3 "" H 3100 6100 50  0000 C CNN
	1    3100 6100
	1    0    0    -1  
$EndComp
Text GLabel 2300 1650 2    39   Output ~ 0
DC-IN-VOLTAGE
$Comp
L Rs R202
U 1 1 5B34ECDE
P 1750 4450
F 0 "R202" V 1800 4450 31  0000 C CNN
F 1 "10k" V 1750 4450 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 1750 4450 60  0001 C CNN
F 3 "" H 1750 4450 60  0000 C CNN
	1    1750 4450
	1    0    0    -1  
$EndComp
$Comp
L Rs R203
U 1 1 5B34FA37
P 1750 4750
F 0 "R203" V 1800 4750 31  0000 C CNN
F 1 "10k" V 1750 4750 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 1750 4750 60  0001 C CNN
F 3 "" H 1750 4750 60  0000 C CNN
	1    1750 4750
	1    0    0    -1  
$EndComp
Text GLabel 1850 4600 2    39   Output ~ 0
USB-IN-VOLTAGE
$Comp
L +5V #PWR054
U 1 1 5B37831C
P 10600 4350
F 0 "#PWR054" H 10600 4200 50  0001 C CNN
F 1 "+5V" H 10600 4490 50  0000 C CNN
F 2 "" H 10600 4350 50  0001 C CNN
F 3 "" H 10600 4350 50  0001 C CNN
	1    10600 4350
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR055
U 1 1 5B37AAF3
P 6400 3700
F 0 "#PWR055" H 6400 3800 40  0001 C CNN
F 1 "3V3" H 6400 3825 40  0000 C CNN
F 2 "" H 6400 3700 60  0000 C CNN
F 3 "" H 6400 3700 60  0000 C CNN
	1    6400 3700
	1    0    0    -1  
$EndComp
$Comp
L AP7333 U205
U 1 1 5B37AB7F
P 5900 3700
F 0 "U205" H 5700 3900 60  0000 C CNN
F 1 " AP7333-33SAG-7 " H 6300 3900 60  0000 C CNN
F 2 "kicad-libraries:SOT23-3" H 5900 3700 60  0001 C CNN
F 3 "" H 5900 3700 60  0000 C CNN
	1    5900 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR056
U 1 1 5B37B480
P 5900 4150
F 0 "#PWR056" H 5900 4150 30  0001 C CNN
F 1 "GND" H 5900 4080 30  0001 C CNN
F 2 "" H 5900 4150 60  0001 C CNN
F 3 "" H 5900 4150 60  0001 C CNN
	1    5900 4150
	1    0    0    -1  
$EndComp
$Comp
L Cs C225
U 1 1 5B37C6FD
P 5500 3800
F 0 "C225" H 5525 3875 31  0000 L CNN
F 1 "1µF/10V" V 5600 3600 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 5500 3800 60  0001 C CNN
F 3 "" H 5500 3800 60  0000 C CNN
	1    5500 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR057
U 1 1 5B37D5C9
P 5500 3950
F 0 "#PWR057" H 5500 3950 30  0001 C CNN
F 1 "GND" H 5500 3880 30  0001 C CNN
F 2 "" H 5500 3950 60  0001 C CNN
F 3 "" H 5500 3950 60  0001 C CNN
	1    5500 3950
	1    0    0    -1  
$EndComp
$Comp
L Cs C226
U 1 1 5B37D748
P 6300 3800
F 0 "C226" H 6325 3875 31  0000 L CNN
F 1 "1µF/10V" V 6400 3600 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6300 3800 60  0001 C CNN
F 3 "" H 6300 3800 60  0000 C CNN
	1    6300 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR058
U 1 1 5B37D8EE
P 6300 3950
F 0 "#PWR058" H 6300 3950 30  0001 C CNN
F 1 "GND" H 6300 3880 30  0001 C CNN
F 2 "" H 6300 3950 60  0001 C CNN
F 3 "" H 6300 3950 60  0001 C CNN
	1    6300 3950
	1    0    0    -1  
$EndComp
$Comp
L BQ2407X U202
U 1 1 5B3F55C8
P 4300 4950
F 0 "U202" H 3850 5700 39  0000 C CNN
F 1 "BQ2407X" H 4700 4200 39  0000 C CNN
F 2 "kicad-libraries:QFN16-0.5" H 4300 5000 39  0001 C CNN
F 3 "" H 4300 5000 39  0001 C CNN
	1    4300 4950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR059
U 1 1 5B3F6580
P 5350 5050
F 0 "#PWR059" H 5350 5050 30  0001 C CNN
F 1 "GND" H 5350 4980 30  0001 C CNN
F 2 "" H 5350 5050 60  0001 C CNN
F 3 "" H 5350 5050 60  0001 C CNN
	1    5350 5050
	1    0    0    -1  
$EndComp
Text GLabel 3150 5000 0    39   Input ~ 0
CHG-EN2
Text GLabel 3150 5100 0    39   Input ~ 0
CHG-SYSOFF
Text GLabel 2100 5350 0    39   Output ~ 0
CHG-nCHG
Text GLabel 2100 5450 0    39   Output ~ 0
CHG-nPGOOD
NoConn ~ 2350 5250
NoConn ~ 2450 5250
$Comp
L 3V3 #PWR060
U 1 1 5B3FC43F
P 2400 4800
F 0 "#PWR060" H 2400 4900 40  0001 C CNN
F 1 "3V3" H 2400 4925 40  0000 C CNN
F 2 "" H 2400 4800 60  0000 C CNN
F 3 "" H 2400 4800 60  0000 C CNN
	1    2400 4800
	1    0    0    -1  
$EndComp
NoConn ~ 2350 4850
NoConn ~ 2450 4850
$Comp
L GND #PWR061
U 1 1 5B3FD35E
P 4100 6100
F 0 "#PWR061" H 4100 6100 30  0001 C CNN
F 1 "GND" H 4100 6030 30  0001 C CNN
F 2 "" H 4100 6100 60  0001 C CNN
F 3 "" H 4100 6100 60  0001 C CNN
	1    4100 6100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR062
U 1 1 5B3FD72C
P 4200 6100
F 0 "#PWR062" H 4200 6100 30  0001 C CNN
F 1 "GND" H 4200 6030 30  0001 C CNN
F 2 "" H 4200 6100 60  0001 C CNN
F 3 "" H 4200 6100 60  0001 C CNN
	1    4200 6100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR063
U 1 1 5B3FD7F4
P 4300 6100
F 0 "#PWR063" H 4300 6100 30  0001 C CNN
F 1 "GND" H 4300 6030 30  0001 C CNN
F 2 "" H 4300 6100 60  0001 C CNN
F 3 "" H 4300 6100 60  0001 C CNN
	1    4300 6100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR064
U 1 1 5B3FD8BC
P 4400 6100
F 0 "#PWR064" H 4400 6100 30  0001 C CNN
F 1 "GND" H 4400 6030 30  0001 C CNN
F 2 "" H 4400 6100 60  0001 C CNN
F 3 "" H 4400 6100 60  0001 C CNN
	1    4400 6100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR065
U 1 1 5B3FD984
P 4500 6100
F 0 "#PWR065" H 4500 6100 30  0001 C CNN
F 1 "GND" H 4500 6030 30  0001 C CNN
F 2 "" H 4500 6100 60  0001 C CNN
F 3 "" H 4500 6100 60  0001 C CNN
	1    4500 6100
	1    0    0    -1  
$EndComp
$Comp
L Rs R211
U 1 1 5B3FE7DF
P 5050 5700
F 0 "R211" V 5100 5700 31  0000 C CNN
F 1 "10k" V 5050 5700 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 5050 5700 60  0001 C CNN
F 3 "" H 5050 5700 60  0000 C CNN
	1    5050 5700
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR066
U 1 1 5B3FEED7
P 5050 6100
F 0 "#PWR066" H 5050 6100 30  0001 C CNN
F 1 "GND" H 5050 6030 30  0001 C CNN
F 2 "" H 5050 6100 60  0001 C CNN
F 3 "" H 5050 6100 60  0001 C CNN
	1    5050 6100
	1    0    0    -1  
$EndComp
Text Notes 5150 6000 1    39   ~ 0
Thermistor not used
$Comp
L Rs R209
U 1 1 5B3FF3C5
P 4400 5900
F 0 "R209" V 4450 5900 31  0000 C CNN
F 1 "DNP" V 4400 5900 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 4400 5900 60  0001 C CNN
F 3 "" H 4400 5900 60  0000 C CNN
	1    4400 5900
	-1   0    0    1   
$EndComp
Text Notes 4450 6750 1    39   ~ 0
Safety Timer Default
Text Notes 4350 7100 1    39   ~ 0
1.1k->1.5A  max input current
$Comp
L Rs R210
U 1 1 5B40026C
P 4500 5900
F 0 "R210" V 4550 5900 31  0000 C CNN
F 1 "590" V 4500 5900 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 4500 5900 60  0001 C CNN
F 3 "" H 4500 5900 60  0000 C CNN
	1    4500 5900
	-1   0    0    1   
$EndComp
Text Notes 4550 6950 1    39   ~ 0
590->1.5A Charge Current
$Comp
L Rs R208
U 1 1 5B400D26
P 4300 5900
F 0 "R208" V 4350 5900 31  0000 C CNN
F 1 "1k1" V 4300 5900 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 4300 5900 60  0001 C CNN
F 3 "" H 4300 5900 60  0000 C CNN
	1    4300 5900
	-1   0    0    1   
$EndComp
Text Notes 3450 4250 0    39   ~ 0
1.5A max
Text GLabel 5150 4300 1    39   Input ~ 0
BOOST-IN
Wire Wire Line
	4250 1750 3050 1750
Wire Wire Line
	6050 1850 9550 1850
Wire Wire Line
	2100 1350 2100 1650
Wire Wire Line
	4150 2050 4250 2050
Wire Wire Line
	3050 3050 3050 2450
Connection ~ 4100 1750
Wire Wire Line
	4100 1750 4100 1850
Wire Wire Line
	4100 1850 4250 1850
Connection ~ 3050 1750
Wire Wire Line
	3400 1750 3400 2050
Wire Wire Line
	3700 3050 3700 2450
Wire Wire Line
	5450 1550 5450 1850
Wire Wire Line
	5450 1850 5050 1850
Wire Wire Line
	3050 2050 3050 850 
Wire Wire Line
	4150 2600 4150 2550
Connection ~ 6750 1850
Connection ~ 6200 1850
Wire Wire Line
	6450 1850 6450 2050
Wire Wire Line
	6450 3050 6450 2450
Wire Wire Line
	6200 2450 6200 2350
Wire Wire Line
	5300 3050 5300 2450
Wire Wire Line
	6200 3050 6200 2950
Wire Wire Line
	5300 2050 5300 1850
Connection ~ 5300 1850
Connection ~ 6200 2400
Wire Wire Line
	6750 3050 6750 2450
Wire Wire Line
	6750 1850 6750 2050
Connection ~ 6450 1850
Wire Wire Line
	1150 1150 1150 850 
Wire Wire Line
	5050 1950 5150 1950
Wire Wire Line
	5150 1950 5150 2550
Wire Wire Line
	5150 2550 5500 2550
Wire Wire Line
	5500 2550 5500 2400
Wire Wire Line
	5500 2400 6200 2400
Wire Wire Line
	5050 3050 5050 2050
Wire Wire Line
	5050 1750 5050 1550
Connection ~ 5450 1850
Wire Wire Line
	4250 1950 3700 1950
Wire Wire Line
	3700 1950 3700 2050
Wire Wire Line
	4150 3050 4150 3000
Wire Wire Line
	1150 1350 1150 3050
Wire Wire Line
	3400 2450 3400 3050
Connection ~ 3400 1750
Wire Wire Line
	2100 1650 2300 1650
Connection ~ 2100 1650
Wire Wire Line
	1150 850  2400 850 
Connection ~ 2100 850 
Wire Wire Line
	2100 2150 2100 3050
Wire Wire Line
	3050 850  2800 850 
Wire Wire Line
	9950 4350 10600 4350
Connection ~ 10500 4350
Wire Wire Line
	10050 4850 10050 4750
Wire Wire Line
	10500 4850 10500 4750
Connection ~ 10050 4350
Wire Wire Line
	7250 1850 7250 3400
Wire Wire Line
	7250 3400 1150 3400
Wire Wire Line
	1150 3400 1150 3850
Wire Wire Line
	1150 3850 1950 3850
Connection ~ 7250 1850
Wire Wire Line
	1400 4850 1750 4850
Wire Wire Line
	1550 4650 1550 5000
Wire Wire Line
	1400 4750 1550 4750
Connection ~ 1550 4850
Connection ~ 1550 4750
Connection ~ 1550 4350
Wire Wire Line
	7250 5700 7250 5850
Wire Wire Line
	7250 5850 7650 5850
Wire Wire Line
	7500 5700 7500 5950
Wire Wire Line
	7650 5850 7650 5700
Connection ~ 7500 5850
Wire Wire Line
	7400 5700 7400 5850
Connection ~ 7400 5850
Wire Wire Line
	6350 5950 6350 5400
Wire Wire Line
	4900 4350 7150 4350
Wire Wire Line
	6350 4350 6350 5000
Wire Wire Line
	7000 4350 7000 4700
Wire Wire Line
	7000 4700 7300 4700
Wire Wire Line
	7300 4700 7300 4800
Connection ~ 7000 4350
Wire Wire Line
	7700 4800 7700 4700
Wire Wire Line
	7600 4700 7900 4700
Wire Wire Line
	7900 4700 7900 4350
Wire Wire Line
	7750 4350 8050 4350
Wire Wire Line
	7600 4800 7600 4700
Connection ~ 7700 4700
Connection ~ 7900 4350
Wire Wire Line
	8000 5050 8550 5050
Wire Wire Line
	8550 5050 8550 4350
Wire Wire Line
	8450 4350 9550 4350
Wire Wire Line
	8750 5950 8750 5650
Wire Wire Line
	8000 5150 8950 5150
Wire Wire Line
	8750 5150 8750 5000
Wire Wire Line
	8750 4350 8750 4500
Connection ~ 8550 4350
Wire Wire Line
	8950 5150 8950 4950
Connection ~ 8750 5150
Wire Wire Line
	8950 4350 8950 4550
Connection ~ 8750 4350
Wire Wire Line
	10500 1850 10500 4350
Connection ~ 8950 4350
Wire Wire Line
	8550 5950 8550 5850
Wire Wire Line
	8550 5450 8550 5350
Wire Wire Line
	8000 5350 8050 5350
Wire Wire Line
	7000 5350 6850 5350
Wire Wire Line
	6850 5750 6850 5950
Wire Wire Line
	9250 4800 9250 4750
Wire Wire Line
	9500 4800 9500 4750
Connection ~ 9500 4350
Connection ~ 9250 4350
Wire Wire Line
	6850 5050 7000 5050
Wire Wire Line
	2250 3850 2750 3850
Wire Wire Line
	2750 3850 2750 4350
Connection ~ 2750 4350
Wire Wire Line
	2750 4600 2750 4550
Wire Wire Line
	3000 4600 3000 4550
Connection ~ 3000 4350
Wire Wire Line
	5150 4550 5150 4600
Wire Wire Line
	5400 4550 5400 4600
Connection ~ 4950 4350
Connection ~ 5150 4350
Connection ~ 5400 4350
Wire Wire Line
	10500 1850 9950 1850
Wire Wire Line
	3200 5700 3200 5650
Wire Wire Line
	3200 4800 3200 5450
Connection ~ 3200 4800
Wire Wire Line
	4900 4800 5500 4800
Wire Wire Line
	4900 4900 5000 4900
Wire Wire Line
	5000 4900 5000 4800
Connection ~ 5000 4800
Connection ~ 5150 4800
Connection ~ 5350 4800
Connection ~ 6350 4350
Wire Wire Line
	2650 7050 2650 7450
Connection ~ 2650 7300
Wire Wire Line
	2350 7050 2350 7150
Wire Wire Line
	2350 7150 2150 7150
Wire Wire Line
	2150 7050 2150 7400
Wire Wire Line
	2250 7150 2250 7050
Connection ~ 2250 7150
Connection ~ 2150 7150
Connection ~ 2150 7300
Wire Wire Line
	2850 5850 2000 5850
Wire Wire Line
	2000 5850 2000 6200
Connection ~ 2000 6100
Wire Wire Line
	1800 6300 1800 6350
Wire Wire Line
	1500 6700 2000 6700
Wire Wire Line
	1650 6500 1650 6100
Connection ~ 1800 6100
Wire Wire Line
	1150 6300 1150 6350
Connection ~ 1650 6100
Wire Wire Line
	1500 6700 1500 6200
Connection ~ 1650 6700
Wire Wire Line
	2800 6300 3100 6300
Wire Wire Line
	3100 6300 3100 6550
Wire Wire Line
	3100 6550 3600 6550
Wire Wire Line
	2800 6400 3050 6400
Wire Wire Line
	3050 6400 3050 6650
Wire Wire Line
	3050 6650 3600 6650
Wire Wire Line
	3600 6750 3000 6750
Wire Wire Line
	3000 6750 3000 6500
Wire Wire Line
	3000 6500 2800 6500
Wire Wire Line
	3250 6450 3250 6550
Connection ~ 3250 6550
Wire Wire Line
	3450 6450 3450 6650
Connection ~ 3450 6650
Wire Wire Line
	3550 6450 3550 6750
Connection ~ 3550 6750
Wire Wire Line
	3250 6050 3550 6050
Connection ~ 3350 6050
Connection ~ 3400 6050
Connection ~ 3450 6050
Wire Wire Line
	3100 6100 3050 6100
Wire Wire Line
	2850 6100 2800 6100
Wire Wire Line
	1500 6200 1150 6200
Wire Wire Line
	1150 6100 2000 6100
Wire Wire Line
	1550 4350 1550 4450
Wire Wire Line
	1750 4550 1750 4650
Wire Wire Line
	1850 4600 1750 4600
Connection ~ 1750 4600
Wire Wire Line
	5400 3700 5400 4350
Wire Wire Line
	5900 4150 5900 4100
Wire Wire Line
	5550 3700 5400 3700
Wire Wire Line
	6250 3700 6400 3700
Wire Wire Line
	6300 3950 6300 3900
Wire Wire Line
	5500 3950 5500 3900
Connection ~ 6300 3700
Connection ~ 5500 3700
Connection ~ 1750 4350
Wire Wire Line
	1400 4350 1900 4350
Wire Wire Line
	5350 5050 5350 5000
Wire Wire Line
	5150 5050 5150 5000
Wire Wire Line
	3700 4350 2300 4350
Wire Wire Line
	3150 4800 3350 4800
Wire Wire Line
	3350 4800 3350 4650
Wire Wire Line
	3350 4650 3700 4650
Wire Wire Line
	3700 4750 3450 4750
Wire Wire Line
	3450 4750 3450 4900
Wire Wire Line
	3450 4900 3150 4900
Wire Wire Line
	3150 5000 3550 5000
Wire Wire Line
	3550 5000 3550 4850
Wire Wire Line
	3550 4850 3700 4850
Wire Wire Line
	3700 4950 3650 4950
Wire Wire Line
	3650 4950 3650 5100
Wire Wire Line
	3650 5100 3150 5100
Wire Wire Line
	3700 5250 2750 5250
Wire Wire Line
	2750 5250 2750 5350
Wire Wire Line
	2750 5350 2100 5350
Wire Wire Line
	2100 5450 2850 5450
Wire Wire Line
	2850 5450 2850 5350
Wire Wire Line
	2850 5350 3700 5350
Wire Wire Line
	2250 5250 2250 5350
Connection ~ 2250 5350
Wire Wire Line
	2550 5250 2550 5450
Connection ~ 2550 5450
Wire Wire Line
	2250 4800 2550 4800
Wire Wire Line
	2550 4800 2550 4850
Wire Wire Line
	2250 4800 2250 4850
Connection ~ 2400 4800
Wire Wire Line
	4100 5750 4100 6100
Wire Wire Line
	4200 5750 4200 6100
Wire Wire Line
	4900 5300 5050 5300
Wire Wire Line
	5050 5300 5050 5600
Wire Wire Line
	5050 6100 5050 5800
Wire Wire Line
	4400 5750 4400 5800
Wire Wire Line
	4400 6000 4400 6100
Wire Wire Line
	4300 5800 4300 5750
Wire Wire Line
	4300 6000 4300 6100
Wire Wire Line
	4500 6100 4500 6000
Wire Wire Line
	4500 5800 4500 5750
Wire Wire Line
	4950 4350 4950 4450
Wire Wire Line
	4950 4450 4900 4450
Wire Wire Line
	5150 4350 5150 4300
$Comp
L C C227
U 1 1 5B45CD51
P 6050 5200
F 0 "C227" H 6100 5300 50  0000 L CNN
F 1 "10uF/16V" V 6000 4750 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 6050 5200 60  0001 C CNN
F 3 "" H 6050 5200 60  0001 C CNN
	1    6050 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR067
U 1 1 5B45CEA4
P 6050 5950
F 0 "#PWR067" H 6050 5950 30  0001 C CNN
F 1 "GND" H 6050 5880 30  0001 C CNN
F 2 "" H 6050 5950 60  0001 C CNN
F 3 "" H 6050 5950 60  0001 C CNN
	1    6050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5950 6050 5400
Wire Wire Line
	6050 5000 6050 4350
Connection ~ 6050 4350
Text GLabel 3000 4300 1    39   Input ~ 0
PWR-IN
Wire Wire Line
	3000 4350 3000 4300
$EndSCHEMATC
