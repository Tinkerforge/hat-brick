EESchema Schematic File Version 4
LIBS:hat-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "HAT Bricklet"
Date "2018-06-28"
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
Text GLabel 1700 6000 2    39   Output ~ 0
CHG-EN
Text GLabel 4000 1700 2    39   Input ~ 0
BATTERY-ALRT
Text GLabel 4000 2000 2    39   BiDi ~ 0
BATTERY-SDA
Text GLabel 4000 1900 2    39   Output ~ 0
BATTERY-SCL
Text GLabel 1700 5700 2    39   Input ~ 0
CHG-nCHG
Text GLabel 1700 5600 2    39   Input ~ 0
CHG-nPGOOD
Text GLabel 1700 6200 2    39   Output ~ 0
BOOST-EN
Text GLabel 4000 1600 2    39   Input ~ 0
DC-IN-VOLTAGE
Text GLabel 4000 1500 2    39   Input ~ 0
USB-IN-VOLTAGE
$Comp
L tinkerforge:XMC1XXX48 U101
U 1 1 5B351B68
P 1200 1500
F 0 "U101" H 1050 2450 60  0000 C CNN
F 1 "XMC1404" H 1200 550 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 1350 1750 60  0001 C CNN
F 3 "" H 1350 1750 60  0000 C CNN
	1    1200 1500
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX48 U101
U 2 1 5B351C5B
P 1200 3850
F 0 "U101" H 1050 4800 60  0000 C CNN
F 1 "XMC1404" H 1200 2900 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 1350 4100 60  0001 C CNN
F 3 "" H 1350 4100 60  0000 C CNN
	2    1200 3850
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX48 U101
U 3 1 5B351D55
P 1200 5900
F 0 "U101" H 1050 6400 60  0000 C CNN
F 1 "XMC1404" H 1200 5400 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 1350 6150 60  0001 C CNN
F 3 "" H 1350 6150 60  0000 C CNN
	3    1200 5900
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX48 U101
U 4 1 5B351E5E
P 3550 1200
F 0 "U101" H 3400 1850 60  0000 C CNN
F 1 "XMC1404" H 3550 250 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 3700 1450 60  0001 C CNN
F 3 "" H 3700 1450 60  0000 C CNN
	4    3550 1200
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX48 U101
U 5 1 5B351FE8
P 3550 2750
F 0 "U101" H 3400 3200 60  0000 C CNN
F 1 "XMC1404" H 3550 2200 60  0000 C CNN
F 2 "kicad-libraries:QFN48-EP2" H 3700 3000 60  0001 C CNN
F 3 "" H 3700 3000 60  0000 C CNN
	5    3550 2750
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:Raspberry_Pi_2_3 J101
U 1 1 5B35250F
P 8950 4650
F 0 "J101" H 9650 3400 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 8550 5550 50  0000 C CNN
F 2 "kicad-libraries:raspberrypi_hat2" H 9950 5900 50  0001 C CNN
F 3 "" H 9000 4500 50  0001 C CNN
	1    8950 4650
	1    0    0    -1  
$EndComp
$Sheet
S 4600 6650 1000 1000
U 5B352770
F0 "Bricklets" 60
F1 "bricklets.sch" 60
$EndSheet
Text GLabel 7000 3850 0    39   Output ~ 0
B-CS2
Text GLabel 7000 4450 0    39   Output ~ 0
B-CS1
Text GLabel 7000 4250 0    39   Output ~ 0
B-CS4
Text GLabel 10550 4450 2    39   Output ~ 0
B-CS5
Text GLabel 10550 4250 2    39   Output ~ 0
B-CS7
Text GLabel 10550 4150 2    39   Output ~ 0
B-CS8
Text GLabel 7000 4350 0    39   Output ~ 0
B-CS6
Text GLabel 10550 4850 2    39   Output ~ 0
B-CLK
Text GLabel 10550 4750 2    39   Output ~ 0
B-MOSI
Text GLabel 10550 4650 2    39   Input ~ 0
B-MISO
Text GLabel 8300 750  1    39   Output ~ 0
B-5V
Text GLabel 10150 900  2    39   Output ~ 0
B-3V3
Text GLabel 6900 5450 0    39   Output ~ 0
RASP-SC
Text GLabel 6900 5350 0    39   BiDi ~ 0
RASP-SD
Text GLabel 1700 3300 2    39   Input ~ 0
RASP-SC
Text GLabel 1700 3400 2    39   BiDi ~ 0
RASP-SD
$Comp
L tinkerforge:R_PACK4 RP101
U 1 1 5B363AF1
P 7000 5100
F 0 "RP101" H 7000 5550 50  0000 C CNN
F 1 "3.9k" H 7000 5050 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7000 5100 50  0001 C CNN
F 3 "" H 7000 5100 50  0000 C CNN
	1    7000 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 5350 7050 5350
Wire Wire Line
	6900 5450 7350 5450
Wire Wire Line
	7050 5300 7050 5350
Connection ~ 7050 5350
Wire Wire Line
	7350 5300 7350 5450
Connection ~ 7350 5450
NoConn ~ 7150 5300
NoConn ~ 7250 5300
Wire Wire Line
	9850 4850 10000 4850
