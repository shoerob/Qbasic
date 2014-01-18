DEFINT A-Z ' All variables are integers
TYPE RegType
      ax    AS INTEGER
      bx    AS INTEGER
      cX    AS INTEGER
      DX    AS INTEGER
      bp    AS INTEGER
      si    AS INTEGER
      di    AS INTEGER
      flags AS INTEGER
 END TYPE
 DECLARE SUB INTERRUPT (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)
 DECLARE SUB Mouse (ax%, bx%, cX%, DX%) ' Our mouse routine
 CLS
 SCREEN 12
 OPEN "title.sho" FOR INPUT AS #1
 DO
 INPUT #1, qx%
 INPUT #1, zx%
 INPUT #1, csize
 INPUT #1, col
 CIRCLE (qx%, zx%), csize, col
 LOOP UNTIL EOF(1)
 CLOSE #1

PRINT "SoftShoe Animation Maker Version 1.0TesT"
PRINT "Programmed By: Robert Shoemate"
PRINT "Help:"
PRINT "+/- CircleBrush Size"
PRINT "RMB Circle Color"
PRINT "LMB Draw Circle"
PRINT "I will add *.sho"
INPUT "Save As?(*.sho)>", file2$
file2$ = file2$ + ".sho"
OPEN file2$ FOR OUTPUT AS #2
 CLS
 ax% = 0
 Mouse ax%, bx%, cX%, DX%

 IF ax% THEN
	PRINT bx%; "button mouse found."
	ELSE
	PRINT "Mouse driver not found."
 END IF
 ax% = 1
 Mouse ax%, bx%, cX%, DX%
 CLS
 DO
 LOCATE 1, 1: PRINT "Exit"
 ax% = 3
 Mouse ax%, bx%, cX%, DX%
 LOCATE 3, 1
 b1% = (bx% AND 1) <> 0
 B2% = (bx% AND 2) <> 0
 key$ = INKEY$
 IF key$ = "=" THEN csize = csize + 1
 IF key$ = "+" THEN csize = csize + 1
 IF key$ = "-" THEN IF csize > 0 THEN csize = csize - 1
 butx = 1
 buty = 1
 Butx1 = 1
 Buty1 = 1
 butlen = 30
 butwid = 10
 'LINE (butx, buty)-(Butx1 + butlen, Buty1 + butwid)
 PSET (0, 0), 10
 DRAW "D12R32U12L32"
 IF b1% = -1 AND DX% > buty AND DX% < Buty1 + butwid AND cX% < Butx1 + butlen AND cX% > butx THEN CLOSE #1: CLOSE #2: END
 IF B2% = -1 AND col < 16 THEN col = col + 1: IF col > 15 THEN col = 1
 qx% = cX%
 zx% = DX%
 IF b1% = -1 THEN CIRCLE (qx%, zx% - 12), csize, col: GOSUB SavData
 LOCATE 1, 6: PRINT "Color:"; col; "Bsize:"; csize; "Frames:"; lines
 LOOP

 ' ------------------------------------------------------------------------
'PRINT "Button1:"; b1%
'PRINT "Button2:"; b2%
 ' Get the mouse status
' Show mouse position
' PRINT USING "Graphical position X:### Y:###"; cx%; dx%
 ' Show text mouse position
' PRINT USING "Text position      X:### Y:###"; cx% \ 8; dx% \ 8
' NOTES

SavData:
 PRINT #2, qx%
 PRINT #2, zx% - 12
 PRINT #2, csize
 PRINT #2, col
 lines = lines + 1
 RETURN

 ' The following sub makes the call easier to use
 SUB Mouse (ax%, bx%, cX%, DX%)

	 DIM inregs AS RegType
	 DIM outregs AS RegType

	 ' Load values into declared type
	 inregs.ax = ax%
	 inregs.bx = bx%
	 inregs.cX = cX%
	 inregs.DX = DX%

	 ' Make the call
	 INTERRUPT &H33, inregs, outregs

	 ' Retrieve values back into variables
	 ax% = outregs.ax
	 bx% = outregs.bx
	 cX% = outregs.cX
	 DX% = outregs.DX

 END SUB

