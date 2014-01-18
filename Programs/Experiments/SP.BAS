SCREEN 12
x = 1
y = 1
boxy = 1
boxx = 1
LINE (1, 1)-(195, 1)
LINE (1, 1)-(1, 196)
LINE (195, 196)-(1, 196)
LINE (196, 196)-(196, 1)
l = 1
DO UNTIL l > 180
l = l + 15
LINE (1, l)-(196, l)
LOOP
l = 1
DO UNTIL l > 180
l = l + 15
LINE (l, 1)-(l, 195)
LOOP
GOSUB colors






1
IF scrn = 13 THEN SCREEN 12: scrn = 12
DO
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN GOSUB UP
IF a$ = CHR$(0) + "K" THEN GOSUB LEFT
IF a$ = CHR$(0) + "M" THEN GOSUB RIGHT
IF a$ = CHR$(0) + "P" THEN GOSUB DOWN
IF a$ = CHR$(32) THEN GOTO fill
IF a$ = "C" OR a$ = "c" THEN GOSUB colors
PSET (x, y), 10: DRAW "D15r15u15l15"
LOCATE 25, 1: PRINT "Box:"; boxx; ","; boxy
LOCATE 26, 1: PRINT "SoFtShoE Sprite Draw VeRsIoN 1.0B"
IF a$ = "S" OR a$ = "s" THEN lod = 1: GOTO pcolor
IF a$ = "V" OR a$ = "v" THEN SCREEN 13: scrn = 13: GOTO pcolor
IF a$ = "H" OR a$ = "h" THEN GOSUB HELP
IF a$ = "Q" OR a$ = "q" THEN GOTO QUIT
LOOP


UP:
IF y = 1 THEN RETURN
y = y - 15
GOSUB redraw
boxy = boxy - 1
RETURN

DOWN:
IF y = 181 THEN RETURN
y = y + 15
GOSUB redraw
boxy = boxy + 1
RETURN

LEFT:
IF x = 1 THEN RETURN
x = x - 15
GOSUB redraw
boxx = boxx - 1
RETURN

RIGHT:
IF x = 181 THEN RETURN
x = x + 15
GOSUB redraw
boxx = boxx + 1
RETURN

fill:
del = 1
yb = y + 1
xb = x + 1
DO UNTIL del = 15
COLOR c
LINE (xb, yb)-(xb + 14, yb)
yb = yb + 1
'xb = xb + 1
del = del + 1
LOOP
GOTO BLOCKINFO


colors:
LOCATE 15, 1: PRINT "Colors:"
LOCATE 16, 1: COLOR 1: PRINT "1:Dblue "; : COLOR 2: PRINT "2:Dgreen "; : COLOR 3: PRINT "3:DLblue "
LOCATE 17, 1: COLOR 4: PRINT "4:Dred "; : COLOR 5: PRINT "5:Dpurple "; : COLOR 6: PRINT "6:Brown "
LOCATE 18, 1: COLOR 7: PRINT "7:Lgrey "; : COLOR 8: PRINT "8:Dgrey "; : COLOR 9: PRINT "9:LDblue "
LOCATE 19, 1: COLOR 10: PRINT "10:Lgreen "; : COLOR 11: PRINT "11:Lblue "; : COLOR 12: PRINT "12:Lred "
LOCATE 20, 1: COLOR 13: PRINT "13:Lpurple "; : COLOR 14: PRINT "14:Lyellow "; : COLOR 15: PRINT "15:White "
LOCATE 21, 1: INPUT "ColorNum?>", c
IF c < 0 OR c > 15 THEN GOTO colors
LOCATE 21, 1: PRINT "CurrentColor>"; : COLOR c: PRINT c
GOSUB redraw
RETURN

redraw:
LOCATE 15, 1: PRINT "Colors:"
LOCATE 16, 1: COLOR 1: PRINT "1:Dblue "; : COLOR 2: PRINT "2:Dgreen "; : COLOR 3: PRINT "3:DLblue "
LOCATE 17, 1: COLOR 4: PRINT "4:Dred "; : COLOR 5: PRINT "5:Dpurple "; : COLOR 6: PRINT "6:Brown "
LOCATE 18, 1: COLOR 7: PRINT "7:Lgrey "; : COLOR 8: PRINT "8:Dgrey "; : COLOR 9: PRINT "9:LDblue "
LOCATE 19, 1: COLOR 10: PRINT "10:Lgreen "; : COLOR 11: PRINT "11:Lblue "; : COLOR 12: PRINT "12:Lred "
LOCATE 20, 1: COLOR 13: PRINT "13:Lpurple "; : COLOR 14: PRINT "14:Lyellow "; : COLOR 15: PRINT "15:White "
LOCATE 21, 1: PRINT "CurrentColor>"; : COLOR c: PRINT c

