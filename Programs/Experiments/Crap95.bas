SCREEN 12
LOCATE 15, 20: PRINT "Welcome to crappo's 95!!!"
PLAY "ADDAC"
LOCATE 16, 20: PRINT "The crappiest non window program around!!!"
LOCATE 17, 20: PRINT "(But alot better then microcrap's windows 95!!)"
CLS
PRINT "Loading."
SLEEP 1
CLS
PRINT "Loading.."
SLEEP 1
CLS
PRINT "Loading..."
SLEEP 1
CLS
PRINT "Loading...."
SLEEP 1
CLS
PRINT "Loading....."
SLEEP 1
CLS
PRINT "Loading.....Done!!"
BEEP
SLEEP 1
CLS
PRINT "Crappo's 95"
PRINT "****************************"
PRINT "*(1)New drawer  (2)options *"
PRINT "*(3)Transfer file          *"
PRINT "*(4)open drawer (5)contents*"
PRINT "*(6)place file  (7)Erase   *"
PRINT "****************************"
LOCATE 2, 29: PRINT "Your drawers!!"
LOCATE 3, 29: PRINT a$
LOCATE 4, 29: PRINT b$

LOCATE 8, 1: INPUT menue$
IF menue$ = "1" THEN PRINT "What drawer number will this be 1,2,3,4,5,6,7,8,9?": GOTO 10
10 INPUT drawer$
PRINT "What will it be called?"
INPUT name$
IF menue$ = "1" THEN a$ = name$: LOCATE 3, 29: PRINT a$: GOTO 20
IF menue$ = "2" THEN b$ = name$: LOCATE 4, 29: PRINT b$: GOTO 20
20




