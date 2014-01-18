SCREEN 12
RANDOMIZE TIMER
lev = 7
lev2 = 7
killer = 15
ammo = 25
level = 1
'Intro Screen
FOR h = 1 TO 400
CIRCLE (315, 180), h, c
c = INT(RND * 15) + 1
CIRCLE (315, 280), h, c
NEXT h
LOCATE 15, 35: PRINT "Lamb Hunt 2"
PLAY "T255<L10AGFGAAA"
'Intro Screen

'Instructions
CLS
PRINT "Lamb Hunt 2 By: Robert Shoemate"
PRINT "Instructions:"
PRINT
PRINT "Shoot "
PSET (46, 47), 12: DRAW "D12R7U6R9D6R7U11R7U8L11D3L19D3"
LOCATE 4, 11: PRINT "Lambs Using Arrow Keys To Move And Space Bar To Shoot <A> "
LOCATE 5, 1: PRINT "reloads your gun!"
PRINT "The Story:"
PRINT "Your Fields Are Being Over Run By High lamb Populations! You Must Kill "
PRINT "As Many Lambs You Can Until The Population Is Low Enough To Save Your Field!"
PRINT "25 Levels Of Pure Lamb Hunting Action!"
INPUT "[PRESS ENTER]", wwf$
'Instructions

'The Game
CLS
x = 300
y = 480
lamby = INT(RND * 400) + 100
lamb2y = INT(RND * 400) + 100
delay = 1
delay2 = 2
del = 0
DO
IF kills = killer THEN GOSUB level
COLOR 12
LOCATE 1, 1: PRINT "Lamb Hunt 2 By: Robert Shoemate  Ammo:"; ammo
LOCATE 2, 2: PRINT "Points:"; pnt; "Kills:"; kills; "Misses:"; miss; "Level:"; level; "Escapes:"; escape
PSET (1, 37), 14: DRAW "R450u40"
COLOR 15
PSET (x, y), 14: DRAW "U20r10d20"
PSET (526, 15), 10: DRAW "d500"
a$ = INKEY$
IF a$ = "A" OR a$ = "a" AND ammo = 0 THEN ammo = ammo + 25
IF a$ = CHR$(0) + "M" THEN GOSUB RIGHT
IF a$ = CHR$(0) + "K" THEN GOSUB LEFT
IF a$ = CHR$(32) THEN GOSUB SHOOT
del = del + 1
del2 = del2 + 1
IF del = delay THEN GOSUB lamb
IF del2 = delay2 THEN GOSUB lamb2
IF escape = 3 THEN GOTO done
LOOP

RIGHT:
IF x = 515 THEN RETURN
PSET (x, y), 0: DRAW "U20r10d20"
x = x + 5
RETURN

LEFT:
IF x = 0 THEN RETURN
PSET (x, y), 0: DRAW "U20r10d20"
x = x - 5
RETURN

SHOOT:
IF ammo < 1 THEN RETURN
ammo = ammo - 1
PSET (x + 5, y - 20), 4
DRAW "u5r5u5 l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5"
FOR snd = 500 TO 503
SOUND snd, snd / 1000
NEXT snd
PSET (x + 5, y - 20), 0
DRAW "u5r5u5 l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5l10u5r10u5"
miss = miss + 1
GOTO HITORNO:
backin:
RETURN

HITORNO:
IF x >= lambx AND x <= lambx + 30 THEN GOTO hit:
IF x >= lamb2x AND x <= lamb2x + 30 THEN GOTO hit2:
pnt = pnt - 2
GOTO backin:


hit:
FOR h = 1 TO 50
CIRCLE (lambx + 15, lamby), h, 12
NEXT h
FOR h = 1 TO 50
CIRCLE (lambx + 15, lamby), h, 15
NEXT h
FOR h = 1 TO 50
CIRCLE (lambx + 15, lamby), h, 12
NEXT h
FOR h = 1 TO 50
CIRCLE (lambx + 15, lamby), h, 0
NEXT h
pnt = pnt + 5
kills = kills + 1
lambx = 700
miss = miss - 1
escape = escape - 1
GOTO lamb
GOTO backin

hit2:
FOR h = 1 TO 50
CIRCLE (lamb2x + 15, lamb2y), h, 12
NEXT h
FOR h = 1 TO 50
CIRCLE (lamb2x + 15, lamb2y), h, 15
NEXT h
FOR h = 1 TO 50
CIRCLE (lamb2x + 15, lamb2y), h, 12
NEXT h
FOR h = 1 TO 50
CIRCLE (lamb2x + 15, lamb2y), h, 0
NEXT h
pnt = pnt + 5
kills = kills + 1
lamb2x = 700
miss = miss - 1
escape = escape - 1
GOTO lamb2
GOTO backin



lamb2:

PSET (lamb2x, lamb2y), 0: DRAW "D12R7U6R9D6R7U11R7U8L11D3L19D3"
lamb2x = lamb2x + 1
PSET (lamb2x, lamb2y), 15: DRAW "D12R7U6R9D6R7U11R7U8L11D3L19D3"
del2 = 0
IF lamb2x < 600 THEN RETURN
lamb2x = 0
lamb2y = INT(RND * 300) + 70
delay2 = INT(RND * lev2) + 1
escape = escape + 1
RETURN


lamb:
PSET (lambx, lamby), 0: DRAW "D12R7U6R9D6R7U11R7U8L11D3L19D3"
lambx = lambx + 1
PSET (lambx, lamby), 15: DRAW "D12R7U6R9D6R7U11R7U8L11D3L19D3"
del = 0
IF lambx < 600 THEN RETURN
lambx = 0
lamby = INT(RND * 300) + 70
delay = INT(RND * lev) + 1
escape = escape + 1
RETURN


level:
IF lev2 > 1 THEN lev2 = lev2 - 1
IF lev > 1 THEN lev = lev - 1
level = level + 1
killer = killer + 5
kills = 0
escape = 0
IF level = 25 THEN GOTO WIN
CLS
LOCATE 15, 27: PRINT "Level:"; level
PLAY "T255L9AGFGAAA"
CLS
RETURN

done:
CLS
BEEP
PRINT "Oh No The Field Will Never Be Safe With All Of Those Lambs In It!"
PRINT "You Have Lost..."
PRINT "Final Score:"; pnt
PRINT "Thankyou For Playing Lamb Hunt 2 By: Robert Shoemate"
END

WIN:
CLS
BEEP
PRINT "The Entire Lamb Population Has Been Lowered And Your Field Is Now Safe!"
COLOR 10
PRINT "You Have Won!"
COLOR 15
PRINT "Final Score:"; pnt
PRINT "Thankyou For Playing Lamb Hunt 2 By: Robert Shoemate"
BEEP
END

