Hit1 = 0
pla = 1
shipa1$ = "…ÕÕÕÕª"
shipa2$ = "–≠‹‹≠–"

shipb1$ = "““ﬂﬂ““"
shipb2$ = "∫Œ——Œ∫"
shipb3$ = "” ¿Ÿ Ω"

shipc1$ = "ùÕÕÕù"

shipd1$ = " À——À"
shipd2$ = "  √¥  "

shipe1$ = "÷¬¬∑"
shipe2$ = "»——º"
shipe3$ = "…œœª"
shipe4$ = "”¡¡Ω"

SCREEN 12
1
CLS
LOCATE 1, 1: PRINT "Battle Ships V1.0"
LOCATE 2, 1: PRINT "<1>2 Player Game"
LOCATE 3, 1: PRINT "<2>2 Player Serial Game"
LOCATE 4, 1: PRINT "<3>Quit"
LOCATE 5, 1: INPUT ">", a$
IF a$ = "1" THEN GOTO Ply2sm
IF a$ = "2" THEN GOTO ply2ser
IF a$ = "3" THEN GOTO Done ELSE 1

Ply2sm:
PRINT "Whats Player 1's Name?"
INPUT ">", ply1$
PRINT "Whats Player 2's Name?"
INPUT ">", ply2$
CLS
COLOR 13
LOCATE 1, 1: PRINT ply1$; " Vs. "; ply2$
BEEP
COLOR 10
INPUT "Press Enter", a$
CLS
GETSHIP:
      X = 1
      Y = 1
 DO
 a$ = INKEY$
 IF a$ = CHR$(0) + "H" THEN GOSUB UP
 IF a$ = CHR$(0) + "P" THEN GOSUB down
 IF a$ = CHR$(0) + "K" THEN GOSUB left
 IF a$ = CHR$(0) + "M" THEN GOSUB right
 IF a$ = "C" OR a$ = "c" THEN GOSUB ChooseShip
 IF a$ = CHR$(32) THEN GOSUB Placeship
 IF a$ = "D" OR a$ = "d" THEN GOTO donewship
 COLOR 14
 LOCATE 26, 1: PRINT "Player"; pla; ": Place Your Ships X:"; X; "Y:"; Y
 LOCATE 27, 1: PRINT "<[C]hoose Ship> <[SPACE]Place Ship> <[D]one> <Ship: "; ship$; ">"
 COLOR 7
 LOCATE X, Y: PRINT "€"

IF ship1 = 1 THEN LOCATE Shipa1x, shipa1y: PRINT shipa1$
IF ship1 = 1 THEN LOCATE shipa2x, shipa2y: PRINT shipa2$

 IF ship2 = 1 THEN LOCATE shipb1x, shipb1y: PRINT shipb1$
 IF ship2 = 1 THEN LOCATE shipb2x, shipb2y: PRINT shipb2$
 IF ship2 = 1 THEN LOCATE shipb3x, shipb3y: PRINT shipb3$
 
  IF ship3 = 1 THEN LOCATE shipc1x, shipc1y: PRINT shipc1$
  
   IF ship4 = 1 THEN LOCATE shipd1x, shipd1y: PRINT shipd1$
   IF ship4 = 1 THEN LOCATE shipd2x, shipd2y: PRINT shipd2$
  
    IF ship5 = 1 THEN LOCATE shipe1x, shipe1y: PRINT shipe1$
    IF ship5 = 1 THEN LOCATE shipe2x, shipe2y: PRINT shipe2$
    IF ship5 = 1 THEN LOCATE shipe3x, shipe3y: PRINT shipe3$
    IF ship5 = 1 THEN LOCATE shipe4x, shipe4y: PRINT shipe4$
  





 LOOP

UP:
 IF X = 1 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  X = X - 1
   RETURN

down:
 IF X = 25 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  X = X + 1
   RETURN

left:
 IF Y = 1 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  Y = Y - 1
   RETURN

right:
 IF Y = 80 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  Y = Y + 1
   RETURN

ChooseShip:
2
CLS
COLOR 14
PRINT "What Ship?"
COLOR 10
IF ship1 = 0 THEN PRINT "<1> …ÕÕÕÕª Battle Cruiser"
IF ship1 = 0 THEN PRINT "    –≠‹‹≠– "
IF ship1 = 0 THEN PRINT
IF ship2 = 0 THEN PRINT "<2> ““ﬂﬂ““ Distroyer"
IF ship2 = 0 THEN PRINT "    ∫Œ——Œ∫"
IF ship2 = 0 THEN PRINT "    ” ¿Ÿ Ω "
IF ship3 = 0 THEN PRINT "<3> ùÕÕÕù Satallite Distroyer"
IF ship4 = 0 THEN PRINT "<4> À——À Star Fighter"
IF ship4 = 0 THEN PRINT "     √¥  "
IF ship5 = 0 THEN PRINT "<5> ÷¬¬∑"
IF ship5 = 0 THEN PRINT "    »——º Babylon"
IF ship5 = 0 THEN PRINT "    …œœª"
IF ship5 = 0 THEN PRINT "    ”¡¡Ω "
IF ships = 0 THEN INPUT ">", a$

