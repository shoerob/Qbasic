'*********************** CHARACTER <BUG> NEEDS PUT/FIXED *****************
'========================================================
'RPGTILE Engine Version 1.0 -+First Release+-
'SoFtShoE RPGTILE Engine (C)Robert Shoemate 1997
'========================================================
'************** STARTUP LOADING INFORMATION **************************
' Set up variables for different Matrixes
DIM map(1 TO 11, 1 TO 9)
DIM MapAction(1 TO 11, 1 TO 9)
DIM Charmove(1 TO 11, 1 TO 9)
DIM tile(1 TO 20, 1 TO 20)
DIM Antile(1 TO 20, 1 TO 20)
DIM character(1 TO 500) 'Character- Not a matrix, but a get statment

' Information For Game Tile Graphics
tile1$ = "mat1" 'TriWall Block Tile
tile2$ = "mat" 'Grass Tile:
tile3$ = "mat2" 'Door Tile:  'Add unlimited tile#$ Variables--Be sure to add them to the SCREEN tile loading Sequenc

'Information For Map Matrix's
MAP1$ = "map.smp"
MAP2$ = "map2.smp"

' Start Up Variables
TileRowsX = 1  'Unusable Until Fixed
tilerowsy = 8
'***** MAP$ = STARTING MAP VARIABLE(MAP1$)
map$ = MAP1$


'Matrix Map/Action Info
         'Every # After the Blockers Number is nonBlocking Everone before blocks
Blockers = 1
newgame = 1

SCREEN 13
' Information For Player Tile Graphics
character$ = "char"
FILE$ = character$
GOSUB Loadmatrix
GET (1, 20)-(20, 1), character
'************** STARTUP LOADING INFORMATION **************************



'******************************* GAME STARTS HERE **************************
CLS
mapon = 1
GOSUB ScreenInit
TextC = 10 'The text color variable (1-256)
say = 1: GOSUB Talksay
GOSUB MapTiles
DRawchar = 1
GOSUB character
say = 2: GOSUB Talksay
GOSUB Animation1
say = 3: GOSUB Talksay
LOCATE 20, 30: PRINT "          "
DO UNTIL a$ = CHR$(27)
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN arw$ = "M": GOSUB character
IF a$ = CHR$(0) + "P" THEN arw$ = "P": GOSUB character
IF a$ = CHR$(0) + "K" THEN arw$ = "K": GOSUB character
IF a$ = CHR$(0) + "H" THEN arw$ = "H": GOSUB character
LOOP
END
'******************************* GAME END HERE **************************

'******************************* TALKING STUFF **************************
'Say is the variable that tells the computer what to say
'Sayx, And Sayy are the X and Y locations of where to print the TEXT
'TextC(1-256) is the color of the text printed onto the screen
Talksay:
COLOR TextC
IF say = 1 THEN say$ = "This Program Was Made With The SoFtShoE RPGTILE Engine!": sayx = 22: sayy = 1
IF say = 2 THEN say$ = "Here is a cool animation!                              ": sayx = 22: sayy = 1
IF say = 3 THEN say$ = "Welcome To The SoftShoe RPGTILE Engine DEMOTrack...    ": sayx = 22: sayy = 1
IF say = 4 THEN say$ = "Don't Make The Beep Noise Yet!                         "
LOCATE sayx, sayy: PRINT say$  ' Tells where on the screen to print Say$
RETURN
'******************************* TALKING STUFF **************************

'************** GAME ANIMATION/OTHER **************************
Animation1:
' Animation Sequence --May Have As Many As You Need
'AnMatx: X location of animation--Can be changed
'AnMaty: Y location of animation--Can be changed
'Anclr1: <=1 Clears The Screen/Spot><=0 Skips Clearing>
'file$ = "face1": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face2": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face3": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face4": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face5": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face6": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face7": Anmatx = 20: Anmaty = 20: Anclr1 = 0: GOSUB loadanim
'file$ = "face8": Anmatx = 20: Anmaty = 20: Anclr1 = 1: GOSUB loadanim
RETURN
'************** GAME ANIMATION/OTHER **************************




