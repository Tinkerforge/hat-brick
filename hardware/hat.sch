EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "HAT Brick"
Date "2020-08-25"
Rev "1.6"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2020, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5750 6650 1000 1000
U 5B31E6A8
F0 "Power Supply" 60
F1 "power_supply.sch" 60
$EndSheet
Text GLabel 1400 5200 2    39   Input ~ 0
DC-IN-VOLTAGE
Text GLabel 1400 5300 2    39   Input ~ 0
USB-IN-VOLTAGE
$Comp
L tinkerforge:Raspberry_Pi_2_3 J101
U 1 1 5B35250F
P 8950 4800
F 0 "J101" H 9650 3550 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 8550 5700 50  0000 C CNN
F 2 "kicad-libraries:raspberrypi_hat2" H 9950 6050 50  0001 C CNN
F 3 "" H 9000 4650 50  0001 C CNN
	1    8950 4800
	1    0    0    -1  
$EndComp
$Sheet
S 4600 6650 1000 1000
U 5B352770
F0 "Bricklets" 60
F1 "bricklets.sch" 60
$EndSheet
Text GLabel 7000 4000 0    39   Output ~ 0
B-CS2
Text GLabel 7000 4600 0    39   Output ~ 0
B-CS1
Text GLabel 7000 4400 0    39   Output ~ 0
B-CS4
Text GLabel 10550 4600 2    39   Output ~ 0
B-CS5
Text GLabel 10550 4400 2    39   Output ~ 0
B-CS7
Text GLabel 10550 4300 2    39   Output ~ 0
B-CS8
Text GLabel 7000 4500 0    39   Output ~ 0
B-CS6
Text GLabel 10550 5000 2    39   Output ~ 0
B-CLK
Text GLabel 10550 4900 2    39   Output ~ 0
B-MOSI
Text GLabel 10550 4800 2    39   Input ~ 0
B-MISO
Text GLabel 8700 900  1    39   Output ~ 0
B-5V
Text GLabel 10550 1050 2    39   Output ~ 0
B-3V3
Text GLabel 6900 5600 0    39   Output ~ 0
RASP-SC
Text GLabel 6900 5500 0    39   BiDi ~ 0
RASP-SD
Text GLabel 1450 5700 2    39   Input ~ 0
RASP-SC
Text GLabel 1450 5600 2    39   BiDi ~ 0
RASP-SD
$Comp
L tinkerforge:R_PACK4 RP101
U 1 1 5B363AF1
P 7400 5250
F 0 "RP101" H 7400 5700 50  0000 C CNN
F 1 "3.9k" H 7400 5200 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 5250 50  0001 C CNN
F 3 "" H 7400 5250 50  0000 C CNN
	1    7400 5250
	0    -1   1    0   
$EndComp
Wire Wire Line
	6900 5500 7050 5500
Wire Wire Line
	6900 5600 7350 5600
Wire Wire Line
	7050 5450 7050 5500
Connection ~ 7050 5500
Wire Wire Line
	7350 5450 7350 5600
Connection ~ 7350 5600
NoConn ~ 7150 5450
NoConn ~ 7250 5450
Wire Wire Line
	9850 5000 10000 5000
Wire Wire Line
	9850 4900 10000 4900
Wire Wire Line
	9850 4800 10000 4800
Wire Wire Line
	10400 4800 10550 4800
Wire Wire Line
	10550 4900 10400 4900
Wire Wire Line
	10400 5000 10550 5000
Text GLabel 1900 3350 2    39   Input ~ 0
B-CLK
Text GLabel 1900 3450 2    39   Input ~ 0
B-MOSI
Text GLabel 1400 5000 2    39   Output ~ 0
B-MISO
Text GLabel 7000 4300 0    39   Output ~ 0
B-CS3
NoConn ~ 9850 5500
NoConn ~ 9850 5600
$Comp
L tinkerforge:3V3 #PWR01
U 1 1 5B36ED34
P 7200 5000
F 0 "#PWR01" H 7200 5100 40  0001 C CNN
F 1 "3V3" H 7200 5125 40  0000 C CNN
F 2 "" H 7200 5000 60  0000 C CNN
F 3 "" H 7200 5000 60  0000 C CNN
	1    7200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5050 7050 5000
Wire Wire Line
	7050 5000 7150 5000
Wire Wire Line
	7350 5000 7350 5050
Connection ~ 7200 5000
Wire Wire Line
	7250 5050 7250 5000
Connection ~ 7250 5000
Wire Wire Line
	7150 5050 7150 5000
Connection ~ 7150 5000
Text GLabel 1900 3250 2    39   Input ~ 0
B-CS8
Wire Wire Line
	10550 4400 10400 4400
Wire Wire Line
	9850 4400 10000 4400
Wire Wire Line
	9850 4300 10000 4300
Wire Wire Line
	10400 4300 10550 4300
Wire Wire Line
	7000 4100 7200 4100
Wire Wire Line
	7000 4000 7200 4000
$Comp
L tinkerforge:GND #PWR02
U 1 1 5B375DA1
P 8900 6250
F 0 "#PWR02" H 8900 6250 30  0001 C CNN
F 1 "GND" H 8900 6180 30  0001 C CNN
F 2 "" H 8900 6250 60  0000 C CNN
F 3 "" H 8900 6250 60  0000 C CNN
	1    8900 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 6100 8550 6200
Wire Wire Line
	8550 6200 8650 6200
Wire Wire Line
	9250 6200 9250 6100
Wire Wire Line
	9150 6100 9150 6200
Connection ~ 9150 6200
Wire Wire Line
	9050 6100 9050 6200
Connection ~ 9050 6200
Wire Wire Line
	8950 6100 8950 6200
Connection ~ 8950 6200
Wire Wire Line
	8850 6100 8850 6200
Connection ~ 8850 6200
Wire Wire Line
	8750 6100 8750 6200
