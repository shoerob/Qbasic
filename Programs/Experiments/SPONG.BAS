SCREEN 12
RANDOMIZE TIMER
pY = 450
px = 200
paddle$ = "u10r35d10l35"
x = INT(RND * 300) + 10
Y = INT(RND * 300) + 10
directx = INT(RND * 1) + 1
directy = INT(RND * 1) + 1
PSET (1, 1), 12: DRAW "D450R600u450l600"
PSET (px, pY), 14
DRAW paddle$
spd = .3
life = 10
DO
CIRCLE (x, Y), 5, 0
IF directx = 0 THEN x = x + spd: IF x > 595 OR Y > 434 AND x < px + 35 AND x > px THEN directx = 1
IF directx = 1 THEN x = x - spd: IF x < 8 THEN directx = 0
IF directy = 0 THEN Y = Y + spd: IF Y > 434 AND x < px + 35 AND x > px THEN directy = 1:
IF directy = 1 THEN Y = Y - spd: IF Y < 8 THEN directy = 0
IF Y > 445 THEN GOSUB loser: directy = 1
CIRCLE (x, Y), 5, 10
'IF Y > 434 AND x < px + 35 AND x > px - 35 THEN
a$ = INKEY$
IF a$ = CHR$(0) + "K" THEN GOSUB left
IF a$ = CHR$(0) + "M" THEN GOSUB right
IF a$ = CHR$(27) THEN GOTO done
LOCATE 1, 1: PRINT "Super Spong -Lifes:"; life
LOOP
left:
IF px < 6 THEN RETURN
PSET (px, pY), 0
DRAW paddle$
px = px - 5
PSET (px, pY), 14
DRAW paddle$
RETURN
right:
IF px > 559 THEN RETURN
PSET (px, pY), 0
DRAW paddle$
px = px + 5
PSET (px, pY), 14
DRAW paddle$
RETURN
loser:
life = life - 1
IF life = 0 THEN GOTO done
RETURN
done:
SCREEN 0
COLOR 7, 4
PRINT "Thankyou for playing Super Spong!"
COLOR 4, 7
PRINT "Super Spong V1.1"
COLOR 7, 1
PRINT "(c)SoftShoe 1997"
COLOR 2, 1
PRINT "By: Robert Shoemate"
END

