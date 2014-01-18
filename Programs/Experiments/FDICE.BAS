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
PRINT " Format C:"
PRINT "By: Robert Shoemate(I know, I Was Bored, Nothing Else To Do."
PRINT "(Forgive Me.)"
PRINT "Do you forgive the filthy bastard?"
INPUT "(y/n)>", a$
IF a$ = "y" THEN GOTO ok
IF a$ = "n" THEN GOTO loser
ok:
PRINT "Thankyou and have a nice day."
END

loser:
PRINT "You are now infected with...."
SLEEP 1
PRINT "with..........."
PRINT "OH NO!"
PRINT "Its The Usless Fake Virus!"
PRINT "You Have Just Wasted 1.23Kb of Hdrive SpacE!!!"
END



