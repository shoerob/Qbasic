DECLARE SUB bmpload (data1$)

PRINT "Loading.... Froggie-Jump 1.0 By: Robert Shoemate"
PRINT "Copyright(c) Robert Shoemate )SoftShoe("
PRINT "Press any key to continue..."
DO: LOOP UNTIL INKEY$ <> ""

DIM pic1(1 TO 600)
DIM pic2(1 TO 600)
DIM pic3(1 TO 600)
DIM pic4(1 TO 600)
DIM pic5(1 TO 600)
DIM pic6(1 TO 600)
DIM frogup(1 TO 600)
DIM frogdn(1 TO 600)
DIM froglt(1 TO 600)
DIM frogrt(1 TO 600)
DIM car1l(1 TO 600)
DIM car1r(1 TO 600)
DIM car2l(1 TO 600)
DIM car2r(1 TO 600)
DIM truck1rb(1 TO 600)
DIM truck1rf(1 TO 600)

DIM map(1 TO 12, 1 TO 11)
' Picture Loading Sequence
SCREEN 13
data1$ = "1.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), pic1
data1$ = "2.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), pic2
data1$ = "3.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), pic3
data1$ = "4.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), pic4
data1$ = "5.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), pic5
data1$ = "6.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), pic6

data1$ = "frogup.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), frogup
data1$ = "frogdn.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), frogdn
data1$ = "froglt.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), froglt
data1$ = "frogrt.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), frogrt

data1$ = "car1l.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), car1l

data1$ = "car1r.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), car1r

data1$ = "car2l.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), car2l

data1$ = "car2r.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), car2r


data1$ = "truck1rf.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), truck1rf

data1$ = "truck1rB.bmp"
CALL bmpload(data1$)
GET (2, 15)-(25, 1), truck1rb

CLS

RANDOMIZE TIMER
spd1 = INT(RND * 8) + 5
spd2 = INT(RND * 15) + 10
spd3 = INT(RND * 10) + 5
spd4 = INT(RND * 8) + 4

c1x = 289
c1y = 166

c2x = 145
c2y = 166

c3x = 1
c3y = 151

c4x = 25
c4y = 151

c5x = 217
c5y = 151

c6x = 145
c6y = 151

c7x = 145
c7y = 136

c8x = 25
c8y = 136

c9x = 217
c9y = 136

c10x = 217
c10y = 121

c11x = 145
c11y = 121

c12x = 97
c12y = 121

c13x = 1
c13y = 121

c14x = 25
c14y = 121

SCREEN 13
playgame:
CLS
OPEN "frogmap.map" FOR INPUT AS #1
mx = 1
my = 32
yy = 0
xx = 0

DO
INPUT #1, m1
IF m1 = 1 THEN PUT (mx, my), pic1
IF m1 = 2 THEN PUT (mx, my), pic2
IF m1 = 3 THEN PUT (mx, my), pic3
IF m1 = 4 THEN PUT (mx, my), pic4
IF m1 = 5 THEN PUT (mx, my), pic5
IF m1 = 6 THEN PUT (mx, my), pic6
mx = mx + 24
yy = yy + 1
IF yy = 13 THEN yy = 0: my = my + 15: mx = 1: xx = xx + 1
IF xx = 11 THEN GOTO donemap
LOOP
donemap:
CLOSE #1
COLOR 15
LOCATE 1, 2: PRINT "FroGGie JumP 1.0 By: Robert Shoemate"
COLOR 12
LOCATE 2, 3: PRINT "Score:       Lifes:       Level:"
PSET (1, 31), 9
DRAW "R311"
fy = 181
fx = 145
PUT (fx, fy), frogup
PUT (c1x, c1y), car1l
PUT (c2x, c2y), car2l
PUT (c3x, c3y), truck1rb
PUT (c4x, c4y), truck1rf
PUT (c5x, c5y), car1r
PUT (c6x, c6y), car2r
PUT (c7x, c7y), car2l
PUT (c8x, c8y), car1l
PUT (c9x, c9y), car2l
PUT (c10x, c10y), car2r
PUT (c11x, c11y), car1r
PUT (c12x, c12y), car2r
PUT (c13x, c13y), truck1rb
PUT (c14x, c14y), truck1rf

frog$ = "UP"

DO
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN dir$ = "UP": GOSUB placefrog
IF a$ = CHR$(0) + "P" THEN dir$ = "DN": GOSUB placefrog
IF a$ = CHR$(0) + "K" THEN dir$ = "LT": GOSUB placefrog
IF a$ = CHR$(0) + "M" THEN dir$ = "RT": GOSUB placefrog
LOCATE 3, 1: PRINT fx; fy
GOSUB cars
GOSUB checkdeath
LOOP

placefrog:
PLAY "mb o1 l40 Aca"

