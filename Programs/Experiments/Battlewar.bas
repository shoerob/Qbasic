ship1$ = "(-)"
ship2$ = ":-:"
ship3$ = "/|\"
ship4$ = "!\/!"

SCREEN 13
PRINT "Welcome to Battle War!"
SLEEP 1
1 PRINT "Choose a ship to fly!"
PRINT "(1)Enforcer"
PRINT "(2)Zap"
PRINT "(3)Dreader"
PRINT "(4)Create your own"
PRINT "(5)info on a ship"
PRINT "E(x)it"
INPUT a$
IF a$ = "4" GOTO 10
IF a$ = "x" THEN END
10 PRINT "What will your ship be called?"
INPUT shipdata1$
15 CLS
PRINT "Is "; shipdata1$; " what your ship will be called?"
PRINT "y = YES n = NO"
INPUT yesno$
IF yesno$ = "y" THEN GOTO 20
IF yesno$ = "n" GOTO 10 ELSE GOTO 15
20 CLS
PRINT "What will the "; shipdata1$; " look like?"
PRINT "(A) = (-)"
PRINT "(B) = :-:"
PRINT "(C) = /|\"
PRINT "(d) = !\/!"
INPUT shipdata2$
IF shipdata2$ = "a" THEN ship$ = ship2$: a = 0
IF shipdata2$ = "b" THEN ship$ = ship2$: a = 1
IF shipdata2$ = "c" THEN ship$ = ship3$: a = 2
IF shipdata2$ = "d" THEN ship$ = ship4$: a = 3
ON a GOTO 21, 22, 23, 24
21 PRINT "OK! What a great looking ship!"
SLEEP 5
GOTO 25
22 PRINT "That's the ugliest thing"
SLEEP 5
GOTO 25
23 PRINT "That ship is a piece of crap"
SLEEP 5
GOTO 25
24 PRINT "Peuuuu eeeee Stinko!"
SLEEP 5
25 CLS
PRINT "Your ship is called the "; shipdata1$; " and it looks like this: "; ship$;
PRINT "Is this ok with you?"
PRINT "y = YES n = NO"
INPUT yesno$
IF yesno$ = "y" THEN GOTO 30
IF yesno$ = "n" GOTO 10 ELSE GOTO 25
30 CLS
PRINT "The "; shipdata1$; " Is ready to fly!"
a$ = shipdata1$
b$ = ship$
GOTO 40
40 PRINT "Choose a sector to set your colony on."
PRINT "(AA) Sector"
PRINT "(BF) Sector"
PRINT "(HA) Sector"
PRINT "(AD) Sector"
INPUT sec$
PRINT "(1)Look for a planet to colonize"
PRINT "(2)Scan for a planet "
PRINT "(3)Fly around for a while"
INPUT choice$

