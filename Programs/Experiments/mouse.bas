' It is recommended that you download this from the FTP site instead of
' the WWW site.

DECLARE FUNCTION MouseInit% ()
DECLARE SUB MouseStatus (Lb%, Rb%, xMouse%, yMouse%)
DECLARE SUB MouseRange (X1%, Y1%, x2%, Y2%)
DECLARE SUB MousePut (X%, Y%)
DECLARE SUB MouseHide ()
DECLARE SUB MouseDriver (ax%, bx%, cx%, dx%)
DECLARE SUB MouseShow ()
DEFINT A-Z: DEF SEG = &HA000:       
DIM SHARED mouse$: mouse$ = SPACE$(57)
CLS
SCREEN 12
FOR I% = 1 TO 57:  READ a$:  H$ = CHR$(VAL("&H" + a$))
MID$(mouse$, I%, 1) = H$: NEXT I%
DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B
DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53
DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F
DATA 8B,5E,06,89,17,5D,CA,08,00  
RESTORE
ms% = MouseInit%
IF NOT ms% THEN
  PRINT "Mouse not found"
  END
END IF
 LOCATE 2, 30
 PRINT "Mouse Control in QBasic"
MouseShow
MouseRange 0, 0, 630, 478
 
DO
 MouseStatus Lb, Rb, X, Y

 SELECT CASE Lb%
  CASE -1: LOCATE 10, 1: PRINT "Left Button Pressed"
  CASE ELSE: LOCATE 10, 1: PRINT SPACE$(20)
 END SELECT
 SELECT CASE Rb%
  CASE -1: LOCATE 10, 60: PRINT "Right Button Pressed"
  CASE ELSE: LOCATE 10, 60: PRINT SPACE$(20)
 END SELECT
LOOP

DEFLNG A-Z
SUB MouseDriver (ax%, bx%, cx%, dx%)
  DEF SEG = VARSEG(mouse$)
  mouse% = SADD(mouse$)
  CALL Absolute(ax%, bx%, cx%, dx%, mouse%)
END SUB

SUB MouseHide
 ax% = 2
 MouseDriver ax%, 0, 0, 0
END SUB

FUNCTION MouseInit%
  ax% = 0
  MouseDriver ax%, 0, 0, 0
  MouseInit% = ax%
END FUNCTION

SUB MousePut (X%, Y%)
  ax% = 4
  cx% = X%
  dx% = Y%
  MouseDriver ax%, 0, cx%, dx%
END SUB

SUB MouseRange (X1%, Y1%, x2%, Y2%)
  ax% = 7
  cx% = X1%
  dx% = x2%
MouseDriver ax%, 0, cx%, dx%
  ax% = 8
  cx% = Y1%
  dx% = Y2%
  MouseDriver ax%, 0, cx%, dx%
END SUB

SUB MouseShow
  ax% = 1
  MouseDriver ax%, 0, 0, 0
END SUB

SUB MouseStatus (Lb%, Rb%, xMouse%, yMouse%)
  ax% = 3
  MouseDriver ax%, bx%, cx%, dx%
  Lb% = ((bx% AND 1) <> 0)
  Rb% = ((bx% AND 2) <> 0)
  xMouse% = cx%
  yMouse% = dx%
END SUB

