'Fire Works Display By: Robert Shoemate/Cow Eater


SCREEN 12
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
LOCATE 1, 1: PRINT "Fire Works Display By: Robert Shoemate Fire Works Shot: "; f
LOOP




