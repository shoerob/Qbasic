'Text Typer Engine, By Robert Shoemate
'Commands:
'COLOR, C  :USAGE: DATA COLOR, C :C=1-15 Color Number -Changes Text Color
'XAXIS  :USAGE: DATA XAXIS,X :X=1-25 -Changes The X Axis Location Of The Text
'YAXIS  :USAGE: DATA YAXIS,Y :Y=1-80 -Changes The Y Axis Location Of The Text
'INVALID COMMAND SPACE  :USAGE: DATA SPACE -Adds A Blank Space To The Word Phrase
'RESET  :USAGE: DATA RESET -Resets The Text Variable To Nothing
'DELAY  :USAGE: DATA TDELAY, D :D=1-9999 -Changes The Delay Between Each Letter
'DONE  :USAGE: DATA DONE -ENDS PROGRAM


'This is where you type your text code
DATA TDELAY, 500
DATA XAXIS, 1
DATA YAXIS, 1
DATA COLOR, 12

DATA Y,o,u,r,SPACE,M,i,s,s,i,o,n,":"

DATA DONE

'Do not change this, it is the Engine Code
CLS
DO
SOUND 100, 105 / 1000
READ DATACODE$
IF DATACODE$ = "TDELAY" THEN READ DELAYER: GOTO DONE
IF DATACODE$ = "RESET" THEN TEXT$ = "": GOTO DONE
IF DATACODE$ = "XAXIS" THEN READ X: GOTO DONE
IF DATACODE$ = "YAXIS" THEN READ Y: GOTO DONE
IF DATACODE$ = "COLOR" THEN READ C: COLOR C: GOTO DONE
IF DATACODE$ = "DONE" THEN END
IF DATACODE$ = "" THEN TEXT$ = TEXT$ + " ": GOTO DONE
TEXT$ = TEXT$ + DATACODE$
LOCATE X, Y: PRINT TEXT$
DONE:
delay = 0
DO UNTIL delay = DELAYER
delay = delay + 1
LOOP
LOOP



