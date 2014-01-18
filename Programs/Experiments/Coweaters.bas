RANDOMIZE TIMER

cow = 0
CLS
SCREEN 12
 FOR h = 1 TO 999
 CIRCLE (INT(RND * h), 200), 345, INT(RND * 15) + 1
 NEXT h
LOCATE 15, 30:  PRINT "Cow Eaters"
PLAY "l64 o 1 cdecdecdecde o2 cdecdecdecde o3 cdecdecdecde o4 cdecdecdecde o5 cdecdecdecde o6 cdecdecdece"
BEEP
PLAY "l8 o1"
CLS
PRINT "Whats your name?"
INPUT name$
PRINT "Welcome to Cow Eaters "; name$; "!"
PRINT "By Cow Eater himself!"
SLEEP 4
1 CLS
PRINT "Want to"
PRINT "(P)lay a game (Q)uit "
BEEP
INPUT a$
IF a$ = "p" GOTO 10
IF a$ = "q" THEN END ELSE GOTO 1
10 CLS
PRINT "(W)rite a song (G)uess a number"
PRINT "(M)ath helper  (Q)uit to main"
INPUT a$
IF a$ = "w" GOTO 20
IF a$ = "g" GOTO 30
IF a$ = "q" GOTO 1
IF a$ = "m" GOTO 5000 ELSE GOTO 10
20 CLS
PRINT "Write song using letters a,b,c,d,e,f,g!"
 INPUT play$
PLAY play$: GOTO 10
21 PRINT "What a song!"
SLEEP 2
GOTO 1
30 a = 0
a = INT(RND * 100)
0 SLEEP 2
CLS
PRINT "What number am I thinking of?"
PRINT "0 to 100"
INPUT b
IF b = a THEN PRINT "Thats right!": SLEEP 2: GOTO 2000
IF b < a THEN PRINT "Wrong higher": GOTO 0
IF b > a THEN PRINT "Wrong lower": GOTO 0
5000 SCREEN 12
PRINT "Welcome to the math helper "; name$; "."
SLEEP 2
3 CLS
PRINT "Want to (A)dd (S)ubtract or (Q)uit?"
INPUT b$
IF b$ = "a" GOTO 60
IF b$ = "s" GOTO 100
IF b$ = "q" THEN GOTO 10 ELSE GOTO 3
60 CLS
PRINT "Adding"
PRINT "(C)alculater (M)ath quiz (Q)uit to main"
INPUT b$
IF b$ = "c" GOTO 2
IF b$ = "m" GOTO 70
IF b$ = "q" GOTO 3 ELSE GOTO 60
2 CLS
PRINT "Give me a problem!"
PRINT "1st number"
INPUT a
PRINT "2nd number"
INPUT b
PRINT a + b; "is the answer"
SLEEP 4
4 CLS
PRINT "Want to add again?"
INPUT yn$
5 IF yn$ = "y" GOTO 2
IF yn$ = "n" GOTO 60 ELSE GOTO 4
70 PRINT "The math quiz"
11 c = 0
12 c = c + 1
13 IF c = 10 GOTO 60
X = INT(RND * 100) + 1
Z = INT(RND * 100) + 1
PRINT " "; X
PRINT "+"; Z
PRINT "-----"
INPUT a
IF a = X + Z GOTO 900 ELSE GOTO 80
900 PRINT "CORRECT": SLEEP 1: GOTO 12
80 PRINT "WRONG": SLEEP 1: GOTO 12


100 CLS
PRINT "Subtracting"
PRINT "(C)alculater (M)athquiz (Q)uit to main "
INPUT st$
IF st$ = "q" THEN GOTO 10
IF st$ = "m" GOTO 111
IF st$ = "c" GOTO 200 ELSE GOTO 100
111 c = 0
112 c = c + 1: GOTO 113
113 IF c = 10 GOTO 100
120 X = INT(RND * 50) + 50
130 Z = INT(RND * 50) + 1
140 PRINT " "; X
141 PRINT "-"; Z
PRINT "-----"
INPUT a
IF a = X - Z GOTO 170 ELSE GOTO 180
170 PRINT "CORRECT": SLEEP 1: GOTO 112
180 PRINT "WRONG": SLEEP 1: GOTO 112
200 PRINT "Give me a problem!"
PRINT "1st number"
201 INPUT a
PRINT "2nd number"
INPUT b
PRINT a - b; "is the answer"
690 SLEEP 4
CLS
PRINT "Want to subtract again?"
INPUT aaaaa$
IF aaaaa$ = "y" GOTO 200
IF aaaaa$ = "n" GOTO 100 ELSE GOTO 690
2000 CLS
SCREEN 13
FOR h = 0 TO 1000
 CIRCLE (INT(RND * h), 200), 345, INT(RND * 15) + 1
 LOCATE 14, 20: PRINT "You won!!!!!!!"
 NEXT h
 PLAY "AAAADDDDCCCCAAAAGGGGAAAACDACGaaa"
 SCREEN 12
 GOTO 10



