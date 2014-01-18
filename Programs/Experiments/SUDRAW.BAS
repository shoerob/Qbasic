'------------------------------------------------------------------------
'Super Draw V1.0 Completely By: Robert Shoemate/Cow Eater
'Cow Eater Freeware 1996
'Email Your Comments At Shoemate@flash.net
'Use The Keypad to draw a picture up to a 1500 line long qbasic program
'if the program is more than 1500 lines then it wont work right
'------------------------------------------------------------------------


CLS
2
CLOSE
CLOSE
CLOSE
PRINT "Super Draw V1.0 By: Robert Shoemate"
INPUT "Save As?:", file$
file$ = file$ + ".Bas"
ON ERROR GOTO 2
OPEN file$ FOR OUTPUT AS #1
PRINT #1, "SCREEN 12"
12
SCREEN 12
c = 15
x = 200
y = 200
brush$ = "U1R1D1L1"
1
DO
IF q = 1 THEN PSET (x, y), 0
IF q = 1 THEN DRAW "U2R2D2L2"
LOCATE 1, 1: PRINT "Super Draw X:"; x; "Y:"; y
COLOR c
LOCATE 1, 28: PRINT "COLOR"; c
COLOR 10
LOCATE 27, 1: PRINT "BRUSH SIZE:Z-X-C-V-B-N-M Colors:+,- RandomColor:A-S ViewFile:O Sksave:Q-W"
a$ = INKEY$
IF a$ = CHR$(27) THEN END
IF a$ = "A" OR a$ = "a" THEN randc = 1
IF a$ = "S" OR a$ = "s" THEN randc = 0
IF a$ = "7" THEN GOSUB UPLEFT
IF a$ = "8" THEN GOSUB UP
IF a$ = "9" THEN GOSUB UPRIGHT
IF a$ = "6" THEN GOSUB RIGHT
IF a$ = "4" THEN GOSUB LEFT
IF a$ = "1" THEN GOSUB DOWNLEFT
IF a$ = "2" THEN GOSUB DOWN
IF a$ = "3" THEN GOSUB DOWNRIGHT
IF a$ = "+" OR a$ = "=" THEN GOSUB COLUP
IF a$ = "-" THEN GOSUB COLDOWN
IF a$ = "Z" OR a$ = "z" THEN brush$ = "U1R1D1L1"
IF a$ = "X" OR a$ = "x" THEN brush$ = "U2R2D2L2"
IF a$ = "C" OR a$ = "c" THEN brush$ = "U3R3D3L3"
IF a$ = "V" OR a$ = "v" THEN brush$ = "U4R4D4L4"
IF a$ = "B" OR a$ = "b" THEN brush$ = "U5R5D5L5"
IF a$ = "N" OR a$ = "n" THEN brush$ = "U6R6D6L6"
IF a$ = "M" OR a$ = "m" THEN brush$ = "U7R7D7L7"
IF a$ = "q" OR a$ = "Q" THEN q = 1
IF a$ = "w" OR a$ = "W" THEN q = 0
IF a$ = "O" OR a$ = "o" THEN GOSUB openfile
IF randc = 1 THEN c = INT(RND * 15) + 1
IF q = 1 THEN GOTO SKIP
PSET (x, y), c
DRAW brush$
GOTO 1
SKIP:
PSET (x, y), 0
DRAW "U1R1D1L1"
PSET (x, y), 12
DRAW "U1R1D1L1"
LOOP
UP:
y = y - 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
DOWN:
y = y + 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
LEFT:
x = x - 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
RIGHT:
x = x + 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
UPLEFT:
y = y - 1
x = x - 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
UPRIGHT:
y = y - 1
x = x + 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
DOWNLEFT:
y = y + 1
x = x - 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
DOWNRIGHT:
y = y + 1
x = x + 1
IF q = 0 THEN PRINT #1, "PSET ("; x; ","; y; "),"; c; ":DRAW"; CHR$(34); brush$; CHR$(34)
RETURN
COLUP:
IF c >= 15 THEN RETURN
c = c + 1
RETURN
COLDOWN:
IF c <= 0 THEN RETURN
c = c - 1
RETURN
openfile:
3
CLOSE
CLOSE
CLOSE
CLOSE
CLS
PRINT "Open What File?"
ON ERROR GOTO 3
INPUT ">", file2$
file$ = file$ + ".Bas"
CLS
PRINT "Loading File..."
CHAIN file2$
END

