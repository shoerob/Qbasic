SCREEN 13
PRINT "What is your name?"
INPUT a$
PRINT "Welcome to the math helper "; a$; "."
3 PRINT "Want to (A)dd (S)ubtract or (Q)uit?"
INPUT b$
IF b$ = "a" GOTO 1
IF b$ = "s" GOTO 100
IF b$ = "q" THEN GOTO 1000 ELSE GOTO 3
1000   GOTO 6666666666
1 PRINT "Adding"
PRINT "(C)alculater (M)ath quiz (Q)uit to main"
INPUT b$
IF b$ = "c" GOTO 2
IF b$ = "m" GOTO 10
IF b$ = "q" GOTO 3 ELSE GOTO 1
2 PRINT "Give me a problem!"
PRINT "1st number"
INPUT a
PRINT "2nd number"
INPUT b
PRINT a + b; "is the answer": GOTO 4
4 PRINT "Want to add again?"
INPUT yn$
5 IF yn$ = "y" GOTO 2
IF yn$ = "n" GOTO 1 ELSE GOTO 4
10 PRINT "The math quiz"
11 c = 0
12 c = c + 1
13 IF c = 10 GOTO 1
20 X = INT(RND * 100) + 1
30 Z = INT(RND * 100) + 1
40 PRINT " "; X
41 PRINT "+"; Z
PRINT "-----"
INPUT a
IF a = X + Z GOTO 70 ELSE GOTO 80
70 PRINT "CORRECT": SLEEP 1: GOTO 12
80 PRINT "WRONG": SLEEP 1: GOTO 12


100 PRINT " Subtracting"
PRINT "(C)alculater (M)athquiz (Q)uit to main "
INPUT st$
IF st$ = "q" THEN GOTO 2
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
PRINT "Want to subtract again?"
INPUT aaaaa$
IF aaaaa$ = "y" GOTO 200
IF aaaaa$ = "n" GOTO 100

6666666666

