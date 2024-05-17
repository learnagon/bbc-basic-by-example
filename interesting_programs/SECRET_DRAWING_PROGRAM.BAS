   18 CLG:CLS
   20 REM > SECRET_DRAWING_PROGRAM.BAS
   30 :
   40 REM Try to programatically test the PLOT KEYWORD and codes.
   50 :
   60 FOR code%=0 TO 255:REM to see the effects of all 255 drawing codes
   65   GCOL 0,RND(63): REM foreground graphics colour should be random number
   67   GCOL 0,RND(63)+128: REM background colour should be black (graphics colour)
   70   PLOT code%, RND(code%),RND(code%)
   75   PRINT TAB(0,0)"Code=";code% :REM G=GET
   78   FOR i=0 TO 2500:NEXT i
   79   CLG
   80 NEXT code%
 1000 END
