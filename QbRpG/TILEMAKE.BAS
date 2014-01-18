PRINT "RPGTILE Desighner Version 1.2"
PRINT "SoFtShoE 20x20 Tile Desighner For RPGTILE Engine"
INPUT ">PRESS ENTER TO CONTINUE<", pooooooopp$
PRINT "Loading..."
SCREEN 13
DIM matrix(1 TO 20, 1 TO 20)
PSET (0, 0), 10: DRAW "r21d21l21u21"
col = 1
x = 1
y = 1

DO
PSET (0, 0), 10: DRAW "r21d21l21u21"
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN Arw$ = "M": GOSUB drawpix
IF a$ = CHR$(0) + "P" THEN Arw$ = "P": GOSUB drawpix
IF a$ = CHR$(0) + "K" THEN Arw$ = "K": GOSUB drawpix
IF a$ = CHR$(0) + "H" THEN Arw$ = "H": GOSUB drawpix
IF UCASE$(a$) = "." THEN col = col + 1
IF UCASE$(a$) = "," THEN col = col - 1
IF UCASE$(a$) = "F" THEN pnt = 0
IF UCASE$(a$) = "D" THEN pnt = 1
IF UCASE$(a$) = "S" THEN CLS : GOSUB Save
IF UCASE$(a$) = "L" THEN CLS : GOSUB Load
IF UCASE$(a$) = "Q" THEN END
IF UCASE$(a$) = "B" THEN GOSUB DrawBug
LOCATE 20, 1: PRINT "X:"; x; "Y:"; y;
COLOR col: PRINT col
LOOP

drawpix:
IF pnt = 0 THEN PSET (x, y), 0
IF Arw$ = "M" THEN x = x + 1
IF Arw$ = "P" THEN y = y + 1
IF Arw$ = "K" THEN x = x - 1
IF Arw$ = "H" THEN y = y - 1
IF pnt = 1 THEN matrix(x, y) = col
PSET (x, y), col
RETURN

ChooseColor:
LOCATE 9, 1
DO UNTIL c = 15
c = c + 1
COLOR c
PRINT c;
LOOP
LOCATE 11, 1: INPUT "What Color?>", col
RETURN



Save:
SCREEN 12
INPUT "Save As?(.mtx)-I'll Add>", file$
file$ = file$ + ".mtx"
OPEN file$ FOR OUTPUT AS #1
ya = 1
xa = 1
PRINT #1, matrix(1, 1)
DO
xa = xa + 1
IF xa = 21 THEN ya = ya + 1: xa = 1
IF ya = 21 THEN BEEP: CLOSE #1: GOTO DoneSav
c = matrix(xa, ya)
PSET (xa, ya), c
del = del + 1
PRINT #1, matrix(xa, ya)
LOOP
CLOSE #1
DoneSav:
ya = 1
xa = 1
SCREEN 13
CLS
PSET (0, 0), 10: DRAW "r21d21l21u21"
DO
xa = xa + 1
IF xa = 21 THEN ya = ya + 1: xa = 1
IF ya = 21 THEN BEEP: RETURN
c = matrix(xa, ya)
PSET (xa, ya), c
del = del + 1
LOOP

Load:
ya = 1
xa = 1
SCREEN 12
LOCATE 20, 1: INPUT "Load As?(.mtx)-I'll Add>", file$
CLS
SCREEN 13
PSET (0, 0), 10: DRAW "r21d21l21u21"
file$ = file$ + ".mtx"
OPEN file$ FOR INPUT AS #1
DO
xa = xa + 1
IF xa = 21 THEN ya = ya + 1: xa = 1
IF ya = 21 THEN BEEP: CLOSE #1: RETURN
INPUT #1, c
matrix(xa, ya) = c
PSET (xa, ya), c
del = del + 1
LOOP






DrawBug:
ya = 1
CLS

DO
xa = xa + 1
IF xa = 41 THEN ya = ya + 1: xa = 1
IF ya = 41 THEN BEEP: GOTO Done
c = matrix(xa, ya)
PSET (xa, ya), c
del = del + 1
LOOP

Done:
PRINT xa
PRINT ya
PRINT c
PRINT del
RETURN


