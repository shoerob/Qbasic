DECLARE SUB DrawPic (piclength, picwidth, picye, picxe)
SCREEN 13
DATA 15,15,15,00,15,15,15,00,15,15,15,00,15,15,15,00,00,15,15,15,00,15,00,00,00,15,15,15,00,15,15,15
DATA 15,00,00,00,15,00,15,00,15,00,00,00,00,15,00,00,00,15,00,00,00,15,00,00,00,15,00,15,00,15,00,00
DATA 15,15,15,00,15,00,15,00,15,15,15,00,00,15,00,00,00,15,15,15,00,15,15,15,00,15,00,15,00,15,15,00
DATA 00,00,15,00,15,00,15,00,15,00,00,00,00,15,00,00,00,00,00,15,00,15,00,15,00,15,00,15,00,15,00,00
DATA 15,15,15,00,15,15,15,00,15,00,00,00,00,15,00,00,00,15,15,15,00,15,00,15,00,15,15,15,00,15,15,15
piclength = 32
picwidth = 5
picye = 100
picxe = 100
CALL DrawPic(piclength, picwidth, picye, picxe)

'*** Colors ***
'00 - black                    08 - dark grey
'01 - dark blue                09 - light blue
'02 - dark green               10 - light green
'03 - dark cyan                11 - light cyan
'04 - dark red                 12 - light red
'05 - dark purple              13 - magenta
'06 - orange brown             14 - yellow
'07 - grey                     15 - bright white

SUB DrawPic (piclength, picwidth, picye, picxe)
picy = picye
picx = picxe
DO UNTIL picy = picwidth + picye
READ piccolor
PSET (picx, picy), piccolor
picx = picx + 1
IF picx = piclength + picxe THEN picx = picxe: picy = picy + 1
LOOP
END SUB

