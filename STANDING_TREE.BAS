    1 REM TREE
    2 REM Sourced from
    3 REM https://youtu.be/EQrnlK37Qho?si=2tOtH_Lpx6kiC4mq&t=372
    4 REM Uncomment line 125 for colour version
    5 :
   10 REM ------------RECURSIVE TREE------------
   20 REM    BY ANDY FANDANGO @PIXEL_FANDANGO
   30 :
   40 MODE 8
   50 TIME=0
   60 MOVE 500, 0
   70 PROC_DrawTree(7,300,500,0,100)
   80 @%=&0002020A
   90 PRINT "TIME TAKEN: "; TIME/100
  100 @%=0
  110 END
  115 :
  120 DEF PROC_DrawTree(i,x,y,a,l)
  125 GCOL 0,i
  130 da=0.4
  140 DRAW y,x
  150 IF i=0 ENDPROC
  160 PROC_DrawTree(i-1,x+l*COS(a-da),y+l*SIN(a-da),a-da,l*.9)
  170 MOVE y, x
  180 PROC_DrawTree(i-1,x+l*COS(a+da),y+l*SIN(a+da),a+da,l*.9)
  190 ENDPROC