IF ship1 = 1 THEN GOTO 5
IF a$ = "1" THEN ship = 1: ship$ = "Battle Cruiser": CLS : RETURN
5
IF ship2 = 1 THEN GOTO 6
IF a$ = "2" THEN ship = 2: ship$ = "Distroyer": CLS : RETURN
6
IF ship3 = 1 THEN GOTO 7
IF a$ = "3" THEN ship = 3: ship$ = "Sat Distroyer": CLS : RETURN
7
IF ship4 = 1 THEN GOTO 8
IF a$ = "4" THEN ship = 4: ship$ = "Star Fighter": CLS : RETURN
8
IF ship5 = 1 THEN GOTO 9
IF a$ = "5" THEN ship = 5: ship$ = "Babylon": CLS : RETURN
9
IF ship1 = 1 AND ship2 = 1 AND ship3 = 1 AND ship4 = 1 AND ship5 = 1 THEN CLS : BEEP: RETURN
GOTO 2
Placeship:
     IF ship = 1 THEN LOCATE X, Y: PRINT shipa1$: Shipa1x = X: shipa1y = Y: ship1 = 1
     IF ship = 1 THEN LOCATE X + 1, Y: PRINT shipa2$: shipa2x = X + 1: shipa2y = Y: ship1 = 1
   
    IF ship = 2 THEN LOCATE X, Y: PRINT shipb1$: shipb1x = X: shipb1y = Y: ship2 = 1
    IF ship = 2 THEN LOCATE X + 1, Y: PRINT shipb2$: shipb2x = X + 1: shipb2y = Y: ship2 = 1
   IF ship = 2 THEN LOCATE X + 2, Y: PRINT shipb3$: shipb3x = X + 2: shipb3y = Y: ship2 = 1
  
   IF ship = 3 THEN LOCATE X, Y: PRINT shipc1$: shipc1x = X: shipc1y = Y: ship3 = 1
 
  IF ship = 4 THEN LOCATE X, Y: PRINT shipd1$: shipd1x = X: shipd1y = Y: ship4 = 1
  IF ship = 4 THEN LOCATE X + 1, Y: PRINT shipd2$: shipd2x = X + 1: shipd2y = Y: ship4 = 1

 IF ship = 5 THEN LOCATE X, Y: PRINT shipe1$: shipe1x = X: shipe1y = Y: ship5 = 1
 IF ship = 5 THEN LOCATE X + 1, Y: PRINT shipe2$: shipe2x = X + 1: shipe2y = Y: ship5 = 1
 IF ship = 5 THEN LOCATE X + 2, Y: PRINT shipe3$: shipe3x = X + 2: shipe3y = Y: ship5 = 1
 IF ship = 5 THEN LOCATE X + 3, Y: PRINT shipe4$: shipe4x = X + 3: shipe4y = Y: ship5 = 1
 RETURN






donewship:
IF ship1 = 0 OR ship2 = 0 OR ship3 = 0 OR ship4 = 0 OR ship5 = 0 THEN BEEP: END
donewship = donewship + 1
IF donewship = 1 THEN GOTO Saveinfoforplayer1
IF donewship = 2 THEN GOTO saveinfoforplayer2
END




Saveinfoforplayer1:
OPEN "PLAYER1.DAT" FOR OUTPUT AS #1
PRINT #1, ply1$
PRINT #1, Shipa1x
PRINT #1, shipa1y
PRINT #1, shipa2x
PRINT #1, shipa2y
PRINT #1, shipb1x
PRINT #1, shipb1y
PRINT #1, shipb2x
PRINT #1, shipb2y
PRINT #1, shipb3x
PRINT #1, shipb3y
PRINT #1, shipc1x
PRINT #1, shipc1y
PRINT #1, shipd1x
PRINT #1, shipd1y
PRINT #1, shipd2x
PRINT #1, shipd2y
PRINT #1, shipe1x
PRINT #1, shipe1y
PRINT #1, shipe2x
PRINT #1, shipe2y
PRINT #1, shipe3x
PRINT #1, shipe3y
PRINT #1, shipe4x
PRINT #1, shipe4y
CLOSE
ship1 = 0
ship2 = 0
ship3 = 0
ship4 = 0
ship5 = 0
CLS
pla = 2
GOTO GETSHIP:

