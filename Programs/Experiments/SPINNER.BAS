SCREEN 12
CLS
d2 = 1000
y29 = 1
DO
IF y29 < 29 THEN COLOR 0: LOCATE 13, y29: PRINT "By: Robert Shoemate": COLOR 12: y29 = y29 + 1: COLOR 10
COLOR 12
LOCATE 13, y29: PRINT "By: Robert Shoemate"
COLOR 10
LOCATE 12, 30: PRINT "\ Lamb Hunt III \"
del = 0
DO UNTIL del = d2
del = del + 1
LOOP
LOCATE 12, 30: PRINT "| Lamb Hunt III |"
del = 0
IF y29 < 29 THEN COLOR 0: LOCATE 13, y29: PRINT "By: Robert Shoemate": COLOR 12: y29 = y29 + 1: COLOR 10
LOCATE 13, y29: PRINT "By: Robert Shoemate"
DO UNTIL del = d2
del = del + 1
LOOP
LOCATE 12, 30: PRINT "/ Lamb Hunt III /"
del = 0
IF y29 < 29 THEN COLOR 0: LOCATE 13, y29: PRINT "By: Robert Shoemate": COLOR 12: y29 = y29 + 1: COLOR 10
LOCATE 13, y29: PRINT "By: Robert Shoemate"
DO UNTIL del = d2
del = del + 1
LOOP
LOCATE 12, 30: PRINT "- Lamb Hunt III -"
del = 0
IF y29 < 29 THEN COLOR 0: LOCATE 13, y29: PRINT "By: Robert Shoemate": COLOR 12: y29 = y29 + 1: COLOR 10
COLOR 12
LOCATE 13, y29: PRINT "By: Robert Shoemate"
DO UNTIL del = d2
del = del + 1
LOOP
COLOR 12
IF y29 < 29 THEN COLOR 0: LOCATE 13, y29: PRINT "By: Robert Shoemate": COLOR 12: y29 = y29 + 1: COLOR 10
LOCATE 13, y29: PRINT "By: Robert Shoemate"
delay = delay + 1
IF delay = 10 THEN GOTO START
LOOP



START:
x = 0
y = 0
delay = 0
del = 0
CLS


DO
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN GOSUB RIGHT
IF a$ = CHR$(0) + "K" THEN GOSUB LEFT
LOOP


RIGHT:
RETURN

LEFT:
RETURN


LAMB:
PSET (lamb2x, lamb2y), 15: DRAW "D12R7U6R9D6R7U11R7U8L11D3L19D3"
RETURN




