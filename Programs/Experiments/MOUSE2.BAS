DECLARE SUB SetScreenMode (Scrn%, Xmin%, Ymin%, Xmax%, Ymax%)
DECLARE SUB SetPointer (Pointer%)
DECLARE SUB MouseDriver (AX%, bx%, CX%, DX%)
DECLARE FUNCTION MouseInit% ()
DECLARE SUB MouseShow (Show%)
DECLARE SUB Mousestatus (lb%, rb%, xmouse%, ymouse%)
DIM SHARED mouse$
DIM Pointer%(1 TO 100)

REM ***** Setup Mouse Routines **********************
RESTORE
mouse$ = SPACE$(57)
FOR I% = 1 TO 57
  READ A$
  H$ = CHR$(VAL("&H" + A$))
  MID$(mouse$, I%, 1) = H$
NEXT I%
DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B
DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53
DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F
DATA 8B,5E,06,89,17,5D,CA,08,00
MS% = MouseInit%
IF NOT MS% THEN
  PRINT "Mouse not found": LET AMOUSE$ = "NO":
END IF
PRINT "Mouse found and initialized": LET AMOUSE$ = "YES"
REM *****************************************************

SCREEN 9: CLS

 LINE (0, 0)-(5, 0), 7      '\_ Pointer Graphic
 LINE (0, 0)-(0, 5), 7
 LINE (0, 0)-(10, 10), 7
 GET (0, 0)-(10, 10), Pointer%  '/

CLS                 '**** open Screen *****
Show% = 0           '**** Makes Mouse Pointer Visible ****
MouseShow (Show%)


REM ******* SetDefaults
BrushSize = 1: col = 1: Pointer = 1
LINE (0, 20)-(629, 339), 5, B



DO
   
   LOCATE 1, 1: PRINT "X="; xmouse%, "Y="; ymouse%, "Brush = "; BrushSize, "Color = "; col
  
   key$ = INKEY$                                   '}
   IF key$ = "+" AND col < 17 THEN col = col + 1   '} **** Change Brush Color
   IF key$ = "-" AND col > -1 THEN col = col - 1   '} **** Change Brush Color
   IF key$ = " " THEN GOSUB OptionsMenu

   IF lb% = 0 THEN PUT (xmouse%, ymouse%), Pointer%, XOR
   Mousestatus lb%, rb%, xmouse%, ymouse%
        IF xmouse% > 629 THEN xmouse% = 629   '}
        IF ymouse% < 20 THEN ymouse% = 20     ' } **** Mouse Limits Set in ScreenMode
        IF ymouse% > 339 THEN ymouse% = 339   '}
   IF lb% = 0 THEN PUT (xmouse%, ymouse%), Pointer%
    
   IF rb% = -1 THEN BrushSize = BrushSize + 1: FOR Delay = 1 TO 800: NEXT Delay
   IF rb% = -1 AND BrushSize = 7 THEN BrushSize = 1

   IF lb% = -1 AND BrushSize >= 1 THEN LINE (oldx%, oldy%)-(xmouse%, ymouse%), col
   IF lb% = -1 AND BrushSize >= 2 THEN LINE (oldx%, oldy% + 1)-(xmouse%, ymouse% + 1), col
   IF lb% = -1 AND BrushSize >= 3 THEN LINE (oldx%, oldy% - 1)-(xmouse%, ymouse% - 1), col
   IF lb% = -1 AND BrushSize >= 4 THEN LINE (oldx%, oldy% + 2)-(xmouse%, ymouse% + 2), col
   IF lb% = -1 AND BrushSize >= 5 THEN LINE (oldx%, oldy% - 2)-(xmouse%, ymouse% - 2), col
   IF lb% = -1 AND BrushSize >= 6 THEN LINE (oldx%, oldy% + 3)-(xmouse%, ymouse% + 3), col
   
   IF lb% = -1 AND BrushSize >= 2 THEN LINE (oldx% + 1, oldy%)-(xmouse% + 1, ymouse%), col
   IF lb% = -1 AND BrushSize >= 3 THEN LINE (oldx% - 1, oldy%)-(xmouse% - 1, ymouse%), col
   IF lb% = -1 AND BrushSize >= 4 THEN LINE (oldx% + 2, oldy%)-(xmouse% + 2, ymouse%), col
   IF lb% = -1 AND BrushSize >= 5 THEN LINE (oldx% - 2, oldy%)-(xmouse% - 2, ymouse%), col
   IF lb% = -1 AND BrushSize >= 6 THEN LINE (oldx% + 3, oldy%)-(xmouse% + 3, ymouse%), col
   
   oldx% = xmouse% '} **** Remember Current x Coords
   oldy% = ymouse% '} **** Remember Current y Coords

LOOP

OptionsMenu:

SUB MouseDriver (AX%, bx%, CX%, DX%)
  DEF SEG = VARSEG(mouse$)
  mouse% = SADD(mouse$)
  CALL Absolute(AX%, bx%, CX%, DX%, mouse%)
END SUB

SUB MouseHide
 AX% = 2
 MouseDriver AX%, 0, 0, 0
END SUB

FUNCTION MouseInit%
  AX% = 0
  MouseDriver AX%, 0, 0, 0
  MouseInit% = AX%

END FUNCTION

SUB MousePut
  AX% = 4
  CX% = X%
  DX% = Y%
  MouseDriver AX%, 0, CX%, DX%
END SUB

SUB MouseShow (Show%)
  AX% = Show%
  MouseDriver AX%, 0, 0, 0
END SUB

SUB Mousestatus (lb%, rb%, xmouse%, ymouse%)
  AX% = 3
  MouseDriver AX%, bx%, CX%, DX%
  lb% = ((bx% AND 1) <> 0)
  rb% = ((bx% AND 2) <> 0)
  xmouse% = CX%
  ymouse% = DX%
END SUB

SUB SetPointer (Pointer%)
 
END SUB

SUB SetScreenMode (Scrn%, Xmin%, Ymin%, Xmax%, Ymax%)
 CLS
 Show% = 1
 MouseShow (Show%)
 LOCATE 1, 10: PRINT "ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป "
 LOCATE 2, 10: PRINT "บ Please Select A Screen Mode From One Of The Following บ"
 LOCATE 3, 10: PRINT "ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ "

 LOCATE 6, 20: PRINT "Screen 0"
 LOCATE 7, 20: PRINT "Screen 1"
 LOCATE 8, 20: PRINT "Screen 2"
 LOCATE 9, 20: PRINT "Screen 3"
 LOCATE 10, 20: PRINT "Screen 4"
 LOCATE 11, 20: PRINT "Screen 5"
 LOCATE 12, 20: PRINT "Screen 6"
 LOCATE 13, 20: PRINT "Screen 7"
 LOCATE 14, 20: PRINT "Screen 8"
 LOCATE 15, 20: PRINT "Screen 9"
 LOCATE 16, 20: PRINT "Screen 10"
 LOCATE 17, 20: PRINT "Screen 11"
 LOCATE 18, 20: PRINT "Screen 12"
 LOCATE 19, 20: PRINT "Screen 13"


END SUB

