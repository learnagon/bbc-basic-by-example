   10 CLG:CLS
   15 GCOL 0,2: REM foreground colour should be green (graphics colour)
   17 GCOL 0,128: REM background colour should be black (graphics colour)
   18 CLG
   20 REM > PLOT_CODES_TEST.BAS
   30 :
   40 REM Try to programatically test the PLOT KEYWORD and codes.
   50 :
   60 FOR code%=0 TO 255
   70   PLOT code%, 10+code%, 10+code%
   75   PRINT TAB(0,0)"Code=";code% :G=GET
   80 NEXT code%
   90 REM FOR code%=8 TO 15
  100 REM   PLOT code%, 70+code%, 70+code%
  110 REM NEXT code%
  120 REM FOR code%=16 TO 23
  130 REM  PLOT code%, 90+code%, 90+code%
  140 REM NEXT code%
  150 REM FOR code%=72 TO 79
  160 REM  PLOT code%, 200+code%, 200+code%
  170 REM NEXT code%
 1000 END
