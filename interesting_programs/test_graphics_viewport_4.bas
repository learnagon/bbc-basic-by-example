   10 CLS
   20 REM > TEST_GRAPHICS_VIEWPORT_4.BAS
   30 :
   40 REM use VDU 24, left; bottom; right; top; : Set the graphics viewport.
   50 :
   60 GCOL 0,7: REM gray foreground for outline and grid of the viewport
   70 GCOL 0,128: REM black background
   80 CLG : REM clear the graphics screen
   90 VDU 24, 319; 470; 1279; 990; : REM my tentative Oscilloscope Graphics Window
  100 VDU 23, 23, 4 : REM set line thickness to 4 pixels thick.
  110 PLOT 4, 319, 470: REM set start of line to plot for border of graphics viewport
  120 PLOT 5, 1279, 470: REM draw the bottom border of graphics viewport
  130 PLOT 5, 1279, 990: REM draw the right border of the graphics viewport
  140 PLOT 5, 319, 990: REM draw the top border of the graphics viewport
  150 PLOT 5, 319, 470: REM draw the left border of the graphics viewport
  160 :
  170 REM create a grid inside the viewport.
  172 VDU 23, 23, 1 : REM set line thickness to 1 pixel
  175 GCOL 0,7
  180 PLOT 4, 319, 730: REM set start of HORIZONTAL CENTRAL grid line
  190 DRAW 1279,730
  200 :
  210 REM create vertical line in middle of viewport
  220 PLOT 4, 799, 470
  230 DRAW 799, 1023
  235 :
  245 REM create horizontal grid for volts measurement
  247 Y%=470
  249 FOR i=1 TO 8
  250   PLOT 4,319,Y%
  260   DRAW 1279, Y%
  265   Y%=Y%+64
  270 NEXT i
  280 :
  290 REM create vertical grid for milliseconds measurement
  300 X%=319
  310 FOR i=1 TO 6
  320   PLOT 4, X%, 470
  330   DRAW X%, 990
  340   X%=X%+160
  350 NEXT i
  365 COLOUR2:PRINT TAB(18,0)"4"
  370 PRINT TAB(18,2)"3"
  375 PRINT TAB(18,4)"2"
  380 PRINT TAB(18,6)"1"
  385 PRINT TAB(18,8)"0"
  390 REM Need to explore how to use PLOT 4 and VDU 5 to write characters at the current graphics cursor...to be continued!