Connection ~ 8750 6200
Wire Wire Line
	8650 6100 8650 6200
Connection ~ 8650 6200
Wire Wire Line
	8900 6250 8900 6200
Connection ~ 8900 6200
NoConn ~ 9050 3500
NoConn ~ 9150 3500
$Comp
L tinkerforge:3V3 #PWR04
U 1 1 5B37E484
P 1950 700
F 0 "#PWR04" H 1950 800 40  0001 C CNN
F 1 "3V3" H 1950 825 40  0000 C CNN
F 2 "" H 1950 700 60  0000 C CNN
F 3 "" H 1950 700 60  0000 C CNN
	1    1950 700 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR05
U 1 1 5B37E57D
P 9700 1550
F 0 "#PWR05" H 9700 1550 30  0001 C CNN
F 1 "GND" H 9700 1480 30  0001 C CNN
F 2 "" H 9700 1550 60  0000 C CNN
F 3 "" H 9700 1550 60  0000 C CNN
	1    9700 1550
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR06
U 1 1 5B37E601
P 1950 1450
F 0 "#PWR06" H 1950 1450 30  0001 C CNN
F 1 "GND" H 1950 1380 30  0001 C CNN
F 2 "" H 1950 1450 60  0000 C CNN
F 3 "" H 1950 1450 60  0000 C CNN
	1    1950 1450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:LD1117 U102
U 1 1 5B37E9FB
P 9700 1250
F 0 "U102" H 9500 1750 60  0000 C CNN
F 1 "LD1117" H 9700 1550 60  0000 C CNN
F 2 "kicad-libraries:SOT-223" H 9700 1250 60  0001 C CNN
F 3 "" H 9700 1250 60  0000 C CNN
	1    9700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1550 9700 1450
$Comp
L tinkerforge:C C109
U 1 1 5B37F271
P 9100 1250
F 0 "C109" H 9150 1350 50  0000 L CNN
F 1 "100nF" H 9150 1150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 9100 1250 60  0001 C CNN
F 3 "" H 9100 1250 60  0000 C CNN
	1    9100 1250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR07
U 1 1 5B37F495
P 9100 1550
F 0 "#PWR07" H 9100 1550 30  0001 C CNN
F 1 "GND" H 9100 1480 30  0001 C CNN
F 2 "" H 9100 1550 60  0000 C CNN
F 3 "" H 9100 1550 60  0000 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1550 9100 1450
$Comp
L tinkerforge:C C112
U 1 1 5B37F618
P 10250 1250
F 0 "C112" H 10300 1350 50  0000 L CNN
F 1 "10uF" H 10300 1150 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 10250 1250 60  0001 C CNN
F 3 "" H 10250 1250 60  0000 C CNN
	1    10250 1250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR08
U 1 1 5B37F6B0
P 10250 1550
F 0 "#PWR08" H 10250 1550 30  0001 C CNN
F 1 "GND" H 10250 1480 30  0001 C CNN
F 2 "" H 10250 1550 60  0000 C CNN
F 3 "" H 10250 1550 60  0000 C CNN
	1    10250 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1050 10250 1050
Wire Wire Line
	10250 1450 10250 1550
Connection ~ 10250 1050
$Comp
L tinkerforge:C C108
U 1 1 5B37F8B8
P 8800 1250
F 0 "C108" H 8850 1350 50  0000 L CNN
F 1 "10uF" H 8850 1150 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 8800 1250 60  0001 C CNN
F 3 "" H 8800 1250 60  0000 C CNN
	1    8800 1250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR09
U 1 1 5B37F92B
P 8800 1550
F 0 "#PWR09" H 8800 1550 30  0001 C CNN
F 1 "GND" H 8800 1480 30  0001 C CNN
F 2 "" H 8800 1550 60  0000 C CNN
F 3 "" H 8800 1550 60  0000 C CNN
	1    8800 1550
	1    0    0    -1  
$EndComp
Connection ~ 9100 1050
Wire Wire Line
	8700 900  8700 1050
Connection ~ 8800 1050
Wire Wire Line
	8800 1550 8800 1450
Connection ~ 8700 1050
Wire Wire Line
	6600 950  6600 1050
$Comp
L tinkerforge:C C107
U 1 1 5B37FDC9
P 6600 1250
F 0 "C107" H 6400 1350 50  0000 L CNN
F 1 "10uF" H 6400 1150 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 6600 1250 60  0001 C CNN
F 3 "" H 6600 1250 60  0000 C CNN
	1    6600 1250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR010
U 1 1 5B37FE55
P 6600 1550
F 0 "#PWR010" H 6600 1550 30  0001 C CNN
F 1 "GND" H 6600 1480 30  0001 C CNN
F 2 "" H 6600 1550 60  0000 C CNN
F 3 "" H 6600 1550 60  0000 C CNN
	1    6600 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1550 6600 1450
Connection ~ 6600 1050
$Comp
L tinkerforge:INDUCTs L101
U 1 1 5B3801CB
P 7450 1050
F 0 "L101" V 7530 1050 50  0000 C CNN
F 1 "742792040" V 7350 1050 50  0000 C CNN
F 2 "kicad-libraries:R0805" H 7450 1050 60  0001 C CNN
F 3 "" H 7450 1050 60  0000 C CNN
	1    7450 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 3300 8750 3500
Wire Wire Line
	8850 2250 8850 2700
$Comp
L tinkerforge:C C111
U 1 1 5B381025
P 9050 3100
F 0 "C111" V 8900 3050 50  0000 L CNN
F 1 "100nF" V 9200 3000 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 9050 3100 60  0001 C CNN
F 3 "" H 9050 3100 60  0000 C CNN
	1    9050 3100
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:GND #PWR012
U 1 1 5B3810DF
P 9250 3150
F 0 "#PWR012" H 9250 3150 30  0001 C CNN
F 1 "GND" H 9250 3080 30  0001 C CNN
F 2 "" H 9250 3150 60  0000 C CNN
F 3 "" H 9250 3150 60  0000 C CNN
	1    9250 3150
	1    0    0    -1  
