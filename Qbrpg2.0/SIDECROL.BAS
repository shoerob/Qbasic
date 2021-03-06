DECLARE SUB bmpload (data1$)
DIM wall1(1 TO 150)
DIM man(1 TO 150)
DIM title(1 TO 250)
DIM map(1 TO 100, 1 TO 100)
DIM dispmap(1 TO 11, 1 TO 8)
DIM startpntx
DIM startpnty
SCREEN 13

data1$ = "D:\man.bmp"
CALL bmpload(data1$)
GET (2, 15)-(28, 1), man
CLS

data1$ = "D:\brick.bmp"
CALL bmpload(data1$)
GET (2, 15)-(28, 1), wall1
CLS

data1$ = "D:\gallerhoth.bmp"
CALL bmpload(data1$)
GET (2, 15)-(28, 1), title
CLS



 '******** Loading Sequence For Map
OPEN "D:\level1.lvl" FOR INPUT AS #1
Xc = 1
Yc = 0
DO UNTIL Xc = 100
Yc = Yc + 1
IF Yc = 101 THEN Xc = Xc + 1: Yc = 1
INPUT #1, map(Xc, Yc)
IF map(Xc, Yc) = 6 THEN startpntx = Xc - 5: startpnty = Yc - 4
LOOP
manx = 148  '75 + 73
many = 83

 '******** Loading Sequence For Map
yl = startpnty + 1' Map Matrix Location
Xl = startpntx  ' Map Matrix Location
Xp = 1   'Dispmap Matrix Location
Yp = 0   'Dispmap Matrix Location


'Locate Starting Point And Draw Map From there!
DO UNTIL Xp = 11 AND (Xl = 11 + startpntx)
yl = yl + 1
IF yl = 9 + startpnty THEN Xl = Xl + 1: yl = startpnty + 1
Yp = Yp + 1
IF Yp = 9 THEN Xp = Xp + 1: Yp = 1
dispmap(Xp, Yp) = map(Xl, yl)
LOOP

x = 1
y = 1
PSET (72, 37), 10
PSET (72, 159), 10
PSET (239, 37), 10
PSET (239, 159), 10


xv = 73
yv = 38
xq = 1
yq = 0

DO
'PSET (xv, yv), 12
'PUT (xv, yv), wall1
'DRAW "D15r15u15l15"

yq = yq + 1
IF yq = 9 THEN xq = xq + 1: yq = 1

yv = yv + 15
IF yv > 150 THEN xv = xv + 15: yv = 38
IF xv > 230 THEN GOTO DoneDraw
IF dispmap(xq, yq) = 1 THEN PUT (xv, yv), wall1

LOOP



DoneDraw:
PUT (manx, many), man
DO
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN GOSUB UP
IF a$ = CHR$(0) + "P" THEN GOSUB Down
IF a$ = CHR$(0) + "K" THEN GOSUB Left
IF a$ = CHR$(0) + "M" THEN GOSUB Right
LOOP

UP:
IF startpnty > 0 THEN startpnty = startpnty - 1
GOTO FindMapPoints

Down:
IF startpnty < 100 THEN startpnty = startpnty + 1
GOTO FindMapPoints

Left:
startpntx = startpntx - 1
GOTO FindMapPoints

Right:
startpntx = startpntx + 1
GOTO FindMapPoints

FindMapPoints:
CLS
PUT (manx, many), man
yl = startpnty + 1' Map Matrix Location
Xl = startpntx  ' Map Matrix Location
Xp = 1   'Dispmap Matrix Location
Yp = 0   'Dispmap Matrix Location


DO UNTIL Xp = 11 AND (Xl = 11 + startpntx)
yl = yl + 1
IF yl = 9 + startpnty THEN Xl = Xl + 1: yl = startpnty + 1
Yp = Yp + 1
IF Yp = 9 THEN Xp = Xp + 1: Yp = 1
dispmap(Xp, Yp) = map(Xl, yl)
LOOP


