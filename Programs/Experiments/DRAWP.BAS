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
 LOCATE 1, 1: PRINT "Exit"
 DO
 ax% = 3
 Mouse ax%, bx%, cX%, DX%
 LOCATE 3, 1
 b1% = (bx% AND 1) <> 0
 B2% = (bx% AND 2) <> 0
 Key$ = INKEY$
 butx = 1
 buty = 1
 Butx1 = 1
 Buty1 = 1
 butlen = 30
 butwid = 10
 'LINE (butx, buty)-(Butx1 + butlen, Buty1 + butwid)
 PSET (0, 0), 10
 DRAW "D12R32U12L32"
 IF b1% = -1 AND DX% > buty AND DX% < Buty1 + butwid AND cX% < Butx1 + butlen AND cX% > butx THEN END
 IF B2% = -1 AND col < 16 THEN col = col + 1: IF col > 15 THEN col = 1
 bsize = 10
 QX% = cX%
 ZX% = DX%
 IF b1% = -1 THEN CIRCLE (QX%, ZX% - 1), bsize, col
 LOCATE 1, 6: PRINT "Color:"; col
 LOOP UNTIL Key$ > ""

 ' ------------------------------------------------------------------------
'PRINT "Button1:"; b1%
'PRINT "Button2:"; b2%
 ' Get the mouse status
' Show mouse position
' PRINT USING "Graphical position X:### Y:###"; cx%; dx%
 ' Show text mouse position
' PRINT USING "Text position      X:### Y:###"; cx% \ 8; dx% \ 8
' NOTES

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

