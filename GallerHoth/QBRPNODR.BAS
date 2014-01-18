
'Variable type to hold screen design item data.
TYPE DesignType
    imageno AS INTEGER
    Xpos AS INTEGER
    Ypos AS INTEGER
    DisAct AS INTEGER
END TYPE

DECLARE SUB initpalettedata (Filename$, PaletteArray&())
DECLARE SUB InitDesignData (Filename$, DesignArray() AS DesignType)
DECLARE SUB initimagedata (Filename$, ImageArray%())
DECLARE SUB makeimageindex (ImageArray%(), IndexArray%())
DECLARE SUB DisplayDesign (DesignArray() AS DesignType, ImageArray%(), ImageIndex%(), ClsAction%)
DECLARE SUB ChangePalette (PaletteArray&())
DECLARE SUB FadePalette (Direction%, PaletteArray&())
DECLARE SUB RotatePalette (StartAttr%, EndAttr%, Direction%, PaletteArray&())
DECLARE SUB CharPrint (Text$, Fore%, Back%, CursorPos%, ImageArray%())
DECLARE SUB CharPrintXY (x%, y%, Text$, Fore%, Back%, CursorPos%, ImageArray%())
DECLARE SUB Scroller (ScrollAct%, ImageArray%(), IndexArray%())
DECLARE SUB WizzText (Text$, TopLine%, ImageArray%(), IndexArray%())
DECLARE SUB GraphicText (x%, y%, Text$, CursorPos%, ImageArray%(), IndexArray%())
DECLARE FUNCTION GetDepth% (ImNo%, ImageArray%(), IndexArray%())
DECLARE FUNCTION GetWidth% (ImNo%, ImageArray%(), IndexArray%())
'---------------Declare QMIDI subroutines.
DECLARE SUB LoadAndPlayMIDI (Filename$, MIDISegment%, MIDIOffset%)
DECLARE SUB LoadMIDI (Filename$, MIDISegment%, MIDIOffset%)
DECLARE SUB PlayMIDI (MIDISegment%, MIDIOffset%)
DECLARE SUB stopmidi ()
DECLARE FUNCTION BytesRequired& (Filename$)
DECLARE SUB DriversLoaded (SBMIDI%, SBSIM%)
DECLARE FUNCTION TimeMIDI! ()
DECLARE FUNCTION MIDIError$ ()
DECLARE SUB PauseMIDI ()
DECLARE SUB ResumeMIDI ()
DECLARE SUB GetIntVector (IntNum%, Segment%, Offset%)

'The following code is REQUIRED in programs that use QMIDI in order for
'all features to work properly.
DIM SHARED MIDI.PLAYTIME AS SINGLE
DIM SHARED MIDI.ERROR AS INTEGER
DIM SHARED SBMIDI.INTERRUPT AS INTEGER
DIM SHARED SBSIM.INTERRUPT AS INTEGER
DIM SHARED PAUSED AS SINGLE
MIDI.PLAYTIME = 0
MIDI.ERROR = 0

REM $DYNAMIC
DIM map(1 TO 100, 1 TO 100)
REM $DYNAMIC
DIM mprop(1 TO 100, 1 TO 100)
REM $DYNAMIC
DIM Vmap(1 TO 15, 1 TO 9)
CLS
SCREEN 0
PRINT "Loading... The Quest For The Bodies Of Gallerhoth"
PRINT "Programmed By: Robert Shoemate"
PRINT "Graphics By: Robert Shoemate"
PRINT "Music By: Blake Cannon"
PRINT "Sound By: No Sound Yet!"
PRINT "Pixel Plus Routines By: ??????"
PRINT "Qmidi Routines By: ??????"
PRINT "Press Any Key To Continue..."
DO UNTIL INKEY$ <> "": LOOP


'******************* Play Midi Code Starts Here
'$DYNAMIC
'Print the DriversLoaded syntax in yellow.
COLOR 14, 0
PRINT "DriversLoaded (SBMIDI%, SBSIM%)"
'Print the DriverLoaded description in white.
COLOR 15, 0
PRINT "Attempts to detect if the sound drivers have been loaded."
'Print the "detecting..." message
PRINT
COLOR 12, 0
PRINT "Looking for sound drivers..."
DriversLoaded SBMIDI.INTERRUPT, SBSIM.INTERRUPT
'Print the status of the detection.
SELECT CASE SBMIDI.INTERRUPT
        CASE 0:
                PRINT "The SBMIDI driver could not be found!"
                PRINT "Are you sure you want to continue? (Y/N)"
                A$ = UCASE$(INPUT$(1))
                IF A$ <> "Y" THEN
                        SCREEN 1: SCREEN 0: WIDTH 80, 25: CLS : END
                END IF
        CASE ELSE:
                PRINT
                PRINT "SBMIDI driver found!"
               
END SELECT
SELECT CASE SBSIM.INTERRUPT
        CASE 0:
                PRINT "The SBSIM driver could not be found!"
                PRINT "Are you sure you want to continue? (Y/N)"
                A$ = UCASE$(INPUT$(1))
                IF A$ <> "Y" THEN
                        SCREEN 1: SCREEN 0: WIDTH 80, 25: CLS : END
                END IF
        CASE ELSE:
                PRINT "SBSIM driver found!"
END SELECT






'************** Start Up
midifilename$ = "2.mid"
charpx = 170  'Set up The Center Of The Screen
charpy = 90

'Set Starting Game Point
'charx = 20
'chary = 19

'Set Starting Character Tile
characterpic = 55
Direction$ = "SOUTH"

AnimationDelay = 2000
'************ Animation Startup Frame Tiles
ChangeTorch = 4
'************ Animation Startup Frame Tiles
'************** Start Up Done


tilemax = 40
SCREEN 13
CLS

'Loads Tile Set File, And Makes an Index!!!
REDIM demoimages%(1 TO 1)
Filename$ = "tiles.put"
CALL initimagedata(Filename$, demoimages%())
REDIM imageno%(1 TO 1)
CALL makeimageindex(demoimages%(), imageno%())
loadname$ = "map1.map"
REDIM demopalette&(1 TO 1)
CALL initpalettedata("tiles.apf", demopalette&())
PALETTE USING demopalette&
GOSUB loadmap
GOSUB playmidifile



mxset = charx - 7
myset = chary - 4
mx = mxset
my = myset
vx = 1
Vy = 1







'===========================-----------Main Map Maker System!!!!
DO
AnimDelay = AnimDelay + 1
IF AnimDelay = AnimationDelay THEN GOSUB Animate

'CpuMoveDelay = CpuMoveDelay + 1
'IF CpuMoveDelay = 1000 THEN GOSUB CPUMove

A$ = INKEY$
IF A$ = CHR$(27) THEN stopmidi: END
IF A$ = CHR$(0) + "H" THEN GOSUB up
IF A$ = CHR$(0) + "K" THEN GOSUB Left
IF A$ = CHR$(0) + "P" THEN GOSUB down
IF A$ = CHR$(0) + "M" THEN GOSUB right
IF A$ = CHR$(32) THEN GOSUB Action
LOOP
Action:
RETURN
'************************Go Here If They Enter A House Or Building
Changeposition:
xcheese = 1
ycheese = 1
DO
IF mprop(xcheese, ycheese) = ChangePos AND xcheese <> charx AND ycheese <> chary THEN GOTO changedone
xcheese = xcheese + 1
IF xcheese = 101 THEN xcheese = 1: ycheese = ycheese + 1
LOOP
changedone:
charx = xcheese
chary = ycheese
mxset = xcheese - 7
myset = ycheese - 4
CLS
GOTO setview