Wire Wire Line
	9850 4750 10000 4750
Wire Wire Line
	9850 4650 10000 4650
Wire Wire Line
	10400 4650 10550 4650
Wire Wire Line
	10550 4750 10400 4750
Wire Wire Line
	10400 4850 10550 4850
Text GLabel 1700 4500 2    39   Input ~ 0
B-CLK
Text GLabel 1700 4600 2    39   Input ~ 0
B-MOSI
Text GLabel 4000 700  2    39   Output ~ 0
B-MISO
Text GLabel 7000 4150 0    39   Output ~ 0
B-CS3
NoConn ~ 9850 5350
NoConn ~ 9850 5450
$Comp
L tinkerforge:3V3 #PWR01
U 1 1 5B36ED34
P 7200 4850
F 0 "#PWR01" H 7200 4950 40  0001 C CNN
F 1 "3V3" H 7200 4975 40  0000 C CNN
F 2 "" H 7200 4850 60  0000 C CNN
F 3 "" H 7200 4850 60  0000 C CNN
	1    7200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4900 7050 4850
Wire Wire Line
	7050 4850 7150 4850
Wire Wire Line
	7350 4850 7350 4900
Connection ~ 7200 4850
Wire Wire Line
	7250 4900 7250 4850
Connection ~ 7250 4850
Wire Wire Line
	7150 4900 7150 4850
Connection ~ 7150 4850
Text GLabel 1700 4400 2    39   Input ~ 0
B-CS8
Wire Wire Line
	10550 4250 10400 4250
Wire Wire Line
	9850 4250 10000 4250
Wire Wire Line
	9850 4150 10000 4150
Wire Wire Line
	10400 4150 10550 4150
Wire Wire Line
	7000 3950 7200 3950
Wire Wire Line
	7000 3850 7200 3850
$Comp
L tinkerforge:GND #PWR02
U 1 1 5B375DA1
P 8900 6100
F 0 "#PWR02" H 8900 6100 30  0001 C CNN
F 1 "GND" H 8900 6030 30  0001 C CNN
F 2 "" H 8900 6100 60  0000 C CNN
F 3 "" H 8900 6100 60  0000 C CNN
	1    8900 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 5950 8550 6050
Wire Wire Line
	8550 6050 8650 6050
Wire Wire Line
	9250 6050 9250 5950
Wire Wire Line
	9150 5950 9150 6050
Connection ~ 9150 6050
Wire Wire Line
	9050 5950 9050 6050
Connection ~ 9050 6050
Wire Wire Line
	8950 5950 8950 6050
Connection ~ 8950 6050
Wire Wire Line
	8850 5950 8850 6050
Connection ~ 8850 6050
Wire Wire Line
	8750 5950 8750 6050
Connection ~ 8750 6050
Wire Wire Line
	8650 5950 8650 6050
Connection ~ 8650 6050
Wire Wire Line
	8900 6100 8900 6050
Connection ~ 8900 6050
$Comp
L power:+5V #PWR03
U 1 1 5B37899C
P 7100 800
F 0 "#PWR03" H 7100 650 50  0001 C CNN
F 1 "+5V" H 7100 940 50  0000 C CNN
F 2 "" H 7100 800 50  0001 C CNN
F 3 "" H 7100 800 50  0001 C CNN
	1    7100 800 
	1    0    0    -1  
$EndComp
NoConn ~ 9050 3350
NoConn ~ 9150 3350
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
P 9300 1400
F 0 "#PWR05" H 9300 1400 30  0001 C CNN
F 1 "GND" H 9300 1330 30  0001 C CNN
F 2 "" H 9300 1400 60  0000 C CNN
F 3 "" H 9300 1400 60  0000 C CNN
	1    9300 1400
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
P 9300 1100
F 0 "U102" H 9100 1600 60  0000 C CNN
F 1 "LD1117" H 9300 1400 60  0000 C CNN
F 2 "kicad-libraries:SOT-223" H 9300 1100 60  0001 C CNN
F 3 "" H 9300 1100 60  0000 C CNN
	1    9300 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1400 9300 1300
$Comp
L tinkerforge:C C109
U 1 1 5B37F271
P 8700 1100
F 0 "C109" H 8750 1200 50  0000 L CNN
F 1 "100nF" H 8750 1000 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 8700 1100 60  0001 C CNN
F 3 "" H 8700 1100 60  0000 C CNN
	1    8700 1100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR07
U 1 1 5B37F495
P 8700 1400
F 0 "#PWR07" H 8700 1400 30  0001 C CNN
F 1 "GND" H 8700 1330 30  0001 C CNN
F 2 "" H 8700 1400 60  0000 C CNN
F 3 "" H 8700 1400 60  0000 C CNN
	1    8700 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1400 8700 1300
Wire Wire Line
	8150 900  8300 900 
$Comp
L tinkerforge:C C112
U 1 1 5B37F618
P 9850 1100
F 0 "C112" H 9900 1200 50  0000 L CNN
F 1 "10uF" H 9900 1000 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 9850 1100 60  0001 C CNN
F 3 "" H 9850 1100 60  0000 C CNN
	1    9850 1100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR08