saveinfoforplayer2:
OPEN "PLAYER2.DAT" FOR OUTPUT AS #1
PRINT #1, ply2$
PRINT #1, Shipa1x
PRINT #1, shipa1y
PRINT #1, shipa2x
PRINT #1, shipa2y
PRINT #1, shipb1x
PRINT #1, shipb1y
PRINT #1, shipb2x
PRINT #1, shipb2y
PRINT #1, shipb3x
PRINT #1, shipb3y
PRINT #1, shipc1x
PRINT #1, shipc1y
PRINT #1, shipd1x
PRINT #1, shipd1y
PRINT #1, shipd2x
PRINT #1, shipd2y
PRINT #1, shipe1x
PRINT #1, shipe1y
PRINT #1, shipe2x
PRINT #1, shipe2y
PRINT #1, shipe3x
PRINT #1, shipe3y
PRINT #1, shipe4x
PRINT #1, shipe4y
CLOSE
ship1 = 0
ship2 = 0
ship3 = 0
ship4 = 0
ship5 = 0
CLS
GOTO ALLSHIPPLace














ALLSHIPPLace:
CLS
OPEN "PLAYER1.DAT" FOR INPUT AS #1
OPEN "PLAYER2.DAT" FOR INPUT AS #2
'25
INPUT #1, name1$
INPUT #2, name2$
INPUT #1, S1a1x
INPUT #1, S1a1y
INPUT #1, S1a2x
INPUT #1, S1a2y
INPUT #1, S1b1x
INPUT #1, S1b1y
INPUT #1, S1b2x
INPUT #1, S1b2y
INPUT #1, S1b3x
INPUT #1, S1b3y
INPUT #1, S1c1x
INPUT #1, S1c1y
INPUT #1, S1d1x
INPUT #1, S1d1y
INPUT #1, S1d2x
INPUT #1, S1d2y
INPUT #1, S1e1x
INPUT #1, S1e1y
INPUT #1, S1e2x
INPUT #1, S1e2y
INPUT #1, S1e3x
INPUT #1, S1e3y
INPUT #1, S1e4x
INPUT #1, S1e4y

INPUT #2, S2a1x
INPUT #2, S2a1y
INPUT #2, S2a2x
INPUT #2, S2a2y
INPUT #2, S2b1x
INPUT #2, S2b1y
INPUT #2, S2b2x
INPUT #2, S2b2y
INPUT #2, S2b3x
INPUT #2, S2b3y
INPUT #2, S2C1X
INPUT #2, S2C1Y
INPUT #2, S2d1x
INPUT #2, S2d1y
INPUT #2, S2d2x
INPUT #2, S2d2y
INPUT #2, S2e1x
INPUT #2, S2e1y
INPUT #2, S2e2x
INPUT #2, S2e2y
INPUT #2, S2e3x
INPUT #2, S2e3y
INPUT #2, S2e4x
INPUT #2, S2e4y
CLOSE #1
CLOSE #2



















go = 1

50
DO
IF go = 1 THEN namego$ = name1$
IF go = 2 THEN namego$ = name2$
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN GOSUB UP2
IF a$ = CHR$(0) + "P" THEN GOSUB down2
IF a$ = CHR$(0) + "K" THEN GOSUB left2
IF a$ = CHR$(0) + "M" THEN GOSUB right2
IF a$ = CHR$(32) THEN GOSUB FIRE
COLOR 10
LOCATE 26, 1: PRINT "<[SPACE] FIRE> X:"; X; "Y:"; Y
LOCATE 27, 1: PRINT "<"; namego$; ">"
COLOR 10
LOCATE X, Y: PRINT "˛"
IF Hit1 >= 1 AND go = 1 THEN LOCATE H1X1, h1y1: PRINT "˜"
IF Hit1 >= 2 AND go = 1 THEN LOCATE H1X2, h1y2: PRINT "˜"
IF Hit1 >= 3 AND go = 1 THEN LOCATE H1X3, h1y3: PRINT "˜"
IF Hit1 >= 4 AND go = 1 THEN LOCATE H1X4, h1y4: PRINT "˜"
IF Hit1 >= 5 AND go = 1 THEN LOCATE H1X5, h1y5: PRINT "˜"
IF Hit1 >= 6 AND go = 1 THEN LOCATE H1X6, h1y6: PRINT "˜"
IF Hit1 >= 7 AND go = 1 THEN LOCATE H1X7, h1y7: PRINT "˜"
IF Hit1 >= 8 AND go = 1 THEN LOCATE H1X8, h1y8: PRINT "˜"
IF Hit1 >= 9 AND go = 1 THEN LOCATE H1X9, h1y9: PRINT "˜"
IF Hit1 >= 10 AND go = 1 THEN LOCATE H1X10, h1y10: PRINT "˜"
IF Hit1 >= 11 AND go = 1 THEN LOCATE H1X11, h1y11: PRINT "˜"
IF Hit1 >= 12 AND go = 1 THEN LOCATE H1X12, H1Y12: PRINT "˜"
IF Hit1 >= 13 AND go = 1 THEN LOCATE H1X13, h1y13: PRINT "˜"
IF Hit1 >= 14 AND go = 1 THEN LOCATE H1X14, h1y14: PRINT "˜"
IF Hit1 >= 15 AND go = 1 THEN LOCATE H1X15, h1y15: PRINT "˜"
IF Hit1 >= 16 AND go = 1 THEN LOCATE H1X16, h1y16: PRINT "˜"
IF Hit1 >= 17 AND go = 1 THEN LOCATE H1X17, h1y17: PRINT "˜"
IF Hit1 >= 18 AND go = 1 THEN LOCATE H1X18, h1y18: PRINT "˜"
IF Hit1 >= 19 AND go = 1 THEN LOCATE H1X19, h1y19: PRINT "˜"
IF Hit1 >= 20 AND go = 1 THEN LOCATE H1X20, h1y20: PRINT "˜"
IF Hit1 >= 21 AND go = 1 THEN LOCATE H1X21, h1y21: PRINT "˜"
IF Hit1 >= 22 AND go = 1 THEN LOCATE H1X22, h1y22: PRINT "˜"
IF Hit1 >= 23 AND go = 1 THEN LOCATE H1X23, h1y23: PRINT "˜"
IF Hit1 >= 24 AND go = 1 THEN LOCATE H1X24, H1Y24: PRINT "˜"

