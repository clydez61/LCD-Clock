EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L MCU_Microchip_ATmega:ATmega328P-PU U?
U 1 1 5FBB048E
P 2400 2700
F 0 "U?" H 1756 2746 50  0000 R CNN
F 1 "ATmega328P-PU" H 1756 2655 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2400 2700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2400 2700 50  0001 C CNN
	1    2400 2700
	1    0    0    -1  
$EndComp
$Comp
L Display_Character:LCD-016N002L U?
U 1 1 5FBB0CA0
P 4900 2200
F 0 "U?" H 4900 3181 50  0000 C CNN
F 1 "LCD-016N002L" H 4900 3090 50  0000 C CNN
F 2 "Display:LCD-016N002L" H 4920 1280 50  0001 C CNN
F 3 "http://www.vishay.com/docs/37299/37299.pdf" H 5400 1900 50  0001 C CNN
	1    4900 2200
	1    0    0    -1  
$EndComp
Text Notes 3900 3600 0    79   ~ 0
Note: The original LCD-GDM1602K used isn't in the library, 
Text Notes 3800 3800 0    79   ~ 0
This LCD is used as a replacement as they share the same used pins
Text Notes 3000 3300 0    49   ~ 0
E
Text Notes 3000 3200 0    49   ~ 0
RS
NoConn ~ 3000 3400
NoConn ~ 3000 3500
Text Notes 3000 3600 0    49   ~ 0
DB4
Text Notes 3000 3700 0    49   ~ 0
DB5
Text Notes 3000 3800 0    49   ~ 0
DB6
Text Notes 3000 3900 0    49   ~ 0
DB7
Text Notes 4300 2500 0    49   ~ 0
PD4
Text Notes 4300 2600 0    49   ~ 0
PD5
Text Notes 4300 2700 0    49   ~ 0
PD6
Text Notes 4300 2800 0    49   ~ 0
PD7
$Comp
L power:GND #PWR?
U 1 1 5FBB6C53
P 4900 3000
F 0 "#PWR?" H 4900 2750 50  0001 C CNN
F 1 "GND" H 4905 2827 50  0000 C CNN
F 2 "" H 4900 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1000 4900 1100
$Comp
L power:+5V #PWR?
U 1 1 5FBB9349
P 4900 1000
F 0 "#PWR?" H 4900 850 50  0001 C CNN
F 1 "+5V" H 4915 1173 50  0000 C CNN
F 2 "" H 4900 1000 50  0001 C CNN
F 3 "" H 4900 1000 50  0001 C CNN
	1    4900 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US 0-2M
U 1 1 5FBBA4A8
P 5800 1600
F 0 "0-2M" H 5868 1646 50  0000 L CNN
F 1 "BAOTER 3296" H 5868 1555 50  0000 L CNN
F 2 "" V 5840 1590 50  0001 C CNN
F 3 "~" H 5800 1600 50  0001 C CNN
	1    5800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1100 5400 1100
Connection ~ 4900 1100
Wire Wire Line
	4900 1100 4900 1400
Wire Wire Line
	5800 3000 4900 3000
Connection ~ 4900 3000
Wire Wire Line
	5800 1700 5800 1750
Connection ~ 5800 1750
Wire Wire Line
	5800 1750 5800 3000
Wire Wire Line
	5800 1100 5800 1400
Connection ~ 5800 1450
Wire Wire Line
	5800 1450 5800 1500
Wire Wire Line
	5300 1600 5300 1400
Wire Wire Line
	5300 1400 5800 1400
Connection ~ 5800 1400
Wire Wire Line
	5800 1400 5800 1450
$Comp
L Device:R_US 220Ω
U 1 1 5FBC1F00
P 5400 1700
F 0 "220Ω" H 5468 1746 50  0000 L CNN
F 1 "R_US" H 5468 1655 50  0000 L CNN
F 2 "" V 5440 1690 50  0001 C CNN
F 3 "~" H 5400 1700 50  0001 C CNN
	1    5400 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1800 5400 1850
Wire Wire Line
	5400 1900 5300 1900
Connection ~ 5400 1850
Wire Wire Line
	5400 1850 5400 1900
Wire Wire Line
	5400 1600 5400 1550
Connection ~ 5400 1100
Wire Wire Line
	5400 1100 5800 1100
Connection ~ 5400 1550
Wire Wire Line
	5400 1550 5400 1100
