DECLARE SUB DrawPic (piclength, picwidth, picye, picxe)
SCREEN 13
DATA 00,12,13,12,00,12,13,12,00,12,13,12,00,12,13,12,00,00,12,13,12,00,12,00,00,00,13,12,13,00,12,13,12
DATA 00,13,00,00,00,13,00,13,00,13,00,00,00,00,12,00,00,00,13,00,00,00,13,00,00,00,12,00,12,00,13,00,00
DATA 00,12,13,12,00,12,00,12,00,12,13,12,00,00,13,00,00,00,12,13,12,00,12,13,12,00,13,00,13,00,12,12,00
DATA 00,00,00,13,00,13,00,13,00,13,00,00,00,00,12,00,00,00,00,00,13,00,13,00,13,00,12,00,12,00,13,00,00
DATA 00,12,13,12,00,12,13,12,00,12,00,00,00,00,13,00,00,00,12,13,12,00,12,00,12,00,13,12,13,00,12,13,12
piclength = 33
picwidth = 5
picye = 1
picxe = 1
DO UNTIL INKEY$ <> ""
CALL DrawPic(piclength, picwidth, picye, picxe)
RESTORE
picxe = picxe + 1
snd = INT(RND * 100) + 300
SOUND snd, 1
LOOP

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
IF picx = 130 THEN END
END SUB