$EndComp
Connection ~ 8850 3300
Wire Wire Line
	9250 3100 9250 3150
$Comp
L tinkerforge:INDUCTs L102
U 1 1 5B381518
P 7350 2400
F 0 "L102" V 7430 2400 50  0000 C CNN
F 1 "742792040" V 7400 2600 50  0000 C CNN
F 2 "kicad-libraries:R0805" H 7350 2400 60  0001 C CNN
F 3 "" H 7350 2400 60  0000 C CNN
	1    7350 2400
	-1   0    0    1   
$EndComp
Text GLabel 7550 1850 3    39   Input ~ 0
B-EN
Connection ~ 8850 3100
Wire Wire Line
	8750 3300 8850 3300
$Comp
L tinkerforge:C C110
U 1 1 5B3833F9
P 9050 2700
F 0 "C110" V 8900 2650 50  0000 L CNN
F 1 "10uF" V 9200 2600 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 9050 2700 60  0001 C CNN
F 3 "" H 9050 2700 60  0000 C CNN
	1    9050 2700
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:GND #PWR014
U 1 1 5B383655
P 9250 2750
F 0 "#PWR014" H 9250 2750 30  0001 C CNN
F 1 "GND" H 9250 2680 30  0001 C CNN
F 2 "" H 9250 2750 60  0000 C CNN
F 3 "" H 9250 2750 60  0000 C CNN
	1    9250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2750 9250 2700
Connection ~ 8850 2700
Text GLabel 6800 2800 0    39   Input ~ 0
RASP-EN
Text GLabel 1900 2850 2    39   Output ~ 0
RASP-GP
Text GLabel 10550 5200 2    39   Output ~ 0
RASP-GP
Text Notes 600  7700 0    39   ~ 0
Copyright Tinkerforge GmbH 2020.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions
$Comp
L tinkerforge:C C103
U 1 1 5B38A2DF
P 1950 1100
F 0 "C103" H 2000 1200 50  0000 L CNN
F 1 "100nF" H 2000 1000 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 1950 1100 60  0001 C CNN
F 3 "" H 1950 1100 60  0000 C CNN
	1    1950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 850  1550 850 
Connection ~ 1950 850 
Connection ~ 1950 1350
Wire Wire Line
	1950 1300 1950 1350
$Comp
L tinkerforge:CONN_01X02 J102
U 1 1 5B38E436
P 2400 4350
F 0 "J102" H 2400 4500 50  0000 C CNN
F 1 "Boot" H 2400 4200 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 2400 4350 50  0001 C CNN
F 3 "" H 2400 4350 50  0001 C CNN
	1    2400 4350
	1    0    0    1   
$EndComp
$Comp
L tinkerforge:CONN_01X01 P101
U 1 1 5B38E84F
P 2050 2550
F 0 "P101" H 2050 2650 50  0000 C CNN
F 1 "Debug" V 2150 2550 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 2050 2550 50  0001 C CNN
F 3 "" H 2050 2550 50  0000 C CNN
	1    2050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5200 7650 5200
Wire Wire Line
	7650 5200 7650 4600
Wire Wire Line
	7650 4600 7600 4600
Wire Wire Line
	7600 4500 7700 4500
Wire Wire Line
	7700 4500 7700 5100
Wire Wire Line
	7700 5100 8050 5100
Wire Wire Line
	8050 5000 7750 5000
Wire Wire Line
	7750 5000 7750 4400
Wire Wire Line
	7750 4400 7600 4400
Wire Wire Line
	8050 4900 7800 4900
Wire Wire Line
	7800 4900 7800 4300
Wire Wire Line
	7800 4300 7600 4300
Wire Wire Line
	8050 4800 7850 4800
Wire Wire Line
	7850 4800 7850 4100
Wire Wire Line
	7850 4100 7600 4100
Wire Wire Line
	8050 4700 7900 4700
Wire Wire Line
	7900 4700 7900 4000
Wire Wire Line
	7900 4000 7600 4000
NoConn ~ 9850 4700
NoConn ~ 8050 4600
NoConn ~ 8050 4500
NoConn ~ 8050 4400
Text GLabel 7000 4100 0    39   Output ~ 0
B-CS0
Wire Wire Line
	7000 4600 7200 4600
Wire Wire Line
	7200 4500 7000 4500
Wire Wire Line
	7000 4400 7200 4400
Wire Wire Line
	7000 4300 7200 4300
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 1 1 5B3CDC72
P 7400 4000
F 0 "RP102" H 7215 4035 20  0000 C CNN
F 1 "82" H 7400 4000 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4000 60  0001 C CNN
F 3 "" H 7400 4000 60  0000 C CNN
	1    7400 4000
	1    0    0    -1  
$EndComp
NoConn ~ 8050 4300
NoConn ~ 8050 4200
NoConn ~ 8050 4100
NoConn ~ 9850 5300
NoConn ~ 9850 4100
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 2 1 5B3CFA38
P 7400 4300
F 0 "RP102" H 7215 4335 20  0000 C CNN
F 1 "82" H 7400 4300 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4300 60  0001 C CNN
F 3 "" H 7400 4300 60  0000 C CNN
	2    7400 4300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 3 1 5B3CFAB5
P 7400 4600
F 0 "RP102" H 7215 4635 20  0000 C CNN
F 1 "82" H 7400 4600 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4600 60  0001 C CNN
F 3 "" H 7400 4600 60  0000 C CNN
	3    7400 4600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 4 1 5B3CFB39
P 7400 4100
F 0 "RP102" H 7215 4135 20  0000 C CNN
F 1 "82" H 7400 4100 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4100 60  0001 C CNN
F 3 "" H 7400 4100 60  0000 C CNN
	4    7400 4100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 1 1 5B3CFC33
