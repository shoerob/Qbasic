SCREEN 12
CLS
3
CLS
COLOR 4
PRINT "Ascii Wars By: Robert Shoemate"
PRINT "What Skill Level?"
PRINT "Higher The Easier."
PRINT "<500-2500>"
COLOR 14
INPUT ">", skill
IF skill > 2500 THEN 3
IF skill < 500 THEN 3
4
CLS
PRINT "How Much Time You Want?"
PRINT "<1000-100000>"
INPUT ">", tim
IF tim > 100000 THEN GOTO 4
IF tim < 1000 THEN GOTO 4
CLS
x1 = 5
y1 = 40
x = 15
y = 40
1
DO
tim = tim - 1
IF tim = 0 THEN GOTO 9999
delay = delay + 1
IF delay = skill THEN GOSUB enem
COLOR 12
LOCATE 26, 1: PRINT "Score: "; points; " Time Left: "; tim
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN GOSUB UP
IF a$ = CHR$(0) + "K" THEN GOSUB Left
IF a$ = CHR$(0) + "M" THEN GOSUB RIGHT
IF a$ = CHR$(0) + "P" THEN GOSUB DOWN
IF a$ = CHR$(32) THEN GOSUB shoot
COLOR 10
LOCATE x, y: PRINT CHR$(254)
COLOR 2
LOCATE x, 80: PRINT "*"
LOCATE x, 1: PRINT "*"
LOCATE 25, y: PRINT "*"
LOCATE 1, y: PRINT "*"
COLOR 12
LOCATE x1, y1: PRINT CHR$(234)
LOOP
UP:
IF x = 1 THEN RETURN
COLOR 0
LOCATE x, y: PRINT CHR$(254)
COLOR 0
LOCATE x, 80: PRINT "*"
LOCATE x, 1: PRINT "*"
LOCATE 25, y: PRINT "*"
LOCATE 1, y: PRINT "*"
x = x - 1
RETURN
Left:
IF y = 1 THEN RETURN
COLOR 0
LOCATE x, y: PRINT CHR$(254)
COLOR 0
LOCATE x, 80: PRINT "*"
LOCATE x, 1: PRINT "*"
LOCATE 25, y: PRINT "*"
LOCATE 1, y: PRINT "*"
y = y - 1
RETURN
RIGHT:
IF y = 80 THEN RETURN
COLOR 0
LOCATE x, y: PRINT CHR$(254)
COLOR 0
LOCATE x, 80: PRINT "*"
LOCATE x, 1: PRINT "*"
LOCATE 25, y: PRINT "*"
LOCATE 1, y: PRINT "*"
y = y + 1
RETURN
DOWN:
IF x = 25 THEN RETURN
COLOR 0
LOCATE x, y: PRINT CHR$(254)
COLOR 0
LOCATE x, 80: PRINT "*"
LOCATE x, 1: PRINT "*"
LOCATE 25, y: PRINT "*"
LOCATE 1, y: PRINT "*"
x = x + 1
RETURN
enem:
RANDOMIZE TIMER
COLOR 0
LOCATE x1, y1: PRINT CHR$(234)
x1 = INT(RND * 23) + 2
y1 = INT(RND * 78) + 2
delay = 0
points = points - 2
RETURN
shoot:
IF x = x1 AND y = y1 THEN GOTO 120 ELSE points = points - 1: RETURN
120
points = points + 4
FOR snd = 440 TO 447
SOUND snd, snd / 1000
NEXT snd
GOSUB enem
RETURN
9999
END

