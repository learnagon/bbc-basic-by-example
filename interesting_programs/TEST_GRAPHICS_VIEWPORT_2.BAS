   10 CLS
   20 REM > TEST_GRAPHICS_VIEWPORT_2.BAS
   30 :
   40 REM use VDU 24, left; bottom; right; top; : Set the graphics viewport.
   50 :
   60 GCOL 0,7: REM gray foreground for outline and grid of the viewport
   70 GCOL 0,128: REM black background
   80 CLG : REM clear the graphics screen
   90 VDU 24, 320; 512; 1279; 1023; : REM my tentative Oscilloscope Graphics Window
  100 VDU 23, 23, 4 : REM set line thickness to 4 pixels thick.
  110 PLOT 4, 320, 512: REM set start of line to plot for border of graphics viewport
  120 PLOT 5, 1279, 512: REM draw the bottom border of graphics viewport
  130 PLOT 5, 1279, 1023: REM draw the right border of the graphics viewport
  140 PLOT 5, 320, 1023: REM draw the top border of the graphics viewport
  150 PLOT 5, 320, 512: REM draw the left border of the graphics viewport
  160 :
  170 REM create a grid inside the viewport.
  172 VDU 23, 23, 1 : REM set line thickness to 1 pixel
  175 GCOL 0,7
  180 PLOT 4, 320,768: REM set start of HORIZONTAL CENTRAL grid line
  190 DRAW 1279,768
  200 :
  210 REM create vertical line in middle of viewport
  220 PLOT 4, 799, 512
  230 DRAW 799, 1023