'===========================-----------Main Map Maker System!!!!
Animate:
xod = 1
yod = 1
DO UNTIL yod = 10
'********************Torch Animation
IF Vmap(xod, yod) = 4 THEN Vmap(xod, yod) = 5: ChangeTorch = 5: GOTO SkipTorch1
IF Vmap(xod, yod) = 5 THEN Vmap(xod, yod) = 6: ChangeTorch = 6: GOTO SkipTorch1
IF Vmap(xod, yod) = 6 THEN Vmap(xod, yod) = 4: ChangeTorch = 4: GOTO SkipTorch1
'********************Torch Animation
SkipTorch1:
xod = xod + 1
IF xod = 16 THEN yod = yod + 1: xod = 1
AnimDelay = 1
LOOP
GOTO SetVMap

CPUMove:
xod = 1
yod = 1
DO UNTIL yod = 10
IF mprop(xod, yod) = 16 THEN GOSUB movecpu: BEEP
xod = xod + 1
IF xod = 16 THEN yod = yod + 1: xod = 1
LOOP
CpuMoveDelay = 1
GOTO SetVMap

movecpu:
RANDOMIZE TIMER
Direction = INT(RND * 4) + 1
'1- north 2- East 3- South 4- West
LOCATE 1, 1: PRINT Direction

IF Direction = 1 THEN
IF mprop(xod - 1, yod) = 1 THEN RETURN
map(xod - 1, yod) = map(xod, yod)
mprop(xod - 1, yod) = mprop(xod, yod)
map(xod, yod) = 1
END IF


IF Direction = 2 THEN
IF mprop(xod, yod + 1) = 1 THEN RETURN
map(xod, yod + 1) = map(xod, yod)
mprop(xod, yod + 1) = mprop(xod, yod)
map(xod, yod) = 1
END IF

IF Direction = 3 THEN
IF mprop(xod + 1, yod) = 1 THEN RETURN
map(xod + 1, yod) = map(xod, yod)
mprop(xod + 1, yod) = mprop(xod, yod)
map(xod, yod) = 1
END IF

IF Direction = 4 THEN
IF mprop(xod, yod - 1) = 1 THEN RETURN
map(xod, yod - 1) = map(xod, yod)
mprop(xod, yod - 1) = mprop(xod, yod)
map(xod, yod) = 1
END IF

RETURN

loadmap:
CLS
OPEN loadname$ FOR INPUT AS #1
xos = 1
yos = 1
DO UNTIL yos = 101
INPUT #1, map(xos, yos)
INPUT #1, mprop(xos, yos)
IF mprop(xos, yos) = 2 THEN charx = xos: chary = yos
xos = xos + 1
IF xos = 101 THEN xos = 1: yos = yos + 1
LOOP
CLOSE #1
mxset = charx - 7
myset = chary - 4

GOTO setview

UpTest:
IF mprop(charx, (chary - 1)) = 8 THEN GOTO setview 'Water Bee/Walk/Boat Test
IF mprop(charx, (chary - 1)) = 1 THEN GOTO setview 'Blocked Space
GOTO UpTestPassed

DownTest:
IF mprop(charx, (chary + 1)) = 8 THEN GOTO setview 'Water Bee/Walk/Boat Test
IF mprop(charx, (chary + 1)) = 1 THEN GOTO setview 'Blocked Space
GOTO DownTestPassed

LeftTest:
IF mprop((charx - 1), chary) = 8 THEN GOTO setview'Water Bee/Walk/Boat Test
IF mprop((charx - 1), chary) = 1 THEN GOTO setview'Blocked Space
GOTO LeftTestPassed

RightTest:
IF mprop((charx + 1), chary) = 8 THEN GOTO setview'Water Bee/Walk/Boat Test
IF mprop((charx + 1), chary) = 1 THEN GOTO setview'Blocked Space
GOTO RightTestPassed




up:
Direction$ = "NORTH"
characterpic = 56
IF chary = 5 THEN RETURN
GOTO UpTest
UpTestPassed:
characterpic = 56
myset = myset - 1
chary = chary - 1
IF mprop(charx, chary) = 3 THEN ChangePos = 4: GOSUB Changeposition
IF mprop(charx, chary) = 5 THEN ChangePos = 6: GOSUB Changeposition
GOTO setview

down:
Direction$ = "SOUTH"
characterpic = 55
IF chary = 96 THEN RETURN
GOTO DownTest
DownTestPassed:
characterpic = 55
myset = myset + 1
chary = chary + 1
IF mprop(charx, chary) = 3 THEN ChangePos = 4: GOSUB Changeposition
IF mprop(charx, chary) = 5 THEN ChangePos = 6: GOSUB Changeposition
GOTO setview

Left:
Direction$ = "WEST"
characterpic = 57
IF charx = 8 THEN RETURN
GOTO LeftTest
LeftTestPassed:
characterpic = 57
mxset = mxset - 1
charx = charx - 1
IF mprop(charx, chary) = 3 THEN ChangePos = 4: GOSUB Changeposition
IF mprop(charx, chary) = 5 THEN ChangePos = 6: GOSUB Changeposition
GOTO setview

right:
Direction$ = "EAST"
characterpic = 58
IF charx = 92 THEN RETURN
GOTO RightTest
RightTestPassed:
characterpic = 58
mxset = mxset + 1
charx = charx + 1
IF mprop(charx, chary) = 3 THEN ChangePos = 4: GOSUB Changeposition
IF mprop(charx, chary) = 5 THEN ChangePos = 6: GOSUB Changeposition
GOTO setview




'Set Up Viewing Matrix on Movement of Cursor
setview:
LOCATE 1, 1: PRINT "X:"; charx; "Y:"; chary; "Tile#:"; map(charx, chary); "TileProp#"; mprop(charx, chary)
vx = 1
Vy = 1
mx = mxset
my = myset
'*************** Set Up 15x9 Viewing Matrix
DO UNTIL Vy = 10
Vmap(vx, Vy) = map(mx, my)



'******************** Changes Images For Animation On Movement(fast)
IF Vmap(vx, Vy) >= 4 AND Vmap(vx, Vy) <= 6 THEN Vmap(vx, Vy) = ChangeTorch
'******************** Changes Images For Animation On Movement(fast)



vx = vx + 1
mx = mx + 1
IF vx = 16 THEN Vy = Vy + 1: vx = 1
IF mx = 15 + mxset THEN my = my + 1: mx = mxset
LOOP


'************************ Draw Map Image On Screen!!!
SetVMap:
imagenum = 1
x = 10
y = 10
vx = 1
Vy = 1
DO UNTIL Vy = 10

PUT (charpx - 20, charpy), demoimages%(imageno%(characterpic)), PSET
imagenum = Vmap(vx, Vy)
PUT (x, y), demoimages%(imageno%(imagenum)), PSET
vx = vx + 1
x = x + 20

IF x = 310 THEN y = y + 20: x = 10
IF vx = 16 THEN Vy = Vy + 1: vx = 1

LOOP
'PSET (charpx, charpy), 12: DRAW "d20l20u20r20"
PUT (charpx - 20, charpy), demoimages%(imageno%(characterpic)), PSET
RETURN






