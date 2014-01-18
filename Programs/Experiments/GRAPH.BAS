SCREEN 13
RANDOMIZE TIMER

x = 50
y = 100
DO
c = c + 1
IF c = 200 THEN c = 1
PSET (x, y), c
x = INT(RND * 300) + 1
IF x = 400 THEN x = 50
y = y + 1
IF y = 400 THEN y = 1
LOOP

END

DO
FOR a = 1 TO 27
x = INT(RND * 400) + 1
y = INT(RND * 400) + 1
c = INT(RND * 255) + 1
CIRCLE (x, y), a, c
NEXT a
LOOP


