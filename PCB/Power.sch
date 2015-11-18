EESchema Schematic File Version 2
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
LIBS:stm32f405vgt
LIBS:adp3335
LIBS:buzzer
LIBS:q_nmos_gsd
LIBS:ADIS16405
LIBS:uSD_holder
LIBS:ms5611-01ba03
LIBS:microusb
LIBS:usblc6-2
LIBS:swd
LIBS:IMU-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title "Power Supply"
Date "29 oct 2015"
Rev ""
Comp "Cambridge University Spaceflight"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ADP3335 IC2
U 1 1 5631D46D
P 3250 3350
F 0 "IC2" H 3050 3050 60  0000 L TNN
F 1 "ADP3335ARMZ-3.3" H 3250 3650 60  0000 C BNN
F 2 "IMU:MSOP8" H 3650 2950 60  0001 C CNN
F 3 "" H 3650 2950 60  0000 C CNN
F 4 "2067775" H 3250 3350 60  0001 C CNN "Farnell"
	1    3250 3350
	1    0    0    -1  
$EndComp
$Comp
L C C17
U 1 1 5631D495
P 3950 3500
F 0 "C17" V 4000 3550 40  0000 L TNN
F 1 "1n" V 4000 3450 40  0000 R TNN
F 2 "Capacitors_SMD:C_0603" H 3988 3350 30  0001 C CNN
F 3 "~" H 3950 3500 60  0000 C CNN
F 4 "Value" H 3950 3500 60  0001 C CNN "Digikey"
F 5 "Value" H 3950 3500 60  0001 C CNN "Farnell"
F 6 "Value" H 3950 3500 60  0001 C CNN "Fieldname"
	1    3950 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3500 3800 3500
Wire Wire Line
	3700 3200 4200 3200
Wire Wire Line
	4200 3150 4200 3500
Wire Wire Line
	4200 3500 4100 3500
Wire Wire Line
	3800 3400 3700 3400
Wire Wire Line
	3800 3200 3800 3400
Connection ~ 3800 3200
Wire Wire Line
	3700 3300 3800 3300
Connection ~ 3800 3300
Text Notes 3800 3800 0    60   ~ 0
As close as\nis possible
$Comp
L GND #PWR026
U 1 1 5631D5C9
P 2700 3600
F 0 "#PWR026" H 2700 3600 30  0001 C CNN
F 1 "GND" H 2700 3530 30  0001 C CNN
F 2 "" H 2700 3600 60  0000 C CNN
F 3 "" H 2700 3600 60  0000 C CNN
	1    2700 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3600 2700 3500
Wire Wire Line
	2700 3500 2800 3500
Connection ~ 4200 3200
Wire Wire Line
	2700 3400 2800 3400
Wire Wire Line
	2600 3200 2800 3200
$Comp
L ADP3335 IC3
U 1 1 5631D621
P 7350 3350
F 0 "IC3" H 7150 3050 60  0000 L TNN
F 1 "ADP3335ARMZ-5" H 7350 3650 60  0000 C BNN
F 2 "IMU:MSOP8" H 7750 2950 60  0001 C CNN
F 3 "" H 7750 2950 60  0000 C CNN
F 4 "2074873" H 7350 3350 60  0001 C CNN "Farnell"
	1    7350 3350
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 5631D62C
P 8050 3500
F 0 "C21" V 8100 3550 40  0000 L TNN
F 1 "1n" V 8100 3450 40  0000 R TNN
F 2 "Capacitors_SMD:C_0603" H 8088 3350 30  0001 C CNN
F 3 "~" H 8050 3500 60  0000 C CNN
F 4 "Value" H 8050 3500 60  0001 C CNN "Digikey"
F 5 "Value" H 8050 3500 60  0001 C CNN "Farnell"
F 6 "Value" H 8050 3500 60  0001 C CNN "Fieldname"
	1    8050 3500
	0    1    1    0   
$EndComp
Text Notes 7900 3800 0    60   ~ 0
As close as\nis possible
Wire Wire Line
	7800 3500 7900 3500
Wire Wire Line
	7800 3200 8300 3200
Wire Wire Line
	8300 3150 8300 3500
Wire Wire Line
	7900 3400 7800 3400
Wire Wire Line
	7900 3200 7900 3400
Connection ~ 7900 3200
Wire Wire Line
	7800 3300 7900 3300
Connection ~ 7900 3300
Connection ~ 8300 3200
Wire Wire Line
	6150 3200 6900 3200
