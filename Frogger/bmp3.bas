' It is recommended that you download this from the FTP site instead of
' the WWW site.

DEFINT A-Z
DIM byte AS STRING * 1
CLS
INPUT "Bitmap Filename"; data$

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
DO: LOOP UNTIL INKEY$ <> ""
SYSTEM

