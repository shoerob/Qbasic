 SCREEN 12
PRINT "ShoView 1.0"
PRINT "CopyRight(c) SoftShoe"
PRINT "By: Robert Shoemate"
 PRINT "I will add the *.sho"
 INPUT "Load?(*.sho)>", file$
 file$ = file$ + ".sho"
 PRINT "Animation Speed:"
 PRINT "<Higher The Number, The Slower The Animation>"
 INPUT ">", spd
 IF spd < 0 THEN spd = 0
 ON ERROR GOTO erro
 OPEN file$ FOR INPUT AS #1
 CLS
 DO
 GOSUB SPEED
 INPUT #1, qx%
 INPUT #1, zx%
 INPUT #1, csize
 INPUT #1, col
 CIRCLE (qx%, zx%), csize, col
 LOOP UNTIL EOF(1)
 CLOSE #1
 DO UNTIL inkey <> 5
 LOOP
END
SPEED:
del = 0
DO UNTIL del = spd
del = del + 1
LOOP

RETURN



erro:
BEEP
PRINT "Error "; : COLOR 10: PRINT "1"
COLOR 15: PRINT "Invalid File!!"
END