Text Label 6150 3200 0    60   ~ 0
VIN
Wire Wire Line
	6800 3400 6900 3400
Wire Wire Line
	6800 3300 6900 3300
Connection ~ 6800 3300
$Comp
L GND #PWR027
U 1 1 5631D95D
P 6800 3600
F 0 "#PWR027" H 6800 3600 30  0001 C CNN
F 1 "GND" H 6800 3530 30  0001 C CNN
F 2 "" H 6800 3600 60  0000 C CNN
F 3 "" H 6800 3600 60  0000 C CNN
	1    6800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3500 6800 3500
Wire Wire Line
	6800 3500 6800 3600
Wire Wire Line
	8700 3200 8700 3100
Wire Wire Line
	8700 3100 9000 3100
Wire Wire Line
	9000 3100 9000 3200
Wire Wire Line
	8700 3500 8700 3600
Wire Wire Line
	8700 3600 9000 3600
Wire Wire Line
	9000 3600 9000 3500
$Comp
L GND #PWR028
U 1 1 5631DA54
P 8850 3700
F 0 "#PWR028" H 8850 3700 30  0001 C CNN
F 1 "GND" H 8850 3630 30  0001 C CNN
F 2 "" H 8850 3700 60  0000 C CNN
F 3 "" H 8850 3700 60  0000 C CNN
	1    8850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3600 8850 3700
Connection ~ 8850 3600
Wire Wire Line
	8850 3050 8850 3100
Connection ~ 8850 3100
Wire Wire Line
	4600 3200 4600 3100
Wire Wire Line
	4600 3100 4900 3100
Wire Wire Line
	4900 3100 4900 3200
Wire Wire Line
	4600 3500 4600 3600
Wire Wire Line
	4600 3600 4900 3600
Wire Wire Line
	4900 3600 4900 3500
$Comp
L GND #PWR029
U 1 1 5631DADE
P 4750 3700
F 0 "#PWR029" H 4750 3700 30  0001 C CNN
F 1 "GND" H 4750 3630 30  0001 C CNN
F 2 "" H 4750 3700 60  0000 C CNN
F 3 "" H 4750 3700 60  0000 C CNN
	1    4750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3600 4750 3700
Connection ~ 4750 3600
Wire Wire Line
	4750 3050 4750 3100
Connection ~ 4750 3100
$Comp
L TST TP3
U 1 1 5631DBC1
P 8000 3150
F 0 "TP3" H 8000 3450 40  0000 C CNN
F 1 "5V" H 8000 3400 30  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Big" H 8000 3150 60  0001 C CNN
F 3 "~" H 8000 3150 60  0000 C CNN
	1    8000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3200 8000 3150
Connection ~ 8000 3200
$Comp
L TST TP2
U 1 1 5631DC07
P 3900 3150
F 0 "TP2" H 3900 3450 40  0000 C CNN
F 1 "3V3" H 3900 3400 30  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Big" H 3900 3150 60  0001 C CNN
F 3 "~" H 3900 3150 60  0000 C CNN
	1    3900 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3150 3900 3200
Connection ~ 3900 3200
Wire Wire Line
	2700 3200 2700 3400
Wire Wire Line
	2800 3300 2700 3300
Connection ~ 2700 3300
Wire Wire Line
	2600 3150 2600 3200
Connection ~ 2700 3200
Text Label 4000 2100 2    60   ~ 0
VIN
Text HLabel 7250 4050 0    60   Input ~ 0
USB5V
Wire Wire Line
	7700 4000 7700 4050
Wire Wire Line
	7700 4050 7600 4050
$Comp
L GND #PWR030
U 1 1 5631E025
P 2950 2300
F 0 "#PWR030" H 2950 2300 30  0001 C CNN
F 1 "GND" H 2950 2230 30  0001 C CNN
F 2 "" H 2950 2300 60  0000 C CNN
F 3 "" H 2950 2300 60  0000 C CNN
	1    2950 2300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2850 2200 3050 2200
Wire Wire Line
	2950 2200 2950 2300
Wire Wire Line
	2850 2100 3450 2100
Wire Wire Line
	6500 3300 6500 3200
Connection ~ 6500 3200
$Comp
L GND #PWR031
U 1 1 5631E281
P 6500 3700
F 0 "#PWR031" H 6500 3700 30  0001 C CNN
F 1 "GND" H 6500 3630 30  0001 C CNN
F 2 "" H 6500 3700 60  0000 C CNN
F 3 "" H 6500 3700 60  0000 C CNN
	1    6500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3600 6500 3700