COLOR 1
LINE (1, 1)-(195, 1)
LINE (1, 1)-(1, 196)
LINE (195, 196)-(1, 196)
LINE (196, 196)-(196, 1)
l = 1
DO UNTIL l > 180
l = l + 15
LINE (1, l)-(196, l)
LOOP
l = 1
DO UNTIL l > 180
l = l + 15
LINE (l, 1)-(l, 195)
LOOP
RETURN





BLOCKINFO:
IF boxx = 1 THEN GOTO x1
IF boxx = 2 THEN GOTO x2
IF boxx = 3 THEN GOTO x3
IF boxx = 4 THEN GOTO x4
IF boxx = 5 THEN GOTO x5
IF boxx = 6 THEN GOTO x6
IF boxx = 7 THEN GOTO x7
IF boxx = 8 THEN GOTO x8
IF boxx = 9 THEN GOTO x9
IF boxx = 10 THEN GOTO x10
IF boxx = 11 THEN GOTO x11
IF boxx = 12 THEN GOTO x12
IF boxx = 13 THEN GOTO x13
BEEP
PRINT "Error 1"
END

x1:
IF boxy = 1 THEN x1y1 = c
IF boxy = 2 THEN x1y2 = c
IF boxy = 3 THEN x1y3 = c
IF boxy = 4 THEN x1y4 = c
IF boxy = 5 THEN x1y5 = c
IF boxy = 6 THEN x1y6 = c
IF boxy = 7 THEN x1y7 = c
IF boxy = 8 THEN x1y8 = c
IF boxy = 9 THEN x1y9 = c
IF boxy = 10 THEN x1y10 = c
IF boxy = 11 THEN x1y11 = c
IF boxy = 12 THEN x1y12 = c
IF boxy = 13 THEN x1y13 = c
GOTO DRAWSMALL
RETURN

x2:
IF boxy = 1 THEN x2y1 = c
IF boxy = 2 THEN x2y2 = c
IF boxy = 3 THEN x2y3 = c
IF boxy = 4 THEN x2y4 = c
IF boxy = 5 THEN x2y5 = c
IF boxy = 6 THEN x2y6 = c
IF boxy = 7 THEN x2y7 = c
IF boxy = 8 THEN x2y8 = c
IF boxy = 9 THEN x2y9 = c
IF boxy = 10 THEN x2y10 = c
IF boxy = 11 THEN x2y11 = c
IF boxy = 12 THEN x2y12 = c
IF boxy = 13 THEN x2y13 = c
GOTO DRAWSMALL
RETURN

x3:
IF boxy = 1 THEN x3y1 = c
IF boxy = 2 THEN x3y2 = c
IF boxy = 3 THEN x3y3 = c
IF boxy = 4 THEN x3y4 = c
IF boxy = 5 THEN x3y5 = c
IF boxy = 6 THEN x3y6 = c
IF boxy = 7 THEN x3y7 = c
IF boxy = 8 THEN x3y8 = c
IF boxy = 9 THEN x3y9 = c
IF boxy = 10 THEN x3y10 = c
IF boxy = 11 THEN x3y11 = c
IF boxy = 12 THEN x3y12 = c
IF boxy = 13 THEN x3y13 = c
GOTO DRAWSMALL
RETURN

x4:
IF boxy = 1 THEN x4y1 = c
IF boxy = 2 THEN x4y2 = c
IF boxy = 3 THEN x4y3 = c
IF boxy = 4 THEN x4y4 = c
IF boxy = 5 THEN x4y5 = c
IF boxy = 6 THEN x4y6 = c
IF boxy = 7 THEN x4y7 = c
IF boxy = 8 THEN x4y8 = c
IF boxy = 9 THEN x4y9 = c
IF boxy = 10 THEN x4y10 = c
IF boxy = 11 THEN x4y11 = c
IF boxy = 12 THEN x4y12 = c
IF boxy = 13 THEN x4y13 = c
GOTO DRAWSMALL
RETURN

x5:
IF boxy = 1 THEN x5y1 = c
IF boxy = 2 THEN x5y2 = c
IF boxy = 3 THEN x5y3 = c
IF boxy = 4 THEN x5y4 = c
IF boxy = 5 THEN x5y5 = c
IF boxy = 6 THEN x5y6 = c
IF boxy = 7 THEN x5y7 = c
IF boxy = 8 THEN x5y8 = c
IF boxy = 9 THEN x5y9 = c
IF boxy = 10 THEN x5y10 = c
IF boxy = 11 THEN x5y11 = c
IF boxy = 12 THEN x5y12 = c
IF boxy = 13 THEN x5y13 = c
GOTO DRAWSMALL
RETURN