U 1 1 5B37F6B0
P 9850 1400
F 0 "#PWR08" H 9850 1400 30  0001 C CNN
F 1 "GND" H 9850 1330 30  0001 C CNN
F 2 "" H 9850 1400 60  0000 C CNN
F 3 "" H 9850 1400 60  0000 C CNN
	1    9850 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 900  9850 900 
Wire Wire Line
	9850 1300 9850 1400
Connection ~ 9850 900 
$Comp
L tinkerforge:C C108
U 1 1 5B37F8B8
P 8400 1100
F 0 "C108" H 8450 1200 50  0000 L CNN
F 1 "10uF" H 8450 1000 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 8400 1100 60  0001 C CNN
F 3 "" H 8400 1100 60  0000 C CNN
	1    8400 1100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR09
U 1 1 5B37F92B
P 8400 1400
F 0 "#PWR09" H 8400 1400 30  0001 C CNN
F 1 "GND" H 8400 1330 30  0001 C CNN
F 2 "" H 8400 1400 60  0000 C CNN
F 3 "" H 8400 1400 60  0000 C CNN
	1    8400 1400
	1    0    0    -1  
$EndComp
Connection ~ 8700 900 
Wire Wire Line
	8300 750  8300 900 
Connection ~ 8400 900 
Wire Wire Line
	8400 1400 8400 1300
Connection ~ 8300 900 
Wire Wire Line
	7100 800  7100 900 
$Comp
L tinkerforge:C C107
U 1 1 5B37FDC9
P 7100 1100
F 0 "C107" H 7150 1200 50  0000 L CNN
F 1 "10uF" H 7150 1000 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 7100 1100 60  0001 C CNN
F 3 "" H 7100 1100 60  0000 C CNN
	1    7100 1100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR010
U 1 1 5B37FE55
P 7100 1400
F 0 "#PWR010" H 7100 1400 30  0001 C CNN
F 1 "GND" H 7100 1330 30  0001 C CNN
F 2 "" H 7100 1400 60  0000 C CNN
F 3 "" H 7100 1400 60  0000 C CNN
	1    7100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1400 7100 1300
Connection ~ 7100 900 
$Comp
L tinkerforge:MOSFET_P_CH Q103
U 1 1 5B37FF34
P 7950 1000
F 0 "Q103" V 7800 1200 50  0000 R CNN
F 1 "NTR2101P" V 8150 1200 50  0000 R CNN
F 2 "kicad-libraries:SOT23GDS" H 8150 1100 50  0001 C CNN
F 3 "" H 7950 1000 50  0000 C CNN
	1    7950 1000
	0    1    -1   0   
$EndComp
$Comp
L tinkerforge:INDUCTs L101
U 1 1 5B3801CB
P 7600 900
F 0 "L101" V 7680 900 50  0000 C CNN
F 1 "FB" V 7500 900 50  0000 C CNN
F 2 "kicad-libraries:R0805" H 7600 900 60  0001 C CNN
F 3 "" H 7600 900 60  0000 C CNN
	1    7600 900 
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:MOSFET_N_CH Q101
U 1 1 5B38041A
P 7850 1550
F 0 "Q101" H 8150 1600 50  0000 R CNN
F 1 "2N7002P" H 8400 1400 50  0000 R CNN
F 2 "kicad-libraries:SOT23GDS" H 8050 1650 50  0001 C CNN
F 3 "" H 7850 1550 50  0000 C CNN
	1    7850 1550
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR011
U 1 1 5B38053B
P 7950 1800
F 0 "#PWR011" H 7950 1800 30  0001 C CNN
F 1 "GND" H 7950 1730 30  0001 C CNN
F 2 "" H 7950 1800 60  0000 C CNN
F 3 "" H 7950 1800 60  0000 C CNN
	1    7950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1800 7950 1750
Wire Wire Line
	7950 1200 7950 1350
$Comp
L tinkerforge:Rs R101
U 1 1 5B380707
P 7750 1100
F 0 "R101" V 7800 1100 31  0000 C CNN
F 1 "10k" V 7750 1100 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 7750 1100 60  0001 C CNN
F 3 "" H 7750 1100 60  0000 C CNN
	1    7750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 900  7750 1000
Wire Wire Line
	7950 1200 7750 1200
Connection ~ 7950 1200
Connection ~ 7750 900 
Wire Wire Line
	8750 3150 8750 3350
Wire Wire Line
	8850 2100 8850 2550
$Comp
L tinkerforge:C C111
U 1 1 5B381025
P 9050 2950
F 0 "C111" V 8900 2900 50  0000 L CNN
F 1 "100nF" V 9200 2850 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 9050 2950 60  0001 C CNN
F 3 "" H 9050 2950 60  0000 C CNN
	1    9050 2950
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:GND #PWR012
U 1 1 5B3810DF
P 9250 3000
F 0 "#PWR012" H 9250 3000 30  0001 C CNN
F 1 "GND" H 9250 2930 30  0001 C CNN
F 2 "" H 9250 3000 60  0000 C CNN
F 3 "" H 9250 3000 60  0000 C CNN
	1    9250 3000
	1    0    0    -1  
$EndComp
Connection ~ 8850 3150
Wire Wire Line
	9250 2950 9250 3000