P 7400 4500
F 0 "RP103" H 7215 4535 20  0000 C CNN
F 1 "82" H 7400 4500 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4500 60  0001 C CNN
F 3 "" H 7400 4500 60  0000 C CNN
	1    7400 4500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 2 1 5B3CFCB5
P 10200 4400
F 0 "RP103" H 10015 4435 20  0000 C CNN
F 1 "82" H 10200 4400 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4400 60  0001 C CNN
F 3 "" H 10200 4400 60  0000 C CNN
	2    10200 4400
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 3 1 5B3CFD3A
P 10200 4300
F 0 "RP103" H 10015 4335 20  0000 C CNN
F 1 "82" H 10200 4300 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4300 60  0001 C CNN
F 3 "" H 10200 4300 60  0000 C CNN
	3    10200 4300
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 4 1 5B3D0098
P 10200 4600
F 0 "RP103" H 10015 4635 20  0000 C CNN
F 1 "82" H 10200 4600 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4600 60  0001 C CNN
F 3 "" H 10200 4600 60  0000 C CNN
	4    10200 4600
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 2 1 5B3D0831
P 10200 5000
F 0 "RP104" H 10015 5035 20  0000 C CNN
F 1 "82" H 10200 5000 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 5000 60  0001 C CNN
F 3 "" H 10200 5000 60  0000 C CNN
	2    10200 5000
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 3 1 5B3D08CF
P 10200 4800
F 0 "RP104" H 10015 4835 20  0000 C CNN
F 1 "82" H 10200 4800 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4800 60  0001 C CNN
F 3 "" H 10200 4800 60  0000 C CNN
	3    10200 4800
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 4 1 5B3D0964
P 10200 4900
F 0 "RP104" H 10015 4935 20  0000 C CNN
F 1 "82" H 10200 4900 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4900 60  0001 C CNN
F 3 "" H 10200 4900 60  0000 C CNN
	4    10200 4900
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 1 1 5B3D09F8
P 7400 4400
F 0 "RP104" H 7215 4435 20  0000 C CNN
F 1 "82" H 7400 4400 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4400 60  0001 C CNN
F 3 "" H 7400 4400 60  0000 C CNN
	1    7400 4400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R103
U 1 1 5B3D0F81
P 10200 5200
F 0 "R103" V 10280 5200 50  0000 C CNN
F 1 "1k" V 10200 5200 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 10200 5200 60  0001 C CNN
F 3 "" H 10200 5200 60  0000 C CNN
	1    10200 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	10550 5200 10450 5200
Wire Wire Line
	9950 5200 9850 5200
Wire Wire Line
	9850 4600 10000 4600
Wire Wire Line
	10400 4600 10550 4600
Wire Wire Line
	1750 3250 1900 3250
Wire Wire Line
	1750 3350 1900 3350
Wire Wire Line
	1750 3450 1900 3450
Wire Wire Line
	1300 5000 1400 5000
Wire Wire Line
	1750 2850 1900 2850
Text Notes 1850 3600 0    39   ~ 0
USIC0_CH0
Text Notes 1850 5700 0    39   ~ 0
USIC1_CH0
Wire Wire Line
	1300 5600 1450 5600
Wire Wire Line
	1450 5700 1300 5700
Wire Wire Line
	1850 2550 1750 2550
$Comp
L tinkerforge:LED D102
U 1 1 5B476059
P 2650 4750
F 0 "D102" H 2650 4850 50  0000 C CNN
F 1 "blue" H 2650 4650 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 2650 4750 50  0001 C CNN
F 3 "" H 2650 4750 50  0000 C CNN
	1    2650 4750
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:3V3 #PWR022
U 1 1 5B47747F
P 2850 4600
F 0 "#PWR022" H 2850 4700 40  0001 C CNN
F 1 "3V3" H 2850 4725 40  0000 C CNN
F 2 "" H 2850 4600 60  0000 C CNN
F 3 "" H 2850 4600 60  0000 C CNN
	1    2850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4600 2850 4750
$Comp
L tinkerforge:GND #PWR024
U 1 1 5B481E6B
P 2200 4450
F 0 "#PWR024" H 2200 4450 30  0001 C CNN
F 1 "GND" H 2200 4380 30  0001 C CNN
F 2 "" H 2200 4450 60  0000 C CNN
F 3 "" H 2200 4450 60  0000 C CNN
	1    2200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4450 2200 4400
Wire Wire Line
	2200 4300 1350 4300
Text GLabel 8900 2250 2    39   Output ~ 0
RASP-PWR
Wire Wire Line
	7050 5500 8050 5500
Wire Wire Line
	7350 5600 8050 5600
Wire Wire Line
	7200 5000 7250 5000
Wire Wire Line
	7250 5000 7350 5000
Wire Wire Line
	7150 5000 7200 5000
Wire Wire Line
	9150 6200 9250 6200
Wire Wire Line
	9050 6200 9150 6200
Wire Wire Line
	8950 6200 9050 6200
Wire Wire Line
	8850 6200 8900 6200
Wire Wire Line
	8750 6200 8850 6200
Wire Wire Line
	8650 6200 8750 6200
Wire Wire Line
	8900 6200 8950 6200
Wire Wire Line
	10250 1050 10550 1050
Wire Wire Line
	9100 1050 9300 1050
Wire Wire Line
	8800 1050 9100 1050
Wire Wire Line
	8700 1050 8800 1050
Wire Wire Line
	8850 3300 8850 3500
Wire Wire Line
	8850 3100 8850 3300
Wire Wire Line
	8850 2700 8850 3100
Wire Wire Line
	1950 850  1950 900 
Wire Wire Line
	1950 1350 1950 1450
Wire Wire Line
	8850 2250 8900 2250
