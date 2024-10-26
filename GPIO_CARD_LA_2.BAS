    5 MODE 0
   10 REM first thoughts GPIO outline example: use at your own risk
   20 :
   50 REM First uncomment one of the next two line
   60 contactvalue=0 :REM use pull-up resistors
   70 REM contactvalue=1 :REM use pull-down resistors
   80 REM then whichever polarity you choose to use, the rest of the code is the same
   90 :
  102 REM Set GPIO register values etc.
  105 PC_DR =&9E : REM Address of VDP controlled copy of eZ80 Port C Data Register,
  106 : REM   reflecting the state of AGON GPIO pins 17-24
  200 PC_DDR=&9F : REM Address of VDP controlled copy of eZ80 Port C Data Direction Register,
  210 : REM   reflecting the function of AGON GPIO pins 17-24
  300 :
  320 REM Define port C pins 0-3 as inputs, 4-7 as outputs.
  325 REM Outputs not currently used.
  340 max_ip_pin=3 : REM starts at 0 so number of pins equals max_ip_pin+1;"
  350 pin_functions=0 :REM default state is all pins as outputs.
  360 FOR i= 0 TO max_ip_pin
  370   pin_functions=pin_functions+2^i
  380 NEXT:
  385 PRINT"No. of inputs = ";max_ip_pin+1;" so control value = &";~pin_functions;" = %";:PROCshow_binary_byte(pin_functions)
  390 PUT PC_DDR, pin_functions
  400 :
  410 CLS :PROCdisplay_card :REM Start with a blank template
  420 :
  450 no_of_ip_bits=7 :REM Allow reading of 8 bits (7..0) for a whole byte.
  500 data_value=0    :REM initialise input value counter 
  600 :
  650 REM loop though all inputs (MSB to LSB)
  700 FOR bit_counter= no_of_ip_bits TO 0 STEP -1 
  800   :
  810   REPEAT :REM Wait for the clock key to be pressed.
  820     PROCreadpins
  825     REM CLOCK_button_pressed=TRUE : REM *** REMOVE IF USING ACTUAL AGON HARDWARE!!! 
  830   UNTIL CLOCK_button_pressed=TRUE
  840   :
  850   REM assumes the data contact (if any) is stable before the clock contact ends
  860   :
  870   REPEAT :REM Wait for the clock key to be released.
  880     PROCreadpins
  885     REM CLOCK_button_pressed=FALSE : REM *** REMOVE IF USING ACTUAL AGON HARDWARE!!! 
  890   UNTIL CLOCK_button_pressed=FALSE
  895   :
  898   REM DAT_button_pressed=TRUE : REM *** REMOVE IF USING ACTUAL AGON HARDWARE!!! 
  899   :
  900   IF DAT_button_pressed=TRUE THEN data_value = data_value +2^bit_counter
  910   PRINT TAB(0,cardtop+12);
  920   PRINT "Bit# ";bit_counter,"  SubTotal = ";data_value;" = %";:PROCshow_binary_byte(data_value)
  925   :
  930   IF DAT_button_pressed=TRUE THEN bit_value = 1 ELSE bit_value = 0
  933   PROCupdate_card(bit_counter,bit_value) :REM fill in vertical info for the data bit just read.
  935   REM PRINT TAB(0,cardtop+14);" PRESS A KEY...";
  936   REM G=GET
  937   PRINT TAB(0,cardtop+12);STRING$(44," ")
  940 NEXT bit_counter :REM get next bit
  950 :
  960 PRINT '"Total value = ";data_value;" = &"~data_value;" = %";:PROCshow_binary_byte(data_value)
  965 PRINT "Character = ";C$
  970 :
  980 END
  990 :
 1000 DEF PROCreadpins
 1010 REM Read GPIO input pins **DEBOUNCE compensation (hopefully) incorporated**.
 1020 stability_count=0
 1030 portc_in = GET(PC_DR) AND 3
 1035 REM portc_old = portc_in
 1040 :
 1045 GOTO 1150 :REM Ignore debounce code for now.
 1050 REPEAT
 1060   portc_in = GET(PC_DR) AND 3
 1070   IF portc_in = portc_old
 1080   THEN 
 1090   stability_count=stability_count+1
 1100   ELSE
 1110   stability_count=0
 1120   portc_old = GET(PC_DR) AND 3
 1130   ENDIF
 1140 UNTIL stability_count>10
 1150 :
 1160 IF (portc_in AND 1)  =contactvalue THEN CLOCK_button_pressed=TRUE ELSE CLOCK_button_pressed=FALSE
 1170 IF (portc_in AND 2)/2=contactvalue THEN  DAT_button_pressed=TRUE ELSE  DAT_button_pressed=FALSE 
 1180 ENDPROC
 1190 :
 1200 DEF PROCshow_binary_byte(byte)
 1210 FOR bit=7 TO 0 STEP -1
 1220   IF (byte AND 2^bit)=0 THEN PRINT "0"; ELSE PRINT"1";
 1230 NEXT
 1240 PRINT 
 1250 ENDPROC
 1299 :
 1300 DEF PROCdisplay_card
 1310 REM Use VDU Draw a filled rectangle commands to depict card
 1314 REM Use VDU Draw a filled circle commands to depict holes
 1315 REM Use UDG chars forlarge ASCII Char
 1320 REM or for now ...
 1325 REM draw card outline
 1330 cardtop=5:margin=3
 1340 PRINT TAB(0,cardtop);
 1350 PRINT STRING$(margin," ");"+";STRING$(40,"-");"+"
 1360 FOR line=1 TO 10
 1370   PRINT STRING$(margin," ");"|";STRING$(40," ");"|"
 1380 NEXT
 1390 PRINT STRING$(margin," ");"+";STRING$(40,"-");"+"
 1395 REM Add card text
 1400 margin=margin+2
 1410 PRINT TAB(margin+3,cardtop+2);"Dec: ???                Char: ??"
 1420 PRINT TAB(margin+3,cardtop+3);"Hex: &??                        "
 1430 PRINT TAB(margin,cardtop+5);"[ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]   Bits"
 1440 PRINT TAB(margin,cardtop+6);" 7   6   5   4   3   2   1   0    Bits"
 1450 PRINT TAB(margin,cardtop+8);" O   O   O   O   O   O   O   O    Data"
 1460 PRINT TAB(margin,cardtop+9);"O   O   O   O   O   O   O   O    Clock"
 1500 PRINT TAB(0,cardtop+15); :REM Position cursor below card in case of error or user exits.
 3000 ENDPROC
 3500 :
 4000 DEF PROCupdate_card(bitcolumn,digit)
 4001 REM relies on variable values left over from previous usage. = Bad practice :)
 4500 REM Fill in 1 vertical bit column
 4510 PRINT TAB(margin+1+(4*(7-bitcolumn)),cardtop+5);digit
 4550 REM Fill in clock/data holes using VDU circle draw commands
 4560 REM (needs writing when layout approved)
 4600 REM IF bitcolumn>0 THEN GOTO 4700 :REM The dreaded GOTO !! More bad practice lol.
 4605 REM FILL IN REMAINING Numeric/character values on card
 4610 PRINT TAB(margin+8,cardtop+2);data_value;"   "
 4611 PRINT TAB(margin+9,cardtop+3);~data_value;"   "
 4612 IF data_value >32 THEN C$=CHR$(data_value) ELSE C$="#":REM AND data_value <127 THEN C$=CHR$(data_value) ELSE C$="#"
 4613 DBLH$=CHR$(141):YEL$=CHR$(131)
 4615 PRINT TAB(margin+31,cardtop+2)DBLH$;YEL$;C$;"    "
 4616 PRINT TAB(margin+31,cardtop+3);DBLH$;YEL$;C$;"    "
 4700 :
 5000 ENDPROC