IF dir$ = "UP" AND fy = 31 GOTO Donemove
IF dir$ = "DN" AND fy = 181 GOTO Donemove
IF dir$ = "LT" AND fx = 1 GOTO Donemove
IF dir$ = "RT" AND fx = 289 GOTO Donemove
IF frog$ = "UP" THEN PUT (fx, fy), frogup
IF frog$ = "DN" THEN PUT (fx, fy), frogdn
IF frog$ = "LT" THEN PUT (fx, fy), froglt
IF frog$ = "RT" THEN PUT (fx, fy), frogrt
IF dir$ = "UP" THEN frog$ = "UP": fy = fy - 15: PUT (fx, fy), frogup: GOTO Donemove
IF dir$ = "DN" THEN frog$ = "DN": fy = fy + 15: PUT (fx, fy), frogdn: GOTO Donemove
IF dir$ = "LT" THEN frog$ = "LT": fx = fx - 24: PUT (fx, fy), froglt: GOTO Donemove
IF dir$ = "RT" THEN frog$ = "RT": fx = fx + 24: PUT (fx, fy), frogrt: GOTO Donemove
Donemove:
RETURN



cars:
cardel1 = cardel1 + 1
cardel2 = cardel2 + 1
cardel3 = cardel3 + 1
cardel4 = cardel4 + 1

donecar1:
IF cardel1 = spd1 THEN GOTO car1
IF cardel2 = spd2 THEN GOTO car2
IF cardel3 = spd3 THEN GOTO car3
IF cardel4 = spd4 THEN GOTO car4



GOTO donecar
car1:
cardel1 = 0
PUT (c1x, c1y), car1l
c1x = c1x - 1
PUT (c1x, c1y), car1l
IF c1x = 1 THEN PUT (c1x, c1y), car1l: c1x = 289: PUT (c1x, c1y), car1l
PUT (c2x, c2y), car2l
c2x = c2x - 1
PUT (c2x, c2y), car2l
IF c2x = 1 THEN PUT (c2x, c2y), car2l: c2x = 289: PUT (c2x, c2y), car2l
GOTO donecar1:


car2:
cardel2 = 0
PUT (c3x, c3y), truck1rb
c3x = c3x + 1
PUT (c3x, c3y), truck1rb
IF c3x = 289 THEN PUT (c3x, c3y), truck1rb: c3x = 1: PUT (c3x, c3y), truck1rb

PUT (c4x, c4y), truck1rf
c4x = c4x + 1
PUT (c4x, c4y), truck1rf
IF c4x = 289 THEN PUT (c4x, c4y), truck1rf: c4x = 1: PUT (c4x, c4y), truck1rf

PUT (c5x, c5y), car1r
c5x = c5x + 1
PUT (c5x, c5y), car1r
IF c5x = 289 THEN PUT (c5x, c5y), car1r: c5x = 1: PUT (c5x, c5y), car1r

PUT (c6x, c6y), car2r
c6x = c6x + 1
PUT (c6x, c6y), car2r
IF c6x = 289 THEN PUT (c6x, c6y), car2r: c6x = 1: PUT (c6x, c6y), car2r
GOTO donecar1:


car3:
cardel3 = 0
PUT (c7x, c7y), car2l
c7x = c7x - 1
PUT (c7x, c7y), car2l
IF c7x = 1 THEN PUT (c7x, c7y), car2l: c7x = 289: PUT (c7x, c7y), car2l

PUT (c8x, c8y), car1l
c8x = c8x - 1
PUT (c8x, c8y), car1l
IF c8x = 1 THEN PUT (c8x, c8y), car1l: c8x = 289: PUT (c8x, c8y), car1l

PUT (c9x, c9y), car2l
c9x = c9x - 1
PUT (c9x, c9y), car2l
IF c9x = 1 THEN PUT (c9x, c9y), car2l: c9x = 289: PUT (c9x, c9y), car2l

GOTO donecar1


car4:
cardel4 = 0
PUT (c10x, c10y), car2r
c10x = c10x + 1
PUT (c10x, c10y), car2r
IF c10x = 289 THEN PUT (c10x, c10y), car2r: c10x = 1: PUT (c10x, c10y), car2r

PUT (c11x, c11y), car1r
c11x = c11x + 1
PUT (c11x, c11y), car1r
IF c11x = 289 THEN PUT (c11x, c11y), car1r: c11x = 1: PUT (c11x, c11y), car1r

PUT (c12x, c12y), car2r
c12x = c12x + 1
PUT (c12x, c12y), car2r
IF c12x = 289 THEN PUT (c12x, c12y), car2r: c12x = 1: PUT (c12x, c12y), car2r

PUT (c13x, c13y), truck1rb
c13x = c13x + 1
PUT (c13x, c13y), truck1rb
IF c13x = 289 THEN PUT (c13x, c13y), truck1rb: c13x = 1: PUT (c13x, c13y), truck1rb

PUT (c14x, c14y), truck1rf
c14x = c14x + 1
PUT (c14x, c14y), truck1rf
IF c14x = 289 THEN PUT (c14x, c14y), truck1rf: c14x = 1: PUT (c14x, c14y), truck1rf

GOTO donecar1

donecar:
RETURN