$Comp
L tinkerforge:INDUCTs L102
U 1 1 5B381518
P 7600 2100
F 0 "L102" V 7680 2100 50  0000 C CNN
F 1 "FB" V 7500 2100 50  0000 C CNN
F 2 "kicad-libraries:R0805" H 7600 2100 60  0001 C CNN
F 3 "" H 7600 2100 60  0000 C CNN
	1    7600 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 900  7700 900 
Wire Wire Line
	7100 900  7350 900 
Wire Wire Line
	7350 900  7350 2100
Wire Wire Line
	7350 2100 7500 2100
Connection ~ 7350 900 
Text GLabel 7600 1550 0    39   Input ~ 0
B-EN
Text GLabel 4000 3150 2    39   Output ~ 0
B-EN
Wire Wire Line
	7600 1550 7650 1550
$Comp
L tinkerforge:MOSFET_P_CH Q104
U 1 1 5B382CFC
P 7950 2200
F 0 "Q104" V 7800 2400 50  0000 R CNN
F 1 "NTR2101P" V 8150 2400 50  0000 R CNN
F 2 "kicad-libraries:SOT23GDS" H 8150 2300 50  0001 C CNN
F 3 "" H 7950 2200 50  0000 C CNN
	1    7950 2200
	0    1    -1   0   
$EndComp
$Comp
L tinkerforge:MOSFET_N_CH Q102
U 1 1 5B382E4B
P 7850 2750
F 0 "Q102" H 8150 2800 50  0000 R CNN
F 1 "2N7002P" H 8400 2600 50  0000 R CNN
F 2 "kicad-libraries:SOT23GDS" H 8050 2850 50  0001 C CNN
F 3 "" H 7850 2750 50  0000 C CNN
	1    7850 2750
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR013
U 1 1 5B382F8B
P 7950 3000
F 0 "#PWR013" H 7950 3000 30  0001 C CNN
F 1 "GND" H 7950 2930 30  0001 C CNN
F 2 "" H 7950 3000 60  0000 C CNN
F 3 "" H 7950 3000 60  0000 C CNN
	1    7950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3000 7950 2950
Wire Wire Line
	7950 2550 7950 2400
Wire Wire Line
	7700 2100 7750 2100
Wire Wire Line
	8150 2100 8850 2100
Connection ~ 8850 2950
Wire Wire Line
	8750 3150 8850 3150
$Comp
L tinkerforge:C C110
U 1 1 5B3833F9
P 9050 2550
F 0 "C110" V 8900 2500 50  0000 L CNN
F 1 "10uF" V 9200 2450 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 9050 2550 60  0001 C CNN
F 3 "" H 9050 2550 60  0000 C CNN
	1    9050 2550
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:GND #PWR014
U 1 1 5B383655
P 9250 2600
F 0 "#PWR014" H 9250 2600 30  0001 C CNN
F 1 "GND" H 9250 2530 30  0001 C CNN
F 2 "" H 9250 2600 60  0000 C CNN
F 3 "" H 9250 2600 60  0000 C CNN
	1    9250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2600 9250 2550
Connection ~ 8850 2550
Text GLabel 7600 2750 0    39   Input ~ 0
RASP-EN
Wire Wire Line
	7600 2750 7650 2750
Text GLabel 4000 3050 2    39   Output ~ 0
RASP-EN
Text GLabel 1700 3800 2    39   Output ~ 0
RASP-GP
Text GLabel 10550 5050 2    39   Output ~ 0
RASP-GP
$Comp
L tinkerforge:Rs R102
U 1 1 5B385E8D
P 7750 2300
F 0 "R102" V 7800 2300 31  0000 C CNN
F 1 "10k" V 7750 2300 31  0000 C CNN
F 2 "kicad-libraries:R0603F" H 7750 2300 60  0001 C CNN
F 3 "" H 7750 2300 60  0000 C CNN
	1    7750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2400 7750 2400
Wire Wire Line
	7750 2100 7750 2200
Connection ~ 7950 2400
Connection ~ 7750 2100
Text Notes 600  7700 0    39   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions
$Comp
L tinkerforge:C C101
U 1 1 5B38A092
P 1650 1100
F 0 "C101" H 1700 1200 50  0000 L CNN
F 1 "100nF" H 1700 1000 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 1650 1100 60  0001 C CNN
F 3 "" H 1650 1100 60  0000 C CNN
	1    1650 1100
	1    0    0    -1  
$EndComp
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
	1550 750  1650 750 
Wire Wire Line
	1950 700  1950 750 
Wire Wire Line
	1950 850  1550 850 
Connection ~ 1950 750 
Connection ~ 1950 850 
Wire Wire Line
	1650 900  1650 750 
Connection ~ 1650 750 
Wire Wire Line
	1550 1350 1650 1350
Wire Wire Line
	1650 1300 1650 1350
Connection ~ 1650 1350
Wire Wire Line
	1650 1450 1550 1450
