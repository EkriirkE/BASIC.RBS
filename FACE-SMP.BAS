100 REM BASIC Month 7: Make-a-Face
110 REM Erik Johnson - EkriirkE
120 REM 2022-07-11

200 WIDTH 40: CLS
210 LOCATE 3, 5: PRINT "Use arrows to move the cursor."
220 LOCATE 4, 5: PRINT "WASD to move/swap the block."
230 LOCATE 5, 5: PRINT "f/F to flip block face."
240 C$ = " @#&*~(){}[]\/<>-_|XOo.:"
250 FX = 10: FY = 10
260 CX = 2: CY = 2
270 FOR Y = 0 TO 4: FOR X = 0 TO 4
280 READ F(X, Y)
290 NEXT X, Y

300 COLOR 15, 0: GOSUB 600
310 COLOR 0, 7
320 FOR Y = 0 TO 4: FOR X = 0 TO 4
330 LOCATE FY + Y, FX + X: PRINT MID$(C$, F(X, Y) + 1, 1);
340 NEXT X, Y
350 K$ = RIGHT$(INKEY$, 1)
360 IF K$ = "" GOTO 350
370 IF K$ = CHR$(27) OR K$ = "q" THEN SYSTEM
380 COLOR 0, 0: GOSUB 600
390 IF INSTR("wasd", K$) THEN MX = CX: MY = CY ELSE MX = -1
400 IF K$ = "a" OR K$ = "K" THEN CX = CX - 1: IF CX < 0 THEN CX = 0
410 IF K$ = "s" OR K$ = "P" THEN CY = CY + 1: IF CY > 4 THEN CY = 4
420 IF K$ = "d" OR K$ = "M" THEN CX = CX + 1: IF CX > 4 THEN CX = 4
430 IF K$ = "w" OR K$ = "H" THEN CY = CY - 1: IF CY < 0 THEN CY = 0
440 IF K$ = "f" OR K$ = " " THEN F(CX, CY) = F(CX, CY) + 1
450 IF K$ = "F" THEN F(CX, CY) = F(CX, CY) - 1
460 F(CX, CY) = (F(CX, CY) + LEN(C$)) MOD LEN(C$)
470 IF MX >= 0 THEN X = F(CX, CY): F(CX, CY) = F(MX, MY): F(MX, MY) = X
480 GOTO 300

600 LOCATE FY + CY, FX - 1: PRINT "|";
610 LOCATE FY + CY, FX + 5: PRINT "|";
620 LOCATE FY - 1, FX + CX: PRINT "-";
630 LOCATE FY + 5, FX + CX: PRINT "-";
640 RETURN

1000 DATA 13,13,12,12,12
1010 DATA 13,4,0,4,12
1020 DATA 1,0,7,0,1
1030 DATA 0,12,17,13,0
1040 DATA 0,7,0,6,0

