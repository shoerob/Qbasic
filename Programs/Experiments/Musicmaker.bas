OPEN "C:\Temp.bas" FOR OUTPUT AS #1
2
CLS
PRINT "Qbasic Music Man"
PRINT "<1> Set Tempo"
PRINT "<2> Set Octive"
PRINT "<3> Set Song"
PRINT "<4> Play Song"
PRINT "<5> Exit"
INPUT ">", a$
IF a$ = "1" THEN GOTO tempo
IF a$ = "2" THEN GOTO octive
IF a$ = "3" THEN GOTO song
IF a$ = "4" THEN GOTO SAVE
IF a$ = "5" THEN GOTO DONE ELSE 1
tempo:
PRINT "What Tempo?"
PRINT "32-255"
INPUT ">", tempo
IF tempo > 255 THEN GOTO tempo
IF tempo < 32 THEN GOTO tempo
GOTO 1
octive:
PRINT "What Octive?"
PRINT "0-6"
INPUT ">", oct
IF oct > 6 THEN GOTO octive
IF oct < 0 THEN GOTO octive
GOTO 1
song:
PRINT "Letters A-G"
PRINT "[- Flat][+ Sharp][1 HoleNote][2 HalfNote][3 QuarterNote][4 EigthNote]"
PRINT "[5 SixteenthNote][6 3ScndNote]"
INPUT ">", notes$
GOTO 1
SAVE:
CHAIN "C:\Temp.bas"
CHAIN "C:\Music.bas"
GOTO 2
DONE:
CLOSE
END
'Save Part
1
PRINT #1, "PLAY "; CHR$(34); "o"; oct; "t"; tempo; notes$; CHR$(34)
GOTO 2