Connection ~ 1950 1350
$Comp
L tinkerforge:C C102
U 1 1 5B38A97E
P 1650 2050
F 0 "C102" H 1700 2150 50  0000 L CNN
F 1 "220nF" H 1700 1950 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 1650 2050 60  0001 C CNN
F 3 "" H 1650 2050 60  0000 C CNN
	1    1650 2050
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C104
U 1 1 5B38AA51
P 1950 2050
F 0 "C104" H 2000 2150 50  0000 L CNN
F 1 "100nF" H 2000 1950 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 1950 2050 60  0001 C CNN
F 3 "" H 1950 2050 60  0000 C CNN
	1    1950 2050
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR015
U 1 1 5B38AC3B
P 1950 2350
F 0 "#PWR015" H 1950 2350 30  0001 C CNN
F 1 "GND" H 1950 2280 30  0001 C CNN
F 2 "" H 1950 2350 60  0000 C CNN
F 3 "" H 1950 2350 60  0000 C CNN
	1    1950 2350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR016
U 1 1 5B38ACDC
P 1950 1700
F 0 "#PWR016" H 1950 1800 40  0001 C CNN
F 1 "3V3" H 1950 1825 40  0000 C CNN
F 2 "" H 1950 1700 60  0000 C CNN
F 3 "" H 1950 1700 60  0000 C CNN
	1    1950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1300 1950 1350
Wire Wire Line
	1550 1700 1950 1700
Wire Wire Line
	1550 1800 1650 1800
Wire Wire Line
	1950 1700 1950 1800
Wire Wire Line
	1650 1850 1650 1800
Connection ~ 1650 1800
Wire Wire Line
	1550 2300 1650 2300
Wire Wire Line
	1950 2250 1950 2300
Connection ~ 1950 2300
Wire Wire Line
	1650 2250 1650 2300
Connection ~ 1650 2300
Connection ~ 1950 1800
Connection ~ 1950 1700
$Comp
L tinkerforge:CRYSTAL_3225 X101
U 1 1 5B38B8F4
P 2350 4750
F 0 "X101" H 2150 5000 60  0000 C CNN
F 1 "16MHz" H 2400 4500 60  0000 C CNN
F 2 "kicad-libraries:CRYSTAL_3225" H 2350 4750 60  0001 C CNN
F 3 "" H 2350 4750 60  0000 C CNN
	1    2350 4750
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C105
U 1 1 5B38BE3D
P 2000 4950
F 0 "C105" V 1950 5000 50  0000 L CNN
F 1 "10pF" V 2050 5050 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 2000 4950 60  0001 C CNN
F 3 "" H 2000 4950 60  0000 C CNN
	1    2000 4950
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:C C106
U 1 1 5B38C2CD
P 2700 4950
F 0 "C106" V 2650 5000 50  0000 L CNN
F 1 "10pF" V 2750 5000 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 2700 4950 60  0001 C CNN
F 3 "" H 2700 4950 60  0000 C CNN
	1    2700 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 4200 2050 4200
Wire Wire Line
	2050 4200 2050 4750
Wire Wire Line
	1550 4100 2650 4100
Wire Wire Line
	2650 4100 2650 4750
Wire Wire Line
	2050 4750 2000 4750
Wire Wire Line
	2650 4750 2700 4750
$Comp
L tinkerforge:GND #PWR017
U 1 1 5B38CA96
P 2000 5250
F 0 "#PWR017" H 2000 5250 30  0001 C CNN
F 1 "GND" H 2000 5180 30  0001 C CNN
F 2 "" H 2000 5250 60  0000 C CNN
F 3 "" H 2000 5250 60  0000 C CNN
	1    2000 5250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR018
U 1 1 5B38CD35
P 2200 5250
F 0 "#PWR018" H 2200 5250 30  0001 C CNN
F 1 "GND" H 2200 5180 30  0001 C CNN
F 2 "" H 2200 5250 60  0000 C CNN
F 3 "" H 2200 5250 60  0000 C CNN
	1    2200 5250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR019
U 1 1 5B38CDA3
P 2700 5250
F 0 "#PWR019" H 2700 5250 30  0001 C CNN
F 1 "GND" H 2700 5180 30  0001 C CNN
F 2 "" H 2700 5250 60  0000 C CNN
F 3 "" H 2700 5250 60  0000 C CNN
	1    2700 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5250 2700 5150
Wire Wire Line
	2200 5250 2200 5050
Wire Wire Line
	2000 5250 2000 5150
Connection ~ 2650 4750
Connection ~ 2050 4750
$Comp
L tinkerforge:CRYSTAL_3225 X102
U 1 1 5B38D71D
P 3050 4000
F 0 "X102" H 2850 4250 60  0000 C CNN
F 1 "32.768kHz" H 3200 3750 60  0000 C CNN
F 2 "kicad-libraries:AB26TRQ" H 3050 4000 60  0001 C CNN
F 3 "" H 3050 4000 60  0000 C CNN
	1    3050 4000
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR020
U 1 1 5B38DB50
P 2900 4350
F 0 "#PWR020" H 2900 4350 30  0001 C CNN
F 1 "GND" H 2900 4280 30  0001 C CNN
F 2 "" H 2900 4350 60  0000 C CNN
F 3 "" H 2900 4350 60  0000 C CNN
	1    2900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4350 2900 4300
Wire Wire Line
	3350 4000 3350 3650
Wire Wire Line
	3350 3650 2600 3650