'******************************* SCREEN INIT PROCESS **************************
ScreenInit:
' Square Around Tiles
COLOR 12
PSET (220, 0): DRAW "d160l220"
RETURN
'******************************* SCREEN INIT PROCESS **************************

'*******************************Character Movement*********************
character:
a$ = INKEY$                                        '# = Amount of blocking tiles, all #'s after # Are NonBlocking All Before # Are Blocking
IF DRawchar = 1 THEN PUT (Charx, Chary), character
IF DRawchar = 1 THEN DRawchar = 0: GOTO actioncheck
IF arw$ = "M" THEN IF map(CharRowx + 1, CharRowy) > Blockers THEN PUT (Charx, Chary), character: Charx = Charx + 20: CharRowx = CharRowx + 1: DRawchar = 1
IF arw$ = "P" THEN IF map(CharRowx, CharRowy + 1) > Blockers THEN PUT (Charx, Chary), character: Chary = Chary + 20: CharRowy = CharRowy + 1: DRawchar = 1
IF arw$ = "K" THEN IF map(CharRowx - 1, CharRowy) > Blockers THEN PUT (Charx, Chary), character: Charx = Charx - 20: CharRowx = CharRowx - 1: DRawchar = 1
IF arw$ = "H" THEN IF map(CharRowx, CharRowy - 1) > Blockers THEN PUT (Charx, Chary), character: Chary = Chary - 20: CharRowy = CharRowy - 1: DRawchar = 1
LOCATE 1, 1: PRINT CharRowx; CharRowy
IF DRawchar = 1 THEN PUT (Charx, Chary), character
DRawchar = 0
GOTO actioncheck
'RETURN
'*******************************Character Movement*********************
'******************************* ACTION CHECKS ***********************
actioncheck:
                     'Set this up to meet the Action Needs:
IF mapon = 1 THEN GOTO MAP1:
IF mapon = 2 THEN GOTO MAP2:
RETURN

MAP1:
IF MapAction(CharRowx, CharRowy) = 0 THEN GOTO EndActions

 IF MapAction(CharRowx, CharRowy) = 1 AND arw$ = "H" THEN
 noff = 1
 mapon = 2

 GOSUB MapTiles
 DRawchar = 1
 GOSUB character
 GOTO EndActions
 END IF

IF MapAction(CharRowx, CharRowy) = 2 THEN BEEP: say = 4: GOSUB Talksay: GOTO EndActions

GOTO EndActions

MAP2:
IF MapAction(CharRowx, CharRowy) = 0 THEN GOTO EndActions

 IF MapAction(CharRowx, CharRowy) = 1 AND arw$ = "P" THEN
 noff = 1
 mapon = 1
 GOSUB MapTiles
 DRawchar = 1
 GOSUB character
 GOTO EndActions
 END IF

GOTO EndActions



EndActions:
RETURN
'******************************* ACTION CHECKS ***********************




' ******* SCREEN MAP TILE matrix loading Sequence *******
MapTiles:
LOCATE 20, 30: PRINT "Loading..."

'Change MAP Stuff here to specify Program needs
IF mapon = 1 THEN map$ = MAP1$
IF mapon = 2 THEN map$ = MAP2$
IF mapon = 3 THEN map$ = MAP3$

graphmap$ = map$
OPEN graphmap$ FOR INPUT AS #1
TileRowsX = 1  'Unusable Until Fixed
tilerowsy = 8
matx = 0
maty = 0

DO
INPUT #1, blck
                           'Change these to You Blocking Specified Needs