playmidifile:
REDIM MIDI%(BytesRequired&(midifilename$) \ 2)
LoadAndPlayMIDI midifilename$, VARSEG(MIDI%(0)), VARPTR(MIDI%(0))
PlayMIDI VARSEG(MIDI%(0)), VARPTR(MIDI%(0))
RETURN









SBMIDIData:
DATA 156,30,6,80,83,81,82,87,86,85,139,236,80,184,14,16,142,216,142,192,88,131,78,24,1,199,70,12,255,255,128,62
DATA 68,1,0,117,59,198,6,68,1,1,251,252,11,219,120,21,129,251,13,0,115,37,131,102,24,254,209,227,255,151,40,0
DATA 137,70,12,235,22,247,219,75,129,251,3,0,115,13,131,102,24,254,209,227,255,151,34,0,137,70,12,198,6,68,1,0
DATA 93,94,95,90,89,91,88,7,31,157,207,156,250,30,6,80,184,14,16,142,216,142,192,161,145,1,1,6,28,0,114,6
DATA 176,32,230,32,235,9,255,6,28,0,156,255,30,18,0,83,81,82,87,86,85,139,236,250,128,62,67,1,0,117,54,140
DATA 22,32,0,137,38,30,0,140,216,142,208,188,66,1,198,6,67,1,1,251,252,131,62,133,1,0,116,10,128,62,21,3
DATA 0,117,3,232,143,4,250,139,38,30,0,142,22,32,0,198,6,67,1,0,251,93,94,95,90,89,91,88,7,31,157,207
DATA 30,6,80,83,81,82,87,86,85,156,184,14,16,142,216,142,192,228,96,10,192,120,18,60,83,117,14,180,2,205,22,36
SBSIMData:
DATA 46,143,6,134,1,46,143,6,132,1,46,143,6,130,1,46,131,14,130,1,1,46,131,62,110,1,0,116,6,184,1,0
DATA 233,193,0,128,255,5,119,25,10,255,116,27,81,80,51,192,138,207,128,225,127,249,211,208,46,35,6,126,1,88,89,117
DATA 6,184,2,0,233,157,0,250,46,140,30,138,1,14,31,140,22,140,1,137,38,142,1,142,22,152,1,139,38,154,1,85
DATA 139,236,86,87,6,83,163,144,1,137,22,148,1,137,14,146,1,180,98,205,33,137,30,150,1,180,80,140,203,205,33,199
DATA 6,110,1,1,0,251,252,50,192,255,30,118,1,139,94,248,83,134,251,3,219,3,219,50,255,254,14,124,1,117,11,129
DATA 6,152,1,0,0,198,6,124,1,20,139,243,91,50,255,30,7,255,156,176,1,114,5,131,38,130,1,254,250,199,6,110
DATA 1,0,0,80,180,80,139,30,150,1,205,33,88,91,7,95,94,139,229,93,139,14,146,1,142,22,140,1,139,38,142,1
DATA 142,30,138,1,46,255,54,130,1,46,255,54,132,1,46,255,54,134,1,207,85,139,236,131,236,10,137,70,248,137,94,250

REM $STATIC
'BytesRequired - Returns the amount of memory needed to store a file.
FUNCTION BytesRequired& (Filename$)
'Open the file.
FF% = FREEFILE
OPEN Filename$ FOR BINARY AS #FF%
'Store the length of the file.
FileLen& = LOF(FF%)
'Close the file.
CLOSE FF%
'If the length of the file is 0, assume it does not exist and delete it.
IF FileLen& = 0 THEN KILL Filename$
'Return the length of the file as the number of bytes required.
BytesRequired& = FileLen&
MIDI.ERROR = 0
END FUNCTION

DEFINT A-Z
SUB ChangePalette (PaletteArray&())

    'Break down all 256 colours into their RGB values.
    DIM RGBval(0 TO 255, 0 TO 2)
    FOR n = 0 TO 255
        c& = PaletteArray&(n)
        b = c& \ 65536: c& = c& - b * 65536
        g = c& \ 256: c& = c& - g * 256
        r = c&
        RGBval(n, 0) = r
        RGBval(n, 1) = g
        RGBval(n, 2) = b
    NEXT n

    'Write colours directly to the video card.
    WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
    FOR n = 0 TO 255
        OUT &H3C8, n            'Select attribute.
        OUT &H3C9, RGBval(n, 0) 'Write red.
        OUT &H3C9, RGBval(n, 1) 'Write green.
        OUT &H3C9, RGBval(n, 2) 'Write blue.
    NEXT n

END SUB

SUB CharPrint (Text$, Fore, Back, CursorPos, ImageArray())

    'Create an 8x8 image array to build a character in.
    DIM NewChar(1 TO 34)
    NewChar(1) = 64: NewChar(2) = 8
   
    'Convert text cursor position to graphics (x,y) coordinates.
    x = (POS(0) - 1) * 8: y = (CSRLIN - 1) * 8

    'Get high byte equivalent of Fore & Back colours.
    HighFore = 0: HighBack = 0
    DEF SEG = VARSEG(HighFore)
    POKE VARPTR(HighFore) + 1, Fore
    DEF SEG = VARSEG(HighBack)
    POKE VARPTR(HighBack) + 1, Back
    DEF SEG

    IF Back = OVERPRINT THEN
        '*** Overprint text onto existing screen image ***

        'Loop to build and display each character of Text$.
        FOR J = 1 TO LEN(Text$)
            GET (x, y)-STEP(7, 7), NewChar(1)

            BasePtr = (ASC(MID$(Text$, J, 1)) - 32) * 34

            'Build new character image in NewChar().
            FOR n = 3 TO 34
                PixPair = ImageArray(BasePtr + n)

                IF (PixPair AND &HFF) THEN
                    LowByte = Fore
                ELSE
                    LowByte = NewChar(n) AND &HFF
                END IF

                IF (PixPair AND &HFF00) THEN
                    NewChar(n) = HighFore OR LowByte
                ELSE
                    NewChar(n) = (NewChar(n) AND &HFF00) OR LowByte
                END IF
            NEXT n

            'Display the character.
            PUT (x, y), NewChar(1), PSET

            'Find screen coordinates for next character.
            IF x = 312 THEN
                x = 0
                IF y <> 192 THEN y = y + 8
            ELSE
                x = x + 8
            END IF
        NEXT J
    ELSE
        '*** Display text using foreground & background colours ***

        'Loop to build and display each character of Text$.
        FOR J = 1 TO LEN(Text$)
            BasePtr = (ASC(MID$(Text$, J, 1)) - 32) * 34

            'Build new character image in NewChar().
            FOR n = 3 TO 34
                PixPair = ImageArray(BasePtr + n)

                IF (PixPair AND &HFF) THEN
                    LowByte = Fore
                ELSE
                    LowByte = Back
                END IF

                IF (PixPair AND &HFF00) THEN
                    NewChar(n) = HighFore OR LowByte
                ELSE
                    NewChar(n) = HighBack OR LowByte
                END IF
            NEXT n

            'Display the character.
            PUT (x, y), NewChar(1), PSET

            'Find screen coordinates for next character.
            IF x = 312 THEN
                x = 0
                IF y <> 192 THEN y = y + 8
            ELSE
                x = x + 8
            END IF
        NEXT J
    END IF

    'Update text cursor to required position before exiting.
    c = (x \ 8) + 1: r = (y \ 8) + 1
    IF CursorPos = NEWLINE THEN
        'Check a new line is actually required.
        IF c <> 1 THEN
            c = 1
            IF r < 25 THEN r = r + 1
        END IF
    END IF
    LOCATE r, c

