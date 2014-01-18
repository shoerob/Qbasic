CLOSE

'Startup###############################
OPEN "dirs.dat" FOR INPUT AS #2
INPUT #2, EDITUSER$
INPUT #2, USERNUM$: INPUT #2, USERNUM$: INPUT #2, USERNUM$
INPUT #2, PASSWORDS$
INPUT #2, birthday$
INPUT #2, ACCESS$
INPUT #2, ADDRESS$
CLOSE #2
GETUSER:
OPEN EDITUSER$ FOR INPUT AS #1
'######################################
INPUT #1, user1$
INPUT #1, user2$
INPUT #1, user3$
INPUT #1, user4$
INPUT #1, user5$
INPUT #1, user6$
INPUT #1, user7$
INPUT #1, user8$
INPUT #1, user9$
INPUT #1, user10$
INPUT #1, user11$
INPUT #1, user12$
INPUT #1, user13$
INPUT #1, user14$
INPUT #1, user15$
INPUT #1, user16$
INPUT #1, user17$
INPUT #1, user18$
INPUT #1, user19$
INPUT #1, user20$
INPUT #1, user21$
INPUT #1, user22$
INPUT #1, user23$
INPUT #1, user24$
INPUT #1, user25$
INPUT #1, user26$
INPUT #1, user27$
INPUT #1, user28$
INPUT #1, user29$
INPUT #1, user30$
INPUT #1, user31$
INPUT #1, user32$
INPUT #1, user33$
INPUT #1, user34$
INPUT #1, user35$
INPUT #1, user36$
INPUT #1, user37$
INPUT #1, user38$
INPUT #1, user39$
INPUT #1, user40$
CLOSE #1


doNewinpt:
USERLIST:
CLS
COLOR 10
PRINT "Make Sure That Caps Lock Is On!!"
PRINT "Users:"
COLOR 12
PRINT "<01>"; user1$; " <02>"; user2$; " <03>"; user3$; " <04>"; user4$; " <05>"; user5$
PRINT "<06>"; user6$; " <07>"; user7$; " <08>"; user8$; " <09>"; user9$; " <10>"; user10$
PRINT "<11>"; user11$; " <12>"; user12$; " <13>"; user13$; " <14>"; user14$; " <15>"; user15$
PRINT "<16>"; user16$; " <17>"; user17$; " <18>"; user18$; " <19>"; user19$; " <20>"; user20$
PRINT "<21>"; user21$; " <22>"; user22$; " <23>"; user23$; " <24>"; user24$; " <25>"; user25$
PRINT "<26>"; user26$; " <27>"; user27$; " <28>"; user28$; " <29>"; user29$; " <30>"; user30$
PRINT "<31>"; user31$; " <32>"; user32$; " <33>"; user33$; " <34>"; user34$; " <35>"; user35$
PRINT "<36>"; user36$; " <37>"; user37$; " <38>"; user38$; " <39>"; user39$; " <40>"; user40$
PRINT "<41>QUIT USER EDIT V1.0"
COLOR 14
INPUT "EDIT WHICH USER?:", USERedNUM
IF USERedNUM = 41 THEN GOTO DONE
IF USERedNUM < 1 THEN GOTO USERLIST
IF USERedNUM > 40 THEN GOTO USERLIST
GOTO EDUSER
END





EDUSER:
CLOSE
CLOSE
OPEN EDITUSER$ FOR INPUT AS #1
CLS
del = 0
      DO
      INPUT #1, usr$
      LOCATE 1, 1: PRINT "USER:"; usr$; "                 "
      del = del + 1
      IF del = USERedNUM THEN GOTO 100
LOOP
100 CLOSE #1
IF usr$ = "NONE" THEN GOTO nouser
GOTO edituserid




nouser:
CLS
COLOR 2
PRINT "Do you wish to add a new user?"
COLOR 14
INPUT ">", A$
IF A$ = "Y" OR A$ = "y" THEN GOTO edituserid
IF A$ = "N" OR A$ = "n" THEN GOTO USERLIST
GOTO nouser

DONE:
CLS
PRINT "Thankyou for using USER EDIT V1.0"
END


edituserid:
   '(REMEMBER THESE VARIABLES    >USERedNUM< & >USR$<
  
   CLS
   '************************ OPEN USERS INFORMATION****************
   PRINT "Opening User Information..."
   del = 0
   OPEN ACCESS$ FOR INPUT AS #1
   DO UNTIL del = USERedNUM
   del = del + 1
   INPUT #1, acs
   LOOP
   CLOSE #1
  
   OPEN PASSWORDS$ FOR INPUT AS #1
   del = 0
   DO UNTIL del = USERedNUM
   del = del + 1
   INPUT #1, PASS$
   LOOP
   CLOSE #1
  
   OPEN ADDRESS$ FOR INPUT AS #1
   del = 0
   DO UNTIL del = USERedNUM
   del = del + 1
   INPUT #1, adr$
   LOOP
   CLOSE #1

   OPEN birthday$ FOR INPUT AS #1
   del = 0
   DO UNTIL del = USERedNUM
   del = del + 1
   INPUT #1, birth$
   LOOP
   CLOSE #1
   '***************************************************************
  