Wire Wire Line
	2600 3650 2600 3900
Wire Wire Line
	2600 3900 1550 3900
Wire Wire Line
	1550 4000 2750 4000
$Comp
L tinkerforge:CONN_01X02 J102
U 1 1 5B38E436
P 4950 1450
F 0 "J102" H 4950 1600 50  0000 C CNN
F 1 "Boot" H 4950 1300 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 4950 1450 50  0001 C CNN
F 3 "" H 4950 1450 50  0001 C CNN
	1    4950 1450
	1    0    0    1   
$EndComp
$Comp
L tinkerforge:CONN_01X01 P101
U 1 1 5B38E84F
P 4200 2450
F 0 "P101" H 4200 2550 50  0000 C CNN
F 1 "Debug" V 4300 2450 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 4200 2450 50  0001 C CNN
F 3 "" H 4200 2450 50  0000 C CNN
	1    4200 2450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:LED D101
U 1 1 5B38EE2F
P 4900 800
F 0 "D101" H 4900 900 50  0000 C CNN
F 1 "green" H 4900 700 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 4900 800 50  0001 C CNN
F 3 "" H 4900 800 50  0000 C CNN
	1    4900 800 
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 5050 7650 5050
Wire Wire Line
	7650 5050 7650 4450
Wire Wire Line
	7650 4450 7600 4450
Wire Wire Line
	7600 4350 7700 4350
Wire Wire Line
	7700 4350 7700 4950
Wire Wire Line
	7700 4950 8050 4950
Wire Wire Line
	8050 4850 7750 4850
Wire Wire Line
	7750 4850 7750 4250
Wire Wire Line
	7750 4250 7600 4250
Wire Wire Line
	8050 4750 7800 4750
Wire Wire Line
	7800 4750 7800 4150
Wire Wire Line
	7800 4150 7600 4150
Wire Wire Line
	8050 4650 7850 4650
Wire Wire Line
	7850 4650 7850 3950
Wire Wire Line
	7850 3950 7600 3950
Wire Wire Line
	8050 4550 7900 4550
Wire Wire Line
	7900 4550 7900 3850
Wire Wire Line
	7900 3850 7600 3850
NoConn ~ 9850 4550
NoConn ~ 8050 4450
NoConn ~ 8050 4350
NoConn ~ 8050 4250
Text GLabel 7000 3950 0    39   Output ~ 0
B-CS0
Wire Wire Line
	7000 4450 7200 4450
Wire Wire Line
	7200 4350 7000 4350
Wire Wire Line
	7000 4250 7200 4250
Wire Wire Line
	7000 4150 7200 4150
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 1 1 5B3CDC72
P 7400 3850
F 0 "RP102" H 7215 3885 20  0000 C CNN
F 1 "82" H 7400 3850 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 3850 60  0001 C CNN
F 3 "" H 7400 3850 60  0000 C CNN
	1    7400 3850
	1    0    0    -1  
$EndComp
NoConn ~ 8050 4150
NoConn ~ 8050 4050
NoConn ~ 8050 3950
NoConn ~ 9850 5150
NoConn ~ 9850 3950
NoConn ~ 9850 3850
NoConn ~ 9850 3750
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 2 1 5B3CFA38
P 7400 4150
F 0 "RP102" H 7215 4185 20  0000 C CNN
F 1 "82" H 7400 4150 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4150 60  0001 C CNN
F 3 "" H 7400 4150 60  0000 C CNN
	2    7400 4150
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 3 1 5B3CFAB5
P 7400 4450
F 0 "RP102" H 7215 4485 20  0000 C CNN
F 1 "82" H 7400 4450 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4450 60  0001 C CNN
F 3 "" H 7400 4450 60  0000 C CNN
	3    7400 4450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP102
U 4 1 5B3CFB39
P 7400 3950
F 0 "RP102" H 7215 3985 20  0000 C CNN
F 1 "82" H 7400 3950 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 3950 60  0001 C CNN
F 3 "" H 7400 3950 60  0000 C CNN
	4    7400 3950
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 1 1 5B3CFC33
P 7400 4350
F 0 "RP103" H 7215 4385 20  0000 C CNN
F 1 "82" H 7400 4350 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4350 60  0001 C CNN
F 3 "" H 7400 4350 60  0000 C CNN
	1    7400 4350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 2 1 5B3CFCB5