END SUB

SUB CharPrintXY (x, y, Text$, Fore, Back, CursorPos, ImageArray())

    MessLen = LEN(Text$)
    IF x = CENTRETEXT THEN
        'Find start X coordinate for centred text.
        w = MessLen * 8
        x = (320 - w) \ 2
    ELSEIF x = FROMCURSOR THEN
        'Use current X coordinate.
        x = POINT(0)
    END IF

    'Use current Y coordinate if requested.
    IF y = FROMCURSOR THEN y = POINT(1)

    'Create an 8x8 image array to build a character in.
    DIM NewChar(1 TO 34)
    NewChar(1) = 64: NewChar(2) = 8

    'Get high byte equivalent of Fore & Back colours.
    HighFore = 0: HighBack = 0
    DEF SEG = VARSEG(HighFore)
    POKE VARPTR(HighFore) + 1, Fore
    DEF SEG = VARSEG(HighBack)
    POKE VARPTR(HighBack) + 1, Back
    DEF SEG

    IF Back = OVERPRINT THEN
        '*** Overprint text onto existing screen image ***

        'Loop to build and display each character of Text$.
        FOR J = 1 TO LEN(Text$)
            GET (x, y)-STEP(7, 7), NewChar(1)

            BasePtr = (ASC(MID$(Text$, J, 1)) - 32) * 34

            'Build new character image in NewChar().
            FOR n = 3 TO 34
                PixPair = ImageArray(BasePtr + n)

                IF (PixPair AND &HFF) THEN
                    LowByte = Fore
                ELSE
                    LowByte = NewChar(n) AND &HFF
                END IF

                IF (PixPair AND &HFF00) THEN
                    NewChar(n) = HighFore OR LowByte
                ELSE
                    NewChar(n) = (NewChar(n) AND &HFF00) OR LowByte
                END IF
            NEXT n

            'Display the character.
            PUT (x, y), NewChar(1), PSET

            'Find screen coordinates for next character.
            IF x >= 305 THEN
                x = 0
                IF y >= 185 THEN y = 192 ELSE y = y + 8
            ELSE
                x = x + 8
            END IF
        NEXT J
    ELSE
        '*** Display text using foreground & background colours ***

        'Loop to build and display each character of Text$.
        FOR J = 1 TO LEN(Text$)
            BasePtr = (ASC(MID$(Text$, J, 1)) - 32) * 34

            'Build new character image in NewChar().
            FOR n = 3 TO 34
                PixPair = ImageArray(BasePtr + n)

                IF (PixPair AND &HFF) THEN
                    LowByte = Fore
                ELSE
                    LowByte = Back
                END IF

                IF (PixPair AND &HFF00) THEN
                    NewChar(n) = HighFore OR LowByte
                ELSE
                    NewChar(n) = HighBack OR LowByte
                END IF
            NEXT n

            'Display the character.
            PUT (x, y), NewChar(1), PSET

            'Find screen coordinates for next character.
            IF x >= 305 THEN
                x = 0
                IF y >= 185 THEN y = 192 ELSE y = y + 8
            ELSE
                x = x + 8
            END IF
        NEXT J
    END IF

    'Update graphics cursor to required position before exiting.
    IF CursorPos = NEWLINE THEN
        'Check a new line is actually required.
        IF x <> 0 THEN
            x = 0
            IF y < 185 THEN y = y + 8
        END IF
    END IF
    PSET (x, y), POINT(x, y)

END SUB

SUB DisplayDesign (DesignArray() AS DesignType, ImageArray(), ImageIndex(), ClsAction)

    'Only clear the screen if requested to.
    IF ClsAction THEN CLS

    LastItem = UBOUND(DesignArray)

    'Loop to display all items in the screen design.
    FOR n = 1 TO LastItem
        imageno = DesignArray(n).imageno
        Xpos = DesignArray(n).Xpos
        Ypos = DesignArray(n).Ypos
        DisAct = DesignArray(n).DisAct

        'Mask-out high byte of DisAct to find display action code.
        SELECT CASE (DisAct AND &HFF)
            CASE 1
                PUT (Xpos, Ypos), ImageArray(ImageIndex(imageno)), PSET
            CASE 2
                PUT (Xpos, Ypos), ImageArray(ImageIndex(imageno)), PRESET
            CASE 3
                PUT (Xpos, Ypos), ImageArray(ImageIndex(imageno)), OR
            CASE 4
                PUT (Xpos, Ypos), ImageArray(ImageIndex(imageno)), XOR
            CASE 5
                PUT (Xpos, Ypos), ImageArray(ImageIndex(imageno)), AND
        END SELECT
    NEXT n

END SUB

DEFSNG A-Z
SUB DriversLoaded (SBMIDI%, SBSIM%) STATIC
'Check the interrupt handlers for int 80h-89h to see if they contain
'program code from either SBSIM or SBMIDI.  Only those 10 interrupts
'are checked because chances are slim that either driver will be loaded
'at int 8Ah or higher, and they will never load themselves below
'80h.

FOR I% = &H80 TO &H8A
    'Get the address of the interrupt handler.
    GetIntVector I%, Segment%, Offset%
    'If the address is null, then the interrupt is not in use, and can be
    'skipped.
    IF Segment% = 0 AND Offset% = 0 THEN GOTO Skip:

    'Point to the segment of the interrupt handler.
    DEF SEG = Segment%
    RESTORE SBMIDIData:
    FOR J% = 0 TO 255
        'Read a byte of the SBMIDI program code that has been previously
        'saved.
        READ Byte1%
        'Read a byte of code from the current interrupt handler.
        Byte2% = PEEK(Offset% + J%)
        'Do they match?  If so, we may have found SBMIDI!
        IF Byte1% = Byte2% THEN
            MatchSBMIDI% = 1
        'If not, this interrupt is definitely not occupied by SBMIDI.
        ELSE
            SELECT CASE J%
                CASE IS = 14, 15, 113, 114, 235, 236
                CASE ELSE
                    MatchSBMIDI% = 0
                    EXIT FOR
            END SELECT
        END IF
    NEXT J%
    'If there's a match, set SBMIDI% to the current interrupt.
    IF MatchSBMIDI% THEN SBMIDI% = I%
    RESTORE SBSIMData:
    FOR J% = 0 TO 255
        'Read a byte of the SBSIM program code that has been previously
        'saved.
        READ Byte1%
        'Read a byte of code from the current interrupt handler.
        Byte2% = PEEK(Offset% + J%)
        'If the values match, SBSIM may be loaded at this interrupt.
        IF Byte1% = Byte2% THEN
            MatchSBSIM% = 1
        'If not, then it isn't.
        ELSE
            MatchSBSIM% = 0
            EXIT FOR
        END IF
    NEXT J%
    'If this interrupt handler is a match, set SBSIM% to the current
    'interrupt number.
    IF MatchSBSIM% THEN SBSIM% = I%

    'If both SBMIDI% and SBSIM% have been detected, there's no need to
    'check the rest of the interrupt handling routines.
    IF MatchSBMIDI% AND MatchSBSIM% THEN EXIT FOR
Skip:
NEXT I%

END SUB

