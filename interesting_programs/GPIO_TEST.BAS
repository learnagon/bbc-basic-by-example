   10 REM GPIO_TEST.BAS
   20 REM FROM TIM GILMORE
   30 :
   40 REM DR=DATA REGISTER (PB/PC/PD)
   50 REM DDR=DATA DIRECTION REGISTER (BIT INPUT/OUTPUT)
   60 REM ALT1=PORT ALTERNATIVE REGISTER 1
   70 REM ALT2=PORT ALTERNATIVE REGISTER 2
   80 :
   90 REM PA PORT (&96,&97,&98,&99) ARE NOT ACCESSIBLE
  100 :
  150 :
  200 PB_DR%=&9A:REM &9A=154 DECIMAL
  210 PB_DDR%=&9B
  220 PB_ALT1%=&9C
  230 PB_ALT2%=&9D
  240 :
  245 :
  250 PC_DR%=&9E:REM &9E=158 DECIMAL
  260 PC_DDR%=&9F
  270 PC_ALT1%=&A0
  280 PC_ALT2%=&A1
  290 :
  295 :
  300 PD_DR%=&A2:REM &A2=162 DECIMAL
  310 PD_DDR%=&A3
  320 PD_ALT1%=&A4
  330 PD_ALT2%=&A5
  340 :
  345 :
  350 REM ACCESSIBLE GPIO PORT PINS:
  360 REM -------------------------
  370 REM GPIO_PB5 : REM -> PIN 26
  380 REM GPIO_PC0 : REM -> PIN 17
  390 REM GPIO_PC1 : REM -> PIN 18
  400 REM GPIO_PC2 : REM -> PIN 19
  410 REM GPIO_PC3 : REM -> PIN 20
  420 REM GPIO_PC4 : REM -> PIN 21
  430 REM GPIO_PC5 : REM -> PIN 22
  440 REM GPIO_PC6 : REM -> PIN 23
  450 REM GPIO_PC7 : REM -> PIN 24
  460 REM GPIO_PD4 : REM -> PIN 13
  470 REM GPIO_PD5 : REM -> PIN 14
  480 REM GPIO_PD6 : REM -> PIN 15
  490 REM GPIO_PD7 : REM -> PIN 16
  495 :
  497 :
  500 REM EXAMPLE GPIO_PB5 AS AN OUTPUT (I.E. RESISTER & LED)
  510 PUT PB_DDR%, &DF : REM -> (1101 1111)
  520 PUT PB_DR%, 1    : REM -> HIGH OUTPUT
  530 PUT PB_DR%, 0    : REM -> LOW OUTPUT
  540 :
  545 :
  550 REM EXAMPLE GPIO_PB5 AS AN INPUT (I.E. SWITCH)
  560 REM PB_DDR%, &20     : REM -> (0010 0000)? OR POSSIBLY (1111 1111)=&FF ?
  570 REM GET PB_DR%, 1    : REM -> HIGH INPUT FROM PIN
  580 REM GET PB_DR%, 0    : REM -> LOW INPUT FROM PIN
  590 :
  595 :
  600 REM EXAMPLE SET ALL GPIO ON PORT C TO OUTPUT
  610 REM PROCres_gpio(PC_DDR%, &FF)
  620 REM PROCres_gpio(PC_ALT1%, &FF)
  630 REM PROCres_gpio(PC_ALT2%, &FF)
  640 :
  645 :
  700 REM LOOP, OUTPUTTING THE BYTE VALUES 0-255 TO PORT C
  705 REM USE RESISTORS AND LEDs IN SERIES BETWEEN PINS AND +3.3VDC
  710 REM FOR I%=0 TO 255
  720 REM PUT PC_DR%, I%
  730 REM FOR J%=0 TO 1000 : REM -> DELAY TO SLOW IT DOWN
  740 REM NEXT
  750 REM NEXT
  760 REM GOTO 700
  770 REM STOP
  800 :
  810 :
 2000 REM SET BITS V% IN GPIO PORT R%
 2010 DEF PROCset_gpio(%R, V%)
 2020 A%
 2030 A%=GET(R%)
 2040 A%=A% OR V%
 2050 PUT R%, A%
 2060 ENDPROC
 2070 :
 2080 :
 2100 REM RESET BITS V% IN GPIO PORT R%
 2110 DEF PROCres_gpio(R%, V%)
 2120 LOCAL A%
 2130 A%=GET(R%)
 2140 A%=A% AND (V% EOR &FF)
 2150 PUT R%, A%
 2160 ENDPROC