x6:
IF boxy = 1 THEN x6y1 = c
IF boxy = 2 THEN x6y2 = c
IF boxy = 3 THEN x6y3 = c
IF boxy = 4 THEN x6y4 = c
IF boxy = 5 THEN x6y5 = c
IF boxy = 6 THEN x6y6 = c
IF boxy = 7 THEN x6y7 = c
IF boxy = 8 THEN x6y8 = c
IF boxy = 9 THEN x6y9 = c
IF boxy = 10 THEN x6y10 = c
IF boxy = 11 THEN x6y11 = c
IF boxy = 12 THEN x6y12 = c
IF boxy = 13 THEN x6y13 = c
GOTO DRAWSMALL
RETURN

x7:
IF boxy = 1 THEN x7y1 = c
IF boxy = 2 THEN x7y2 = c
IF boxy = 3 THEN x7y3 = c
IF boxy = 4 THEN x7y4 = c
IF boxy = 5 THEN x7y5 = c
IF boxy = 6 THEN x7y6 = c
IF boxy = 7 THEN x7y7 = c
IF boxy = 8 THEN x7y8 = c
IF boxy = 9 THEN x7y9 = c
IF boxy = 10 THEN x7y10 = c
IF boxy = 11 THEN x7y11 = c
IF boxy = 12 THEN x7y12 = c
IF boxy = 13 THEN x7y13 = c
GOTO DRAWSMALL
RETURN

x8:
IF boxy = 1 THEN x8y1 = c
IF boxy = 2 THEN x8y2 = c
IF boxy = 3 THEN x8y3 = c
IF boxy = 4 THEN x8y4 = c
IF boxy = 5 THEN x8y5 = c
IF boxy = 6 THEN x8y6 = c
IF boxy = 7 THEN x8y7 = c
IF boxy = 8 THEN x8y8 = c
IF boxy = 9 THEN x8y9 = c
IF boxy = 10 THEN x8y10 = c
IF boxy = 11 THEN x8y11 = c
IF boxy = 12 THEN x8y12 = c
IF boxy = 13 THEN x8y13 = c
GOTO DRAWSMALL
RETURN

x9:
IF boxy = 1 THEN x9y1 = c
IF boxy = 2 THEN x9y2 = c
IF boxy = 3 THEN x9y3 = c
IF boxy = 4 THEN x9y4 = c
IF boxy = 5 THEN x9y5 = c
IF boxy = 6 THEN x9y6 = c
IF boxy = 7 THEN x9y7 = c
IF boxy = 8 THEN x9y8 = c
IF boxy = 9 THEN x9y9 = c
IF boxy = 10 THEN x9y10 = c
IF boxy = 11 THEN x9y11 = c
IF boxy = 12 THEN x9y12 = c
IF boxy = 13 THEN x9y13 = c
GOTO DRAWSMALL
RETURN

x10:
IF boxy = 1 THEN x10y1 = c
IF boxy = 2 THEN x10y2 = c
IF boxy = 3 THEN x10y3 = c
IF boxy = 4 THEN x10y4 = c
IF boxy = 5 THEN x10y5 = c
IF boxy = 6 THEN x10y6 = c
IF boxy = 7 THEN x10y7 = c
IF boxy = 8 THEN x10y8 = c
IF boxy = 9 THEN x10y9 = c
IF boxy = 10 THEN x10y10 = c
IF boxy = 11 THEN x10y11 = c
IF boxy = 12 THEN x10y12 = c
IF boxy = 13 THEN x10y13 = c
GOTO DRAWSMALL
RETURN

x11:
IF boxy = 1 THEN x11y1 = c
IF boxy = 2 THEN x11y2 = c
IF boxy = 3 THEN x11y3 = c
IF boxy = 4 THEN x11y4 = c
IF boxy = 5 THEN x11y5 = c
IF boxy = 6 THEN x11y6 = c
IF boxy = 7 THEN x11y7 = c
IF boxy = 8 THEN x11y8 = c
IF boxy = 9 THEN x11y9 = c
IF boxy = 10 THEN x11y10 = c
IF boxy = 11 THEN x11y11 = c
IF boxy = 12 THEN x11y12 = c
IF boxy = 13 THEN x11y13 = c
GOTO DRAWSMALL
RETURN

