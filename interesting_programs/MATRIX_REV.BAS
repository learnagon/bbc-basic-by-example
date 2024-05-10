  100 REM Matrix Screen Demo For Agon light
  110 REM Hit ESC while demo is running to exit
  120 ON ERROR PROC_HANDLE_ESC:REM Ignore ESC key until demo is off and running
  130 REPEAT CLS:M% = FN_PROMPT_FOR_MODE(6):UNTIL M% >= 0:MODE M%
  140 W% = FN_GETBYTE_VDP(&13):IF W% > 128 THEN W% = 40:REM Screen width in chars
  150 H% = FN_GETBYTE_VDP(&14):IF H% > 96 THEN H% = 25:REM Screen height in chars
  160 C% = FN_GETBYTE_VDP(&15):IF C% > 64 THEN C% = 16:REM Number of colours
  170 DIM T%(W% - 1), Y%(W% - 1):REM Trail heights, Trail starting Y positions
  180 FOR I% = 0 TO W% - 1
  190   Y%(I%) = RND(H%) - 1:REM Random starting Y position
  200   T%(I%) = RND(H% DIV 2) + H% DIV 4:REM Random trail height
  210 NEXT I%
  220 IF M% <> 7 THEN GRN% = RND(16):IF C% < 16 THEN GRN% = 1:VDU 19, GRN%, 255, &00, &FF, &00:REM RANDOM COLOR GENERATED FROM 0 TO 16
  230 IF M% <> 7 THEN VDU 17, 128, 17, GRN%:REM Background=black, Foreground=green
  240 IF M% <> 7 THEN VDU 23, 255, &FF, &FF, &FF, &FF, &FF, &FF, &FF, &FF:REM Redefine ASCII 224 to solid square
  250 VDU 23, 1, 0;:REM Disable the text cursor
  260 VDU 23, 16, 1;:REM Disable scroll
  270 DONE% = FALSE
  280 ON ERROR PROC_HANDLE_ESC:REM Handle ESC key
  290 REPEAT
  300   Z% = INKEY(1):REM Introduce 1/100 second delay
  310   FOR I% = 0 TO W% - 1
  320     IF RND(1) > .3 THEN PROC_PLOT_CHAR(I%):REM Plot a character 30% of the time
  330   NEXT I%
  340 UNTIL DONE%
  350 PROC_RESTORE
  360 END
  370 :
  380 DEF PROC_PLOT_CHAR(column%)
  390 VDU 31, column%, Y%(column%):IF M% <> 7 THEN VDU 32 + RND(90):ELSE IF column% MOD 2 = 0 THEN VDU 130, 32 + RND(90):REM Plot a random printable ASCII character (between 33 and 122)
  400 Y%(column%) = (Y%(column%) + 1) MOD H%:REM Increment Y position of trail with wrap-around to top of screen
  410 VDU 31, column%, Y%(column%):IF M% <> 7 THEN VDU 255:ELSE IF column% MOD 2 = 0 THEN VDU 146, 255:REM Plot the solid square at the bottom of the trail
  420 VDU 31, column%, (Y%(column%) + T%(column%)) MOD H%:IF M% <> 7 THEN VDU 32:ELSE IF column% MOD 2 > 0 THEN VDU 32:REM Erase topmost character in trail
  430 ENDPROC
  440 :
  450 DEF FN_GETBYTE_VDP(n%):A% = &A0:L% = n%:= USR(&FFF4)
  460 :
  470 DEF FN_PROMPT_FOR_MODE(default%)
  480 LOCAL c$, maxlen%, r$
  490 maxlen% = 3:r$ = ""
  500 PRINT TAB(0, 0)"MODE: "STR$(default%)TAB(LEN(r$) + 6, 0);
  510 REPEAT
  520   c$ = GET$
  530   IF ((c$ = CHR$(127) OR c$ = CHR$(8)) AND LEN(r$) > 0) THEN r$ = LEFT$(r$, LEN(r$) - 1):PRINT CHR$(127);
  540   IF ((c$ >= "0" AND c$ <= "9") AND LEN(r$) < maxlen%) THEN r$ = r$ + c$:PRINT c$;
  550 UNTIL (c$ = CHR$(13) AND LEN(r$) <= maxlen%)
  560 IF LEN(r$) = 0 THEN r$ = STR$(default%)
  570 := VAL(r$)
  580 :
  590 DEF PROC_RESTORE
  600 IF M% <> 7 THEN VDU 23, 255, &70, &00, &3C, &06, &3E, &66, &3E, &00:REM Reset ASCII 224
  610 VDU 23, 1, 1;:REM Enable the text cursor
  620 VDU 23, 16, 0;:REM Enable scroll
  630 VDU 17, 7, 12:REM Foreground = white
  640 PRINT "READY."
  650 ENDPROC
  660 :
  670 DEF PROC_HANDLE_ESC
  680 IF ERR <> 17 THEN COLOUR 7:CLS:REPORT:PRINT" @line #";ERL:STOP
  690 IF ERR = 17 THEN DONE% = TRUE
  700 ENDPROC
