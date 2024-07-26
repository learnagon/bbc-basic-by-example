   10 REM inspired from nerdle 2022 by     Dai Rees. for Commodore 64 converted to AGON_BBC Basic
   20 CLS : REM Clear screen
   30 MODE 10:VDU 23,1,0 : REM SET MODE AND HIDE CURSOR
   35 COLOUR 2,8:COLOUR 1,11: COLOUR 3: REM Change Base Colours
   40 PRINT "        Press any key to start";
   50 A$=GET$
   60 REM wait on user
   80 dummy=RND(-TIME)
   90 DIM sign(3), a$(15), g$(8),p(8): w=0
   95 CLS : PRINT "      Generating numdle puzzle": GOTO 1160: REM main loop
  100 END
  110 x=RND(99)
  120 y=RND(9)
  130 z=RND(9)
  140 r=RND(3)
  150 IF r = 1 THEN t=x : u=y : x=u : y=t
  160 IF r = 2 THEN t=x : u=z : x=u : z=t
  170 FOR i = 1 TO 2
  180   sign(i)=RND(4):REM 1=/ 2=* 3=+ 4=- BODMAS
  190 NEXT i
  200 IF sign(1)=1 AND sign(2)= 1 THEN ans=x/y/z :GOTO 370
  210 IF sign(1)=1 AND sign(2)= 2 THEN ans=x/y*z :GOTO 370
  220 IF sign(1)=1 AND sign(2)= 3 THEN ans=x/y+z :GOTO 370
  230 IF sign(1)=1 AND sign(2)= 4 THEN ans=x/y-z :GOTO 370
  240 IF sign(1)=2 AND sign(2)= 1 THEN ans=x*y/z :GOTO 370
  250 IF sign(1)=2 AND sign(2)= 2 THEN ans=x*y*z :GOTO 370
  260 IF sign(1)=2 AND sign(2)= 3 THEN ans=x*y+z :GOTO 370
  270 IF sign(1)=2 AND sign(2)= 4 THEN ans=x*y-z :GOTO 370
  280 IF sign(1)=3 AND sign(2)= 1 THEN ans=x+y/z :GOTO 370
  290 IF sign(1)=3 AND sign(2)= 2 THEN ans=x+y*z :GOTO 370
  300 IF sign(1)=3 AND sign(2)= 3 THEN ans=x+y+z :GOTO 370
  310 IF sign(1)=3 AND sign(2)= 4 THEN ans=x+y-z :GOTO 370
  320 IF sign(1)=4 AND sign(2)= 1 THEN ans=x-y/z :GOTO 370
  330 IF sign(1)=4 AND sign(2)= 2 THEN ans=x-y*z :GOTO 370
  340 IF sign(1)=4 AND sign(2)= 3 THEN ans=x-y+z :GOTO 370
  350 IF sign(1)=4 AND sign(2)= 4 THEN ans=x-y-z
  360 REM
  370 IF sign(1)=1 THEN s$="/" :GOTO 410
  380 IF sign(1)=2 THEN s$="*" :GOTO 410
  390 IF sign(1)=3 THEN s$="+" :GOTO 410
  400 IF sign(1)=4 THEN s$="-"
  410 IF sign(2)=1 THEN s1$="/" :GOTO 450
  420 IF sign(2)=2 THEN s1$="*" :GOTO 450
  430 IF sign(2)=3 THEN s1$="+" :GOTO 450
  440 IF sign(2)=4 THEN s1$="-"
  450 ans$=STR$(x)+" "+s$+" "+STR$(y)+" "+s1$+" "+STR$(z)+" = "+STR$(ans)
  460 IF LEN(ans$)=14 AND ans>0 AND ans=INT(ans) THEN 480
  470 GOTO 110
  480 RETURN
  490 x=RND(999)
  500 y=RND(99)
  510 z=RND(4)
  520 IF z=1 THEN ans=x/y : s$="/"
  530 IF z=2 THEN ans=x*y : s$="*"
  540 IF z=3 THEN ans=x+y : s$="+"
  550 IF z=4 THEN ans=x-y : s$="-"
  560 ans$=STR$(x)+" "+s$+" "+STR$(y)+" = "+STR$(ans)
  570 IF LEN(ans$)=12 AND ans>0 AND ans=INT(ans) THEN 600
  580 REM
  590 GOTO 490
  600 RETURN
  610 FOR i = 1 TO LEN(ans$)
  620   a$=MID$(ans$,i,1)
  630   IF a$=" " THEN 660
  640   b=b+1
  650   a$(b)=a$
  660 NEXT i
  670 RETURN
  680 CLS : PRINTTAB(2,1)"Numdle by D.Rees. Guess the sum e.g."
  690 PRINTTAB(23,3)"6 + 7 * 8 = 62"
  700 REM PRINTTAB(2,5)
  710 FOR I = 0 TO 408 STEP 68 :MOVE 75,835-I:DRAW 590,835-I:NEXT I
  720 FOR I = 0 TO 520 STEP 65 :MOVE 75+I,835:DRAW 75+I,430:NEXT I
  770 PRINTTAB(25,5)"Any signs"
  780 PRINTTAB(25,7)"/ * + -"
  790 PRINTTAB(25,9)"Will be used."
  800 PRINTTAB(25,11)"After each"
  810 PRINTTAB(25,13)"Row I will"
  820 PRINTTAB(25,15)"Show correct"
  830 PRINTTAB(25,17)"Numbers,Signs"
  840 PRINTTAB(19,20)"In Sum Wrong Pos ":COLOUR 0: COLOUR 1+128: PRINTTAB(36,20)"8": COLOUR 3: COLOUR 0+128
  850 PRINTTAB(19,23)"In Sum Right Pos ":COLOUR 0: COLOUR 2+128: PRINTTAB(36,23)"=": COLOUR 3: COLOUR 0+128
  860 RETURN
  870 g=og : off=2 : count = 1
  880 REM 
  890 a$=GET$ : IF a$="" THEN 890
  900 IF a$="1" OR a$="2" OR a$="3" OR a$="4" OR a$="5" OR a$="6" THEN 990
  910 IF a$="7" OR a$="8" OR a$="9" OR a$="0" THEN 990
  920 IF a$="/" OR a$="*" OR a$="+" OR a$="-" OR a$="=" THEN 990
  930 IF a$="B" OR a$=CHR$(127) THEN 960
  940 IF a$="c" OR a$="C" THEN CH=CH+1:IF CH=8 THEN PRINTTAB(23,3)ans$"    "
  950 GOTO 890
  960 g = g-off :PRINTTAB(g,o1)" " : count = count-1
  970 IF count < 1 THEN count = 1 : g=og
  980 GOTO 890
  990 g$(count)=a$ : p(count)=g
 1000 a=ASC(a$) 
 1010 PRINTTAB(g,o1)a$ : g=g+off : count=count+1
 1020 IF count <= 8 THEN 890
 1030 RETURN
 1040 FOR i = 1 TO 8:of=0:COLOUR 0: COLOUR 1+128
 1050   FOR q = 1 TO 8
 1060     IF g$(q)=a$(i) THEN PRINTTAB(og+of,o1);g$(q)
 1070     of=of+2:NEXT q 
 1080 NEXT i
 1090 of=0
 1100 FOR i = 1 TO 8:COLOUR 0:COLOUR 2+128
 1110   IF g$(i)=a$(i) THEN w=w+1: PRINTTAB(og+of,o1);g$(i)
 1120   of=of+2:NEXT i
 1125 COLOUR 3: COLOUR 0+128
 1130 IF w=8 THEN COLOUR 2:PRINTTAB(1,25)"Congratulations you win ";ans$ :COLOUR 3:GOTO 1280
 1140 w=0
 1150 RETURN
 1160 c=RND(2) 
 1170 IF c=1 THEN GOSUB 110 : REM generate 2 symbol puzzle
 1180 IF c=2 THEN GOSUB 490 : REM generate 1 symbol puzzle
 1190 GOSUB 610 : REM split generated puzzle into strings
 1200 GOSUB 680 : REM generate playing grid
 1210 og = 3 : o1 = 6
 1220 FOR row= 1 TO 6 
 1230   GOSUB 870 : REM get keyboard input and print in correct pos
 1240   GOSUB 1040 : REM change colours and reverse correct chatacters
 1250   o1=o1+2: CH=0
 1260 NEXT row 
 1270 COLOUR 1:PRINTTAB(1,25)" You lose the answer is ";ans$:COLOUR 3
 1280 CLEAR
 1290 PRINTTAB(1,27)"           Play again Y N"
 1300 b$=GET$ : IF b$="" THEN 1300
 1310 IF b$="y" OR b$="Y" THEN CLS : GOTO 80
 1320 IF b$="n" OR b$="N"THEN CLS :VDU 23,1,1:MODE 0: END
 1330 GOTO 1300
