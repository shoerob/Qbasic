DECLARE FUNCTION NumEMSHandles% ()
DECLARE FUNCTION NumEMSPages% (Handle%)
DECLARE FUNCTION GetEMS% (numpages%)
DECLARE FUNCTION EMSPages% (func%)
DECLARE FUNCTION PageFrame% ()
DECLARE FUNCTION EMSstatus% ()
DECLARE SUB ReleaseEMS (Handle%)
DECLARE SUB MapEMS (Handle%, block%)

DECLARE SUB MemCopy (fromseg%, fromoff%, toseg%, tooff%, bytes%)

SCREEN 0: WIDTH 80, 25
CLS

'**** Show some EMS stats.
IF EMSstatus% THEN
   PRINT "EMS installed."
   '*** Open up a 12 page block of EMS memory and store the
   '*** handle info for later use.
   EmsHandle1% = GetEMS%(12)

   '*** Store the PageFrame% segment so we can write to it later.
   EMSsegment1% = PageFrame%

   PRINT "Number of EMS handles in use:"; NumEMSHandles%
   PRINT "Total EMS pages:"; EMSPages%(0)
   PRINT "Available EMS pages:"; EMSPages%(1)
   PRINT "Free EMS memory (in bytes):"; EMSPages%(1) * 16000#
   PRINT "Page segment is at: "; HEX$(EMSsegment1%)
   PRINT
   PRINT "<press a key>"
ELSE
   PRINT "EMS not installed.  Aborting."
   PRINT
   PRINT "<press a key>"
   END
END IF

WHILE INKEY$ = "": WEND

SCREEN 13

'*** Draw some stuff on the screen.
FOR x = 1 TO 100
   CIRCLE (159, 99), x, x
NEXT x

EMSsegment2% = &HD000

MapEMS EmsHandle1%, 0
MemCopy &HA000, 0, EMSsegment1%, 0, &HFA00

LOCATE 1, 1: PRINT "This image has been copied into EMS."
LOCATE 2, 1: PRINT "<press a key>"
WHILE INKEY$ = "": WEND

CLS
FOR x = 1 TO 100
   LINE (x, x)-(319 - x, 199 - x), x, B
NEXT x
MapEMS EmsHandle1%, 4
MemCopy &HA000, 0, EMSsegment1%, 0, &HFA00

LOCATE 1, 1: PRINT "This image has also been copied into EMS."
LOCATE 2, 1: PRINT "<press a key>"
WHILE INKEY$ = "": WEND

CLS
FOR x = 1 TO 100
   LINE (x, x)-(319 - x, 199 - x), x
NEXT x
MapEMS EmsHandle1%, 8
MemCopy &HA000, 0, EMSsegment1%, 0, &HFA00

LOCATE 1, 1: PRINT "This, too, has been copied into EMS."
LOCATE 2, 1: PRINT "<press a key>"
WHILE INKEY$ = "": WEND

CLS

'*** Show the first image we saved.
MapEMS EmsHandle1%, 0
MemCopy EMSsegment1%, 0, &HA000, 0, &HFA00

WHILE INKEY$ = "": WEND

'*** Show the second image we saved.
MapEMS EmsHandle1%, 4
MemCopy EMSsegment1%, 0, &HA000, 0, &HFA00

WHILE INKEY$ = "": WEND

'*** Show the last image we saved.
MapEMS EmsHandle1%, 8
MemCopy EMSsegment1%, 0, &HA000, 0, &HFA00

'*** Release the memory we were using for the demo.
ReleaseEMS EmsHandle1%

WHILE INKEY$ = "": WEND
SCREEN 0: WIDTH 80

'************* EMSPages%() ****************
'*** When func% is 0, returns the total ***
'*** number of 16k pages, when func% is ***
'*** 1, returns the number of available ***
'*** 16k pages.                         ***
'******************************************
FUNCTION EMSPages% (func%)

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(180)
asm$ = asm$ + CHR$(66) + CHR$(205) + CHR$(103) + CHR$(139) + CHR$(126)
asm$ = asm$ + CHR$(6) + CHR$(137) + CHR$(29) + CHR$(139) + CHR$(126)
asm$ = asm$ + CHR$(8) + CHR$(137) + CHR$(21) + CHR$(93) + CHR$(203)

TotalPages% = 0: AvailablePages% = 0

DEF SEG = VARSEG(asm$)
   CALL Absolute(TotalPages%, AvailablePages%, SADD(asm$))
DEF SEG

IF func% = 0 THEN
   EMSPages% = TotalPages%
ELSE
   EMSPages% = AvailablePages%
END IF

END FUNCTION

'**************** EMSstatus%() ******************
'*** Returns whether EMS is available.  -1 is ***
'*** returned if it is available, 0 otherwise ***
'************************************************
FUNCTION EMSstatus%

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(180)
asm$ = asm$ + CHR$(64) + CHR$(205) + CHR$(103) + CHR$(176) + CHR$(0)
asm$ = asm$ + CHR$(139) + CHR$(94) + CHR$(6) + CHR$(137) + CHR$(7)
asm$ = asm$ + CHR$(93) + CHR$(203)

