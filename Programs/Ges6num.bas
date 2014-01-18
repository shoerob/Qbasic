RANDOMIZE TIMER
SCREEN 12
PRINT "Please Type 6 numbers 1-50"
INPUT ">", a1
INPUT ">", b1
INPUT ">", c1
INPUT ">", d1
INPUT ">", e1
INPUT ">", f1
CLS
DO
circ = circ + 1
CIRCLE (325, 250), circ, 12
LOCATE 1, 1: PRINT "------------C---Y-- "
LOCATE 2, 1: PRINT "1st Number:"; a; a1
LOCATE 3, 1: PRINT "2nd Number:"; b; b1
LOCATE 4, 1: PRINT "3rd Number:"; c; c1
LOCATE 5, 1: PRINT "4th Number:"; d; d1
LOCATE 6, 1: PRINT "5th Number:"; e; e1
LOCATE 7, 1: PRINT "6th Number:"; f; f1
GOSUB rand
IF circ = 400 THEN GOTO CALC
LOOP
rand:
a = INT(RND * 50) + 1
b = INT(RND * 50) + 1
c = INT(RND * 50) + 1
d = INT(RND * 50) + 1
e = INT(RND * 50) + 1
f = INT(RND * 50) + 1
RETURN

CALC:
LOCATE 1, 1: PRINT "------------C---Y--"
LOCATE 2, 1: PRINT "1st Number:"; a; a1
LOCATE 3, 1: PRINT "2nd Number:"; b; b1
LOCATE 4, 1: PRINT "3rd Number:"; c; c1
LOCATE 5, 1: PRINT "4th Number:"; d; d1
LOCATE 6, 1: PRINT "5th Number:"; e; e1
LOCATE 7, 1: PRINT "6th Number:"; f; f1
IF a = a1 THEN r = r + 1: BEEP
IF b = b1 THEN r = r + 1: BEEP
IF c = c1 THEN r = r + 1: BEEP
IF d = d1 THEN r = r + 1: BEEP
IF e = e1 THEN r = r + 1: BEEP
IF f = f1 THEN r = r + 1: BEEP
PRINT "You Got "; r; "Numbers Right!!!"
END

