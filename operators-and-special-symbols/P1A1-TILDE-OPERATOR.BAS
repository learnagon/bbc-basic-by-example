10 REM > P1A1-TILDE-OPERATOR.BAS
15 CLS: REM Clear the screen
20 REM OPERATORS EXPLAINED BY EXAMPLE
25 :
30 REM *** TILDE '~' OPERATOR ***
35 :
40 REM A character in the start of a print field indicating that the item is to be printed in hexadecimal. Also used with STR$ to cause conversion to a hexadecimal string.
45 :
50 PRINT ~15: REM print the hexadecimal number of the decimal value 15, it should output F.
60 :
70 decimal_number% = 15 : REM This decimal number (integer) 15 is equal to 'F' in hexadecimal format
75 PRINT "Decimal number: ";decimal_number%;" is equal to hexadecimal value: "; ~decimal_number%
80 PRINT
90 PRINT "Now we will display the use of STR$~(decimal_number%)"
100 PRINT
110 PR. "Decimal number: ";decimal_number%;" is equal to the string (hexadecimal value): "; STR$~(decimal_number%)
120 END