Text Notes 6450 3700 2    60   ~ 0
Input\nsmooting
Text Notes 8700 4000 0    60   ~ 0
Output\nsmoothing
Text Notes 4600 4000 0    60   ~ 0
Output\nsmoothing
Text Notes 2800 1950 0    60   ~ 0
Input protection
Wire Notes Line
	2400 2700 2400 4200
Wire Notes Line
	2400 4200 5200 4200
Wire Notes Line
	5200 4200 5200 2700
Wire Notes Line
	5200 2700 2400 2700
Text Notes 2500 4100 0    60   ~ 0
3V3 SUPPLY
Wire Notes Line
	9300 4200 9300 2700
Wire Notes Line
	9300 2700 6000 2700
Wire Notes Line
	6000 2700 6000 4200
Wire Notes Line
	6000 4200 9300 4200
Text Notes 6100 4100 0    60   ~ 0
5V SUPPLY
Text Notes 4100 2450 2    60   ~ 0
BATTERY CONNECTOR
Wire Notes Line
	4150 1800 4150 2500
Wire Notes Line
	4150 2500 2400 2500
Wire Notes Line
	2400 2500 2400 1800
Wire Notes Line
	2400 1800 4150 1800
$Comp
L CONN_01X02 P5
U 1 1 56320EA1
P 2650 2150
F 0 "P5" H 2650 2300 50  0000 C CNN
F 1 "BATTERY" V 2750 2150 50  0000 C CNN
F 2 "IMU:S02B-PASK-2" H 2650 2150 60  0001 C CNN
F 3 "" H 2650 2150 60  0000 C CNN
F 4 "RS 512-8462" H 2650 2150 60  0001 C CNN "Farnell"
	1    2650 2150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8300 3500 8200 3500
$Comp
L +5V #PWR032
U 1 1 56321923
P 2600 3150
F 0 "#PWR032" H 2600 3000 50  0001 C CNN
F 1 "+5V" H 2600 3290 50  0000 C CNN
F 2 "" H 2600 3150 60  0000 C CNN
F 3 "" H 2600 3150 60  0000 C CNN
	1    2600 3150
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR033
U 1 1 56321990
P 4200 3150
F 0 "#PWR033" H 4200 3000 50  0001 C CNN
F 1 "+3V3" H 4200 3290 50  0000 C CNN
F 2 "" H 4200 3150 60  0000 C CNN
F 3 "" H 4200 3150 60  0000 C CNN
	1    4200 3150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR034
U 1 1 56321A81
P 8300 3150
F 0 "#PWR034" H 8300 3000 50  0001 C CNN
F 1 "+5V" H 8300 3290 50  0000 C CNN
F 2 "" H 8300 3150 60  0000 C CNN
F 3 "" H 8300 3150 60  0000 C CNN
	1    8300 3150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR035
U 1 1 56321AC0
P 8850 3050
F 0 "#PWR035" H 8850 2900 50  0001 C CNN
F 1 "+5V" H 8850 3190 50  0000 C CNN
F 2 "" H 8850 3050 60  0000 C CNN
F 3 "" H 8850 3050 60  0000 C CNN
	1    8850 3050
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR036
U 1 1 56321B1B
P 3800 2050
F 0 "#PWR036" H 3800 1900 50  0001 C CNN
F 1 "+BATT" H 3800 2190 50  0000 C CNN
F 2 "" H 3800 2050 60  0000 C CNN
F 3 "" H 3800 2050 60  0000 C CNN
	1    3800 2050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR037
U 1 1 56321CA6
P 7700 4000
F 0 "#PWR037" H 7700 3850 50  0001 C CNN
F 1 "+5V" H 7700 4140 50  0000 C CNN
F 2 "" H 7700 4000 60  0000 C CNN
F 3 "" H 7700 4000 60  0000 C CNN
	1    7700 4000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR038
U 1 1 56321EB5
P 4750 3050
F 0 "#PWR038" H 4750 2900 50  0001 C CNN
F 1 "+3V3" H 4750 3190 50  0000 C CNN
F 2 "" H 4750 3050 60  0000 C CNN
F 3 "" H 4750 3050 60  0000 C CNN
	1    4750 3050
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR039
U 1 1 56337D38
P 4450 2100
F 0 "#PWR039" H 4450 1950 50  0001 C CNN
F 1 "+BATT" H 4450 2240 50  0000 C CNN
F 2 "" H 4450 2100 60  0000 C CNN
F 3 "" H 4450 2100 60  0000 C CNN
	1    4450 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 56337D6A
