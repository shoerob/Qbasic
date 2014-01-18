'Box Drop By: Robert Shoemate
'Use arrows to keep Blocks from hitting bottom of screen
'SoftShoe 96
'OTHER QBASIC STUFF BY ROBERT SHOEMATE/COWEATER:
'Super Draw V1.0
'SerWar
'SerChat












RANDOMIZE TIMER
life = 10
delay2 = INT(RND * 8) + 1
y = 450
x = 300
x2 = INT(RND * 450) + 10
delay = INT(RND * 8) + 1
y = 450
x = 300
x1 = INT(RND * 450) + 10
SCREEN 12
COLOR 4
PRINT "SoftShoe"
COLOR 13
PRINT "Presents:"
COLOR 10
PRINT "Bang Boom"
PRINT "By Robert Shoemate"
SLEEP 2
CLS
DO
IF life = 0 THEN GOTO DONE:
del = del + 1
del2 = del2 + 1
IF del = delay THEN GOSUB enemy1
IF del2 = delay2 THEN GOSUB enemy2
COLOR 10
LOCATE 1, 1: PRINT "Bang Boom Score:"; pnt; "Lifes: "; life
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN GOSUB right
IF a$ = CHR$(0) + "K" THEN GOSUB left
PSET (x, y), 14
DRAW "U5r35D5L35"
LOOP
right:
PSET (x, y), 0
DRAW "U5r35D5L35"
x = x + 5
RETURN
left:
PSET (x, y), 0
DRAW "U5r35D5L35"
x = x - 5
RETURN
enemy1:
PSET (x1, y1), 0
DRAW "U20R20D20L20"
y1 = y1 + 1
PSET (x1, y1), 5
DRAW "U20R20D20L20"
del = 0
IF y1 = 450 THEN GOTO HITORNOT1
RETURN
HITORNOT1:
IF x1 = x THEN GOTO hit1
IF x1 = x + 1 THEN GOTO hit1
IF x1 = x + 2 THEN GOTO hit1
IF x1 = x + 3 THEN GOTO hit1
IF x1 = x + 4 THEN GOTO hit1
IF x1 = x + 5 THEN GOTO hit1
IF x1 = x + 6 THEN GOTO hit1
IF x1 = x + 7 THEN GOTO hit1
IF x1 = x + 8 THEN GOTO hit1
IF x1 = x + 9 THEN GOTO hit1
IF x1 = x + 10 THEN GOTO hit1
IF x1 = x + 11 THEN GOTO hit1
IF x1 = x + 12 THEN GOTO hit1
IF x1 = x + 13 THEN GOTO hit1
IF x1 = x + 14 THEN GOTO hit1
IF x1 = x + 15 THEN GOTO hit1
IF x1 = x + 16 THEN GOTO hit1
IF x1 = x + 17 THEN GOTO hit1
IF x1 = x + 18 THEN GOTO hit1
IF x1 = x + 19 THEN GOTO hit1
FOR circ = 1 TO 100
CIRCLE (x1 + 10, y1 - 10), 14
NEXT circ
FOR circ = 1 TO 100
CIRCLE (x1 + 10, y1 - 10), 1
NEXT circ
FOR circ = 1 TO 100
CIRCLE (x1 + 10, y1 - 10), 7
NEXT circ
FOR circ = 1 TO 100
CIRCLE (x1 + 10, y1 - 10), 0
NEXT circ
life = life - 1
delay = INT(RND * 8) + 1
x1 = INT(RND * 450) + 10
y1 = 1
RETURN
hit1:
FOR snd = 100 TO 150
SOUND snd, snd / 1000
NEXT snd
pnt = pnt + 5
delay = INT(RND * 8) + 1
x1 = INT(RND * 450) + 10
y1 = 1
CLS
RETURN
enemy2:
PSET (x2, y2), 0
DRAW "U20R20D20L20"
y2 = y2 + 1
PSET (x2, y2), 5
DRAW "U20R20D20L20"
del2 = 0
IF y2 = 450 THEN GOTO HITORNOT2
RETURN
HITORNOT2:
IF x2 = x THEN GOTO hit2
IF x2 = x + 1 THEN GOTO hit2
IF x2 = x + 2 THEN GOTO hit2
IF x2 = x + 3 THEN GOTO hit2
IF x2 = x + 4 THEN GOTO hit2
IF x2 = x + 5 THEN GOTO hit2
IF x2 = x + 6 THEN GOTO hit2
IF x2 = x + 7 THEN GOTO hit2
IF x2 = x + 8 THEN GOTO hit2
IF x2 = x + 9 THEN GOTO hit2
IF x2 = x + 10 THEN GOTO hit2
IF x2 = x + 11 THEN GOTO hit2
IF x2 = x + 12 THEN GOTO hit2
IF x2 = x + 13 THEN GOTO hit2
IF x2 = x + 14 THEN GOTO hit2
IF x2 = x + 15 THEN GOTO hit2
IF x2 = x + 16 THEN GOTO hit2
IF x2 = x + 17 THEN GOTO hit2
IF x2 = x + 18 THEN GOTO hit2
IF x2 = x + 19 THEN GOTO hit2
                        
FOR circ = 1 TO 100
CIRCLE (x2 + 10, y2 - 10), 14
NEXT circ
FOR circ = 1 TO 100
CIRCLE (x2 + 10, y2 - 10), 1
NEXT circ
FOR circ = 1 TO 100
CIRCLE (x2 + 10, y2 - 10), 7
NEXT circ
FOR circ = 1 TO 100
CIRCLE (x2 + 10, y2 - 10), 0
NEXT circ
life = life - 1
delay2 = INT(RND * 8) + 1
x2 = INT(RND * 450) + 10
y2 = 1
RETURN
hit2:
FOR snd = 100 TO 150
SOUND snd, snd / 1000
NEXT snd
pnt = pnt + 5
delay2 = INT(RND * 8) + 1
x2 = INT(RND * 450) + 10
y2 = 1
CLS
RETURN
DONE:
CLS
PRINT "You Have Died..."
PRINT "Final Score:"; pnt
INPUT "Press ENTER", a$
END

