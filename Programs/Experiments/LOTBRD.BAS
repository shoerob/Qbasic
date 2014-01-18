SCREEN 12
FOR h = 1 TO 500
CIRCLE (320, 200), h, INT(RND * 16) + 10
LOCATE 15, 20: PRINT "Legend Of The Big Red Dog"
LOCATE 16, 20: PRINT "By Robert Shoemate"
NEXT h
PLAY "a c d f a  cde adcfdddd acdfacdeadcfdd "
SLEEP 2
CLS
mon = 1000
PRINT "What is your name?"
INPUT name$
12 PRINT "Town Square"
PRINT "(1)Dragons Inn  (2)Training Center"
PRINT "(3)Forest       (4)List Warriors"
PRINT "(5)Kill Others  (6)Knights Armory"
PRINT "(7)Weapon shop  (8)Other places"
INPUT a$
IF a$ = "1" GOTO 1
1 PRINT "Dragons Inn": GOTO 2
2 PRINT "(1)Enter Bar  (2)Flirt With star": GOTO 3
3 PRINT "(3)Get A Room (4)Leave Inn"
INPUT b$
IF b$ = "1" GOTO 4
IF b$ = "4" GOTO 12
4 PRINT "The Bar": GOTO 5
5 PRINT "(1)Buy a drink  (2)Leave bar"
INPUT c$
IF c$ = "1" GOTO 6
IF c$ = "2" GOTO 1 ELSE GOTO 5
6 PRINT " Wich drink?": GOTO 7
7 PRINT " Price    Drink"
8 PRINT "100    (B)eer"
9 PRINT "100    (W)isky"
10 PRINT "(D)on't get a drink"
INPUT d$

IF d$ = "b" GOTO 20
IF d$ = "w" GOTO 20 ELSE GOTO 6
IF d$ = "d" GOTO 4
20 IF mon > 0 THEN mon = mon - 100: GOTO 21
21  IF mon = 0 THEN 22
23 PRINT "You feel fresh and relaxed after having the drink.": GOTO 24
22 PRINT "You can't afford that"
24 PRINT "You have"; mon; "$ left.": GOTO 6


