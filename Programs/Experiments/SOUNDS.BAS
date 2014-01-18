SCREEN 12
DO
Snd = INT(RND * 1000) + 100
SOUND Snd, 1
CLS
IF lop > 1 THEN LOCATE 11, 25: PRINT "SoftShoe Productions Presents:"
IF lop > 40 THEN LOCATE 12, 34: PRINT "Lamb Hunt 3"
IF lop > 50 THEN LOCATE 13, 30.5: PRINT "By Robert Shoemate"
IF lop > 70 THEN GOTO StartGame
lop = lop + 1
LOOP

StartGame:
CLS
lop = 0
DO UNTIL INKEY$ <> ""
Snd = INT(RND * 1000) + 100
SOUND Snd, 1
CLS
PRINT "Lamb Hunt 3 Version 3.1"
PRINT "Objective:"
PRINT "Destroy All Lambs That Approach Your Assigned Area."
PRINT "If you are unsuccesful your planet will be destroyed,"
PRINT "leaving only Lambs behind."
LOOP
BEEP
CLS

LOCATE 1, 1: PRINT "Lamb Hunt 3"


DO
LOOP