DEFINT A-Z
SUB FadePalette (Direction, PaletteArray&())

    IF Direction = FADEDOWN THEN
        '*** Fade palette down ***

        'Break down all 256 colours into their RGB values and
        'calculate how much each will need fading down by.
        DIM RGBval!(0 TO 255, 0 TO 2)
        DIM SubVal!(0 TO 255, 0 TO 2)
        FOR n = 0 TO 255
            c& = PaletteArray&(n)
            b = c& \ 65536: c& = c& - b * 65536
            g = c& \ 256: c& = c& - g * 256
            r = c&
            RGBval!(n, 0) = r
            RGBval!(n, 1) = g
            RGBval!(n, 2) = b
            SubVal!(n, 0) = r / 63
            SubVal!(n, 1) = g / 63
            SubVal!(n, 2) = b / 63
        NEXT n

        'Fade down all 256 colours in 63 steps.
        FOR J = 1 TO 63
            'Calculate new faded down RGB values.
            FOR n = 0 TO 255
                RGBval!(n, 0) = RGBval!(n, 0) - SubVal!(n, 0)
                RGBval!(n, 1) = RGBval!(n, 1) - SubVal!(n, 1)
                RGBval!(n, 2) = RGBval!(n, 2) - SubVal!(n, 2)
            NEXT n

            'Write faded down colours directly to the video card.
            WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
            FOR n = 0 TO 255
                OUT &H3C8, n             'Select attribute.
                OUT &H3C9, RGBval!(n, 0) 'Write red.
                OUT &H3C9, RGBval!(n, 1) 'Write green.
                OUT &H3C9, RGBval!(n, 2) 'Write blue.
            NEXT n
        NEXT J
    ELSE
        '*** Fade palette up ***

        'Break down all 256 colours into their RGB values and
        'calculate how much each will need fading up by.
        DIM RGBval!(0 TO 255, 0 TO 2)
        DIM AddVal!(0 TO 255, 0 TO 2)
        FOR n = 0 TO 255
            c& = PaletteArray&(n)
            b = c& \ 65536: c& = c& - b * 65536
            g = c& \ 256: c& = c& - g * 256
            r = c&
            AddVal!(n, 0) = r / 63
            AddVal!(n, 1) = g / 63
            AddVal!(n, 2) = b / 63
        NEXT n

        'Fade up all 256 colours in 63 steps.
        FOR J = 1 TO 63
            'Calculate new faded up RGB values.
            FOR n = 0 TO 255
                RGBval!(n, 0) = RGBval!(n, 0) + AddVal!(n, 0)
                RGBval!(n, 1) = RGBval!(n, 1) + AddVal!(n, 1)
                RGBval!(n, 2) = RGBval!(n, 2) + AddVal!(n, 2)
            NEXT n

            'Write faded up colours directly to the video card.
            WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
            FOR n = 0 TO 255
                OUT &H3C8, n             'Select attribute.
                OUT &H3C9, RGBval!(n, 0) 'Write red.
                OUT &H3C9, RGBval!(n, 1) 'Write green.
                OUT &H3C9, RGBval!(n, 2) 'Write blue.
            NEXT n
        NEXT J
    END IF

END SUB

FUNCTION GetDepth (ImNo, ImageArray(), IndexArray())

    GetDepth = ImageArray(IndexArray(ImNo) + 1)

END FUNCTION

DEFSNG A-Z
SUB GetIntVector (IntNum%, Segment%, Offset%) STATIC
'If the code hasn't been loaded already, do it now.
IF GetIntVCodeLoaded% = 0 THEN
    asm$ = asm$ + CHR$(&H55)
    asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)
    asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)
    asm$ = asm$ + CHR$(&H8A) + CHR$(&H7)
    asm$ = asm$ + CHR$(&HB4) + CHR$(&H35)
    asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)
    asm$ = asm$ + CHR$(&H8C) + CHR$(&HC1)
    asm$ = asm$ + CHR$(&H89) + CHR$(&HDA)
    asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)
    asm$ = asm$ + CHR$(&H89) + CHR$(&HF)
    asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)
    asm$ = asm$ + CHR$(&H89) + CHR$(&H17)
    asm$ = asm$ + CHR$(&H5D)
    asm$ = asm$ + CHR$(&HCB)
    asm$ = asm$ + CHR$(&H34) + CHR$(&H0)
    asm$ = asm$ + CHR$(&H60)
    asm$ = asm$ + CHR$(&H23) + CHR$(&H0)
    GetIntVCodeLoaded% = 1
END IF
'Execute the code
DEF SEG = VARSEG(asm$)
CALL ABSOLUTE(IntNum%, Segment%, Offset%, SADD(asm$))
END SUB

DEFINT A-Z
FUNCTION GetWidth (ImNo, ImageArray(), IndexArray())

    GetWidth = ImageArray(IndexArray(ImNo)) \ 8

END FUNCTION

SUB GraphicText (x, y, Text$, CursorPos, ImageArray(), IndexArray())

    MessLen = LEN(Text$)
    IF x = CENTRETEXT THEN
        'Find start X coordinate for centred text.
        w = 0
        FOR n = 1 TO MessLen
            CharNo = ASC(MID$(Text$, n, 1)) - 31
            w = w + GetWidth(CharNo, ImageArray(), IndexArray())
        NEXT n
        x = (320 - w) \ 2
    ELSEIF x = FROMCURSOR THEN
        'Use current X coordinate.
        x = POINT(0)
    END IF

    'Use current Y coordinate if requested.
    IF y = FROMCURSOR THEN y = POINT(1)

    CharDepth = GetDepth(1, ImageArray(), IndexArray())

    'Loop to display each character of Text$.
    FOR n = 1 TO MessLen
        CharNo = ASC(MID$(Text$, n, 1)) - 31
        CharWidth = GetWidth(CharNo, ImageArray(), IndexArray())

        'Screen coordinate management for current character.
        IF x + CharWidth > 320 THEN
            x = 0
            IF (y + CharDepth + CharDepth - 1) > 199 THEN
                y = 200 - CharDepth
            ELSE
                y = y + CharDepth
            END IF
        END IF

        PUT (x, y), ImageArray(IndexArray(CharNo)), PSET
        x = x + CharWidth
    NEXT n

    'Ensure x and y are valid screen coordinates.
    IF x > 319 THEN
        x = 0
        IF (y + CharDepth + CharDepth - 1) > 199 THEN
            y = 200 - CharDepth
        ELSE
            y = y + CharDepth
        END IF
    END IF

    'Update graphics cursor to required position before exiting.
    IF CursorPos = NEWLINE THEN
        'Check a new line is actually required.
        IF x <> 0 THEN
            x = 0
            IF (y + CharDepth + CharDepth - 1) > 199 THEN
                y = 200 - CharDepth
            ELSE
                y = y + CharDepth
            END IF
        END IF
    END IF
    PSET (x, y), POINT(x, y)

END SUB

SUB InitDesignData (Filename$, DesignArray() AS DesignType)

    IF Filename$ <> "" THEN
        '***** Read screen design data from file *****

        'Establish size of DesignType array required.
        FileNo = FREEFILE
        OPEN Filename$ FOR BINARY AS #FileNo
        ItemCount = (LOF(FileNo) - 7) \ 8
        CLOSE #FileNo
        REDIM DesignArray(0 TO ItemCount) AS DesignType

        'Load screen design data directly into array memory.
        DEF SEG = VARSEG(DesignArray(0))
        BLOAD Filename$, 0
        DEF SEG
    ELSE
        '***** Read screen design data from DATA statements *****

        'Establish size of DesignType array required.
        READ ItemCount
        REDIM DesignArray(0 TO ItemCount) AS DesignType

        'READ screen design DATA into array.
        FOR n = 1 TO ItemCount
            READ imageno, Xpos, Ypos, DisAct
            DesignArray(n).imageno = imageno
            DesignArray(n).Xpos = Xpos
            DesignArray(n).Ypos = Ypos
            DesignArray(n).DisAct = DisAct
        NEXT n
    END IF

