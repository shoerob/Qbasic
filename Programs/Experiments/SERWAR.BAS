'SerWar By Robert Shoemate/Cow Eater
'must be loaded on 2 computers w/Serial Cable attached to both to work
'Use arrows to move face and press SPACE to attack other player whil on
'top of thier Guy.

'!!!This Was Written As An Experemental Serial Cable Game in 1996 by
'Robert Shoemate Age:13



life = 50
life2 = 50
SCREEN 12
x = 1
y = 1
x1 = 1
y1 = 1



'     Change COM2 To Com1 or Whatever port Serial Cable is on
OPEN "COM2:9600,N,8,1,CD0,CS0,DS0,OP0,RS,TB2048,RB2048" FOR RANDOM AS #1
2
CLS
PRINT "Are You Player<1 Or 2>?"
INPUT ">", lay
IF lay = 1 THEN play1$ = CHR$(1): play2$ = CHR$(2): GOTO 1
IF lay = 2 THEN play1$ = CHR$(2): play2$ = CHR$(1): GOTO 1
GOTO 2
1
CLS
play1:
CLS
DO
LOCATE 27, 1: PRINT said$
PRINT #1, "Narn": INPUT #1, wt$
IF wt$ = "SAY" THEN GOSUB TALK
IF wt$ = "UP" THEN COLOR 0: LOCATE x1, y1: PRINT " ": COLOR 12: x1 = x1 - 1
IF wt$ = "DOWN" THEN COLOR 0: LOCATE x1, y1: PRINT " ": COLOR 12: x1 = x1 + 1
IF wt$ = "LEFT" THEN COLOR 0: LOCATE x1, y1: PRINT " ": COLOR 12: y1 = y1 - 1
IF wt$ = "RIGHT" THEN COLOR 0: LOCATE x1, y1: PRINT " ": COLOR 12: y1 = y1 + 1
IF wt$ = "SHOT" THEN GOSUB BLEEP
IF wt$ = "DIE" THEN GOTO WIN:
IF wt$ = "LIFEUP" THEN life = life - 1: life2 = life2 + 1
IF life = 0 THEN GOTO Dead
a$ = INKEY$
IF a$ = "T" OR a$ = "t" THEN GOSUB TALK1
IF a$ = CHR$(0) + "H" THEN GOSUB UP
IF a$ = CHR$(0) + "P" THEN GOSUB Down
IF a$ = CHR$(0) + "K" THEN GOSUB Left
IF a$ = CHR$(0) + "M" THEN GOSUB Right
IF a$ = CHR$(32) THEN GOSUB SHOOT
IF a$ = CHR$(13) THEN END
10
COLOR 12
LOCATE 26, 30: PRINT "YourLife:"; life; " OpponentLife:"; life2
COLOR 10
LOCATE x, y: PRINT play1$
COLOR 13
LOCATE x1, y1: PRINT play2$
LOOP
UP:
IF x = 1 THEN RETURN
COLOR 0
LOCATE x, y: PRINT " "
x = x - 1
PRINT #1, "UP"
RETURN
Down:
IF x = 25 THEN RETURN
COLOR 0
LOCATE x, y: PRINT " "
x = x + 1
PRINT #1, "DOWN"
RETURN
Left:
IF y = 1 THEN RETURN
COLOR 0
LOCATE x, y: PRINT " "
y = y - 1
PRINT #1, "LEFT"
RETURN
Right:
IF y = 80 THEN RETURN
COLOR 0
LOCATE x, y: PRINT " "
y = y + 1
PRINT #1, "RIGHT"
RETURN
TALK:
LOCATE 28, 1: PRINT "The Other Play Is Typing A Message..."
INPUT #1, said$
LOCATE 28, 1: PRINT "                                                "
RETURN
TALK1:
PRINT #1, "SAY"
LOCATE 28, 1: INPUT "Say?>", wht$
PRINT #1, wht$
RETURN
SHOOT:
PRINT #1, "SHOT"
LOCATE x, y: PRINT "!"
FOR snd = 100 TO 102
SOUND snd, snd / 1000
NEXT snd
IF x = x1 AND y = y1 THEN life = life + 1: life2 = life2 - 1 ELSE RETURN
PRINT #1, "KILL"
PRINT #1, "LIFEUP"
RETURN
BLEEP:
LOCATE x1, y1: PRINT "!"
FOR snd = 100 TO 102
SOUND snd, snd / 1000
NEXT snd
COLOR 14
RETURN
Dead:
CLS
PRINT #1, "DIE"
PRINT "You Have Died..."
BEEP
PRINT "Press A Key!"
INPUT "", a$
CLOSE
END
WIN:
CLS
CLOSE
PRINT "You Have Won!!!"
BEEP
INPUT "Press A Key!", a$
END



