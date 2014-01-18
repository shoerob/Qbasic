'Declare QMIDI subroutines.
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

'DEMO CODE STARTS HERE
'$DYNAMIC
'Set text mode
SCREEN 0: WIDTH 80, 25: CLS
'START THE DRIVERSLOADED DEMONSTRATION
CLS
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
                PRINT "UH-OH!!  The SBMIDI driver could not be found!"
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
                PRINT "UH-OH!!  The SBSIM driver could not be found!"
                PRINT "Are you sure you want to continue? (Y/N)"
                A$ = UCASE$(INPUT$(1))
                IF A$ <> "Y" THEN
                        SCREEN 1: SCREEN 0: WIDTH 80, 25: CLS : END
                END IF
        CASE ELSE:
                PRINT "SBSIM driver found!"
                PRINT
                'Prompt the user for a key press.
                PRINT "Press Q to quit of any other key to continue the demo."
                A$ = UCASE$(INPUT$(1))
                'If the user pressed Q, abort the program.
                IF A$ = "Q" THEN SCREEN 1: SCREEN 0: WIDTH 80, 25: CLS : END
END SELECT

'START THE BACKGROUND PLAYING DEMONSTRATION
'Attempt to load and play a sample MIDI file.
REDIM MIDI%(BytesRequired&("C:\qmidi\1.MID") \ 2)
LoadAndPlayMIDI "C:\qmidi\1.MID", VARSEG(MIDI%(0)), VARPTR(MIDI%(0))
'Set the printing color.
Col% = 17
PlayTimeP! = PlayTime!
PlayTime! = INT(TimeMIDI!)
IF PlayTime! > 124 THEN
        PlayMIDI VARSEG(MIDI%(0)), VARPTR(MIDI%(0))
END IF
ptime = 0
DO UNTIL INKEY$ <> ""
PlayTimeP! = PlayTime!
'Get the number of seconds the MIDI file has been playing.
PlayTime! = INT(TimeMIDI!)
'SAMPLE1.MID runs for approximately 2 minutes and 4 seconds.  If more than
'124 seconds has elapsed, the file needs to be restarted.
IF PlayTime! > 12 THEN
        stopmidi
        PlayMIDI VARSEG(MIDI%(0)), VARPTR(MIDI%(0))
END IF
LOOP


stopmidi
END

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

'LoadAndPlayMIDI - Loads a MIDI file into memory and plays it
SUB LoadAndPlayMIDI (Filename$, MIDISegment%, MIDIOffset%)
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

'LoadMIDI - loads a MIDI file into memory
SUB LoadMIDI (Filename$, MIDISegment%, MIDIOffset%) STATIC
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

'PlayMIDI - Begins playing a MIDI file in the background.
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

'StopMIDI - Stops playing MIDI file
SUB stopmidi
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

