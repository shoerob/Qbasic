DECLARE SUB lambs ()
'Lamb Hunt 1996 SoftShoe...
'By: Robert Shoemate


y1 = 200
heh = 1
x1 = 600
SCREEN 12
1 CLS
PRINT "Would You Like View The Intro?(Y/N)"
INPUT ">", a$
IF a$ = "n" OR a$ = "N" THEN GOTO 50
IF a$ = "y" OR a$ = "Y" THEN GOTO 10 ELSE 1
10
CLS
RANDOMIZE TIMER
FOR CIRC = 1 TO 500
C = INT(RND * 15) + 1
CIRCLE (325, 225), CIRC, C
NEXT CIRC
FOR CIRC = 1 TO 100
C = 0
CIRCLE (325, 225), CIRC, C
NEXT CIRC
COLOR 13
LOCATE 14, 39: PRINT "Lamb"
LOCATE 15, 37: PRINT "Hunt V1.0"
COLOR 7
LOCATE 24, 1: PRINT "Proggramed:"
LOCATE 25, 1: PRINT "By: Robert Shoemate"
LOCATE 26, 1: PRINT "Idea"
LOCATE 27, 1: PRINT "By: Jamy Ryals"
COLOR 10
FOR fade = 1 TO 63
PALETTE 12, fade
NEXT


PLAY "t255o3 AGfgaaa2ggg2ao4cc2 o3 agfgaaaaggagf2o4o2f1"
PLAY "t255o3 AGfgaaa2ggg2ao4cc2 o3 agfgaaaaggagf2o4o4f1"
GOTO 50
50
CLS
COLOR 11
LOCATE 1, 1: PRINT "Lamb Hunt 1.0 <SPACE>:Shoots <Arrows>:Move "
PSET (1, 20), 4
DRAW "r355u15"
x = 1
DO
LOCATE 1, 50: PRINT "KILLS: "; kills
LOCATE 1, 62: PRINT "MISSES: "; miss
LOCATE 2, 50: PRINT "POINTS: "; points
LAMB = LAMB + 1
IF LAMB = 4 THEN GOSUB LAMB
r = x
q$ = INKEY$
IF q$ = CHR$(0) + "M" THEN PSET (x, 475), 0: DRAW "U15R5D15": x = x + 5
IF q$ = CHR$(0) + "K" THEN PSET (x, 475), 0: DRAW "U15R5D15": x = x - 5
IF q$ = CHR$(32) THEN GOSUB SHOOT
IF q$ = CHR$(27) THEN GOTO 999999
PSET (x, 475), 15
DRAW "u15r5d15"
LOOP
SHOOT:
l = 1
qscs = 1
IF qscs = 1 THEN IF d = x1 + 0 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 1 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 2 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 3 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 4 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 5 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 6 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 7 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 8 THEN PLAY "o1C": qscs = 0: GOTO 900
IF qscs = 1 THEN IF d = x1 + 9 THEN PLAY "o1C": qscs = 0: GOTO 900
PLAY "t255o2a"
GOTO 901
900
points = points + 5
FOR CIRC = 1 TO 20
C = INT(RND * 15) + 1
CIRCLE (x1, y1), CIRC, 15
NEXT CIRC
FOR CIRC = 1 TO 20
CIRCLE (x1, y1), CIRC, 4
NEXT CIRC
FOR CIRC = 1 TO 20
CIRCLE (x1, y1), CIRC, 0
NEXT CIRC
kills = kills + 1
RANDOMIZE TIMER
heh = INT(RND * 2) + 1
IF heh = 2 THEN x1 = 600
IF heh = 1 THEN x1 = 0
901
miss = miss + 1
DO
IF l = 25 THEN d = x + 3: PSET (d, 475), 0: DRAW "U425": RETURN
l = l + 1
d = x + 3
PSET (d, 475), 14
DRAW "u425"
LOOP
LAMB:
PSET (x1, y1), 0
DRAW "u10R10D10L10"
LAMB = 0
IF heh = 2 THEN IF x1 = 600 THEN y1 = INT(RND * 300) + 100
IF heh = 1 THEN IF x1 = 0 THEN y1 = INT(RND * 300) + 100
IF heh = 2 THEN IF x1 = 600 THEN heh = 1: x1 = 600
IF heh = 1 THEN IF x1 = 0 THEN heh = 2: x1 = 0
IF heh = 2 THEN x1 = x1 + 1
IF heh = 1 THEN x1 = x1 - 1
PSET (x1, y1), 7
DRAW "u10r10D10L10"
RETURN
999999
CLS
SCREEN 0
PLAY "T160O1>L20AGFGAAA"
COLOR 14, 1
PRINT "Thank you For Playing Lamb Hunt V1.0"
COLOR 1, 14
PRINT "Your Final Score Was "; points
COLOR 14, 1
PRINT "Proggramed By: Robert Shoemate"
PRINT "Ideas By: Jamy Ryals"
COLOR 28, 1
PRINT "Unmodified Version By Robert Shoemate"
END

SUB lambs

END SUB

