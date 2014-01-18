CLS
'Init
PRINT "Init..."
RANDOMIZE TIMER
test1:
CLS
PRINT "Welcome to Psychic Geusser"
PRINT "By: Robert Shoemate"
PRINT "Whats your name?"
INPUT ">", name$
OPEN "Log.bat" FOR OUTPUT AS #1
PRINT #1, "@ECHO OFF"
PRINT "I will randomly generate a number between 1 and 100,"
PRINT "Think of what this number might be..."
num = INT(RND * 100) + 1
INPUT "Whats Your Guess?:>", a
IF a < 1 GOTO test1:
IF a > 100 GOTO test1:
IF a = num THEN GOTO YES ELSE GOTO no
YES:
BEEP
PRINT
PRINT "You are probably psycic and will pass this test..."
INPUT "Press a key.", a$
GOTO START
no:
BEEP
PRINT
COLOR 10, 14
PRINT "You are probably not psychic and will fail this test..."
COLOR 7, 0
IF num > a THEN away = num - a
IF num < a THEN away = a - num
PRINT
PRINT "You were "; away; " Numbers away..."
PRINT
PRINT "Correct Numbers:"
   'REM OUT
   REM -IF a < num THEN PRINT "Your Guess:"; a + away
   REM -IF a > num THEN PRINT "Your Guess:"; a - away
   'REM OUT^^
PRINT "Number Generated:"; num
INPUT "Press a key.", a$
GOTO START
START:
SCREEN 12
PRINT "Loading-[            ]"
x = 68
DO UNTIL l = 10000
num = INT(RND * 10) + 1
numc = INT(RND * 10) + 1
IF numc = num THEN correctc = correctc + 1
LOCATE 2, 1: PRINT "Generating Computers Guesses:>"; num; numc
LOCATE 3, 1: PRINT "Number Correct:"; correctc
LOCATE 4, 1: PRINT "Time left to 10000:>"; l
x = x + .01
PSET (x, 10), 12
DRAW "U5r1d5l1"
l = l + 1
LOOP
percC = correctc / 10000 * 100
CLS
l = 0
PRINT "Now its your turn!"
DO UNTIL l = 100
PRINT "Generating Number..."
num = INT(RND * 10) + 1
PRINT "Turns left of 100:"; l
Rdo:
PRINT "Number Correct:"; Correcth
PRINT "What number do you think was generated of the numbers 1-10?"
IF l > 0 THEN PRINT "Last Number:"; num1
num1 = num
INPUT ">", GeussH
IF GeussH > 10 THEN GOTO Rdo
IF GeussH < 1 THEN GOTO Rdo
IF GeussH = num THEN Correcth = Correcth + 1
CLS
l = l + 1
LOOP
PERCh = Correcth / 100 * 100
CLS
DO UNTIL INKEY$ <> ""
LOCATE 1, 1: PRINT "Percent correct for Human:>"; PERCh
LOCATE 2, 1: PRINT "Percent correct for Computer:>"; percC
IF PERCh > percC + 5 THEN PRINT "You are probably psychic at geussing certain numbers, or just really lucky."
IF PERCh < percC + 5 THEN PRINT "You are probably NOT psychic at geussing certain numbers."
LOOP
PRINT #1, "ECHO "; name$; ": Percent Correct>"; PERCh; "<#Correct:"; Correcth
PRINT #1, "ECHO COMPUTER: Percent Correct>"; percC; "<#Correct:"; correctc
CLOSE #1
END