EMS% = -1
DEF SEG = VARSEG(asm$)
   CALL Absolute(EMS%, SADD(asm$))
DEF SEG

IF EMS% = 0 THEN
   EMSstatus = -1         'EMS installed, set to BASIC's TRUE value.
ELSE
   EMSstatus = 0          'EMS not installed, set to FALSE.
END IF

END FUNCTION

'********************** GetEMS%() ********************
'*** Function returns the handle value for a block ***
'*** of EMS memory that consists of numpages% 16k  ***
'*** pages.  You _must_ keep the handle value for  ***
'*** later calls that require the handle.  Example:***
'***                                               ***
'*** EmsHandle% = GetEMS%(5)                       ***
'***                                               ***
'*** EmsHandle% holds the handle info for a block  ***
'*** of memory 5 16k pages in size, or 80k.        ***
'*****************************************************
FUNCTION GetEMS% (numpages%)

'pageoffset% = EMSPages%(0) - EMSPages%(1)

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(139)
asm$ = asm$ + CHR$(94) + CHR$(8) + CHR$(180) + CHR$(67) + CHR$(205)
asm$ = asm$ + CHR$(103) + CHR$(139) + CHR$(94) + CHR$(6) + CHR$(137)
asm$ = asm$ + CHR$(23) + CHR$(93) + CHR$(203)

Handle% = 0
DEF SEG = VARSEG(asm$)
   CALL Absolute(BYVAL numpages%, Handle%, SADD(asm$))
DEF SEG

'asm$ = ""
'asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(139)
'asm$ = asm$ + CHR$(86) + CHR$(8) + CHR$(139) + CHR$(126) + CHR$(6)
'asm$ = asm$ + CHR$(139) + CHR$(118) + CHR$(10) + CHR$(177) + CHR$(0)
'asm$ = asm$ + CHR$(48) + CHR$(237) + CHR$(180) + CHR$(68) + CHR$(136)
'asm$ = asm$ + CHR$(200) + CHR$(137) + CHR$(243) + CHR$(205) + CHR$(103)
'asm$ = asm$ + CHR$(70) + CHR$(65) + CHR$(57) + CHR$(254) + CHR$(117)
'asm$ = asm$ + CHR$(242) + CHR$(93) + CHR$(203)
'
'DEF SEG = VARSEG(asm$)
'   CALL Absolute(BYVAL pageoffset%, BYVAL Handle%, BYVAL numpages%, SADD(asm$))
'DEF SEG

GetEMS% = Handle%

END FUNCTION

'***************** MapEMS () ***********************************
'*** Sets the page of a memory block (identified by Handle%) ***
'*** that is located at the beginning of the page frame.     ***
'*** Example:                                                ***
'***                                                         ***
'*** EmsHandle% = GetEMS%(8)                                 ***
'*** MapEMS EmsHandle%, 4                                    ***
'***                                                         ***
'*** When the page frame segment is next written to, the info***
'*** will be placed starting at the 4th page in the block of ***
'*** memory represented by EmsHandle%.  This could be use,   ***
'*** for instance, to store multiple SCREEN 13 images in one ***
'*** EMS block, by moving the first 64k image into the first ***
'*** 4 16k pages (16000 * 4 = 64000) by using:               ***
'***                                                         ***
'*** MapEMS EmsHandle%, 0                                    ***
'***                                                         ***
'*** And then putting the next 64k image into the next 4 EMS ***
'*** pages by using:                                         ***
'***                                                         ***
'*** MapEMS EmsHandle%, 4                                    ***
'***                                                         ***
'*** ... and then moving the image into the memory block.    ***
'***************************************************************
SUB MapEMS (Handle%, pageoffset%)

numpages% = 4

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(139)
asm$ = asm$ + CHR$(86) + CHR$(8) + CHR$(139) + CHR$(126) + CHR$(6)
asm$ = asm$ + CHR$(139) + CHR$(118) + CHR$(10) + CHR$(177) + CHR$(0)
asm$ = asm$ + CHR$(48) + CHR$(237) + CHR$(180) + CHR$(68) + CHR$(136)
asm$ = asm$ + CHR$(200) + CHR$(137) + CHR$(243) + CHR$(205) + CHR$(103)
asm$ = asm$ + CHR$(70) + CHR$(65) + CHR$(57) + CHR$(249) + CHR$(117)
asm$ = asm$ + CHR$(242) + CHR$(93) + CHR$(203)

DEF SEG = VARSEG(asm$)
   CALL Absolute(BYVAL pageoffset%, BYVAL Handle%, BYVAL numpages%, SADD(asm$))
DEF SEG

END SUB

