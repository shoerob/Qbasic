DEFINT A-Z ' All variables are integers
TYPE RegType
      ax    AS INTEGER
      bx    AS INTEGER
      cx    AS INTEGER
      dx    AS INTEGER
      bp    AS INTEGER
      si    AS INTEGER
      di    AS INTEGER
      flags AS INTEGER
 END TYPE
 DECLARE SUB INTERRUPT (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)
 DECLARE SUB Mouse (ax%, bx%, cx%, dx%) ' Our mouse routine
 DECLARE SUB DrawPic (piclength, picwidth, picye, picxe)
SCREEN 12
DATA 00,00,00,00,15,00,00,00,00
DATA 00,00,00,00,15,00,00,00,00
DATA 00,00,00,00,15,00,00,00,00
DATA 00,00,00,00,12,00,00,00,00
DATA 15,15,15,12,00,12,15,15,15
DATA 00,00,00,00,12,00,00,00,00
DATA 00,00,00,00,15,00,00,00,00
DATA 00,00,00,00,15,00,00,00,00
DATA 00,00,00,00,15,00,00,00,00
piclength = 9
picwidth = 9
picye = 1
picxe = 1
CALL DrawPic(piclength, picwidth, picye, picxe)
DIM SoftShoe(1 TO 675)
GET (1, 40)-(40, 1), SoftShoe
PUT (50, 1), SoftShoe

 CLS
 ax% = 0
 Mouse ax%, bx%, cx%, dx%
 IF ax% THEN
	PRINT bx%; "button mouse found."
	ELSE
	' Mouse not found, tell user.
	PRINT "Mouse driver not found."
 END IF
 ax% = 1
 Mouse ax%, bx%, cx%, dx%
 SCREEN 12

 DO
 ax% = 3
 Mouse ax%, bx%, cx%, dx%
LOCATE 3, 1
 PUT (cx%, dx%), SoftShoe
 PRINT USING "Graphical position X:### Y:###"; cx%; dx%
 PRINT USING "Text position      X:### Y:###"; cx% \ 8; dx% \ 8
 b1% = (bx% AND 1) <> 0
 b2% = (bx% AND 2) <> 0
 PRINT "Button1:"; b1%
 PRINT "Button2:"; b2%
Key$ = INKEY$
 LOOP UNTIL Key$ > ""

SUB DrawPic (piclength, picwidth, picye, picxe)
picy = picye
picx = picxe
DO UNTIL picy = picwidth + picye
READ piccolor
PSET (picx, picy), piccolor
picx = picx + 1
IF picx = piclength + picxe THEN picx = picxe: picy = picy + 1
LOOP
IF picx = 130 THEN END
END SUB

 ' The following sub makes the call easier to use
 SUB Mouse (ax%, bx%, cx%, dx%)

	 DIM inregs AS RegType
	 DIM outregs AS RegType

	 ' Load values into declared type
	 inregs.ax = ax%
	 inregs.bx = bx%
	 inregs.cx = cx%
	 inregs.dx = dx%

	 ' Make the call
	 INTERRUPT &H33, inregs, outregs

	 ' Retrieve values back into variables
	 ax% = outregs.ax
	 bx% = outregs.bx
	 cx% = outregs.cx
	 dx% = outregs.dx

 END SUB

