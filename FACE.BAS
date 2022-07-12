100 REM BASIC Month 7: Make-a-Face
110 REM Erik Johnson - EkriirkE
120 REM 2022-07-12

200 WIDTH 40: CLS
210 PRINT "Use arrows to move the cursor."
211 PRINT "WASD to move/swap the block."
212 PRINT "f/F to flip block face."
213 PRINT "r to reset board, R to randomize board"
214 PRINT "n to pick a new block"

220 FX = 10: FY = 10
230 CX = 2: CY = 2
240 CC = 0
250 READ C$(CC)
260 IF C$(CC) <> "" THEN CC = CC + 1: GOTO 250
270 FOR Y = 0 TO 4: FOR X = 0 TO 4
280 READ F(X, Y), B(X, Y)
290 NEXT X, Y

300 COLOR 15, 0: GOSUB 600
310 FOR Y = 0 TO 4: FOR X = 0 TO 4
320 LOCATE FY + Y, FX + X
330 COLOR INT((F(X, Y) - 2 AND 8) / 8) * 6, SGN(F(X, Y)) + 6
340 PRINT MID$(C$(B(X, Y)), F(X, Y) + 1, 1);
350 NEXT X, Y
360 K$ = RIGHT$(INKEY$, 1)
370 IF K$ = "" GOTO 360
380 IF K$ = CHR$(27) OR K$ = "q" THEN SYSTEM
390 COLOR 0, 0: GOSUB 600
400 IF INSTR("wasd", K$) THEN MX = CX: MY = CY ELSE MX = -1
410 IF K$ = "a" OR K$ = "K" THEN CX = CX - 1
420 IF K$ = "s" OR K$ = "P" THEN CY = CY + 1
430 IF K$ = "d" OR K$ = "M" THEN CX = CX + 1
440 IF K$ = "w" OR K$ = "H" THEN CY = CY - 1
450 IF K$ = "R" THEN GOSUB 700
460 IF K$ = "r" THEN GOSUB 750
470 IF K$ = "n" THEN B(CX, CY) = (B(CX, CY) + 1) MOD CC
480 IF K$ = "f" OR K$ = " " THEN F(CX, CY) = F(CX, CY) + 1
490 IF K$ = "F" THEN F(CX, CY) = F(CX, CY) - 1
500 CX = (CX + 5) MOD 5: CY = (CY + 5) MOD 5
510 F(CX, CY) = (F(CX, CY) + 18) MOD 18
520 IF MX >= 0 THEN X = F(CX, CY): Y = B(CX, CY): F(CX, CY) = F(MX, MY): B(CX, CY) = B(MX, MY): F(MX, MY) = X: B(MX, MY) = Y
530 GOTO 300

600 LOCATE FY + CY, FX - 1: PRINT "|";
610 LOCATE FY + CY, FX + 5: PRINT "|";
620 LOCATE FY - 1, FX + CX: PRINT "-";
630 LOCATE FY + 5, FX + CX: PRINT "-";
640 RETURN

700 FOR Y = 0 TO 5: FOR X = 0 TO 5
710 F(X, Y) = INT(RND * 17): B(X, Y) = INT(RND * CC)
720 NEXT X, Y
730 RETURN

750 FOR Y = 0 TO 5: FOR X = 0 TO 5
760 F(X, Y) = 1
770 NEXT X, Y
780 RETURN

900 REM 6-Sides are 1=solid, 2=blank, then 4 rotations each: 3=black, 4=black, 5=coloured, 6=coloured
910 DATA "  .,`*OoOo.,`*OoOo"
920 DATA "  /\/\<V>^/\/\<V>^"
930 DATA "  (U)nHTHI(U)nHTHI"
940 DATA "  -|-|[_]~-|-|[_]~"
999 DATA ""

1000 REM Initial face; Face#, Block#, ...
1010 DATA 12,1,12,1,13,1,13,1,13,1
1020 DATA 0,1,9,0,1,0,9,0,0,1
1030 DATA 12,1,1,0,2,2,1,0,13,1
1040 DATA 1,0,3,1,7,3,2,1,1,0
1050 DATA 1,0,4,2,1,0,2,2,1,0