DEFINT A-Z
'******************************* MemCopy() ***********************
'*** Copies the number of bytes specified in 'bytes' from the  ***
'*** memory location fromseg:fromoff to the memory location    ***
'*** toseg:tooff.  To copy more than 32,767 bytes (max. of     ***
'*** 65,536 bytes) put the 'bytes' value in HEX form.          ***
'*****************************************************************
SUB MemCopy (fromseg, fromoff, toseg, tooff, bytes)

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(30)
asm$ = asm$ + CHR$(139) + CHR$(70) + CHR$(10) + CHR$(142) + CHR$(192)
asm$ = asm$ + CHR$(139) + CHR$(70) + CHR$(14) + CHR$(142) + CHR$(216)
asm$ = asm$ + CHR$(139) + CHR$(118) + CHR$(8) + CHR$(139) + CHR$(126)
asm$ = asm$ + CHR$(12) + CHR$(139) + CHR$(78) + CHR$(6) + CHR$(243)
asm$ = asm$ + CHR$(164) + CHR$(31) + CHR$(93) + CHR$(203)

DEF SEG = VARSEG(asm$)
   CALL Absolute(BYVAL fromseg, BYVAL fromoff, BYVAL toseg, BYVAL tooff, BYVAL bytes, SADD(asm$))
DEF SEG


END SUB

DEFSNG A-Z
'****************************** NumEMSHandles%() *********************
'*** Returns the number of EMS handles presently being used (there ***
'*** are a maximum of 256 handles possible at any given time).     ***
'*********************************************************************
FUNCTION NumEMSHandles%

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(180)
asm$ = asm$ + CHR$(75) + CHR$(205) + CHR$(103) + CHR$(139) + CHR$(126)
asm$ = asm$ + CHR$(6) + CHR$(137) + CHR$(29) + CHR$(93) + CHR$(203)

NumHandles% = 0
DEF SEG = VARSEG(asm$)
   CALL Absolute(NumHandles%, SADD(asm$))
DEF SEG

NumEMSHandles% = NumHandles%

END FUNCTION

'***************************** NumEMSPages%() *************************
'*** Returns the number of 16k pages being used by the memory block ***
'*** that is represented by Handle%.                                ***
'**********************************************************************
FUNCTION NumEMSPages% (Handle%)

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(139)
asm$ = asm$ + CHR$(86) + CHR$(6) + CHR$(180) + CHR$(76) + CHR$(205)
asm$ = asm$ + CHR$(103) + CHR$(139) + CHR$(126) + CHR$(8) + CHR$(137)
asm$ = asm$ + CHR$(29) + CHR$(93) + CHR$(203)

DEF SEG = VARSEG(asm$)
   CALL Absolute(numpages%, Handle%, SADD(asm$))
DEF SEG

NumEMSPages% = numpages%

END FUNCTION

'******************************* PageFrame% ***************************
'*** Returns the segment that you will need to write to in order to ***
'*** store your data into EMS memory.  For example, PageFrame% may  ***
'*** return D000 (HEX, -12288 decimal), and then you might do this: ***
'***                                                                ***
'*** DEF SEG = PageFrame%        'D000                              ***
'*** MyData$ = "This is a block of data I want to store in EMS."    ***
'*** FOR X = 1 TO LEN(MyData$)                                      ***
'***   POKE X, ASC(MID$(MyData$, X, 1))                             ***
'*** NEXT X                                                         ***
'*** DEF SEG                                                        ***
'***                                                                ***
'*** Note, though, that you have to have a block of EMS opened with ***
'*** GetEMS%() and maped with MapEMS before you can write to the    ***
'*** block.                                                         ***
'**********************************************************************
FUNCTION PageFrame%

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(180)
asm$ = asm$ + CHR$(65) + CHR$(205) + CHR$(103) + CHR$(139) + CHR$(126)
asm$ = asm$ + CHR$(6) + CHR$(137) + CHR$(29) + CHR$(93) + CHR$(203)

PageFrameAddr% = 0
DEF SEG = VARSEG(asm$)
   CALL Absolute(PageFrameAddr%, SADD(asm$))
DEF SEG

PageFrame% = PageFrameAddr%

END FUNCTION

'****************************** ReleaseEMS() **************************
'*** Releases the EMS memory associated with Handle%.  This is very ***
'*** important to do before you exit your program, otherwise the    ***
'*** memory being used by your open handles will not be available   ***
'*** again until you reboot.                                        ***
'**********************************************************************
SUB ReleaseEMS (Handle%)

asm$ = ""
asm$ = asm$ + CHR$(85) + CHR$(137) + CHR$(229) + CHR$(180)
asm$ = asm$ + CHR$(69) + CHR$(139) + CHR$(86) + CHR$(6) + CHR$(205)
asm$ = asm$ + CHR$(103) + CHR$(93) + CHR$(203)

DEF SEG = VARSEG(asm$)
   CALL Absolute(BYVAL Handle%, SADD(asm$))
DEF SEG

END SUB