LOOP

UP2:
 IF X = 1 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  X = X - 1
   RETURN

down2:
 IF X = 25 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  X = X + 1
   RETURN

left2:
 IF Y = 1 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  Y = Y - 1
   RETURN

right2:
 IF Y = 80 THEN RETURN
 COLOR 0
 LOCATE X, Y: PRINT "€"
  Y = Y + 1
   RETURN




FIRE:
IF go = 1 THEN GOTO PLAYER1SHOOT
IF go = 2 THEN GOTO PLAYER2SHOOT
BEEP
PRINT "Error!!!!"
END






PLAYER1SHOOT:
go = 2
'Ship 3
CLS
IF X = S2C1X AND Y = S2C1Y THEN BEEP: GOTO Hit1:
IF X = S2C1X AND Y = S2C1Y + 1 THEN BEEP: GOTO Hit1:
IF X = S2C1X AND Y = S2C1Y + 2 THEN BEEP: GOTO Hit1:
IF X = S2C1X AND Y = S2C1Y + 3 THEN BEEP: GOTO Hit1: 
IF X = S2C1X AND Y = S2C1Y + 4 THEN BEEP: GOTO Hit1:
'Ship 3

RETURN
Hit1:
Hit1 = Hit1 + 1
LOCATE X, Y: PRINT "˜"
IF Hit1 = 1 THEN H1X1 = X: h1y1 = Y
IF Hit1 = 2 THEN H1X2 = X: h1y2 = Y
IF Hit1 = 3 THEN H1X3 = X: h1y3 = Y
IF Hit1 = 4 THEN H1X4 = X: h1y4 = Y
IF Hit1 = 5 THEN H1X5 = X: h1y5 = Y
IF Hit1 = 6 THEN H1X6 = X: h1y6 = Y
IF Hit1 = 7 THEN H1X7 = X: h1y7 = Y
IF Hit1 = 8 THEN H1X8 = X: h1y8 = Y
IF Hit1 = 9 THEN H1X9 = X: h1y9 = Y
IF Hit1 = 10 THEN H1X10 = X: h1y10 = Y
IF Hit1 = 11 THEN H1X11 = X: h1y11 = Y
IF Hit1 = 12 THEN H1X12 = X: H1Y12 = Y
IF Hit1 = 13 THEN H1X13 = X: h1y13 = Y
IF Hit1 = 14 THEN H1X14 = X: h1y14 = Y
IF Hit1 = 15 THEN H1X15 = X: h1y15 = Y
IF Hit1 = 16 THEN H1X16 = X: h1y16 = Y
IF Hit1 = 17 THEN H1X17 = X: h1y17 = Y
IF Hit1 = 18 THEN H1X18 = X: h1y18 = Y
IF Hit1 = 19 THEN H1X19 = X: h1y19 = Y
IF Hit1 = 20 THEN H1X20 = X: h1y20 = Y
IF Hit1 = 21 THEN H1X21 = X: h1y21 = Y
IF Hit1 = 22 THEN H1X22 = X: h1y22 = Y
IF Hit1 = 23 THEN H1X23 = X: h1y23 = Y
IF Hit1 = 24 THEN H1X24 = X: H1Y24 = Y


RETURN

PLAYER2SHOOT:
go = 1
RETURN







ply2ser:
Done:
END








