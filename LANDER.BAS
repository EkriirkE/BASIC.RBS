100 REM BASIC Month 4: Lunar Corps
110 REM http://reddit.com/r/RetroBattlestations
120 REM Based on the original by FozzTexx
130 REM Rewritten by EkriirkE
140 REM Today is 2019-07-15

200 REM Clear screen and setup variables
210 CLS : RANDOMIZE TIMER
220 COLS = 80: ROWS = 24
230 ITER = 10

300 GOSUB 2510
310 YS = SQR(LY) / ITER
320 XV = RND(1) / ITER: YV = 0
330 X = 1: Y = 1
340 FUEL = 100

350 SP$ = "NASA has determined the only landing position is on the X"
360 GOSUB 1210
370 LOCATE LY + 1, LX + 1: COLOR 2: PRINT "X"
380 WHILE INKEY$ = "": GOSUB 2700: WEND
390 LOCATE ROWS / 2: PRINT SPACE$(COLS)

400 LE$ = SPACE$(9)
410 LM$ = "(I)/T\"
420 IF ABS(TD) = 1 AND X >= 2 AND X < COLS - 2 AND Y > 1 THEN LOCATE INT(Y) + 1, INT(X) - 1: PRINT "     ";
430 SP$ = LE$: GOSUB 1510
440 YV = YV + 1 / (ITER * ITER)
450 X = X + XV: Y = Y + YV: FUEL = FUEL - 1 / ITER
460 GOSUB 5010
470 IF ABS(Y - YY) > 2 THEN YY = Y: SOUND 200, .5: SOUND 2000, 1
480 IF FUEL < 20 THEN SOUND 80, .2 ELSE SOUND 40, .1
490 IF K > 32 AND TD <> 0 THEN FOR J = 0 TO 5: SOUND 2000, .1: SOUND 200, .1: NEXT
500 SP$ = LM$: IF TIMER - UT < 1 THEN GOSUB 3010 ELSE TD = 0
510 GOSUB 1510
520 J = TIMER: WHILE TIMER - J < 1 / ITER: WEND
530 IF (YV * ITER < -5 AND Y < 0) OR Y < -10 OR X < -5 OR X > COLS + 5 GOTO 690
540 IF Y < LY GOTO 420
550 SP$ = LE$: GOSUB 1510
560 SP$ = LM$: GOSUB 1510
570 IF INT(Y) = LY AND INT(X) = LX AND INT(YV * ITER) < 4 GOTO 610 ELSE GOTO 710

600 REM Draw flag, start anthem
610 LOCATE ROWS - 4, COLS / 2: COLOR 15, 1: PRINT "**"; : COLOR , 4: PRINT "==="
620 LOCATE ROWS - 3, COLS / 2: COLOR , 4: PRINT "====="
630 LOCATE ROWS - 2, COLS / 2: COLOR , 0: PRINT "| "
640 COLOR 10: SP$ = "The Eagle has landed": PLAY "l5gl15el5ceg>c"
650 GOTO 730

680 REM Too far out of frame
690 COLOR 12: LOCATE ROWS / 2, (COLS - 30) / 2: PRINT "~ The Eagle is "; : PLAY "l30efp15ee-p15efp15ee-": PRINT "LOST IN SPACE ~"
700 END

705 REM Loser, start taps
710 COLOR 12: SP$ = "! The Eagle has crashed !": PLAY "l10c..cl1f"
730 GOSUB 1210


999 COLOR 7: END

1200 REM Centre a message
1210 LOCATE ROWS / 2, (COLS - LEN(SP$)) / 2: PRINT SP$
1220 RETURN

1500 REM EkriirkE's Draw sprite in SP$ at X, Y
1510 IF Y < 1 OR Y > ROWS OR X < 1 OR X > COLS THEN RETURN
1520 FOR J = 1 TO LEN(SP$) STEP 3
1530 COLOR INT(16 - J / 2): LOCATE INT(Y + J / 3), INT(X): PRINT MID$(SP$, J, 3);
1540 NEXT
1550 RETURN

2500 REM EkriirkE's Draw lunar surface, choose landing pad
2510 DEEP = 4: WIDE = 3: COLOR 7
2520 Y = INT(RND(1) * DEEP) + 1: PC = 0: LX = 0
2530 FOR I = 1 TO COLS
2540 OY = Y
2550 IF PC = 0 THEN Y = Y + SGN(INT(RND(1) * 7 - 3))
2560 IF Y < 1 THEN Y = 1
2570 IF Y > DEEP THEN Y = DEEP
2580 IF LI + 1 = I AND Y = OY THEN GOTO 2550
2590 IF Y > OY THEN LOCATE ROWS - Y + 1: PRINT "/";  ELSE LOCATE ROWS - Y
2600 IF Y < OY THEN PRINT "\";
2610 IF Y = OY THEN PRINT "_"; : PC = PC + 1: IF PC >= WIDE THEN PC = 0: LI = I: IF LX = 0 OR RND(1) > .8 THEN LX = I - INT(WIDE / 2 + .5): LY = ROWS - Y - 1
2620 GOSUB 2700
2630 NEXT
2640 IF LX = 0 THEN LX = COLS / 1.5
2650 RETURN
2700 J = TIMER: WHILE TIMER - J < .05: WEND
2710 SOUND 40, .05
2720 RETURN


3000 REM Animate thrusters
3010 FC = FC + 1: IF FC > 3 THEN FC = 1
3020 IF TD = -2 THEN SP$ = LM$ + " " + MID$("VW^", FC, 1) + " "
3030 IF INT(X) < 2 OR INT(X) >= COLS - 4 OR Y < 1 THEN RETURN
3040 IF TD = 1 THEN LOCATE INT(Y) + 1, INT(X) - 1: COLOR 8: PRINT MID$(">=-", FC, 1)
3050 IF TD = -1 THEN LOCATE INT(Y) + 1, INT(X) + 3: COLOR 8: PRINT MID$("<=-", FC, 1)
3060 RETURN

5000 REM Read keyboard, update HUD
5010 IF FUEL THEN K = ASC(RIGHT$(" " + INKEY$, 1)) OR 32
5020 IF K = 27 THEN END
5030 IF FUEL < 1 THEN K = 0
5040 IF K = 97 OR K = 107 THEN XV = XV - .1: TD = -1
5050 IF K = 100 OR K = 109 THEN XV = XV + .1: TD = 1
5060 IF K = 119 OR K = 104 THEN YV = YV - .1: TD = -2
5070 REM IF K = 115 OR K = 112 THEN YV = YV + .1        TD=2
5080 IF K > 32 THEN FUEL = FUEL - 1: UT = TIMER
5090 IF TIMER - UT < 3 THEN FUEL = FUEL - .2
5100 IF FUEL < 0 THEN FUEL = 0

5120 COLOR 7: LOCATE 1, COLS - 4: PRINT "FUEL": LOCATE 4, COLS - 7: PRINT "DESCENT"
5130 LOCATE 2, COLS - 4: COLOR 7 - (INT(FUEL / 34) + 3): PRINT INT(FUEL)
5140 IF YV * ITER > 4 THEN COLOR 4 ELSE COLOR 2
5150 LOCATE 5, COLS - 4: PRINT CHR$(18) + STR$(INT(YV * ITER * 2)) + " "
5160 REM COLOR 7: LOCATE , COLS - 4: PRINT "=" + STR$(INT(XV * ITER)) + " "
5170 LOCATE 1, 1: COLOR 7: PRINT "MISSION TIME"; TIMER
5180 RETURN
