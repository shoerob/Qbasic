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
 CLS
 SCREEN 12
 ax% = 0
 Mouse ax%, bx%, cx%, dx%

 IF ax% THEN
	PRINT bx%; "button mouse found."
	ELSE
	PRINT "Mouse driver not found."
 END IF
 ax% = 1
 Mouse ax%, bx%, cx%, dx%
 DO
 ax% = 3
 Mouse ax%, bx%, cx%, dx%
 LOCATE 3, 1
 b1% = (bx% AND 1) <> 0
 b2% = (bx% AND 2) <> 0
 Key$ = INKEY$
 butx = 100
 buty = 100
 Butx1 = 100
 Buty1 = 100
 butlen = 100
 butwid = 100
 LINE (butx, buty)-(Butx1 + butlen, Buty1 + butwid)
 IF b1% = -1 AND dx% > buty AND dx% < Buty1 + butwid AND cx% < Butx1 + butlen AND cx% > butx THEN BEEP
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

