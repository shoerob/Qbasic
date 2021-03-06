'Variable type to hold screen design item data.
TYPE DesignType
    imageno AS INTEGER
    Xpos AS INTEGER
    Ypos AS INTEGER
    DisAct AS INTEGER
END TYPE

DECLARE SUB InitPaletteData (filename$, PaletteArray&())
DECLARE SUB InitDesignData (filename$, DesignArray() AS DesignType)
DECLARE SUB initimagedata (filename$, ImageArray%())
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
DIM map(1 TO 100, 1 TO 100)
DIM mprop(1 TO 100, 1 TO 100)
DIM vmap(1 TO 15, 1 TO 9)

tilemax = 35

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
        FOR j = 1 TO LEN(Text$)
            GET (x, y)-STEP(7, 7), NewChar(1)

            BasePtr = (ASC(MID$(Text$, j, 1)) - 32) * 34

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
        NEXT j
    ELSE
        '*** Display text using foreground & background colours ***

        'Loop to build and display each character of Text$.
        FOR j = 1 TO LEN(Text$)
            BasePtr = (ASC(MID$(Text$, j, 1)) - 32) * 34

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
        NEXT j
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
        FOR j = 1 TO LEN(Text$)
            GET (x, y)-STEP(7, 7), NewChar(1)

            BasePtr = (ASC(MID$(Text$, j, 1)) - 32) * 34

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
        NEXT j
    ELSE
        '*** Display text using foreground & background colours ***

        'Loop to build and display each character of Text$.
        FOR j = 1 TO LEN(Text$)
            BasePtr = (ASC(MID$(Text$, j, 1)) - 32) * 34

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
        NEXT j
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
        FOR j = 1 TO 63
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
        NEXT j
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
        FOR j = 1 TO 63
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
        NEXT j
    END IF

END SUB

FUNCTION GetDepth (ImNo, ImageArray(), IndexArray())

    GetDepth = ImageArray(IndexArray(ImNo) + 1)

END FUNCTION

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

SUB InitDesignData (filename$, DesignArray() AS DesignType)

    IF filename$ <> "" THEN
        '***** Read screen design data from file *****

        'Establish size of DesignType array required.
        FileNo = FREEFILE
        OPEN filename$ FOR BINARY AS #FileNo
        ItemCount = (LOF(FileNo) - 7) \ 8
        CLOSE #FileNo
        REDIM DesignArray(0 TO ItemCount) AS DesignType

        'Load screen design data directly into array memory.
        DEF SEG = VARSEG(DesignArray(0))
        BLOAD filename$, 0
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

SUB initimagedata (filename$, ImageArray())

    IF filename$ <> "" THEN
        '***** Read image data from file *****

        'Establish size of integer array required.
        FileNo = FREEFILE
        OPEN filename$ FOR BINARY AS #FileNo
        Ints = (LOF(FileNo) - 7) \ 2
        CLOSE #FileNo
        REDIM ImageArray(1 TO Ints)

        'Load image data directly into array memory.
        DEF SEG = VARSEG(ImageArray(1))
        BLOAD filename$, 0
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
SUB InitPaletteData (filename$, PaletteArray&())

    'Size array to hold all 256 colours.
    REDIM PaletteArray&(0 TO 255)

    IF filename$ <> "" THEN
        '*** Read palette data from file ***
        FileNo = FREEFILE
        OPEN filename$ FOR BINARY AS #FileNo
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