P 4800 2300
F 0 "#PWR040" H 4800 2300 30  0001 C CNN
F 1 "GND" H 4800 2230 30  0001 C CNN
F 2 "" H 4800 2300 60  0000 C CNN
F 3 "" H 4800 2300 60  0000 C CNN
	1    4800 2300
	-1   0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG041
U 1 1 56337D91
P 4800 2150
F 0 "#FLG041" H 4800 2245 50  0001 C CNN
F 1 "PWR_FLAG" H 4800 2330 50  0000 C CNN
F 2 "" H 4800 2150 60  0000 C CNN
F 3 "" H 4800 2150 60  0000 C CNN
	1    4800 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2150 4800 2300
$Comp
L PWR_FLAG #FLG042
U 1 1 56337E2D
P 4450 2200
F 0 "#FLG042" H 4450 2295 50  0001 C CNN
F 1 "PWR_FLAG" H 4450 2380 50  0000 C CNN
F 2 "" H 4450 2200 60  0000 C CNN
F 3 "" H 4450 2200 60  0000 C CNN
	1    4450 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 2100 4450 2200
$Comp
L C C20
U 1 1 5649140A
P 6500 3450
F 0 "C20" H 6525 3550 50  0000 L CNN
F 1 "1µ" H 6525 3350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6538 3300 30  0001 C CNN
F 3 "" H 6500 3450 60  0000 C CNN
	1    6500 3450
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 56491592
P 8700 3350
F 0 "C22" H 8725 3450 50  0000 L CNN
F 1 "1µ" H 8725 3250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8738 3200 30  0001 C CNN
F 3 "" H 8700 3350 60  0000 C CNN
	1    8700 3350
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 564915FA
P 9000 3350
F 0 "C23" H 9025 3450 50  0000 L CNN
F 1 "10µ" H 9025 3250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9038 3200 30  0001 C CNN
F 3 "" H 9000 3350 60  0000 C CNN
	1    9000 3350
	1    0    0    -1  
$EndComp
$Comp
L C C19
U 1 1 56491908
P 4900 3350
F 0 "C19" H 4925 3450 50  0000 L CNN
F 1 "10µ" H 4925 3250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4938 3200 30  0001 C CNN
F 3 "" H 4900 3350 60  0000 C CNN
	1    4900 3350
	1    0    0    -1  
$EndComp
$Comp
L C C18
U 1 1 56491994
P 4600 3350
F 0 "C18" H 4625 3450 50  0000 L CNN
F 1 "1µ" H 4625 3250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4638 3200 30  0001 C CNN
F 3 "" H 4600 3350 60  0000 C CNN
	1    4600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3200 6800 3400
Connection ~ 6800 3200
$Comp
L D D7
U 1 1 564A8EB6
P 3600 2100
F 0 "D7" H 3600 2200 50  0000 C CNN
F 1 "S1A" H 3600 2000 50  0001 C CNN
F 2 "Diodes_SMD:SMA_Standard" H 3600 2100 60  0001 C CNN
F 3 "" H 3600 2100 60  0000 C CNN
F 4 "9843868" H 3600 2100 60  0001 C CNN "Farnell"
	1    3600 2100
	-1   0    0    1   
$EndComp
$Comp
L CGA0402MLC-12G D9
U 1 1 564A4108
P 3050 2200
F 0 "D9" H 3150 2100 60  0000 C CNN
F 1 "CGA0402MLC-12G" H 3150 2310 60  0001 C CNN
F 2 "IMU:R0402" H 3050 2200 60  0001 C CNN
F 3 "" H 3050 2200 60  0000 C CNN
F 4 "2368169" H 3050 2200 60  0001 C CNN "Farnell"
	1    3050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2200 3300 2200
Wire Wire Line
	3300 2200 3300 2100
Connection ~ 3300 2100
Connection ~ 2950 2200
Wire Wire Line
	4000 2100 3750 2100
Wire Wire Line
	3800 2050 3800 2100
Connection ~ 3800 2100
$Comp
L F_Small F1
U 1 1 564D00E7
P 7500 4050
F 0 "F1" H 7460 4110 50  0000 L CNN
F 1 "500mA" H 7380 3990 50  0000 L CNN
F 2 "IMU:MC33191" H 7500 4050 60  0001 C CNN
F 3 "" H 7500 4050 60  0000 C CNN
F 4 "1800751" H 7500 4050 60  0001 C CNN "Farnell"
	1    7500 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4050 7400 4050
$EndSCHEMATC
