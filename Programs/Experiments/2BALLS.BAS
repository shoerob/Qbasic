SCREEN 12
RANDOMIZE TIMER
X = INT(RND * 595) + 10
y = INT(RND * 445) + 10
directx = INT(RND * 1) + 0
directy = INT(RND * 1) + 0
X1 = INT(RND * 595) + 10
y1 = INT(RND * 445) + 10
directx1 = INT(RND * 1) + 0
directy1 = INT(RND * 1) + 0
PSET (1, 1), 12: DRAW "D450R600u450l600"
spd = 1

DO
LOCATE 1, 1: PRINT X, y, X1, y1
CIRCLE (X, y), 5, 0
IF directx = 0 THEN X = X + spd: IF X > 595 THEN directx = 1
IF directx = 1 THEN X = X - spd: IF X < 8 THEN directx = 0
IF directy = 0 THEN y = y + spd: IF y > 445 THEN directy = 1
IF directy = 1 THEN y = y - spd: IF y < 8 THEN directy = 0
CIRCLE (X, y), 5, 10

CIRCLE (X1, y1), 5, 0
IF directx1 = 0 THEN X1 = X1 + spd: IF X1 > 595 THEN directx1 = 1
IF directx1 = 1 THEN X1 = X1 - spd: IF X1 < 8 THEN directx1 = 0
IF directy1 = 0 THEN y1 = y1 + spd: IF y1 > 445 THEN directy1 = 1
IF directy1 = 1 THEN y1 = y1 - spd: IF y1 < 8 THEN directy1 = 0
CIRCLE (X1, y1), 5, 10

LOOP