P 10200 4250
F 0 "RP103" H 10015 4285 20  0000 C CNN
F 1 "82" H 10200 4250 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4250 60  0001 C CNN
F 3 "" H 10200 4250 60  0000 C CNN
	2    10200 4250
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 3 1 5B3CFD3A
P 10200 4150
F 0 "RP103" H 10015 4185 20  0000 C CNN
F 1 "82" H 10200 4150 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4150 60  0001 C CNN
F 3 "" H 10200 4150 60  0000 C CNN
	3    10200 4150
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP103
U 4 1 5B3D0098
P 10200 4450
F 0 "RP103" H 10015 4485 20  0000 C CNN
F 1 "82" H 10200 4450 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4450 60  0001 C CNN
F 3 "" H 10200 4450 60  0000 C CNN
	4    10200 4450
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 2 1 5B3D0831
P 10200 4850
F 0 "RP104" H 10015 4885 20  0000 C CNN
F 1 "82" H 10200 4850 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4850 60  0001 C CNN
F 3 "" H 10200 4850 60  0000 C CNN
	2    10200 4850
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 3 1 5B3D08CF
P 10200 4650
F 0 "RP104" H 10015 4685 20  0000 C CNN
F 1 "82" H 10200 4650 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4650 60  0001 C CNN
F 3 "" H 10200 4650 60  0000 C CNN
	3    10200 4650
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 4 1 5B3D0964
P 10200 4750
F 0 "RP104" H 10015 4785 20  0000 C CNN
F 1 "82" H 10200 4750 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 10200 4750 60  0001 C CNN
F 3 "" H 10200 4750 60  0000 C CNN
	4    10200 4750
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP104
U 1 1 5B3D09F8
P 7400 4250
F 0 "RP104" H 7215 4285 20  0000 C CNN
F 1 "82" H 7400 4250 20  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7400 4250 60  0001 C CNN
F 3 "" H 7400 4250 60  0000 C CNN
	1    7400 4250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R103
U 1 1 5B3D0F81
P 10200 5050
F 0 "R103" V 10280 5050 50  0000 C CNN
F 1 "1k" V 10200 5050 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 10200 5050 60  0001 C CNN
F 3 "" H 10200 5050 60  0000 C CNN
	1    10200 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	10550 5050 10450 5050
Wire Wire Line
	9950 5050 9850 5050
Wire Wire Line
	9850 4450 10000 4450
Wire Wire Line
	10400 4450 10550 4450
Wire Wire Line
	1550 4400 1700 4400
Wire Wire Line
	1550 4500 1700 4500
Wire Wire Line
	1550 4600 1700 4600
Wire Wire Line
	3900 700  4000 700 
Wire Wire Line
	1550 3800 1700 3800
Wire Wire Line
	1550 6200 1700 6200
Wire Wire Line
	3900 1900 4000 1900
Wire Wire Line
	4000 2000 3900 2000
Text Notes 4500 1950 0    39   ~ 0
USIC1_CH1
Wire Wire Line
	3900 1700 4000 1700
Text Notes 1650 4750 0    39   ~ 0
USIC0_CH0
Text Notes 2100 3400 0    39   ~ 0
USIC1_CH0
Wire Wire Line
	1550 3300 1700 3300
Wire Wire Line
	1700 3400 1550 3400
Wire Wire Line
	1550 5600 1700 5600
Wire Wire Line
	1700 5700 1550 5700
Wire Wire Line
	1550 6000 1700 6000
Wire Wire Line
	3900 1500 4000 1500
Wire Wire Line
	4000 1600 3900 1600
Wire Wire Line
	3900 3050 4000 3050
Wire Wire Line
	4000 3150 3900 3150
Wire Wire Line
	4000 2450 3900 2450
Wire Wire Line
	3900 800  4250 800 
$Comp
L tinkerforge:3V3 #PWR021
U 1 1 5B47153D
P 5200 800
F 0 "#PWR021" H 5200 900 40  0001 C CNN
F 1 "3V3" H 5200 925 40  0000 C CNN
F 2 "" H 5200 800 60  0000 C CNN
F 3 "" H 5200 800 60  0000 C CNN
	1    5200 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 800  5200 800 
Wire Wire Line
	4700 800  4650 800 
$Comp
L tinkerforge:LED D103
U 1 1 5B4759A1
P 4900 2950
F 0 "D103" H 4900 3050 50  0000 C CNN
F 1 "green" H 4900 2850 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 4900 2950 50  0001 C CNN
F 3 "" H 4900 2950 50  0000 C CNN
	1    4900 2950
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:LED D102
U 1 1 5B476059
P 4900 2700
F 0 "D102" H 4900 2800 50  0000 C CNN
F 1 "blue" H 4900 2600 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 4900 2700 50  0001 C CNN
F 3 "" H 4900 2700 50  0000 C CNN
	1    4900 2700
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP105
U 2 1 5B476840
P 4450 2950
F 0 "RP105" H 4265 2985 20  0000 C CNN
F 1 "1k" H 4450 2950 20  0000 C CNN
F 2 "kicad-libraries:4X0603" H 4450 2950 60  0001 C CNN
F 3 "" H 4450 2950 60  0000 C CNN
	2    4450 2950
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP105
U 1 1 5B476C13
P 3900 4300
F 0 "RP105" H 3715 4335 20  0000 C CNN
F 1 "1k" H 3900 4300 20  0000 C CNN
F 2 "kicad-libraries:4X0603" H 3900 4300 60  0001 C CNN
F 3 "" H 3900 4300 60  0000 C CNN
	1    3900 4300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK_SINGLE RP105
U 3 1 5B47719B
P 4450 800
F 0 "RP105" H 4265 835 20  0000 C CNN
F 1 "1k" H 4450 800 20  0000 C CNN
F 2 "kicad-libraries:4X0603" H 4450 800 60  0001 C CNN
F 3 "" H 4450 800 60  0000 C CNN
	3    4450 800 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR022
