SCREEN 12: CLS

FOR Rad = 1 TO 500
   Col = INT(RND * 15) + 1
   CIRCLE (320, 240), Rad, Col
NEXT Rad

DIM ScreenClip%(180, 180)

GET (0, 0)-(270, 479), ScreenClip%

OPEN "C:\Screen.dat" FOR RANDOM AS #1
PUT #1, 1, ScreenClip
CLOSE

CLS

OPEN "C:\Screen.dat" FOR RANDOM AS #1
GET #1, 1, ScreenClip
CLOSE

PUT (0, 0), ScreenClip%