checkdeath:
IF c1x = fx + 23 AND c1y = fy THEN GOTO dead
IF c1x = fx AND c1y = fy THEN GOTO dead
IF c1x > fx - 20 AND c1x < fx AND c1y = fy THEN GOTO dead
IF c1x > fx AND c1x < fx + 20 AND c1y = fy THEN GOTO dead

IF c2x = fx + 23 AND c2y = fy THEN GOTO dead
IF c2x = fx AND c2y = fy THEN GOTO dead
IF c2x > fx - 20 AND c2x < fx AND c2y = fy THEN GOTO dead
IF c2x > fx AND c2x < fx + 20 AND c2y = fy THEN GOTO dead


IF c3x = fx + 23 AND c3y = fy THEN GOTO dead
IF c3x = fx AND c3y = fy THEN GOTO dead
IF c3x > fx - 20 AND c3x < fx AND c3y = fy THEN GOTO dead
IF c3x > fx AND c3x < fx + 20 AND c3y = fy THEN GOTO dead

IF c4x = fx + 23 AND c4y = fy THEN GOTO dead
IF c4x = fx AND c4y = fy THEN GOTO dead
IF c4x > fx - 20 AND c4x < fx AND c4y = fy THEN GOTO dead
IF c4x > fx AND c4x < fx + 20 AND c4y = fy THEN GOTO dead

IF c5x = fx + 23 AND c5y = fy THEN GOTO dead
IF c5x = fx AND c5y = fy THEN GOTO dead
IF c5x > fx - 20 AND c5x < fx AND c5y = fy THEN GOTO dead
IF c5x > fx AND c5x < fx + 20 AND c5y = fy THEN GOTO dead

IF c6x = fx + 23 AND c6y = fy THEN GOTO dead
IF c6x = fx AND c6y = fy THEN GOTO dead
IF c6x > fx - 20 AND c6x < fx AND c6y = fy THEN GOTO dead
IF c6x > fx AND c6x < fx + 20 AND c6y = fy THEN GOTO dead

IF c7x = fx + 23 AND c7y = fy THEN GOTO dead
IF c7x = fx AND c7y = fy THEN GOTO dead
IF c7x > fx - 20 AND c7x < fx AND c7y = fy THEN GOTO dead
IF c7x > fx AND c7x < fx + 20 AND c7y = fy THEN GOTO dead

IF c8x = fx + 23 AND c8y = fy THEN GOTO dead
IF c8x = fx AND c8y = fy THEN GOTO dead
IF c8x > fx - 20 AND c8x < fx AND c8y = fy THEN GOTO dead
IF c8x > fx AND c8x < fx + 20 AND c8y = fy THEN GOTO dead

IF c9x = fx + 23 AND c9y = fy THEN GOTO dead
IF c9x = fx AND c9y = fy THEN GOTO dead
IF c9x > fx - 20 AND c9x < fx AND c9y = fy THEN GOTO dead
IF c9x > fx AND c9x < fx + 20 AND c9y = fy THEN GOTO dead

IF c10x = fx + 23 AND c10y = fy THEN GOTO dead
IF c10x = fx AND c10y = fy THEN GOTO dead
IF c10x > fx - 20 AND c10x < fx AND c10y = fy THEN GOTO dead
IF c10x > fx AND c10x < fx + 20 AND c10y = fy THEN GOTO dead

IF c11x = fx + 23 AND c11y = fy THEN GOTO dead
IF c11x = fx AND c11y = fy THEN GOTO dead
IF c11x > fx - 20 AND c11x < fx AND c11y = fy THEN GOTO dead
IF c11x > fx AND c11x < fx + 20 AND c11y = fy THEN GOTO dead

IF c12x = fx + 23 AND c12y = fy THEN GOTO dead
IF c12x = fx AND c12y = fy THEN GOTO dead
IF c12x > fx - 20 AND c12x < fx AND c12y = fy THEN GOTO dead
IF c12x > fx AND c12x < fx + 20 AND c12y = fy THEN GOTO dead

IF c13x = fx + 23 AND c13y = fy THEN GOTO dead
IF c13x = fx AND c13y = fy THEN GOTO dead
IF c13x > fx - 20 AND c13x < fx AND c13y = fy THEN GOTO dead
IF c13x > fx AND c13x < fx + 20 AND c13y = fy THEN GOTO dead

IF c14x = fx + 23 AND c14y = fy THEN GOTO dead
IF c14x = fx AND c14y = fy THEN GOTO dead
IF c14x > fx - 20 AND c14x < fx AND c14y = fy THEN GOTO dead
IF c14x > fx AND c14x < fx + 20 AND c14y = fy THEN GOTO dead

RETURN






dead:

DO UNTIL death = 7
death = death + 1
COLOR 9
CIRCLE (fx + 12.5, fy + 7.5), death
GOSUB cars
LOOP
death = 0
lifes = lifes - 1
GOTO playmore



playmore:
IF lifes = 0 THEN END
fy = 181
fx = 145
DO: LOOP UNTIL INKEY$ <> ""
GOTO playgame

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