END SUB

SUB initimagedata (Filename$, ImageArray())

    IF Filename$ <> "" THEN
        '***** Read image data from file *****

        'Establish size of integer array required.
        FileNo = FREEFILE
        OPEN Filename$ FOR BINARY AS #FileNo
        Ints = (LOF(FileNo) - 7) \ 2
        CLOSE #FileNo
        REDIM ImageArray(1 TO Ints)

        'Load image data directly into array memory.
        DEF SEG = VARSEG(ImageArray(1))
        BLOAD Filename$, 0
        DEF SEG
    ELSE
        '***** Read image data from DATA statements *****

        'Establish size of integer array required.
        READ IntCount
        REDIM ImageArray(1 TO IntCount)

        'READ image DATA into array.
        FOR n = 1 TO IntCount
            READ x
            ImageArray(n) = x
        NEXT n
    END IF

END SUB

'* InitPaletteData() subroutine:
'* Initializes a long integer array with palette colour data - this must be
'* done before changing palettes with the PALETTE USING statement. The
'* calling value of FileName$ dictates whether the data should be read
'* directly from a palette file or from DATA statements (see below).
'*
'* Parameters:
'*       FileName$ - The name of the palette file to load. This must include
'*                   the path to the file if it does not reside in the
'*                   current directory. If FileName$ is an empty string (""),
'*                   palette data is read from DATA statements.
'* PaletteArray&() - Dynamic, long integer array to hold palette data.
'*
'* Note: Before calling InitPaletteData() to initialize a palette from DATA
'*       statements, use an appropriate RESTORE statement to ensure the
'*       correct DATA statements are read.
'*
SUB initpalettedata (Filename$, PaletteArray&())

    'Size array to hold all 256 colours.
    REDIM PaletteArray&(0 TO 255)

    IF Filename$ <> "" THEN
        '*** Read palette data from file ***
        FileNo = FREEFILE
        OPEN Filename$ FOR BINARY AS #FileNo
        FOR n = 0 TO 255
            GET #FileNo, , colour&
            PaletteArray&(n) = colour&
        NEXT n
        CLOSE #FileNo
    ELSE
        '*** Read palette data from DATA statements ***
        FOR n = 0 TO 255
            READ colour&
            PaletteArray&(n) = colour&
        NEXT n
    END IF

END SUB

DEFSNG A-Z
SUB LoadAndPlayMIDI (Filename$, MIDISegment%, MIDIOffset%)
'LoadAndPlayMIDI - Loads a MIDI file into memory and plays it
'See if an extension was supplied, and if not, add one.
IF INSTR(Filename$, ".") = 0 THEN Filename$ = Filename$ + ".MID"
'Open the file
FF% = FREEFILE
OPEN Filename$ FOR BINARY AS #FF%
FileLen& = LOF(1)
CLOSE #FF%
'If the file is empty, delete it and exit now.
IF FileLen& = 0 THEN KILL Filename$: MIDI.ERROR = 1: EXIT SUB
'If the file is too large, exit now.
IF FileLen& > 65535 THEN MIDI.ERROR = 2: EXIT SUB
'Make the filename an ASCIIZ string.
Filename$ = Filename$ + CHR$(0)
'Check if the MIDI loading code has already been loaded;
'if not, do it now.
IF LoadCodeLoaded% = 0 THEN
        asm1$ = asm1$ + CHR$(&H1E)
        asm1$ = asm1$ + CHR$(&H55)
        asm1$ = asm1$ + CHR$(&H89) + CHR$(&HE5)
        asm1$ = asm1$ + CHR$(&HB8) + CHR$(&H0) + CHR$(&H3D)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HE)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H17)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H10)
        asm1$ = asm1$ + CHR$(&H8E) + CHR$(&H1F)
        asm1$ = asm1$ + CHR$(&HCD) + CHR$(&H21)
        asm1$ = asm1$ + CHR$(&H89) + CHR$(&HC6)
        asm1$ = asm1$ + CHR$(&HB4) + CHR$(&H3F)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&HF)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H17)
        asm1$ = asm1$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)
        asm1$ = asm1$ + CHR$(&H8E) + CHR$(&H1F)
        asm1$ = asm1$ + CHR$(&H89) + CHR$(&HF3)
        asm1$ = asm1$ + CHR$(&HCD) + CHR$(&H21)
        asm1$ = asm1$ + CHR$(&HB4) + CHR$(&H3E)
        asm1$ = asm1$ + CHR$(&HCD) + CHR$(&H21)
        asm1$ = asm1$ + CHR$(&H5D)
        asm1$ = asm1$ + CHR$(&H1F)
        asm1$ = asm1$ + CHR$(&HCA) + CHR$(&HA) + CHR$(&H0)
        LoadCodeLoaded% = 1
END IF
'Call the assembly language routine.
DEF SEG = VARSEG(asm1$)
CALL ABSOLUTE(VARSEG(Filename$), SADD(Filename$), MIDISegment%, MIDIOffset%, &HFFFF, SADD(asm1$))
MIDI.ERROR = 0
'Check to see if the MIDI playing code has previously been loaded.
'If not, load it now.
IF PlayCodeLoaded% = 0 THEN
        'Load the machine codes into a string.
        asm2$ = asm2$ + CHR$(&H55)
        asm2$ = asm2$ + CHR$(&H89) + CHR$(&HE5)
        asm2$ = asm2$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)
        asm2$ = asm2$ + CHR$(&H8B) + CHR$(&H17)
        asm2$ = asm2$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)
        asm2$ = asm2$ + CHR$(&H8B) + CHR$(&H7)
        asm2$ = asm2$ + CHR$(&HBB) + CHR$(&H4) + CHR$(&H0)
        asm2$ = asm2$ + CHR$(&HCD) + CHR$(SBMIDI.INTERRUPT)
        asm2$ = asm2$ + CHR$(&HBB) + CHR$(&H5) + CHR$(&H0)
        asm2$ = asm2$ + CHR$(&HCD) + CHR$(SBMIDI.INTERRUPT)
        asm2$ = asm2$ + CHR$(&H5D)
        asm2$ = asm2$ + CHR$(&HCA) + CHR$(&H4) + CHR$(&H0)
        'Indicate that the code has been loaded.
        PlayCodeLoaded% = 1
END IF
'Call the machine language routine to play the music.
DEF SEG = VARSEG(asm2$)
CALL ABSOLUTE(MIDISegment%, MIDIOffset%, SADD(asm2$))
'Start the MIDI timer.
MIDI.PLAYTIME = TIMER
MIDI.ERROR = 0
END SUB