U 1 1 5B47747F
P 5100 2550
F 0 "#PWR022" H 5100 2650 40  0001 C CNN
F 1 "3V3" H 5100 2675 40  0000 C CNN
F 2 "" H 5100 2550 60  0000 C CNN
F 3 "" H 5100 2550 60  0000 C CNN
	1    5100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2550 5100 2700
Connection ~ 5100 2700
Wire Wire Line
	3900 2950 4250 2950
Wire Wire Line
	4250 2700 4250 2850
Wire Wire Line
	4250 2850 3900 2850
Wire Wire Line
	4650 2950 4700 2950
Wire Wire Line
	4700 2700 4650 2700
$Comp
L tinkerforge:LED D104
U 1 1 5B479B35
P 4450 4300
F 0 "D104" H 4450 4400 50  0000 C CNN
F 1 "green" H 4450 4200 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 4450 4300 50  0001 C CNN
F 3 "" H 4450 4300 50  0000 C CNN
	1    4450 4300
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:3V3 #PWR023
U 1 1 5B479DFF
P 4650 4200
F 0 "#PWR023" H 4650 4300 40  0001 C CNN
F 1 "3V3" H 4650 4325 40  0000 C CNN
F 2 "" H 4650 4200 60  0000 C CNN
F 3 "" H 4650 4200 60  0000 C CNN
	1    4650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4300 4650 4200
Wire Wire Line
	4250 4300 4100 4300
Wire Wire Line
	1550 4300 3700 4300
$Comp
L tinkerforge:R_PACK_SINGLE RP105
U 4 1 5B47C531
P 4450 2700
F 0 "RP105" H 4265 2735 20  0000 C CNN
F 1 "1k" H 4450 2700 20  0000 C CNN
F 2 "kicad-libraries:4X0603" H 4450 2700 60  0001 C CNN
F 3 "" H 4450 2700 60  0000 C CNN
	4    4450 2700
	1    0    0    -1  
$EndComp
Text GLabel 4000 900  2    39   Input ~ 0
B-CLK
Wire Wire Line
	3900 900  4000 900 
$Comp
L tinkerforge:GND #PWR024
U 1 1 5B481E6B
P 4750 1550
F 0 "#PWR024" H 4750 1550 30  0001 C CNN
F 1 "GND" H 4750 1480 30  0001 C CNN
F 2 "" H 4750 1550 60  0000 C CNN
F 3 "" H 4750 1550 60  0000 C CNN
	1    4750 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1550 4750 1500
Wire Wire Line
	4750 1400 3900 1400
Text GLabel 8900 2100 2    39   Output ~ 0
RASP-PWR
Connection ~ 8850 2100
NoConn ~ 1550 3100
NoConn ~ 1550 3200
NoConn ~ 1550 3500
NoConn ~ 1550 3600
NoConn ~ 1550 3700
NoConn ~ 3900 1000
NoConn ~ 3900 1100
NoConn ~ 3900 1200
NoConn ~ 3900 1300
NoConn ~ 3900 1800
Wire Wire Line
	7050 5350 8050 5350
Wire Wire Line
	7350 5450 8050 5450
Wire Wire Line
	7200 4850 7250 4850
Wire Wire Line
	7250 4850 7350 4850
Wire Wire Line
	7150 4850 7200 4850
Wire Wire Line
	9150 6050 9250 6050
Wire Wire Line
	9050 6050 9150 6050
Wire Wire Line
	8950 6050 9050 6050
Wire Wire Line
	8850 6050 8900 6050
Wire Wire Line
	8750 6050 8850 6050
Wire Wire Line
	8650 6050 8750 6050
Wire Wire Line
	8900 6050 8950 6050
Wire Wire Line
	9850 900  10150 900 
Wire Wire Line
	8700 900  8900 900 
Wire Wire Line
	8400 900  8700 900 
Wire Wire Line
	8300 900  8400 900 
Wire Wire Line
	8850 3150 8850 3350
Wire Wire Line
	7350 900  7500 900 
Wire Wire Line
	8850 2950 8850 3150
Wire Wire Line
	8850 2550 8850 2950
Wire Wire Line
	1950 750  1950 850 
Wire Wire Line
	1950 850  1950 900 
Wire Wire Line
	1650 750  1950 750 
Wire Wire Line
	1650 1350 1950 1350
Wire Wire Line
	1650 1350 1650 1450
Wire Wire Line
	1950 1350 1950 1450
Wire Wire Line
	1650 1800 1950 1800
Wire Wire Line
	1950 2300 1950 2350
Wire Wire Line
	1650 2300 1950 2300
Wire Wire Line
	1950 1800 1950 1850
Wire Wire Line
	5100 2700 5100 2950
Wire Wire Line
	8850 2100 8900 2100
Text Notes 5350 750  0    39   ~ 0
"high led"
Text Notes 5150 2700 0    39   ~ 0
"status led"
Text Notes 5150 2950 0    39   ~ 0
"mid led"
Text Notes 4750 4300 0    39   ~ 0
"low led"
Text Notes 6700 3700 0    39   ~ 0
CS2 und CS3 getauscht
NoConn ~ 1550 5800
NoConn ~ 1550 5900
NoConn ~ 1550 6100
$EndSCHEMATC