x12:
IF boxy = 1 THEN x12y1 = c
IF boxy = 2 THEN x12y2 = c
IF boxy = 3 THEN x12y3 = c
IF boxy = 4 THEN x12y4 = c
IF boxy = 5 THEN x12y5 = c
IF boxy = 6 THEN x12y6 = c
IF boxy = 7 THEN x12y7 = c
IF boxy = 8 THEN x12y8 = c
IF boxy = 9 THEN x12y9 = c
IF boxy = 10 THEN x12y10 = c
IF boxy = 11 THEN x12y11 = c
IF boxy = 12 THEN x12y12 = c
IF boxy = 13 THEN x12y13 = c
GOTO DRAWSMALL
RETURN

x13:
IF boxy = 1 THEN x13y1 = c
IF boxy = 2 THEN x13y2 = c
IF boxy = 3 THEN x13y3 = c
IF boxy = 4 THEN x13y4 = c
IF boxy = 5 THEN x13y5 = c
IF boxy = 6 THEN x13y6 = c
IF boxy = 7 THEN x13y7 = c
IF boxy = 8 THEN x13y8 = c
IF boxy = 9 THEN x13y9 = c
IF boxy = 10 THEN x13y10 = c
IF boxy = 11 THEN x13y11 = c
IF boxy = 12 THEN x13y12 = c
IF boxy = 13 THEN x13y13 = c
GOTO DRAWSMALL
RETURN

DRAWSMALL:
pcol = x1y1
DO
PSET (xc, yc), pcol
GOSUB pcolor
yc = yc + 1
LOOP

RETURN

pcolor:
IF lod = 0 THEN OPEN "draw.sho" FOR OUTPUT AS #1
IF lod = 1 THEN lod = 0: INPUT "Filename>", filename$: OPEN filename$ FOR OUTPUT AS #1
PRINT #1, x1y1
PRINT #1, x1y2
PRINT #1, x1y3
PRINT #1, x1y4
PRINT #1, x1y5
PRINT #1, x1y6
PRINT #1, x1y7
PRINT #1, x1y8
PRINT #1, x1y9
PRINT #1, x1y10
PRINT #1, x1y11
PRINT #1, x1y12
PRINT #1, x1y13
'X2
PRINT #1, x2y1
PRINT #1, x2y2
PRINT #1, x2y3
PRINT #1, x2y4
PRINT #1, x2y5
PRINT #1, x2y6
PRINT #1, x2y7
PRINT #1, x2y8
PRINT #1, x2y9
PRINT #1, x2y10
PRINT #1, x2y11
PRINT #1, x2y12
PRINT #1, x2y13
'x3
PRINT #1, x3y1
PRINT #1, x3y2
PRINT #1, x3y3
PRINT #1, x3y4
PRINT #1, x3y5
PRINT #1, x3y6
PRINT #1, x3y7
PRINT #1, x3y8
PRINT #1, x3y9
PRINT #1, x3y10
PRINT #1, x3y11
PRINT #1, x3y12
PRINT #1, x3y13
'x4
PRINT #1, x4y1
PRINT #1, x4y2
PRINT #1, x4y3
PRINT #1, x4y4
PRINT #1, x4y5
PRINT #1, x4y6
PRINT #1, x4y7
PRINT #1, x4y8
PRINT #1, x4y9
PRINT #1, x4y10
PRINT #1, x4y11
PRINT #1, x4y12
PRINT #1, x4y13
'x5
PRINT #1, x5y1
PRINT #1, x5y2
PRINT #1, x5y3
PRINT #1, x5y4
PRINT #1, x5y5
PRINT #1, x5y6
PRINT #1, x5y7
PRINT #1, x5y8
PRINT #1, x5y9
PRINT #1, x5y10
PRINT #1, x5y11
PRINT #1, x5y12
PRINT #1, x5y13
'x6
PRINT #1, x6y1
PRINT #1, x6y2
PRINT #1, x6y3
PRINT #1, x6y4
PRINT #1, x6y5
PRINT #1, x6y6
PRINT #1, x6y7
PRINT #1, x6y8
PRINT #1, x6y9
PRINT #1, x6y10
PRINT #1, x6y11
PRINT #1, x6y12
PRINT #1, x6y13
'x7
PRINT #1, x7y1
PRINT #1, x7y2
PRINT #1, x7y3
PRINT #1, x7y4
PRINT #1, x7y5
PRINT #1, x7y6
PRINT #1, x7y7
PRINT #1, x7y8
PRINT #1, x7y9
PRINT #1, x7y10
PRINT #1, x7y11
PRINT #1, x7y12
PRINT #1, x7y13
'x8
PRINT #1, x8y1
PRINT #1, x8y2
PRINT #1, x8y3
PRINT #1, x8y4
PRINT #1, x8y5
PRINT #1, x8y6
PRINT #1, x8y7
PRINT #1, x8y8
PRINT #1, x8y9
PRINT #1, x8y10
PRINT #1, x8y11
PRINT #1, x8y12
PRINT #1, x8y13
'x9
PRINT #1, x9y1
PRINT #1, x9y2
PRINT #1, x9y3
PRINT #1, x9y4
PRINT #1, x9y5
PRINT #1, x9y6
PRINT #1, x9y7
PRINT #1, x9y8
PRINT #1, x9y9
PRINT #1, x9y10
PRINT #1, x9y11
PRINT #1, x9y12
PRINT #1, x9y13
'x10
PRINT #1, x10y1
PRINT #1, x10y2
PRINT #1, x10y3
PRINT #1, x10y4
PRINT #1, x10y5
PRINT #1, x10y6
PRINT #1, x10y7
PRINT #1, x10y8
PRINT #1, x10y9
PRINT #1, x10y10
PRINT #1, x10y11
PRINT #1, x10y12
PRINT #1, x10y13
'x11
PRINT #1, x11y1
PRINT #1, x11y2
PRINT #1, x11y3
PRINT #1, x11y4
PRINT #1, x11y5
PRINT #1, x11y6
PRINT #1, x11y7
PRINT #1, x11y8
PRINT #1, x11y9
PRINT #1, x11y10
PRINT #1, x11y11
PRINT #1, x11y12
PRINT #1, x11y13
'x12
PRINT #1, x12y1
PRINT #1, x12y2
PRINT #1, x12y3
PRINT #1, x12y4
PRINT #1, x12y5
PRINT #1, x12y6
PRINT #1, x12y7
PRINT #1, x12y8
PRINT #1, x12y9
PRINT #1, x12y10
PRINT #1, x12y11
PRINT #1, x12y12
PRINT #1, x12y13
'X13
PRINT #1, x13y1
PRINT #1, x13y2
PRINT #1, x13y3
PRINT #1, x13y4
PRINT #1, x13y5
PRINT #1, x13y6
PRINT #1, x13y7
PRINT #1, x13y8
PRINT #1, x13y9
PRINT #1, x13y10
PRINT #1, x13y11
PRINT #1, x13y12
PRINT #1, x13y13
CLOSE #1

