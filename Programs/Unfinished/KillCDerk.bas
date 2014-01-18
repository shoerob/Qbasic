v$ = "Gym Shorts"
q$ = "Foot Balls"
p$ = "Basket Balls"
m$ = "Volley Balls"
o$ = "Base Balls"

q = 0
p = 0
m = 0
o = 0
w = 0
a = 100
SCREEN 13
1 PRINT "What is your name?"
2 INPUT name$
3 PRINT "Hello "; name$; "!"
SLEEP 2
CLS
FOR h = 1 TO 500
CIRCLE (320, 200), h, INT(RND * 30) + 1
LOCATE 10, 25: PRINT "The kill Coach Derks game"
NEXT h
PLAY "acdfacdfacdef"
CLS
SCREEN 13
0 CLS
PRINT "(1)Attack Coach Derks"
PRINT "(2)Gym"
PRINT "(3)Locker Room"
PRINT "(4)Equipment Room"
INPUT a$
IF a$ = "1" GOTO 0
IF a$ = "2" GOTO 500
IF a$ = "3" GOTO 5000
IF a$ = "4" GOTO 0 ELSE GOTO 0
500 CLS
PRINT "GYM"
501 PRINT "(1)Play basket ball"
PRINT "(2)Play Volley ball"
PRINT "(3)Talk to the coach"
PRINT "(4)Leave The GYM"

INPUT z$
IF z$ = "4" GOTO 0
IF z$ = "1" GOTO 600
IF z$ = "2" GOTO 900
IF z$ = "3" GOTO 2000 ELSE GOTO 500
600 CLS
PRINT "Basket Ball"
PRINT "(1)Shoot Ball"
PRINT "(2)Steal ball"
PRINT "(3)Don't Play"
INPUT b$
IF b$ = "3" GOTO 500
IF b$ = "1" GOTO 650
IF b$ = "2" GOTO 800 ELSE GOTO 600
650 x = 0
x = INT(RND * 15) + 10
IF x = 15 GOTO 700 ELSE GOTO 750
700 PRINT "You made it!"
a = a + 5
725 PRINT "You have "; a; " hit points!"
SLEEP 1
GOTO 600
750 PRINT "You missed!"
GOTO 725
800 PRINT "You are unable to steal the ball."
SLEEP 1
GOTO 600
900 CLS
PRINT "Volley Ball"
PRINT "(1)Hit Ball"
PRINT "(2)Steal ball"
PRINT "(3)Don't play"
INPUT c$
IF c$ = "1" GOTO 1000
IF c$ = "2" GOTO 1025
IF c$ = "3" GOTO 500 ELSE GOTO 900
1000 x = 0
x = INT(RND * 15) + 10
IF x = 15 GOTO 1050 ELSE GOTO 1060
1050 PRINT "You are succesful in hiting the ball!"
a = a + 5
58  PRINT "You have "; a; " hit points"
SLEEP 1
GOTO 900
1060 PRINT "You miss the ball!"
GOTO 58
SLEEP 1
GOTO 900
1025 PRINT "You don't get the ball!"
SLEEP 1
GOTO 900
2000 CLS
PRINT "You are talking to the coach"
PRINT "(1)Ask the coach a question"
PRINT "(2)Don't talk to the coach"
INPUT d$
IF d$ = "1" GOTO 2010
IF d$ = "2" GOTO 500 ELSE GOTO 2000
2010 x = 0
x = INT(RND * 5)
IF x = 1 GOTO 10
IF x = 2 GOTO 15
IF x = 3 GOTO 20
IF x = 4 GOTO 15
IF x = 5 GOTO 15
IF x = 0 GOTO 15
10 PRINT "You have been cut from the team!"
a = a - 10
100  PRINT "You have "; a; " hit points"
SLEEP 2
GOTO 2000
15 PRINT "Good job. Keep up the good work "; name$; "!"
a = a + 5: GOTO 100
20 PRINT "You need more exercise you puny fool!"
a = a - 10: GOTO 100
5000 IF yu = 1 GOTO 10000
CLS
PRINT "Locker Room"
PRINT "(1)Get a locker"
PRINT "(2)Rob a locker"
PRINT "(3)Leave"
INPUT S$
IF S$ = "3" GOTO 0
IF S$ = "2" GOTO 67
IF S$ = "1" GOTO 9050 ELSE GOTO 5000
67 u = 0
n = INT(RND * 2)
IF n = 1 GOTO 5050
IF n = 2 THEN GOTO 5050
IF n = 0 GOTO 5100
5050 CLS
PRINT "You dumb fool you will not steal  in my locker room!"
SLEEP 1
PRINT "Coach Derks picks you up and throws you across the locker room"
PRINT "You have lost 5 hit points."
a = a - 5
5025 PRINT "You have"; a; "hitpoints!"
SLEEP 20: GOTO 5000
5100 w = 0
w = INT(RND * 5)
IF w = 0 THEN PRINT "You have found a football!": GOTO 8000
IF w = 1 THEN PRINT "You have found a basket ball!": GOTO 9001
IF w = 2 THEN PRINT "You have found a volley ball!": GOTO 9002
IF w = 3 THEN PRINT "You have found a baseball!": GOTO 9003
IF w = 4 THEN PRINT "You have found a pair of gym shorts!": GOTO 9004
8000 q = q + 1
9000 PRINT "Inventory"
PRINT q; q$
PRINT p; p$
PRINT m; m$
PRINT o; o$
PRINT v; v$
SLEEP 200
GOTO 5000
9001 p = p + 1: GOTO 9000
9002 m = m + 1: GOTO 9000
9003 o = o + 1: GOTO 9000
9004 v = v + 1: GOTO 9000
9050 CLS
PRINT "It costs 10 hitpoints to get a locker."
PRINT "Do you get one?"
INPUT no$
IF no$ = "n" GOTO 5000
IF no$ = "y" GOTO 9051 ELSE GOTO 9050
9051  a = a - 10
PRINT "You have "; a; " hitpoints!"
SLEEP 4
yu = 1: GOTO 5000
10000 CLS
PRINT "Locker Room"
PRINT "(1)Use locker"
PRINT "(2)Rob locker"
PRINT "(3)Leave"
INPUT fdg$
IF fdg$ = "2" GOTO 67
IF fdg$ = "3" GOTO 0
IF fdg$ = "1" GOTO 20000 ELSE GOTO 10000
20000 CLS
PRINT "Locker"
PRINT "(1)Put in stuff"
PRINT "(2)Take out stuff"
PRINT "(3)Leave"
INPUT dd$
IF dd$ = "3" GOTO 10000
IF dd$ = "1" GOTO 456 ELSE GOTO 20000
456 CLS
PRINT "What do you put in?"
PRINT "(G)ym shorts"
PRINT "(F)oot balls"
PRINT "(B)asket balls"
PRINT "(V)olley balls"
PRINT "(B)ase balls"
INPUT fg$
IF fg$ = "g" GOTO 179 ELSE GOTO 456
a = a - 1
qw = qw + 1
179 PRINT "You put one in your locker!"

