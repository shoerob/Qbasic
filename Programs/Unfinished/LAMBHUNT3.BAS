

SCREEN 12

'SOFT SHOE INTRO!
CLS
PRINT "SoftShoe Productions Presents:"
PLAY "o3 l30 CDEFGAB  BAFEDC EGB CEG DFA CDEGB  o4 CDEFGAB l20 N0 BBBB5 o5 c"
DO UNTIL del = 5000
del = del + 1
LOOP
del = 0
CLS
'SOFT SHOE INTRO!
xi = 600
yi = 200
1
DO
RANDOMIZE TIMER
x = INT(RND * 500) + 1
y = INT(RND * 500) + 1
a = INT(RND * 50) + 1
b = INT(RND * 75) + 1
v = 140
h = 145
lor = INT(RND * 15) + 1
FOR c = a TO b
CIRCLE (x, y), c, lor
NEXT c
FOR snd = v TO h
SOUND snd, snd / 1000
NEXT snd
lor = INT(RND * 15) + 1
FOR c = a TO b
CIRCLE (x, y), c, lor
NEXT c
v = 132
h = 136
FOR snd = v TO h
SOUND snd, snd / 1000
NEXT snd
lor = INT(RND * 15) + 1
FOR c = a TO b
CIRCLE (x, y), c, lor
NEXT c
lor = INT(RND * 15) + 1
FOR c = a TO b
CIRCLE (x, y), c, lor
NEXT c
FOR c = a TO b
CIRCLE (x, y), c, 0
NEXT c
p = p + 6
f = f + 1
LOCATE 15, 32: PRINT "Lamb Hunt III"
del = del + 1
IF del > 10 THEN LOCATE 16, 29: PRINT "Planet Lamb Attacks"
IF del = 30 THEN GOTO INTROBOOM:
LOOP
INTROBOOM:
PLAY "ML L20 O4 C10 GGF9 EDA-5A+5A2"
del = 0
SLEEP 1


CLS
DO
CIRCLE (30, 200), 30, 2
LOCATE 1, 1: PRINT Talk$
PSET (xi, yi), 0: DRAW "U1l1u1l1u1 U1r1u1r1u1    R30 D1l1d1l1d1l1 D1R1D1Rd1r1 l30"
xi = xi - 1
PSET (xi, yi), 12: DRAW "U1l1u1l1u1 U1r1u1r1u1    R30 D1l1d1l1d1l1 D1R1D1Rd1r1 l30"
FOR snd = 100 TO 100
SOUND snd, snd / 1000
NEXT snd

del = del + 1
IF del = 10 THEN GOSUB TALK1:
IF del = 575 THEN GOTO GAME
LOOP
TALK1:
IF del = 10 THEN Talk$ = "Planet Earth Is Under Attack By Planet Lamb! Planet Earth Shall Not And Will Not Be Destroyed! YOUR MISSION: SAVE PLANET EARTH BEFORE ITS TO LATE!"
BEEP
CLS
RETURN




GAME:




