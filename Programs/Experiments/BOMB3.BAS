DECLARE SUB pictures ()
DECLARE SUB DrawPic (piclength, picwidth, picye, picxe)
DIM SoftShoe(1 TO 675)
DIM Ball(1 TO 675)
DIM Lamb1(1 TO 675)
DIM Lamb2(1 TO 675)
DIM Gun(1 TO 675)
'**********************
'Picture Variables:
'SoftShoe
'Ball
'lamb1
'Lamb2
'Gun
'*********************
CLS
PRINT "What Screen Mode?:"
PRINT "(1)Cga (2)Vga"
DO UNTIL mode <> 0
mode1$ = INKEY$
IF mode1$ = "1" THEN mode = 1
IF mode1$ = "2" THEN mode = 13
LOOP

SCREEN mode
GOSUB pictureData
GOSUB picturedraw
LOCATE 3, 7: PRINT "Done Loading..."
BEEP
CLS




ctrly = 160
ctrlx = 280 / 2
PUT (ctrlx, ctrly), Gun
'****************************** MAIN LAMB HUNT 3 LOOP **********************
DO
move$ = INKEY$
IF move$ = CHR$(0) + "M" THEN GOSUB ControlRight
IF move$ = CHR$(0) + "K" THEN GOSUB ControlLeft
IF move$ = "s" OR move$ = "S" THEN GOSUB Status
GOSUB Lamb1
LOOP

Lamb1:
RETURN

Status:
SCREEN 12
SCREEN 0
PRINT "Status:"
PRINT "+-+-+-+-+-+-+-+-+-+-+-+-+"
PRINT "Kills:"; kills
PRINT "Escapes:"; escapes
PRINT "Shots Fired:"; Fired
PRINT "Aim Percentage:"; AimPerc
PRINT "+-+-+-+-+-+-+-+-+-+-+-+-+"
PRINT "Lamb Hunt 3 Version .8b"
PRINT "CopyRight (C)1997 Wicked Productions"
PRINT "Desighned And Programmed By: Robert Shoemate"
PRINT "Press Any Key To Continue..."
DO UNTIL INKEY$ <> ""
LOOP

SCREEN mode
RETURN

ControlLeft:
IF ctrlx = 25 THEN RETURN
ctrlx = ctrlx - 5
CLS
PUT (ctrlx, ctrly), Gun
RETURN

ControlRight:
IF ctrlx = 280 THEN RETURN
ctrlx = ctrlx + 5
CLS
PUT (ctrlx, ctrly), Gun
RETURN




END
'Get picture info off the screen
pictureData:
'*** Colors ***
'00 - black                    08 - dark grey
'01 - dark blue                09 - light blue
'02 - dark green               10 - light green
'03 - dark cyan                11 - light cyan
'04 - dark red                 12 - light red
'05 - dark purple              13 - magenta
'06 - orange brown             14 - yellow
'07 - grey                     15 - bright white
DATA 15,15,15,00,15,15,15,00,15,15,15,00,15,15,15,00,00,15,15,15,00,15,00,00,00,15,15,15,00,15,15,15
DATA 15,00,00,00,15,00,15,00,15,00,00,00,00,15,00,00,00,15,00,00,00,15,00,00,00,15,00,15,00,15,00,00
DATA 15,15,15,00,15,00,15,00,15,15,15,00,00,15,00,00,00,15,15,15,00,15,15,15,00,15,00,15,00,15,15,00
DATA 00,00,15,00,15,00,15,00,15,00,00,00,00,15,00,00,00,00,00,15,00,15,00,15,00,15,00,15,00,15,00,00
DATA 15,15,15,00,15,15,15,00,15,00,00,00,00,15,00,00,00,15,15,15,00,15,00,15,00,15,15,15,00,15,15,15
DATA 00,12,15,12,00
DATA 12,12,15,12,12
DATA 15,12,15,12,15
DATA 15,12,15,12,15
DATA 12,12,15,12,12
DATA 00,12,15,12,00
DATA 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
DATA 15,08,08,08,08,08,08,08,08,08,08,08,08,08,00,01,08,08,15
DATA 15,08,08,08,08,08,08,08,08,08,08,08,08,08,00,01,08,08,15
DATA 15,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,15
DATA 15,08,08,08,08,08,08,08,08,08,08,08,08,15,15,15,15,15,15
DATA 15,08,08,08,08,08,08,08,08,08,08,08,08,15,00,00,00,00,00
DATA 15,08,08,15,15,15,15,15,15,15,15,08,08,15,00,00,00,00,00
DATA 15,08,08,15,00,00,00,00,00,00,15,08,08,15,00,00,00,00,00
DATA 15,08,08,15,00,00,00,00,00,00,15,08,08,15,00,00,00,00,00
DATA 15,15,15,15,00,00,00,00,00,00,15,15,15,15,00,00,00,00,00
DATA 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
DATA 15,08,08,01,00,08,08,08,08,08,08,08,08,08,08,08,08,08,15
DATA 15,08,08,01,00,08,08,08,08,08,08,08,08,08,08,08,08,08,15
DATA 15,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,08,15
DATA 15,15,15,15,15,15,08,08,08,08,08,08,08,08,08,08,08,08,15
DATA 00,08,08,08,08,15,08,08,08,08,08,08,08,08,08,08,08,08,15
DATA 00,08,08,00,00,15,08,08,15,15,15,15,15,15,15,15,08,08,15
DATA 00,08,08,00,00,15,08,08,15,00,00,00,00,00,00,15,08,08,15
DATA 00,08,08,00,00,15,08,08,15,00,00,00,00,00,00,15,08,08,15
DATA 00,00,00,00,00,15,15,15,15,00,00,00,00,00,00,15,15,15,15
DATA 00,00,14,14,00,00
DATA 00,14,14,14,14,00
DATA 00,14,14,14,14,00
DATA 14,14,02,02,14,00
DATA 14,02,02,02,02,14
DATA 14,02,02,02,02,14
DATA 14,02,02,02,02,14
DATA 14,02,02,02,02,14
DATA 14,02,02,02,02,14
DATA 14,02,02,02,02,14
DATA 14,02,02,02,02,14
RETURN

picturedraw:
'*******SOFTSHOE PICTURE********
piclength = 32
picwidth = 5
picye = 1
picxe = 1
CALL DrawPic(piclength, picwidth, picye, picxe)
GET (1, 40)-(40, 1), SoftShoe
PUT (50, 1), SoftShoe
'********************************
CLS
'*********BALL PICTURE***********
piclength = 5
picwidth = 6
picye = 1
picxe = 1
CALL DrawPic(piclength, picwidth, picye, picxe)
GET (1, 40)-(40, 1), Ball
PUT (50, 1), Ball
'********************************
CLS
'*******LAMB1 PICTURE********
piclength = 19
picwidth = 10
picye = 1
picxe = 1
CALL DrawPic(piclength, picwidth, picye, picxe)
GET (1, 40)-(40, 1), Lamb1
PUT (50, 1), Lamb1
'********************************
CLS
'*******LAMB1 PICTURE********
piclength = 19
picwidth = 10
picye = 1
picxe = 1
CALL DrawPic(piclength, picwidth, picye, picxe)
GET (1, 40)-(40, 1), Lamb2
PUT (50, 1), Lamb2
'********************************
CLS
'*******GUN PICTURE********
piclength = 6
picwidth = 11
picye = 1
picxe = 1
CALL DrawPic(piclength, picwidth, picye, picxe)
GET (1, 40)-(40, 1), Gun
PUT (50, 1), Gun
'********************************
LOCATE 1, 7: PRINT "Lamb Hunt 3"
LOCATE 2, 7: PRINT "Loading Images..."
RETURN


EndGame:
END



SUB DrawPic (piclength, picwidth, picye, picxe)
LOCATE 1, 7: PRINT "Lamb Hunt 3"
LOCATE 2, 7: PRINT "Loading Images..."
picy = picye
picx = picxe
PSET (0, 0), 10
DRAW "d41 r41 u41 l41"
DO UNTIL picy = picwidth + picye
READ piccolor
PSET (picx, picy), piccolor
picx = picx + 1
IF picx = piclength + picxe THEN picx = picxe: picy = picy + 1
LOOP
END SUB

SUB pictures

END SUB