Text Notes 2900 4750 0    39   ~ 0
"status led"
Wire Wire Line
	1300 5200 1400 5200
Wire Wire Line
	1400 5300 1300 5300
$Comp
L tinkerforge:+5V #PWR0115
U 1 1 5C685556
P 6600 950
F 0 "#PWR0115" H 6600 800 50  0001 C CNN
F 1 "+5V" H 6615 1123 50  0000 C CNN
F 2 "" H 6600 950 50  0000 C CNN
F 3 "" H 6600 950 50  0000 C CNN
	1    6600 950 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R104
U 1 1 5C6D65E1
P 2150 4750
F 0 "R104" V 2230 4750 50  0000 C CNN
F 1 "1k" V 2150 4750 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 2150 4750 60  0001 C CNN
F 3 "" H 2150 4750 60  0000 C CNN
	1    2150 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 4750 2400 4750
$Comp
L tinkerforge:TPS22975 U103
U 1 1 5C70DB28
P 7900 2750
F 0 "U103" H 7900 3101 39  0000 C CNN
F 1 "TPS22975" H 7900 3026 39  0000 C CNN
F 2 "WSON8-2x2" H 8650 2850 39  0001 C CNN
F 3 "" H 8650 2850 39  0001 C CNN
	1    7900 2750
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR0116
U 1 1 5C71FD52
P 7900 3100
F 0 "#PWR0116" H 7900 3100 30  0001 C CNN
F 1 "GND" H 7900 3030 30  0001 C CNN
F 2 "" H 7900 3100 60  0000 C CNN
F 3 "" H 7900 3100 60  0000 C CNN
	1    7900 3100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:Rs R101
U 1 1 5C72014F
P 6950 2700
F 0 "R101" V 7000 2700 31  0000 C CNN
F 1 "1k" V 6950 2700 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 6950 2700 60  0001 C CNN
F 3 "" H 6950 2700 60  0000 C CNN
	1    6950 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2600 7450 2600
Wire Wire Line
	7350 2600 7350 2700
Wire Wire Line
	7350 2700 7450 2700
Wire Wire Line
	7900 3100 7900 3050
$Comp
L tinkerforge:GND #PWR0135
U 1 1 5C7537DE
P 8300 3100
F 0 "#PWR0135" H 8300 3100 30  0001 C CNN
F 1 "GND" H 8300 3030 30  0001 C CNN
F 2 "" H 8300 3100 60  0000 C CNN
F 3 "" H 8300 3100 60  0000 C CNN
	1    8300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3100 8300 2900
$Comp
L tinkerforge:3V3 #PWR0136
U 1 1 5C75C701
P 6950 2550
F 0 "#PWR0136" H 6950 2650 40  0001 C CNN
F 1 "3V3" H 6950 2675 40  0000 C CNN
F 2 "" H 6950 2550 60  0000 C CNN
F 3 "" H 6950 2550 60  0000 C CNN
	1    6950 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2600 6950 2550
Wire Wire Line
	7350 2600 7350 2500
Connection ~ 7350 2600
Wire Wire Line
	7350 1050 7350 1300
Wire Wire Line
	8850 2700 8400 2700
Wire Wire Line
	8300 2600 8400 2600
Wire Wire Line
	8400 2600 8400 2700
Connection ~ 8400 2700
Wire Wire Line
	8400 2700 8300 2700
$Comp
L tinkerforge:TPS22975 U104
U 1 1 5C7991F9
P 8100 1200
F 0 "U104" H 8100 1551 39  0000 C CNN
F 1 "TPS22975" H 8100 1476 39  0000 C CNN
F 2 "WSON8-2x2" H 8850 1300 39  0001 C CNN
F 3 "" H 8850 1300 39  0001 C CNN
	1    8100 1200
	1    0    0    -1  
$EndComp
Connection ~ 7350 1050
Wire Wire Line
	7650 1150 7600 1150
Wire Wire Line
	7600 1150 7600 1050
Wire Wire Line
	7600 1050 7650 1050
Wire Wire Line
	7600 1050 7550 1050
Connection ~ 7600 1050
Wire Wire Line
	8500 1050 8550 1050
Wire Wire Line
	8500 1150 8550 1150
Wire Wire Line
	8550 1150 8550 1050
Connection ~ 8550 1050
Wire Wire Line
	8550 1050 8700 1050
$Comp
L tinkerforge:GND #PWR0137
U 1 1 5C7B99BB
P 8100 1550
F 0 "#PWR0137" H 8100 1550 30  0001 C CNN
F 1 "GND" H 8100 1480 30  0001 C CNN
F 2 "" H 8100 1550 60  0000 C CNN
F 3 "" H 8100 1550 60  0000 C CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1550 8100 1500
$Comp
L tinkerforge:GND #PWR0138
U 1 1 5C7C1F70
P 8500 1550
F 0 "#PWR0138" H 8500 1550 30  0001 C CNN
F 1 "GND" H 8500 1480 30  0001 C CNN
F 2 "" H 8500 1550 60  0000 C CNN
F 3 "" H 8500 1550 60  0000 C CNN
	1    8500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 1550 8500 1350
Wire Wire Line
	6800 2800 6950 2800
Connection ~ 6950 2800
Wire Wire Line
	6950 2800 7450 2800
$Comp
L tinkerforge:Rs R102
U 1 1 5C7DB6D4
P 7450 1650
F 0 "R102" V 7500 1650 31  0000 C CNN
F 1 "1k" V 7450 1650 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 7450 1650 60  0001 C CNN
F 3 "" H 7450 1650 60  0000 C CNN
	1    7450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1250 7550 1800
Wire Wire Line
	7450 1750 7450 1800
Wire Wire Line
	7450 1800 7550 1800
Connection ~ 7550 1800
Wire Wire Line
	7550 1800 7550 1850