IF blck = 3 THEN FILE$ = tile1$: GOSUB Loadmatrix
IF blck = 1 THEN FILE$ = tile2$: GOSUB Loadmatrix
IF blck = 2 THEN FILE$ = tile3$: GOSUB Loadmatrix 'Add more of these kinds of statments as you add more tile#$ variables


matx = matx + 20
IF matx = 220 THEN matx = 0: maty = maty + 20: tilerowsy = tilerowsy + 1
LOOP UNTIL tilerowsy = 16

' Map Graphics Loading!!!
graphmap$ = map$

X = 1
y = 1
CLOSE #1
graphmap$ = map$
OPEN graphmap$ FOR INPUT AS #1
DO UNTIL y = 9
INPUT #1, blck
map(X, y) = blck
IF X = 11 THEN X = 0: y = y + 1
X = X + 1
LOOP


X = 1
y = 1
DO UNTIL y = 9
INPUT #1, blck
MapAction(X, y) = blck
'South
IF blck = 901 AND arw$ = "M" THEN Charx = X * 20 - 20: Chary = y * 20 - 20: CharRowx = X: CharRowy = y
'East
IF blck = 902 AND arw$ = "P" THEN Charx = X * 20 - 20: Chary = y * 20 - 20: CharRowx = X: CharRowy = y
'West
IF blck = 903 AND arw$ = "K" THEN Charx = X * 20 - 20: Chary = y * 20 - 20: CharRowx = X: CharRowy = y
'North
IF blck = 904 AND arw$ = "H" THEN Charx = X * 20 - 20: Chary = y * 20 - 20: CharRowx = X: CharRowy = y
IF noff = 0 THEN IF blck = 999 THEN Charx = X * 20 - 20: Chary = y * 20 - 20: CharRowx = X: CharRowy = y

'Level Start
IF X = 11 THEN X = 0: y = y + 1
X = X + 1
LOOP
noff = 0
CLOSE #1
LOCATE 20, 30: PRINT "          "
RETURN
' ******* SCREEN MAP Tile matrix Loading Sequence *******



'******************************* TILE LOADING PROCESS **************************
Loadmatrix:
xcord1 = matx
ycord1 = maty
xcord = xcord1
ycord = ycord1
ya = 1
xa = 1
FILE$ = FILE$ + ".mtx"
OPEN FILE$ FOR INPUT AS #2
DO
xa = xa + 1
xcord = xcord + 1
IF xa = 21 THEN ya = ya + 1: ycord = ycord + 1: xa = 1: xcord = xcord1
IF ya = 21 THEN CLOSE #2: RETURN
INPUT #2, c
tile(xa, ya) = c
PSET (xcord, ycord), c
del = del + 1
LOOP
'******************************* TILE LOADING PROCESS **************************


'******************************* ANIMATION PROCESS **************************
loadanim:
Anxcord1 = Anmatx
Anycord1 = Anmaty
Anxcord = Anxcord1
Anycord = Anycord1
Anya = 1
Anxa = 1
FILE$ = FILE$ + ".mtx"
OPEN FILE$ FOR INPUT AS #1
DO
Anxa = Anxa + 1
Anxcord = Anxcord + 1
IF Anxa = 21 THEN Anya = Anya + 1: Anycord = Anycord + 1: Anxa = 1: Anxcord = Anxcord1
IF Anya = 21 THEN CLOSE #1: IF Anclr1 = 1 THEN GOTO AnClr ELSE RETURN
INPUT #1, Anc
Antile(Anxa, Anya) = Anc
PSET (Anxcord, Anycord), Anc
Andel = Andel + 1
LOOP
AnClr:
IF AnimCls = 1 THEN AnimCls = 0: Clr1 = 0: RETURN
FILE$ = "mat1": AnimCls = 1: GOTO loadanim  '1 SlowMode/Choose Which Clearing Mode You Want
'CLS : animcls = 1: RETURN  '2 FastMode/Choose Which Clearing Mode You Want
'******************************* ANIMATION PROCESS **************************








