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
 1000 END
