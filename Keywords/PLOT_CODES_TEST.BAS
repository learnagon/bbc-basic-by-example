   10 CLG:CLS
   15 GCOL 0,2: REM foreground colour should be green (graphics colour)
   17 GCOL 0,128: REM background colour should be black (graphics colour)
   18 CLG
   20 REM > PLOT_CODES_TEST.BAS
   30 :
   40 REM Try to programmatically test the PLOT KEYWORD and codes.
   50 :
   60 FOR code%=0 TO 7
   70   PLOT code%, 50+code%, 50+code%
   80 NEXT code%
   90 FOR code%=8 TO 15
  100   PLOT code%, 70+code%, 70+code%
  110 NEXT code%
  120 FOR code%=16 TO 23
  130   PLOT code%, 90+code%, 90+code%
  140 NEXT code%
  150 FOR code%=72 TO 79
  160   PLOT code%, 200+code%, 200+code%
  170 NEXT code%
 1000 END