SUB LoadMIDI (Filename$, MIDISegment%, MIDIOffset%) STATIC
'LoadMIDI - loads a MIDI file into memory
'See if an extension was supplied, and if not, add one.
IF INSTR(Filename$, ".") = 0 THEN Filename$ = Filename$ + ".MID"
'Open the file
FF% = FREEFILE
OPEN Filename$ FOR BINARY AS #FF%
FileLen& = LOF(1)
CLOSE #FF%
'If the file is empty, delete it and exit now.
IF FileLen& = 0 THEN KILL Filename$: MIDI.ERROR = 1: EXIT SUB
'If the file is too large, exit now.
IF FileLen& > 65535 THEN MIDI.ERROR = 2: EXIT SUB
'Make the filename an ASCIIZ string.
Filename$ = Filename$ + CHR$(0)
'Check if the MIDI loading code has already been loaded;
'if not, do it now.
IF LoadCodeLoaded% = 0 THEN
        asm$ = asm$ + CHR$(&H1E)
        asm$ = asm$ + CHR$(&H55)
        asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)
        asm$ = asm$ + CHR$(&HB8) + CHR$(&H0) + CHR$(&H3D)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HE)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H17)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H10)
        asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)
        asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)
        asm$ = asm$ + CHR$(&H89) + CHR$(&HC6)
        asm$ = asm$ + CHR$(&HB4) + CHR$(&H3F)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&HF)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HA)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H17)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&HC)
        asm$ = asm$ + CHR$(&H8E) + CHR$(&H1F)
        asm$ = asm$ + CHR$(&H89) + CHR$(&HF3)
        asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)
        asm$ = asm$ + CHR$(&HB4) + CHR$(&H3E)
        asm$ = asm$ + CHR$(&HCD) + CHR$(&H21)
        asm$ = asm$ + CHR$(&H5D)
        asm$ = asm$ + CHR$(&H1F)
        asm$ = asm$ + CHR$(&HCA) + CHR$(&HA) + CHR$(&H0)
        LoadCodeLoaded% = 1
END IF
'Call the assembly language routine.
DEF SEG = VARSEG(asm$)
CALL ABSOLUTE(VARSEG(Filename$), SADD(Filename$), MIDISegment%, MIDIOffset%, &HFFFF, SADD(asm$))
MIDI.ERROR = 0
END SUB

DEFINT A-Z
'* MakeImageIndex() subroutine:
'* Constructs an image position index for the images held in an image array.
'*
'* Parameters:
'* ImageArray() - Dynamic, integer array holding images to be indexed.
'* IndexArray() - Dynamic, integer array to hold the index for images in
'*                ImageArray().
'*
SUB makeimageindex (ImageArray(), IndexArray())

    'The index will initially be built in a temporary array, allowing
    'for the maximum 1000 images per file.
    DIM Temp(1 TO 1000)
    Ptr& = 1: IndexNo = 1: LastInt = UBOUND(ImageArray)
    DO
        Temp(IndexNo) = Ptr&
        IndexNo = IndexNo + 1

        'Evaluate descriptor of currently referenced image to
        'calculate the beginning of the next image.
        x& = (ImageArray(Ptr&) \ 8) * (ImageArray(Ptr& + 1)) + 4
        IF x& MOD 2 THEN x& = x& + 1
        Ptr& = Ptr& + (x& \ 2)
    LOOP WHILE Ptr& < LastInt

    LastImage = IndexNo - 1

    'Copy the image index values into the actual index array.
    REDIM IndexArray(1 TO LastImage)
    FOR n = 1 TO LastImage
        IndexArray(n) = Temp(n)
    NEXT n

END SUB

DEFSNG A-Z
FUNCTION MIDIError$
SELECT CASE MIDI.ERROR
        CASE 0: MIDIError$ = "NO ERROR"
        CASE 1: MIDIError$ = "FILE CONTAINS NO DATA"
        CASE 2: MIDIError$ = "FILE IS TOO LARGE"
        CASE 3: MIDIError$ = "NO MIDI FILE PLAYING"
        CASE ELSE: MIDIError$ = "UNKNOWN ERROR"
END SELECT
END FUNCTION

SUB PauseMIDI STATIC
'If no MIDI file is playing, exit now
IF MIDI.PLAYTIME = 0 THEN EXIT SUB
'Pause the music.
IF CodeLoaded% = 0 THEN
        asm$ = ""
        asm$ = asm$ + CHR$(&HB8) + CHR$(&H1) + CHR$(&H0)
        asm$ = asm$ + CHR$(&HBA) + CHR$(&H1) + CHR$(&H0)
        asm$ = asm$ + CHR$(&HBB) + CHR$(&H3) + CHR$(&H5)
        asm$ = asm$ + CHR$(&HCD) + CHR$(SBSIM.INTERRUPT)
        asm$ = asm$ + CHR$(&HCB)
        CodeLoaded% = 1
END IF
DEF SEG = VARSEG(asm$)
Offset% = SADD(asm$)
CALL ABSOLUTE(Offset%)
'Save the number of seconds the MIDI file has been playing.
PAUSED = TimeMIDI!
'If it hasn't been playing long enough for TimeMIDI! to return
'a value greater than 0, change PAUSED to a tiny positive value.
IF PAUSED = 0! THEN PAUSED = .00001
'Indicate that the file has stopped playing.
MIDI.PLAYTIME = 0
END SUB

SUB PlayMIDI (MIDISegment%, MIDIOffset%) STATIC
'Check to see if the MIDI playing code has previously been loaded.
'If not, load it now.
IF PlayCodeLoaded% = 0 THEN
        'Load the machine codes into a string.
        asm$ = asm$ + CHR$(&H55)
        asm$ = asm$ + CHR$(&H89) + CHR$(&HE5)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H8)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H17)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H5E) + CHR$(&H6)
        asm$ = asm$ + CHR$(&H8B) + CHR$(&H7)
        asm$ = asm$ + CHR$(&HBB) + CHR$(&H4) + CHR$(&H0)
        asm$ = asm$ + CHR$(&HCD) + CHR$(SBMIDI.INTERRUPT)
        asm$ = asm$ + CHR$(&HBB) + CHR$(&H5) + CHR$(&H0)
        asm$ = asm$ + CHR$(&HCD) + CHR$(SBMIDI.INTERRUPT)
        asm$ = asm$ + CHR$(&H5D)
        asm$ = asm$ + CHR$(&HCA) + CHR$(&H4) + CHR$(&H0)
        'Indicate that the code has been loaded.
        PlayCodeLoaded% = 1
END IF
'Call the machine language routine to play the music.
DEF SEG = VARSEG(asm$)
CALL ABSOLUTE(MIDISegment%, MIDIOffset%, SADD(asm$))
'Start the MIDI timer.
MIDI.PLAYTIME = TIMER
MIDI.ERROR = 0
END SUB

SUB ResumeMIDI STATIC
'If no MIDI file is paused, exit now
IF PAUSED = 0! THEN EXIT SUB
'Resume playing.
IF CodeLoaded% = 0 THEN
        asm$ = ""
        asm$ = asm$ + CHR$(&HB8) + CHR$(&H1) + CHR$(&H0)
        asm$ = asm$ + CHR$(&HBA) + CHR$(&H1) + CHR$(&H0)
        asm$ = asm$ + CHR$(&HBB) + CHR$(&H4) + CHR$(&H5)
        asm$ = asm$ + CHR$(&HCD) + CHR$(SBSIM.INTERRUPT)
        asm$ = asm$ + CHR$(&HCB)
        CodeLoaded% = 1
END IF
DEF SEG = VARSEG(asm$)
Offset% = SADD(asm$)
CALL ABSOLUTE(Offset%)
MIDI.PLAYTIME = TIMER - PAUSED
PAUSED = 0!

END SUB

