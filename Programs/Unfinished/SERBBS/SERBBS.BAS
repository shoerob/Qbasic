CLS
PRINT "SerBbs Loading..."
'STARTUP*****************************************************************
ON ERROR GOTO error1
OPEN "COM2:19200,N,8,1,CD0,CS0,DS0,OP0,RS,TB2048,RB2048" FOR RANDOM AS #1
OPEN "dirs.dat" FOR INPUT AS #2
INPUT #2, edituser$
INPUT #2, editdoor$
INPUT #2, editfile$
CLOSE #2
x = 3
RANDOMIZE TIMER
'************************************************************************


CLS

Start:
'############################SYSOP OPTIONS###############################
DO
c = INT(RND * 15) + 1
COLOR 14
LOCATE 1, 1: PRINT "##################"
COLOR c
LOCATE 2, 1: PRINT "Sysop Control V1.0"
COLOR 10
LOCATE 3, 1: PRINT "< >Wait For Calls>"
LOCATE 4, 1: PRINT "< >Edit Users>"
LOCATE 5, 1: PRINT "< >Edit Doors>"
LOCATE 6, 1: PRINT "< >Edit Files>"
LOCATE 7, 1: PRINT "< >Local Logon>"
LOCATE 8, 1: PRINT "< >Exit Serbbs>"
COLOR 14
LOCATE 9, 1: PRINT "#################"
COLOR 4: LOCATE x, 2: PRINT "þ"
 a$ = INKEY$
   IF a$ = CHR$(0) + "H" THEN IF x > 3 THEN x = x - 1
   IF a$ = CHR$(0) + "P" THEN IF x < 8 THEN x = x + 1
   IF a$ = CHR$(13) THEN GOSUB COMMAND
LOOP


COMMAND:
  IF x = 3 THEN GOSUB waitfcalls
    IF x = 4 THEN GOSUB edituser
      IF x = 5 THEN GOSUB editdoors
     IF x = 6 THEN GOSUB Editfiles
  IF x = 7 THEN GOSUB localog
 IF x = 8 THEN GOTO done
RETURN

edituser:
RETURN

editdoors:
RETURN

Editfiles:
RETURN

localog:
RETURN

waitfcalls:
RETURN






GOTO error1

'########################################################################


CLS


'************************Caller*LOOP*************************************
DO





LOOP












'ERRORS AND ENDINGS***********************************************
error1:
  CLS
  PRINT "You have discovered a fault in this program please contact the proggramer."
  CLS
END

done:
  CLS
  PRINT "Serbbs by: Robert Shoemate"
  END
'********************************************************************8


