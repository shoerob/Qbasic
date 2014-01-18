SCREEN 13
y = 15
x = 30
c = 1
RANDOMIZE TIMER
DO
COLOR 10
LOCATE 1, 13: PRINT "SkiPPy?DraW"
c1 = INT(RND * 16) + 1
COLOR c1
LINE (325, 9)-(1, 9)
LINE (325, 16)-(1, 16)
LINE (30, 9)-(30, 16)
LINE (277, 9)-(277, 16)

x = x + 1
COLOR c
IF c = 255 THEN GOTO Start
c = c + 1
PSET (x, y), c
DRAW "u5"
LOOP
Start:

DO
what$ = INKEY$
IF what$ = CHR$(27) THEN END
COLOR 10
LOCATE 1, 13: PRINT "SkiPPy?DraW"
COLOR c1
LINE (325, 9)-(1, 9)
LINE (325, 16)-(1, 16)
LINE (30, 9)-(30, 16)
LINE (277, 9)-(277, 16)
LOOP


