   10 CLS
   20 REM > TEST_GRAPHICS_VIEWPORT.BAS
   30 :
   40 REM use VDU 24, left; bottom; right; top; : Set the graphics viewport.
   50 :
   60 GCOL 0,3: REM yellow foreground
   70 GCOL 0,128: REM black background
   80 CLG : REM clear the graphics screen
   90 VDU 24, 320; 512; 1279; 1023; : REM my tentative Oscilloscope Graphics Window
  100 VDU 23, 23, 4 : REM set line thickness to 4 pixels thick.
  110 PLOT 4, 320, 512: REM set start of line to plot for border of graphics viewport
  120 PLOT 5, 1279, 512: REM draw the bottom border of graphics viewport
  130 PLOT 5, 1279, 1023: REM draw the right border of the graphics viewport
  140 PLOT 5, 320, 1023: REM draw the top border of the graphics viewport
  150 PLOT 5, 320, 512: REM draw the left border of the graphics viewport