$Comp
L tinkerforge:3V3 #PWR0139
U 1 1 5C7F625F
P 7450 1500
F 0 "#PWR0139" H 7450 1600 40  0001 C CNN
F 1 "3V3" H 7450 1625 40  0000 C CNN
F 2 "" H 7450 1500 60  0000 C CNN
F 3 "" H 7450 1500 60  0000 C CNN
	1    7450 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1550 7450 1500
Wire Wire Line
	7350 2900 7450 2900
Wire Wire Line
	7550 1250 7650 1250
Wire Wire Line
	7600 1350 7650 1350
$Comp
L tinkerforge:Cs C114
U 1 1 5C82E48A
P 7350 3000
F 0 "C114" H 7375 3075 31  0000 L CNN
F 1 "1uF" H 7375 2925 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7350 3000 60  0001 C CNN
F 3 "" H 7350 3000 60  0000 C CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR0140
U 1 1 5C82E62E
P 7350 3150
F 0 "#PWR0140" H 7350 3150 30  0001 C CNN
F 1 "GND" H 7350 3080 30  0001 C CNN
F 2 "" H 7350 3150 60  0000 C CNN
F 3 "" H 7350 3150 60  0000 C CNN
	1    7350 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3150 7350 3100
$Comp
L tinkerforge:Cs C115
U 1 1 5C83819D
P 7600 1450
F 0 "C115" H 7625 1525 31  0000 L CNN
F 1 "1uF" H 7625 1375 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7600 1450 60  0001 C CNN
F 3 "" H 7600 1450 60  0000 C CNN
	1    7600 1450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR0141
U 1 1 5C83842F
P 7600 1600
F 0 "#PWR0141" H 7600 1600 30  0001 C CNN
F 1 "GND" H 7600 1530 30  0001 C CNN
F 2 "" H 7600 1600 60  0000 C CNN
F 3 "" H 7600 1600 60  0000 C CNN
	1    7600 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1600 7600 1550
$Comp
L tinkerforge:Cs C117
U 1 1 5C842611
P 8600 1400
F 0 "C117" H 8625 1475 31  0000 L CNN
F 1 "DNP" H 8625 1325 31  0000 L CNN
F 2 "kicad-libraries:C0402F" H 8600 1400 60  0001 C CNN
F 3 "" H 8600 1400 60  0000 C CNN
	1    8600 1400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:Cs C116
U 1 1 5C842A63
P 8400 2950
F 0 "C116" H 8425 3025 31  0000 L CNN
F 1 "DNP" H 8425 2875 31  0000 L CNN
F 2 "kicad-libraries:C0402F" H 8400 2950 60  0001 C CNN
F 3 "" H 8400 2950 60  0000 C CNN
	1    8400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2800 8400 2800
Wire Wire Line
	8400 2800 8400 2850
Wire Wire Line
	8300 3100 8400 3100
Wire Wire Line
	8400 3100 8400 3050
Connection ~ 8300 3100
Wire Wire Line
	8500 1550 8600 1550
Wire Wire Line
	8600 1550 8600 1500
Connection ~ 8500 1550
Wire Wire Line
	8500 1250 8600 1250
Wire Wire Line
	8600 1250 8600 1300
Wire Wire Line
	7350 1300 7600 1300
Wire Wire Line
	7600 1300 7600 1350
Connection ~ 7350 1300
Wire Wire Line
	7350 1300 7350 2250
Connection ~ 7600 1350
Wire Wire Line
	7350 2250 7150 2250
Wire Wire Line
	7150 2250 7150 2900
Wire Wire Line
	7150 2900 7350 2900
Connection ~ 7350 2250
Wire Wire Line
	7350 2250 7350 2300
Connection ~ 7350 2900
Text GLabel 7650 550  2    39   Output ~ 0
B-5V-IN
Text GLabel 7450 2300 1    39   Output ~ 0
RASP-PWR-IN
Wire Wire Line
	7450 2600 7450 2400
Connection ~ 7450 2600
$Comp
L tinkerforge:XMC1XXX24 U101
U 1 1 5C6F644E
P 1200 1150
F 0 "U101" H 1144 1697 60  0000 C CNN
F 1 "XMC1100" H 1144 1591 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 1350 1900 60  0001 C CNN
F 3 "" H 1350 1900 60  0000 C CNN
	1    1200 1150
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U101
U 2 1 5C6F670F
P 1400 3000
F 0 "U101" H 1344 3697 60  0000 C CNN
F 1 "XMC1100" H 1344 3591 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 1550 3750 60  0001 C CNN
F 3 "" H 1550 3750 60  0000 C CNN
	2    1400 3000
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U101
U 3 1 5C6F6C5E
P 1000 4450
F 0 "U101" H 944 4847 60  0000 C CNN
F 1 "XMC1100" H 944 4741 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 1150 5200 60  0001 C CNN
F 3 "" H 1150 5200 60  0000 C CNN
	3    1000 4450
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U101
U 4 1 5C6F6E9B
P 950 5350
F 0 "U101" H 964 5947 60  0000 C CNN
F 1 "XMC1100" H 964 5841 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 1100 6100 60  0001 C CNN
F 3 "" H 1100 6100 60  0000 C CNN
	4    950  5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 1350 1650 1350
Wire Wire Line
	1950 700  1950 850 
Wire Wire Line
	1550 1450 1650 1450
Wire Wire Line
	1650 1450 1650 1350
Connection ~ 1650 1350
Wire Wire Line
	1650 1350 1950 1350
$Comp
L tinkerforge:PCF85263AT U105
U 1 1 5C7AA842
P 4750 4350
F 0 "U105" H 4750 4747 60  0000 C CNN
F 1 "PCF8523T" H 4750 4641 60  0000 C CNN
F 2 "kicad-libraries:SO-8" H 5250 4150 60  0001 C CNN
F 3 "" H 5250 4150 60  0000 C CNN
	1    4750 4350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK4 RP105
