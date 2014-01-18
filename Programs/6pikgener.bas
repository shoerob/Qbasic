comb = 10000000
CLS
PRINT "Geuss 6 Numbers between 1-50"
INPUT ">", a1, b1, c1, d1, e1, f1
con = a1 + b1 + c1 + d1 + e1 + f1
start:
CLS

DO
GOSUB 500
20
loops = loops + 1
bbc = bbc + 1
RANDOMIZE TIMER
GOSUB lots
LOCATE 1, 1: PRINT "Generating Numbers!"; a; b; c; d; e; f; "             "
LOCATE 2, 1: PRINT "Numbers Matched"; mat; " Of "; loops; "Lottary's."
LOCATE 3, 1: PRINT "Ones "; z1
LOCATE 4, 1: PRINT "Two's"; z2
LOCATE 5, 1: PRINT "Three's"; z3
LOCATE 6, 1: PRINT "Four's"; z4
LOCATE 7, 1: PRINT "Five's"; z5
LOCATE 8, 1: PRINT "Your Numbers: "; a1; b1; c1; d1; e1; f1
IF bbc = comb THEN GOTO go
LOOP

go:
bbc = 0
COLOR 14
LOCATE 2, 1: PRINT a; b; c; d; e; f
PRINT "Use These Numbers?"
INPUT ">", yn$
IF yn$ = "y" OR yn$ = "Y" THEN GOTO DONE
IF yn$ = "n" OR yn$ = "N" THEN GOTO start ELSE GOTO go
CLOSE
DONE:
END



MESS:
PRINT "Invalid File Name!!!"
GOTO start:

500
num1:
IF a1 = a OR a1 = b OR a1 = c OR a1 = d OR a1 = e OR a1 = f THEN GOTO num2 ELSE RETURN
num2:
z1 = z1 + 1
mat = mat + 1
IF b1 = a OR b1 = b OR b1 = c OR b1 = d OR b1 = e OR b1 = f THEN GOTO num3 ELSE RETURN
num3:
z2 = z2 + 1
mat = mat + 1
IF c1 = a OR c1 = b OR c1 = c OR c1 = d OR c1 = e OR c1 = f THEN GOTO num4 ELSE RETURN
num4:
z3 = z3 + 1
LOCATE 13, 1: PRINT a; b; c; d; e; f
mat = mat + 1
IF d1 = a OR a1 = b OR d1 = c OR d1 = d OR d1 = e OR d1 = f THEN GOTO num5 ELSE RETURN
num5:
z4 = z4 + 1
LOCATE 14, 1: PRINT a; b; c; d; e; f
mat = mat + 1
IF e1 = a OR e1 = b OR e1 = c OR e1 = d OR e1 = e OR e1 = f THEN GOTO num6 ELSE RETURN
num6:
z5 = z5 + 1
LOCATE 15, 1: PRINT a; b; c; d; e; f
mat = mat + 1
IF f1 = a OR f1 = b OR f1 = c OR f1 = d OR f1 = e OR f1 = f THEN GOTO match ELSE RETURN
match:
BEEP
BEEP
BEEP
PRINT "Lottary's Done Till Win:"; loops
PRINT "Your Numbers:"; a1; b1; c1; d1; e1; f1
PRINT "Winning Numbers:"; a; b; c; d; e; f
BEEP
BEEP
BEEP
END



lots:
a = INT(RND * 50) + 1
b = INT(RND * 50) + 1
c = INT(RND * 50) + 1
d = INT(RND * 50) + 1
e = INT(RND * 50) + 1
f = INT(RND * 50) + 1
IF a = b OR a = c OR a = d OR a = e OR a = f THEN GOTO lots:
IF b = a OR b = c OR b = d OR b = e OR b = f THEN GOTO lots:
IF c = b OR c = a OR c = d OR c = e OR c = f THEN GOTO lots:
IF d = b OR d = c OR d = a OR d = e OR d = f THEN GOTO lots:
IF e = b OR e = c OR e = d OR e = a OR e = f THEN GOTO lots:
IF f = b OR f = c OR f = d OR f = e OR f = a THEN GOTO lots:
RETURN