EDITU:
CLS

PRINT "USER NUMBER: "; USERedNUM
COLOR 10: PRINT "USER ID: "; usr$
PRINT "PASSWORD: "; PASS$
PRINT "ACCESS: "; acs
PRINT "ADDRESS: "; adr$
PRINT "BIRTHDATE: "; birth$
COLOR 14
PRINT "<1> Change User Id."
PRINT "<2> Change User Password"
PRINT "<3> Change User Access"
PRINT "<4> Change User Address"
PRINT "<5> Change User Birthday"
PRINT "<6> Quit To Main User List"
INPUT ">", A$
IF A$ = "1" THEN GOTO CHANGEUSERNAME
IF A$ = "2" THEN GOTO CHANGEUSERPASS
IF A$ = "3" THEN GOTO CHANGEACCESS
IF A$ = "4" THEN GOTO CHANGEAddress
IF A$ = "5" THEN GOTO CHANGEUSERBIRTH
IF A$ = "6" THEN GOTO QTMUL
GOTO EDITU

'******************************CHANGE USER PROPERTIES*****************
CHANGEAddress:
PRINT "Address: "; adr$
PRINT "FORMAT:\  STREET_NUMBER+ZIP_CODE+CITY+STATE"
INPUT "Change User Address To What?:", adr$
GOTO EDITU

CHANGEACCESS:
PRINT "ACCESS: "; acs
INPUT "Change User Access To What?:", acs
GOTO EDITU

CHANGEUSERNAME:
PRINT "USER ID: "; usr$
INPUT "Change User Id To What?:", usr$
GOTO EDITU

CHANGEUSERPASS:
PRINT "PASSWORD: "; PASS$
INPUT "Change User Password To What?:", PASS$
GOTO EDITU

CHANGEUSERBIRTH:
PRINT "BIRTHDAY: "; birth$
PRINT "FORMAT: MM/DD/YY"
INPUT "Change User Birthdate To What?:", birth$
GOTO EDITU
'********************************************************************

QTMUL:
CLS
PRINT "Do you wish to save changes?"
INPUT ">", A$
IF A$ = "y" OR A$ = "Y" THEN GOTO save
IF A$ = "Y" OR A$ = "y" THEN GOTO USERLIST
GOTO QTMUL


save:
'**********************PASSWORDS****************
OPEN PASSWORDS$ FOR INPUT AS #1
OPEN "TEMP.DAT" FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, PASS1$
IF del = USERedNUM THEN PASS1$ = PASS$
PRINT #2, PASS1$
LOOP
CLOSE #1
CLOSE #2
OPEN "TEMP.DAT" FOR INPUT AS #1
OPEN PASSWORDS$ FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, PASS1$
PRINT #2, PASS1$
LOOP
CLOSE #1
CLOSE #2
'*********************************************************
'**********************names*****************************
OPEN EDITUSER$ FOR INPUT AS #1
OPEN "TEMP.DAT" FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, USR1$
IF del = USERedNUM THEN USR1$ = usr$
PRINT #2, USR1$
LOOP
CLOSE #1
CLOSE #2
OPEN "TEMP.DAT" FOR INPUT AS #1
OPEN EDITUSER$ FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, USR1$
PRINT #2, USR1$
LOOP
CLOSE #1
CLOSE #2
'********************************************************


'************************BIRTHS***************************

OPEN birthday$ FOR INPUT AS #1
OPEN "TEMP.DAT" FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, bday$
IF del = USERedNUM THEN bday$ = birth$
PRINT #2, bday$
LOOP
CLOSE #1
CLOSE #2
OPEN "TEMP.DAT" FOR INPUT AS #1
OPEN birthday$ FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, bday$
PRINT #2, bday$
LOOP
CLOSE #1
CLOSE #2
'*****************************************************************
'**********************************ACCESS*************************
OPEN ACCESS$ FOR INPUT AS #1
OPEN "TEMP.DAT" FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, acs1
IF del = USERedNUM THEN acs1 = acs
PRINT #2, acs1
LOOP
CLOSE #1
CLOSE #2
OPEN "TEMP.DAT" FOR INPUT AS #1
OPEN ACCESS$ FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, acs1
PRINT #2, acs1
LOOP
CLOSE #1
CLOSE #2
'************************************************************
'******************************ADDRESS***********************
OPEN ADDRESS$ FOR INPUT AS #1
OPEN "TEMP.DAT" FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, adr1$
IF del = USERedNUM THEN adr1$ = adr$
PRINT #2, adr1$
LOOP
CLOSE #1
CLOSE #2
OPEN "TEMP.DAT" FOR INPUT AS #1
OPEN ADDRESS$ FOR OUTPUT AS #2
del = 0
DO UNTIL del = 40
del = del + 1
INPUT #1, adr1$
PRINT #2, adr1$
LOOP
CLOSE #1
CLOSE #2


acs = 0
acs1 = 0
birth$ = ""
bday$ = ""
usr$ = ""
PASS1$ = ""
PASS$ = ""
adr$ = ""
adr1$ = ""
GOTO GETUSER

