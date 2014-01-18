DECLARE SUB MouseDriver (AX%, bx%, CX%, DX%)
DECLARE FUNCTION MouseInit% ()
DECLARE SUB mouseshow (show%)
DECLARE SUB mousestatus (lMouse%, RMouse%, xmouse%, ymouse%)
DIM SHARED mouse$




REM ***** Setup Mouse Routines *****
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




SCREEN 12: CLS      '**** open Screen *****
show% = 1           '**** Makes Mouse Pointer Visible ****
mouseshow (show%)

DO
mousestatus LB%, RB%, xmouse%, ymouse%
LOOP

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

SUB mouseshow (show%)
  AX% = show%
  MouseDriver AX%, 0, 0, 0
END SUB

SUB mousestatus (lMouse%, RMouse%, xmouse%, ymouse%)
  AX% = 3
  MouseDriver AX%, bx%, CX%, DX%
  LB% = ((bx% AND 1) <> 0)
  RB% = ((bx% AND 2) <> 0)
  xmouse% = CX%
  ymouse% = DX%
END SUB