$Comp
L power:GND #PWR?
U 1 1 5FBC3A35
P 5500 2100
F 0 "#PWR?" H 5500 1850 50  0001 C CNN
F 1 "GND" H 5505 1927 50  0000 C CNN
F 2 "" H 5500 2100 50  0001 C CNN
F 3 "" H 5500 2100 50  0001 C CNN
	1    5500 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2000 5500 2000
Wire Wire Line
	5500 2000 5500 2100
$Comp
L power:+5V #PWR?
U 1 1 5FBC469D
P 2400 1200
F 0 "#PWR?" H 2400 1050 50  0001 C CNN
F 1 "+5V" H 2415 1373 50  0000 C CNN
F 2 "" H 2400 1200 50  0001 C CNN
F 3 "" H 2400 1200 50  0001 C CNN
	1    2400 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBC574E
P 2400 4200
F 0 "#PWR?" H 2400 3950 50  0001 C CNN
F 1 "GND" H 2405 4027 50  0000 C CNN
F 2 "" H 2400 4200 50  0001 C CNN
F 3 "" H 2400 4200 50  0001 C CNN
	1    2400 4200
	1    0    0    -1  
$EndComp
Text Notes 3000 1600 0    49   ~ 0
Instruction_Button
Text Notes 3000 1500 0    49   ~ 0
Hour_Button
Text Notes 3000 1700 0    49   ~ 0
Minute_Button
$Comp
L Switch:SW_Push SW?
U 1 1 5FBC7380
P 2100 5600
F 0 "SW?" H 2100 5885 50  0000 C CNN
F 1 "Instruction_Button" H 2100 5794 50  0000 C CNN
F 2 "" H 2100 5800 50  0001 C CNN
F 3 "~" H 2100 5800 50  0001 C CNN
	1    2100 5600
	1    0    0    -1  
$EndComp
Text Notes 2100 5300 0    50   ~ 0
 
Text Notes 1700 5600 0    50   ~ 0
PB1
$Comp
L power:GND #PWR?
U 1 1 5FBC87B8
P 2400 5700
F 0 "#PWR?" H 2400 5450 50  0001 C CNN
F 1 "GND" H 2405 5527 50  0000 C CNN
F 2 "" H 2400 5700 50  0001 C CNN
F 3 "" H 2400 5700 50  0001 C CNN
	1    2400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 5600 2400 5600
Wire Wire Line
	2400 5600 2400 5700
$Comp
L Switch:SW_Push SW?
U 1 1 5FBCA075
P 2100 6300
F 0 "SW?" H 2100 6585 50  0000 C CNN
F 1 "Hour_Button" H 2100 6494 50  0000 C CNN
F 2 "" H 2100 6500 50  0001 C CNN
F 3 "~" H 2100 6500 50  0001 C CNN
	1    2100 6300
	1    0    0    -1  
$EndComp
Text Notes 1700 6300 0    50   ~ 0
PB0
$Comp
L power:GND #PWR?
U 1 1 5FBCA07C
P 2400 6400
F 0 "#PWR?" H 2400 6150 50  0001 C CNN
F 1 "GND" H 2405 6227 50  0000 C CNN
F 2 "" H 2400 6400 50  0001 C CNN
F 3 "" H 2400 6400 50  0001 C CNN
	1    2400 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6300 2400 6300
Wire Wire Line
	2400 6300 2400 6400
$Comp
L Switch:SW_Push SW?
U 1 1 5FBCADF9
P 2100 6900
F 0 "SW?" H 2100 7185 50  0000 C CNN
F 1 "Minute_Button" H 2100 7094 50  0000 C CNN
F 2 "" H 2100 7100 50  0001 C CNN
F 3 "~" H 2100 7100 50  0001 C CNN
	1    2100 6900
	1    0    0    -1  
$EndComp
Text Notes 1700 6900 0    50   ~ 0
PB2
$Comp
L power:GND #PWR?
U 1 1 5FBCAE00
P 2400 7000
F 0 "#PWR?" H 2400 6750 50  0001 C CNN
F 1 "GND" H 2405 6827 50  0000 C CNN
F 2 "" H 2400 7000 50  0001 C CNN
F 3 "" H 2400 7000 50  0001 C CNN
	1    2400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6900 2400 6900
Wire Wire Line
	2400 6900 2400 7000
Text Notes 7500 7000 0    236  ~ 0
Author: Chen Zhou
Text Notes 7600 7500 0    98   ~ 0
LCD Clock
$EndSCHEMATC
