DECLARE SUB bmpload (data1$)
SCREEN 13
sprite = 0
sprite1$ = "Cleared Space"
action1$ = "Open"
darw2$ = "Skipping"
DIM map(1 TO 100, 1 TO 100)
DIM mapact(1 TO 100, 1 TO 100)

PSET (0, 0), 12
DRAW "R101D101L101U101"
x = 1
y = 1
DO
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN GOSUB Up
IF a$ = CHR$(0) + "P" THEN GOSUB Down
IF a$ = CHR$(0) + "K" THEN GOSUB Left
IF a$ = CHR$(0) + "M" THEN GOSUB Right
IF a$ = "M" OR a$ = "m" THEN GOSUB maptool
IF a$ = "A" OR a$ = "a" THEN GOSUB mapaction
IF a$ = "S" OR a$ = "s" THEN GOSUB save
IF a$ = "L" OR a$ = "l" THEN GOSUB load
IF a$ = "Q" OR a$ = "q" THEN END
IF a$ = "D" OR a$ = "d" THEN draw1 = 1: draw2$ = "Drawing"
IF a$ = "F" OR a$ = "f" THEN draw1 = 0: draw2$ = "Skipping"

IF a$ = CHR$(32) THEN GOSUB place

PSET (x, y), 14
LOCATE 1, 14: PRINT "("; x; ","; y; "):"; map(x, y); ":"; mapact(x, y)
LOCATE 2, 14: PRINT "Sprite\Wall: "; sprite1$
LOCATE 3, 14: PRINT "Map Action : "; action1$
LOCATE 4, 14: PRINT "Mode: "; draw2$
LOOP

Up:
IF draw1 = 1 THEN GOSUB place
PSET (x, y), map(x, y)
IF y > 1 THEN y = y - 1
RETURN

Down:
IF draw1 = 1 THEN GOSUB place

PSET (x, y), map(x, y)
IF y < 100 THEN y = y + 1
RETURN

Left:
IF draw1 = 1 THEN GOSUB place
PSET (x, y), map(x, y)
IF x > 1 THEN x = x - 1
RETURN

Right:
IF draw1 = 1 THEN GOSUB place
PSET (x, y), map(x, y)
IF x < 100 THEN x = x + 1
RETURN

place:
map(x, y) = sprite
mapact(x, y) = mapa
PSET (x, y), sprite


RETURN

mapaction:
LOCATE 14, 1: PRINT "Map Action Choices:"
LOCATE 15, 1: COLOR 15: PRINT "(0)Open (1)Blocking"
LOCATE 16, 1: INPUT ">", mapa

IF mapa = 0 THEN action1$ = "Open"
IF mapa = 1 THEN action1$ = "Blocking"

CLS
GOTO remap
maptool:

Castle:
LOCATE 14, 1: PRINT "Sprite\Wall Choices:"
LOCATE 15, 1: COLOR 15: PRINT "(0) Cleared Space "; : COLOR 1: PRINT "(1) Brick Wall"
LOCATE 16, 1: COLOR 2: PRINT "(2) Up Spike "; : COLOR 3: PRINT "(3) Down Spike"
LOCATE 17, 1: COLOR 4: PRINT "(4) Left Spike "; : COLOR 5: PRINT "(5) Right Spike"
LOCATE 18, 1: COLOR 6: PRINT "(6) Start "; : COLOR 7: PRINT "(7) Exit"

LOCATE 19, 1: INPUT ">", sprite

IF sprite = 0 THEN sprite1$ = "Cleared Space"
IF sprite = 1 THEN sprite1$ = "Brick Wall"
IF sprite = 2 THEN sprite1$ = "Up Spike"
IF sprite = 3 THEN sprite1$ = "Down Spike"
IF sprite = 4 THEN sprite1$ = "Left Spike"
IF sprite = 5 THEN sprite1$ = "Right Spike"
IF sprite = 6 THEN sprite1$ = "Start"
IF sprite = 7 THEN sprite1$ = "Exit"


CLS
GOTO remap
REMAP1:
RETURN


remap:
PSET (0, 0), 12
DRAW "R101D101L101U101"
XC = 1
YC = 0
DO UNTIL XC = 100
YC = YC + 1
IF YC = 101 THEN XC = XC + 1: YC = 1
PSET (XC, YC), map(XC, YC)
LOOP
GOTO REMAP1

save:
LOCATE 14, 1: INPUT "Save As?", save$
OPEN save$ FOR OUTPUT AS #1
XZ = 1
YZ = 0
DO UNTIL XZ = 100
YZ = YZ + 1
IF YZ = 101 THEN XZ = XZ + 1: YZ = 1
PRINT #1, map(XZ, YZ)
LOOP

XZ = 1
YZ = 0
DO UNTIL XZ = 100
YZ = YZ + 1
IF YZ = 101 THEN XZ = XZ + 1: YZ = 1
PRINT #1, mapact(XZ, YZ)
LOOP

BEEP
CLOSE #1

RETURN


load:
LOCATE 14, 1: INPUT "Load File?", load$
OPEN load$ FOR INPUT AS #1
XZ = 1
YZ = 0
CLS
PSET (0, 0), 12
DRAW "R101D101L101U101"
DO UNTIL XZ = 100
YZ = YZ + 1
IF YZ = 101 THEN XZ = XZ + 1: YZ = 1
INPUT #1, map(XZ, YZ)
PSET (XZ, YZ), map(XZ, YZ)
LOOP

XZ = 1
YZ = 0
DO UNTIL XZ = 100
YZ = YZ + 1
IF YZ = 101 THEN XZ = XZ + 1: YZ = 1
INPUT #1, mapact(XZ, YZ)
LOOP

BEEP
CLOSE #1

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