DEFINT A-Z
'* RotatePalette() subroutine:
'* Rotates a contiguous range of colour attributes in the currently
'* active palette to the left or right.
'*
'* Parameters:
'*       StartAttr - First attribute of the range to be rotated.
'*         EndAttr - Last attribute of the range to be rotated.
'*       Direction - Dictates what direction the selected colours should
'*                   be rotated in:
'*                   Use ROTATELEFT to rotate colours to the left.
'*                   Use ROTATERIGHT to rotate colours to the right.
'* PaletteArray&() - Palette array holding the colours of the currently
'*                   active colour palette.
'*
SUB RotatePalette (StartAttr, EndAttr, Direction, PaletteArray&())

    'Rotate affected colours in PaletteArray&() in the requested direction.
    IF Direction = ROTATERIGHT THEN
        '*** Rotate right ***
        Lastc& = PaletteArray&(EndAttr)
        FOR n = EndAttr TO StartAttr + 1 STEP -1
            PaletteArray&(n) = PaletteArray&(n - 1)
        NEXT n
        PaletteArray&(StartAttr) = Lastc&
    ELSE
        '*** Rotate left ***
        Lastc& = PaletteArray&(StartAttr)
        FOR n = StartAttr TO EndAttr - 1
            PaletteArray&(n) = PaletteArray&(n + 1)
        NEXT n
        PaletteArray&(EndAttr) = Lastc&
    END IF

    'Break down the colours into their RGB values.
    DIM RGBval(StartAttr TO EndAttr, 0 TO 2)
    FOR n = StartAttr TO EndAttr
        c& = PaletteArray&(n)
        b = c& \ 65536: c& = c& - b * 65536
        g = c& \ 256: c& = c& - g * 256
        r = c&
        RGBval(n, 0) = r
        RGBval(n, 1) = g
        RGBval(n, 2) = b
    NEXT n

    'Write colours directly to the video card.
    WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
    FOR n = StartAttr TO EndAttr
        OUT &H3C8, n            'Select attribute.
        OUT &H3C9, RGBval(n, 0) 'Write red.
        OUT &H3C9, RGBval(n, 1) 'Write green.
        OUT &H3C9, RGBval(n, 2) 'Write blue.
    NEXT n
    
END SUB

'* Scroller() subroutine:
'* Displays a scrolling message along the bottom of the screen, using a
'* bitmapped character set.
'*
'* Parameters:
'*    ScrollAct - Dictates what action should be done:
'*                Use INITSCROLL to initialize a new scroller message.
'*                Use UPDATESCROLL to update the scroller display.
'* ImageArray() - Image array holding the character set to be used. Each
'*                character must be a 16x8 image and be in the standard
'*                ASCII order, starting with the space character.
'* IndexArray() - Index array for the character images in ImageArray().
'*
'* Note: Before calling Scroller() to initialize a new scrolling message
'*       from DATA statements, use an appropriate RESTORE statement to
'*       ensure the correct DATA statements are read.
'*
SUB Scroller (ScrollAct, ImageArray(), IndexArray())

    'Retain variable settings between calls.
    STATIC MessChar(), FirstX, CharPtr, MessLen, ScrollMess$

    IF ScrollAct = INITSCROLL THEN
        '*** Initialize scroller ***
        REDIM MessChar(1 TO 19)
        FOR n = 1 TO 19: MessChar(n) = 1: NEXT n

        'Read entire scroller text into ScrollMess$ from module-level DATA.
        ScrollMess$ = ""
        DO
            READ x$
            ScrollMess$ = ScrollMess$ + x$
        LOOP UNTIL x$ = ""

        MessLen = LEN(ScrollMess$)
        CharPtr = 1
        FirstX = 16
    ELSE
        '*** Update scroller message display ***
        x = FirstX
        WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
        FOR n = 1 TO 19
            PUT (x, 192), ImageArray(MessChar(n)), PSET
            x = x + 16
        NEXT n

        'Display two end characters (spaces) to tidy up message appearance.
        PUT (0, 192), ImageArray(IndexArray(1)), PSET
        PUT (304, 192), ImageArray(IndexArray(1)), PSET

        'Variable management ready for next Scroller(UPDATESCROLL) call.
        FirstX = FirstX - 2
        IF FirstX = 0 THEN
            FirstX = 16
            FOR n = 1 TO 18
                MessChar(n) = MessChar(n + 1)
            NEXT n

            IF CharPtr > MessLen THEN CharPtr = 1
            MessChar(19) = IndexArray(ASC(MID$(ScrollMess$, CharPtr, 1)) - 31)
            CharPtr = CharPtr + 1
        END IF
    END IF

END SUB

DEFSNG A-Z
SUB stopmidi
'StopMIDI - Stops playing MIDI file
'Stop the music!!
asm$ = asm$ + CHR$(&HBB) + CHR$(&H4) + CHR$(&H0)
asm$ = asm$ + CHR$(&HCD) + CHR$(SBMIDI.INTERRUPT)
asm$ = asm$ + CHR$(&HCB)
'These next commented lines are for using the converted code.
DEF SEG = VARSEG(asm$)
Offset% = SADD(asm$)
CALL ABSOLUTE(Offset%)
'No MIDI file is playing, so reset the timer
MIDI.PLAYTIME = 0
MIDI.ERROR = 0
PAUSED = 0!

END SUB

FUNCTION TimeMIDI!
'If a MIDI file is paused, lock the current playing time
IF PAUSED > 0! THEN
    TimeMIDI! = PAUSED
'If a MIDI file is playing, carry out the timing routine
ELSEIF MIDI.PLAYTIME THEN
    'Get the current time
    CurrentTime! = TIMER
    'If midnight has come since the MIDI file started playing, change
    'CurrentTime! accordingly
    IF CurrentTime! - MIDI.PLAYTIME < 0 THEN
        CurrentTime! = 86400 + CurrentTime!
    END IF
    'Get the final result
    TimeMIDI! = CurrentTime! - MIDI.PLAYTIME
ELSE
    MIDI.ERROR = 3
END IF
END FUNCTION

DEFINT A-Z
'* WizzText() subroutine:
'* Centres a single line of text on the screen using a bitmapped character
'* set. Each character is whizzed across the screen in turn (from right to
'* left) to it's destination position.
'*
'* Parameters:
'*        Text$ - The single line text message to be displayed.
'*      TopLine - Screen Y coordinate to be the top line for the displayed
'*                text message.
'* ImageArray() - Image array holding the character set to be used. Each
'*                character must be a 16x8 image and be in the standard
'*                ASCII order, starting with the space character.
'* IndexArray() - Index array for the character images in ImageArray().
'*
SUB WizzText (Text$, TopLine, ImageArray(), IndexArray())

    'Calculate X coordinate for first character.
    MessLen = LEN(Text$)
    HomeX = (320 - (MessLen * 16)) \ 2

    'Loop to display each character of Text$.
    FOR n = 1 TO MessLen
        x$ = MID$(Text$, n, 1)

        'Ignore space characters.
        IF x$ <> CHR$(32) THEN
            CharIdx = IndexArray(ASC(x$) - 31)
            OldX = 304

            'Move character across the screen to destination position.
            FOR x = 304 TO HomeX STEP -8
                WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
                LINE (OldX, TopLine)-STEP(15, 7), 0, BF
                PUT (x, TopLine), ImageArray(CharIdx), PSET
                OldX = x
            NEXT x
        END IF

        HomeX = HomeX + 16
    NEXT n
    
END SUB