xq = 1
yq = 0


PSET (72, 37), 10
PSET (72, 159), 10
PSET (239, 37), 10
PSET (239, 159), 10


xv = 73
yv = 38
xq = 1
yq = 0

IF dispmap(xq, yq + 1) = 1 THEN PUT (xv, yv), wall1

DO
'PSET (xv, yv), 12
'PUT (xv, yv), wall1
'DRAW "D15r15u15l15"

yq = yq + 1
IF yq = 9 THEN xq = xq + 1: yq = 1

yv = yv + 15
IF yv > 150 THEN xv = xv + 15: yv = 38
IF xv > 230 THEN GOTO DoneDraw1
IF dispmap(xq, yq) = 1 THEN PUT (xv, yv), wall1

LOOP
DoneDraw1:
RETURN

SUB bmpload (data1$)
DEFINT A-Z
DIM byte AS STRING * 1
CLS
data$ = data1$
'data$ = "c:\win3_1\winlogo.bmp"

IF LTRIM$(RTRIM$(data$)) = "" THEN END
OPEN data$ FOR BINARY AS #1
IF LOF(1) = 0 THEN PRINT "File not found!": CLOSE : KILL data$: END

table$ = INPUT$(54, #1)  'Get the file header (54 bytes)
DIM table&(30)           'Create numerical array for header
DEF SEG = VARSEG(table&(1))
pointer% = VARPTR(table&(1))

'Poke the data from string "table$" into numerical array "table&"
FOR x% = 0 TO 51
 POKE pointer% + x%, ASC(MID$(table$, x% + 3, 1))
NEXT
DEF SEG

'Check for valid file type
IF MID$(table$, 1, 2) <> "BM" OR table&(4) <> 40 THEN
   PRINT "Not a valid *.BMP file!": END
END IF
IF table&(8) <> 0 THEN
   PRINT "This program will not diplay RLE encoded files": END
END IF
'IF ASC(MID$(table$, 29, 1)) <> 4 THEN
'   PRINT "Only 16 color bitmaps are supported!": END
'END IF

'Set the video mode for best picture fit
IF (table&(5) < 321) AND (table&(6) < 201) THEN
   SCREEN 13
ELSE
   SCREEN 12
END IF
LOCATE 2, 1
'PRINT " Image is "; table&(5); " by "; table&(6)

thecolors$ = INPUT$(table&(3) - 54, #1) 'Read in pallette info

DEF SEG = VARSEG(pal&)
pointer% = VARPTR(pal&)
'Poke the pallette info from the string "thecolors$"
'into pal& and reduce to 6 bits per byte.
FOR x% = 0 TO 63 STEP 4
 POKE pointer%, (ASC(MID$(thecolors$, x% + 3, 1))) \ 4
 POKE pointer% + 1, (ASC(MID$(thecolors$, x% + 2, 1))) \ 4
 POKE pointer% + 2, (ASC(MID$(thecolors$, x% + 1, 1))) \ 4
 POKE pointer% + 3, 0
PALETTE x% \ 4, pal&
NEXT
DEF SEG



'Read in Bitmap data and set pixels accordingly
y% = table&(6) 'Put number of vertical pixels into y%
DO
  data$ = INPUT$((((table&(5) - 1) OR 7) + 1) \ 2, #1)
    IF (table&(5) \ 2) < LEN(data$) THEN
       linelength% = table&(5) \ 2
    ELSE
       linelength% = LEN(data$)
    END IF
    FOR x% = 1 TO linelength%
      pixel% = ASC(MID$(data$, x%, 1))
      PSET (x% * 2 + 1, y%), pixel% AND 15
      PSET (x% * 2, y%), pixel% \ 16
     NEXT
    y% = y% - 1
LOOP UNTIL EOF(1) OR INKEY$ <> ""

CLOSE #1
END SUB