U 1 1 5C7AB3EC
P 5850 3650
F 0 "RP105" H 5850 4100 50  0000 C CNN
F 1 "3.9k" H 5850 3600 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 5850 3650 50  0001 C CNN
F 3 "" H 5850 3650 50  0000 C CNN
	1    5850 3650
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:3V3 #PWR0142
U 1 1 5C7AB634
P 6050 3350
F 0 "#PWR0142" H 6050 3450 40  0001 C CNN
F 1 "3V3" H 6050 3475 40  0000 C CNN
F 2 "" H 6050 3350 60  0000 C CNN
F 3 "" H 6050 3350 60  0000 C CNN
	1    6050 3350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C104
U 1 1 5C7AB8FF
P 5300 3650
F 0 "C104" V 5150 3600 50  0000 L CNN
F 1 "1uF" V 5450 3550 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 5300 3650 60  0001 C CNN
F 3 "" H 5300 3650 60  0000 C CNN
	1    5300 3650
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:GND #PWR0143
U 1 1 5C7ABE35
P 5300 3900
F 0 "#PWR0143" H 5300 3900 30  0001 C CNN
F 1 "GND" H 5300 3830 30  0001 C CNN
F 2 "" H 5300 3900 60  0000 C CNN
F 3 "" H 5300 3900 60  0000 C CNN
	1    5300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4200 5100 3350
Wire Wire Line
	5100 3350 5300 3350
Wire Wire Line
	5300 3350 5300 3450
Wire Wire Line
	5900 3450 5900 3400
Wire Wire Line
	5900 3400 6000 3400
Wire Wire Line
	6200 3400 6200 3450
Wire Wire Line
	6100 3450 6100 3400
Connection ~ 6100 3400
Wire Wire Line
	6100 3400 6200 3400
Wire Wire Line
	6000 3450 6000 3400
Connection ~ 6000 3400
Wire Wire Line
	6000 3400 6050 3400
Wire Wire Line
	6050 3350 6050 3400
Connection ~ 6050 3400
Wire Wire Line
	6050 3400 6100 3400
Wire Wire Line
	5300 3900 5300 3850
Wire Wire Line
	5900 4400 5900 3850
Wire Wire Line
	6200 3850 6200 4500
NoConn ~ 5100 4300
$Comp
L tinkerforge:GND #PWR0144
U 1 1 5C81F139
P 4400 4600
F 0 "#PWR0144" H 4400 4600 30  0001 C CNN
F 1 "GND" H 4400 4530 30  0001 C CNN
F 2 "" H 4400 4600 60  0000 C CNN
F 3 "" H 4400 4600 60  0000 C CNN
	1    4400 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4600 4400 4500
NoConn ~ 6000 3850
NoConn ~ 6100 3850
Text GLabel 10550 3900 2    39   BiDi ~ 0
RTC-SDA
Text GLabel 10550 4000 2    39   BiDi ~ 0
RTC-SCL
Wire Wire Line
	10550 3900 9850 3900
Wire Wire Line
	9850 4000 10550 4000
Text GLabel 6250 4500 2    39   BiDi ~ 0
RTC-SDA
Text GLabel 6250 4400 2    39   BiDi ~ 0
RTC-SCL
Wire Wire Line
	5900 4400 6250 4400
Connection ~ 5900 4400
Wire Wire Line
	6250 4500 6200 4500
Connection ~ 6200 4500
$Comp
L tinkerforge:CRYSTAL_3225 X101
U 1 1 5C878C0B
P 3600 4200
F 0 "X101" H 3600 4547 60  0000 C CNN
F 1 "32.768kHz" H 3600 4441 60  0000 C CNN
F 2 "kicad-libraries:AB26TRQ" H 3600 4200 60  0001 C CNN
F 3 "" H 3600 4200 60  0000 C CNN
	1    3600 4200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR0145
U 1 1 5C878ECA
P 3450 4600
F 0 "#PWR0145" H 3450 4600 30  0001 C CNN
F 1 "GND" H 3450 4530 30  0001 C CNN
F 2 "" H 3450 4600 60  0000 C CNN
F 3 "" H 3450 4600 60  0000 C CNN
	1    3450 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4200 4400 4200
Wire Wire Line
	4400 4300 3300 4300
Wire Wire Line
	3300 4300 3300 4200
Wire Wire Line
	3450 4600 3450 4500
$Comp
L tinkerforge:C C102
U 1 1 5C89C333
P 4150 3400
F 0 "C102" V 4000 3350 50  0000 L CNN
F 1 "100nF" V 4300 3300 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 4150 3400 60  0001 C CNN
F 3 "" H 4150 3400 60  0000 C CNN
	1    4150 3400
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:GND #PWR0146
U 1 1 5C89C466
P 4150 3650
F 0 "#PWR0146" H 4150 3650 30  0001 C CNN
F 1 "GND" H 4150 3580 30  0001 C CNN
F 2 "" H 4150 3650 60  0000 C CNN
F 3 "" H 4150 3650 60  0000 C CNN
	1    4150 3650
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR0147
U 1 1 5C89C603
P 3650 3650
F 0 "#PWR0147" H 3650 3650 30  0001 C CNN
F 1 "GND" H 3650 3580 30  0001 C CNN
F 2 "" H 3650 3650 60  0000 C CNN
F 3 "" H 3650 3650 60  0000 C CNN
	1    3650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4400 4350 4400
Wire Wire Line
	4350 4400 4350 3200
Wire Wire Line
	4150 3650 4150 3600
Wire Wire Line
	4150 3200 4350 3200
$Comp
L tinkerforge:CP1 C101
U 1 1 5C8CD98B
P 3650 3400
F 0 "C101" V 3550 3150 50  0000 L CNN
F 1 "DSK-3R3H334T-HL" V 3800 3000 50  0000 L CNN
F 2 "kicad-libraries:DSK" H 3650 3400 60  0001 C CNN
F 3 "" H 3650 3400 60  0000 C CNN
	1    3650 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3200 3650 3200
