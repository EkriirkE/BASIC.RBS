DECLARE SUB fr (x!, y!)
DECLARE SUB mset (x!, y!)
DECLARE SUB mline (x!, y!)

'2018-11-25 EkriirkE
'This program was made to figure out the
'vector points to plot on a Sharp PC-1500A

SCREEN 12
PAINT (0, 0), 15
LINE (10, 10)-(220, 220), 11, B


'The following was transcribed as :
'LINE (MSET x, MSET y)-(LINE x, LINE y)-(LINE x, LINE y)...

mset 30, 100
mline 60, 100
mline 58, 50
mline 30, 55
mline 53, 54
mline 56, 98
mline 30, 100

mset 63, 98
mline 61, 53
mline 66, 94
mline 71, 93
mline 63, 98

mset 15, 85
mline 13, 75
mline 13, 70

mset 35, 93
mline 47, 92
mline 50, 90
mline 49, 65
mline 45, 60
mline 20, 62

mset 28, 85
mline 22, 70
mline 34, 85
mline 30, 70
mline 35, 75
mline 36, 70

mset 0, 28
mline 47, 18
mline 55, 35
mline 55, 25
mline 70, 35
mline 49, 10
mline 0, 28

mset 15, 48
mline 50, 42
mline 42, 25
mline 41, 27
mline 4, 35
mline 40, 32
mline 10, 40
mline 40, 38
mline 32, 42
mline 30, 28
mline 35, 40
mline 15, 48


'mset -30, -100
'mline -25, -108
'mline -15, -108
'mline -10, -100
'mline -10, -95
'mline -15, -90
'mline -10, -80
'mline -15, -80
'mline -20, -90
'mline -25, -90
'mline -25, -80
'mline -30, -80

DO: LOOP WHILE INKEY$ = ""

SUB fr (x, y)
OPEN "c:\temp.txt" FOR APPEND AS #1
PRINT #1, "mline "; (x + 110); ","; (110 - y - 120)
CLOSE #1

LINE -(11 + 110 + x, 217 - (110 - y - 120) + 11), 0
END SUB

SUB mline (x, y)
LINE -(x + 11, 217 - y + 11), 0
END SUB

SUB mset (x, y)
     PSET (x + 11, 216 - y + 11)
END SUB

