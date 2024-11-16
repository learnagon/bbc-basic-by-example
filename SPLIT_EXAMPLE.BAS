    2 CLS
    5 REM @rtrussellcouk 2024-11-15
    7 REM Splitting a string at the first space after the middle.
   10 text$ = "This is a positive affirmation of the day: I am proud of who I am!"
   15 PRINT 'text$'
   20 split = INSTR(text$, " ", LEN(text$)/2)
   30 PRINT LEFT$(text$, split)
   40 PRINT MID$(text$, split + 1)
   50 END