Connection ~ 4150 3200
$Comp
L tinkerforge:R R105
U 1 1 5C8DB012
P 3650 2900
F 0 "R105" V 3730 2900 50  0000 C CNN
F 1 "68" V 3650 2900 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 3650 2900 60  0001 C CNN
F 3 "" H 3650 2900 60  0000 C CNN
	1    3650 2900
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:DIODESCH D101
U 1 1 5C8DB5E2
P 3650 2400
F 0 "D101" V 3612 2479 40  0000 L CNN
F 1 "BAQ33-GS08" V 3688 2479 40  0000 L CNN
F 2 "kicad-libraries:MiniMelf" H 3650 2400 60  0001 C CNN
F 3 "" H 3650 2400 60  0000 C CNN
	1    3650 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 2200 3650 2150
Wire Wire Line
	3650 2650 3650 2600
Wire Wire Line
	3650 3200 3650 3150
Connection ~ 3650 3200
Wire Wire Line
	3650 3650 3650 3600
Text GLabel 1500 4500 2    39   Output ~ 0
RASP-EN
Text GLabel 1500 4600 2    39   Output ~ 0
B-EN
NoConn ~ 1300 5500
NoConn ~ 1300 5400
Wire Wire Line
	1350 4400 1900 4400
Wire Wire Line
	1900 4400 1900 4750
Wire Wire Line
	1350 4500 1500 4500
Wire Wire Line
	1500 4600 1350 4600
NoConn ~ 1750 3150
NoConn ~ 1750 3050
NoConn ~ 1750 2950
NoConn ~ 1750 2650
NoConn ~ 1750 2750
NoConn ~ 1300 5100
Wire Wire Line
	6600 1050 6900 1050
Wire Wire Line
	5100 4400 5900 4400
Wire Wire Line
	5100 4500 6200 4500
$Comp
L tinkerforge:3V3 #PWR0148
U 1 1 5E8950A5
P 5800 3300
F 0 "#PWR0148" H 5800 3400 40  0001 C CNN
F 1 "3V3" H 5800 3425 40  0000 C CNN
F 2 "" H 5800 3300 60  0000 C CNN
F 3 "" H 5800 3300 60  0000 C CNN
	1    5800 3300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R106
U 1 1 5E898682
P 5550 3350
F 0 "R106" V 5630 3350 50  0000 C CNN
F 1 "1k" V 5550 3350 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 5550 3350 60  0001 C CNN
F 3 "" H 5550 3350 60  0000 C CNN
	1    5550 3350
	0    -1   -1   0   
$EndComp
Connection ~ 5300 3350
Wire Wire Line
	5800 3300 5800 3350
$Comp
L tinkerforge:Cs C105
U 1 1 5E93CB2F
P 7550 2400
F 0 "C105" H 7575 2475 31  0000 L CNN
F 1 "1uF" H 7575 2325 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7550 2400 60  0001 C CNN
F 3 "" H 7550 2400 60  0000 C CNN
	1    7550 2400
	0    1    1    0   
$EndComp
Connection ~ 7450 2400
Wire Wire Line
	7450 2400 7450 2300
$Comp
L tinkerforge:GND #PWR0152
U 1 1 5E93E772
P 7700 2400
F 0 "#PWR0152" H 7700 2400 30  0001 C CNN
F 1 "GND" H 7700 2330 30  0001 C CNN
F 2 "" H 7700 2400 60  0000 C CNN
F 3 "" H 7700 2400 60  0000 C CNN
	1    7700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2400 7700 2400
$Comp
L tinkerforge:Cs C106
U 1 1 5E94D415
P 7700 750
F 0 "C106" H 7725 825 31  0000 L CNN
F 1 "1uF" H 7725 675 31  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7700 750 60  0001 C CNN
F 3 "" H 7700 750 60  0000 C CNN
	1    7700 750 
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 550  7600 750 
Connection ~ 7600 750 
Wire Wire Line
	7600 750  7600 1050
$Comp
L tinkerforge:GND #PWR0153
U 1 1 5E95D15A
P 7850 800
F 0 "#PWR0153" H 7850 800 30  0001 C CNN
F 1 "GND" H 7850 730 30  0001 C CNN
F 2 "" H 7850 800 60  0000 C CNN
F 3 "" H 7850 800 60  0000 C CNN
	1    7850 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 750  7850 750 
Wire Wire Line
	7850 750  7850 800 
Wire Wire Line
	7650 550  7600 550 
$Comp
L tinkerforge:C C113
U 1 1 5E991A7B
P 6900 1250
F 0 "C113" H 6700 1350 50  0000 L CNN
F 1 "10uF" H 6700 1150 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 6900 1250 60  0001 C CNN
F 3 "" H 6900 1250 60  0000 C CNN
	1    6900 1250
	1    0    0    -1  
$EndComp
Connection ~ 6900 1050
Wire Wire Line
	6900 1050 7350 1050
$Comp
L tinkerforge:GND #PWR0154
U 1 1 5E991DD1
P 6900 1550
F 0 "#PWR0154" H 6900 1550 30  0001 C CNN
F 1 "GND" H 6900 1480 30  0001 C CNN
F 2 "" H 6900 1550 60  0000 C CNN
F 3 "" H 6900 1550 60  0000 C CNN
	1    6900 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1550 6900 1450
$Comp
L tinkerforge:3V3 #PWR?
U 1 1 5F7305FA
P 3650 2150
F 0 "#PWR?" H 3650 2250 40  0001 C CNN
F 1 "3V3" H 3650 2275 40  0000 C CNN
F 2 "" H 3650 2150 60  0000 C CNN
F 3 "" H 3650 2150 60  0000 C CNN
	1    3650 2150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
