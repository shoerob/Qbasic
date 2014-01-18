CLS
CLS
PRINT "Please insert your Wrath Of Zeban Data Disk in the a: drive and press [ENTER]"
INPUT ">PRESS ENTER<", Enter$
CHDIR "A:\DATA"



start:
  CLS
   COLOR 2: LOCATE 1, 30: PRINT "The Wrath Of Zeban"
    COLOR 10: LOCATE 2, 29: PRINT "By>: Robert Shoemate"
     COLOR 12: LOCATE 3, 30: PRINT "<1> 1 Player Game"
    COLOR 12: LOCATE 4, 27: PRINT "<2> 2 Player Modem Game"
   COLOR 12: LOCATE 5, 34: PRINT "<3> Quit"
  COLOR 14: LOCATE 6, 37: INPUT ">", Cmd$
    IF Cmd$ = "1" THEN GOTO ONEPLAYER
    IF Cmd$ = "2" THEN GOTO TWOPLAYER
    IF Cmd$ = "3" THEN GOTO QUIT
GOTO start:


'ONE PLAYER GAME STARTS HERE!
ONEPLAYER:
CLS
PRINT "Load Character?(Y/N)"
INPUT ">", Cmd$
IF Cmd$ = "Y" OR Cmd$ = "y" THEN GOTO LOADCHARACTER
IF Cmd$ = "N" OR Cmd$ = "n" THEN GOTO ONEPLAYERBEGIN
PRINT "New Character?(Y/N)"


LOADCHARACTER:
 PRINT "Whats Your Character Name?"
 INPUT name$
 OPEN "A:\saved\charact.dat" FOR INPUT AS #1

 DO UNTIL l = 8
 INPUT #1, name1$
 IF name1$ = name$ THEN GOTO LOADSTATS
 l = l + 1
 LOOP
CLS
PRINT "There Is No Character Under That Name!!"
INPUT ">PRESS ENTER<", Enter$
CLOSE #1
GOTO ONEPLAYER:



LOADSTATS:
char$ = "A:\stats\"
CLOSE #1
OPEN char$ FOR INPUT AS #1






ONEPLAYERBEGIN:







TWOPLAYER:
END




QUIT:
CLS
PRINT "Thanks For Playing"
END