OPEN "draw.sho" FOR INPUT AS #1

xstat = 250
ystat = 10
IF scrn = 13 THEN xstat = 1: ystat = 1
PICDx = xstat
Picdy = ystat

del = 0
DO UNTIL EOF(1)
INPUT #1, a
PSET (PICDx, Picdy), a
Picdy = Picdy + 1
IF Picdy = ystat + 13 THEN Picdy = ystat: PICDx = PICDx + 1
LOOP
CLOSE #1
IF scrn = 13 THEN SLEEP
xstat = 250
ystat = 10
GOSUB redraw
GOTO 1




HELP:
CLS
COLOR 10
PRINT "SoFtShoE Sprite Draw V1.0B"
PRINT "Programmed By: Robert Shoemate"
PRINT "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
PRINT "'H- Help on commands         `"
PRINT "'S- Save a sprite file       `"
PRINT "'V- View a sprite in vga mode`"
PRINT "'C- Choose brush color       `"
PRINT "'Q- Exit SoFtShoE Sprite Draw`"
PRINT "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
PRINT "------------------------------"
PRINT "'Space- Fill sprite pixel with`"
PRINT "'       Color                 `"
PRINT "'ArrowKeys- Moves the sprite  `"
PRINT "'           brush to another  `"
PRINT "'           location          `"
PRINT "------------------------------"
PRINT "Thankyou for using SoFtShoE Sprite Draw Version 1.0B"
COLOR 4
PRINT "This version includes:"
PRINT "1- Save Feature "
PRINT "2- Color Feature "
PRINT "3- Help Feature "
PRINT "4- Vga mode Feature "
PRINT "5- Fileview Feature "
PRINT "----------Futer versions will include----------"
PRINT "1- Load Feature  2- More Colors 3- Sprite Draw Vga mode "
PRINT "4- Vga mode bug fix 5- Other cool enhancements!"
PRINT "Press any key..."
DO UNTIL INKEY$ <> ""
LOOP
CLS
GOSUB redraw
RETURN



QUIT:
SCREEN 0
PRINT "Thanks for using SoFtShoE Sprite Draw Vesrion 1.0B"
PRINT "By: Robert Shoemate"
END

