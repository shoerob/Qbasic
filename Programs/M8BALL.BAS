SCREEN 12
RANDOMIZE TIMER
PRINT "Magic 8 Computer By: Robert Shoemate"
INPUT "Whats Your Question?:", q$
CLS
DO
LOCATE 1, 1: PRINT "Im Am Thinking: "; an$; "                        "
a = INT(RND * 2) + 1
b = INT(RND * 2) + 1
c = INT(RND * 2) + 1
d = INT(RND * 2) + 1
e = INT(RND * 2) + 1
f = INT(RND * 2) + 1
GOSUB EEP
l = l + 1
IF l = 80 THEN GOTO DONE:
LOOP

EEP:               'Change Responses Here
IF a = 1 THEN a$ = "Mabey..."
IF a = 2 THEN a$ = "NO!"
IF b = 1 THEN b$ = "YES!!!"
IF b = 2 THEN b$ = "Can't Happen"
IF c = 1 THEN c$ = "You'll See..."
IF c = 2 THEN c$ = "Not A Chance"
IF d = 1 THEN d$ = "I can not tell you now..."
IF d = 2 THEN d$ = "Yes."
IF e = 1 THEN e$ = "Ask Again."
IF e = 2 THEN e$ = "You Figure It OUT."
IF f = 1 THEN f$ = "Yep."
IF f = 2 THEN f$ = "Nope."
z = INT(RND * 6) + 1
IF z = 3 THEN an$ = a$
IF z = 4 THEN an$ = b$
IF z = 2 THEN an$ = c$
IF z = 5 THEN an$ = d$
IF z = 1 THEN an$ = e$
IF z = 6 THEN an$ = f$
RETURN
DONE:
CLS
COLOR 14
PRINT "From What I The Stupid Computer Know: "
COLOR 10
PRINT an$
SLEEP 2
PRINT "Press A Key..."
SLEEP
END

