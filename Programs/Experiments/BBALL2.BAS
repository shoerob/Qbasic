SCREEN 12
RANDOMIZE TIMER
X = INT(RND * 300) + 10
y = INT(RND * 300) + 10
directx = INT(RND * 1) + 0
directy = INT(RND * 1) + 0
PSET (1, 1), 12: DRAW "D450R600u450l600"
DO
LOCATE 1, 1: PRINT X, y
CIRCLE (X, y), 5, 0
IF directx = 0 THEN X = X + .5: IF X > 595 THEN directx = 1
IF directx = 1 THEN X = X - .5: IF X < 8 THEN directx = 0
IF directy = 0 THEN y = y + .5: IF y > 445 THEN directy = 1
IF directy = 1 THEN y = y - .5: IF y < 8 THEN directy = 0
CIRCLE (X, y), 5, 10
LOOP

