
 DEFINT A-Z ' All variables are integers
 ' Example of mouse functions using DOS INT 33h

 ' QB must be started with /L or a library containing the CALL INTERRUPT
 ' routine from QB.LIB

 ' QB.BI contains the data types and declares for CALL INTERRUPT
 ' You must either REM $INCLUDE 'qb.bi' or use the following code instead

 ' This mouse routine was adapted from The BASIC Internet Fanzine by
 ' Peter Cooper of PECO Software and modified by Robert Epps.

 ' Contact Peter at:
 '             Enquiries\support: peter@trenham.demon.co.uk 
 '                  Articles: bmag@trenham.demon.co.uk
 ' Contact me (Robert) at:
 '                      robert@countrysoft.com.au

 ' ----------------------------------------------------------------------

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

 ' Generate a software interrupt, loading all but the segment registers
 '
 DECLARE SUB INTERRUPT (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)

 ' ----------------------------------------------------------------------
 ' Example program continues here

 DECLARE SUB Mouse (ax%, bx%, cx%, dx%) ' Our mouse routine

 CLS
 SCREEN 12

 ' First, initialise the driver
 ax% = 0
 Mouse ax%, bx%, cx%, dx%

 IF ax% THEN
	' Mouse found, tell user what type ( how many buttons )
	PRINT bx%; "button mouse found."
	ELSE
	' Mouse not found, tell user.
	PRINT "Mouse driver not found."
 END IF

 ' Now show the mouse pointer
 ax% = 1
 Mouse ax%, bx%, cx%, dx%

 ' Do something while we try out the mouse
 DO
 ax% = 3
 Mouse ax%, bx%, cx%, dx%
 LOCATE 3, 1
 b1% = (bx% AND 1) <> 0
 b2% = (bx% AND 2) <> 0
 Key$ = INKEY$
 butx = 100
 buty = 100
 PSET (butx, buty), 10
 DRAW "D10r10U10l10"
 IF b1% = -1 AND dx% > buty AND dx% < buty + 10 AND cx% < butx + 10 AND cx% > butx - 10 THEN BEEP
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
' To prevent the mouse pointer from corrupting screen updates it's good
 ' to hide the mouse pointer while your not actually waiting for input.
 ' I would have a GetKey routine while shows the mouse pointer at the start
 ' of the loop which is waiting for a key and hide the mouse after a key
 ' or button has been pressed.

 ' Also, have a flag such as MouseEnabled that you set after the mouse init
 ' routine and put all other mouse routines in an IF MouseEnabled THEN loop
 ' so that you're not calling them for no reason. I think you can have
 ' problems if you call some of the routines when the driver is not present.


 ' The various functions of the mouse routine are listed below. Not all of
 ' the functions are demonstrated in this program.

 ' INPUT          OUTPUT/RESULT

 ' AX = 00        Reset Mouse.
 '                AX = Mouse detected True/False
 '                BX = Number of buttons
 '
 ' AX = 01        Show mouse pointer
 '
 ' AX = 02        Hide mouse pointer
 '
 ' AX = 03        Get mouse position and button status
 '                BX = 0 no buttons down
 '                     1 left button down
 '                     2 right button down
 '                     3 both buttons down
 '                CX = x position
 '                DX = y position
 '
 ' AX = 04        Set mouse position
 ' CX = x pos
 ' DX = y pos
 '
 ' AX = 05        Return button press data ( no example shown )
 ' BX = Button number
 '                AX = Button states
 '                BX = No. of times pressed since last call
 '                CX = Column when last pressed
 '                DX = Row when last pressed
 '
 ' AX = 06        Return button release data ( no example shown )
 ' BX = Button number
 '                AX = Button states
 '                BX = No. of times released since last call
 '                CX = Column when last released
 '                DX = Row when last released
 '
 ' AX = 07        Set upper left range
 ' CX = x1 pos
 ' DX = y1 pos
 '
 ' AX = 08        Set lower right range
 ' CX = X2 pos
 ' DX = Y2 pos
 '
 ' AX = 09        Define graphics cursor ( no example shown )
 ' BX = HotX      Active point of cursor X
 ' CX = HotY      Active point of cursor Y
 ' DX = VARPTR(Shape(1))  Array of shape mask
 ' SG = VARSEG(Shape(1))  Array of shape mask
 '
 ' AX = 0A        Change FG/BG colours of text cursor ( no example shown )
 ' BX = Hardware/Sofware text cursor
 '
 ' Software:
 ' CX = FG colour/screen mask
 ' DX = BG colour/cursor mask
 '
 ' Hardware:
 ' CX = Start scan line
 ' DX = End scan line
 '
 ' AX = 24      Get mouse type/version/IRQ etc ( no example shown )


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

