LOCATE 1, 1: PRINT "Shooters"
PRINT "By: Cow Eater/ Robert Shoemate"
PRINT "Enter a Skill Level!(500-4000)Higher The slower!"
INPUT skill
IF skill < 500 THEN skill = 500
IF skill > 4000 THEN skill = 4000
PRINT "Press a key"
SLEEP
SCREEN 12
x = 100
y = 100
DO
IF a$ = CHR$(27) THEN GOTO done
del = del + 1
IF del = skill THEN GOSUB ENEMY
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN GOSUB RIGHT
IF a$ = CHR$(0) + "H" THEN GOSUB up
IF a$ = CHR$(0) + "P" THEN GOSUB DOwn
IF a$ = CHR$(0) + "K" THEN GOSUB LEFT
IF a$ = CHR$(32) THEN GOSUB shoT
PSET (x, y), 10
DRAW "U2R2D2L2"
' GUN....
PSET (300, 450), 12
DRAW "U20r10d20l10"
PSET (304, 429), 14
DRAW "u2r2d2l2"
LOCATE 27, 1: PRINT "POINTS:"; pnt
LOOP

RIGHT:
PSET (x, y), 0
DRAW "U2r2d2l2"
x = x + 5
RETURN
DOwn:
PSET (x, y), 0
DRAW "U2r2d2l2"
y = y + 5
RETURN
up:
PSET (x, y), 0
DRAW "U2r2d2l2"
y = y - 5
RETURN
LEFT:
PSET (x, y), 0
DRAW "U2r2d2l2"
x = x - 5
RETURN


shoT:
pnt = pnt - 1
x1 = x
y1 = y
x2 = 304
y2 = 429
c = 11
DO
PSET (x2, y2), c
DRAW "u2r2d2l2"
IF x >= 300 AND x2 < x THEN x2 = x2 + 1
IF x <= 299 AND x2 > x THEN x2 = x2 - 1
IF y2 > 1 AND y2 < 500 THEN y2 = y2 - 1
IF y2 = y THEN GOTO clr
LOOP



clr:
x1 = x
y1 = y
x2 = 304
y2 = 429
c = 0
DO
PSET (x2, y2), c
DRAW "u2r2d2l2"
IF x >= 300 AND x2 < x THEN x2 = x2 + 1
IF x <= 299 AND x2 > x THEN x2 = x2 - 1
IF y2 > 1 AND y2 < 500 THEN y2 = y2 - 1
IF y2 = y GOTO ck
LOOP
ck:
IF y = y4 OR y = y4 - 1 OR y = y4 - 2 OR y = y4 - 3 OR y = y4 - 4 OR y = y4 - 5 THEN GOTO kil ELSE RETURN
IF x = x4 OR x = x4 - 1 OR x = x4 - 2 OR x = x4 - 3 OR x = x4 - 4 OR x = x4 - 5 THEN GOTO kil ELSE RETURN
RETURN
kil:
FOR circ = 1 TO 50
CIRCLE (x4, y4), circ, 12
NEXT circ
FOR circ = 1 TO 50
CIRCLE (x4, y4), circ, 10
NEXT circ
FOR circ = 1 TO 50
CIRCLE (x4, y4), circ, 12
NEXT circ
FOR circ = 1 TO 50
CIRCLE (x4, y4), circ, 10
NEXT circ
FOR circ = 1 TO 50
CIRCLE (x4, y4), circ, 12
NEXT circ
FOR circ = 1 TO 50
CIRCLE (x4, y4), circ, 0
NEXT circ
pnt = pnt + 3
GOTO ENEMY


ENEMY:
PSET (x4, y4), 0
DRAW "U5r5d5l5"
x4 = INT(RND * 500) + 1
y4 = INT(RND * 300) + 1
PSET (x4, y4), 14
DRAW "U5r5d5l5"
del = 0
RETURN

done:
CLS
PRINT "You Scored"; pnt; "Points!"
INPUT "<PRESS A KEY>", a$
END


