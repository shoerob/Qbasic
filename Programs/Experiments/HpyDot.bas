y = 1
x = 1
SCREEN 12
DO
COLOR c

RANDOMIZE TIMER
x1 = INT(RND * 800) + 2
y1 = INT(RND * 500) + 2
x2 = INT(RND * 800) + 2
y2 = INT(RND * 500) + 2
c = INT(RND * 15) + 0
c2 = INT(RND * 15) + 15
x3 = INT(RND * 2) + 1
y3 = INT(RND * 1) + 1
COLOR 0
LOCATE x3, y3: PRINT " "
PSET (x1, y1), c
DRAW "u5r5d5l5"
PSET (x2, y2), c2
DRAW "u5r5d5l5"
LOOP

