COLOR 10, 14
CLS
PRINT "Serbbs Install"
PRINT "Please Enter a Directory to install Serbbs to-"
INPUT ">", dir$
PRINT "Installing..."
PRINT "Making Directory: "; dir$
userpass$ = dir$ + "\users\Pass.dat"
user$ = dir$ + "\Users\Users.dat"
usernum$ = dir$ + "\users\UserNum.dat"
userbirth$ = dir$ + "\users\birth.dat"
useraccess$ = dir$ + "\users\Access.dat"
useraddress$ = dir$ + "\users\address.dat"
file$ = dir$ + "\files\files.dat"
door$ = dir$ + "\doors\doors.dat"
' ****************************************DIR MAKER*****************
userdir$ = "Mkdir " + dir$ + "\users"
filedir$ = "mkdir " + dir$ + "\files"
doordir$ = "mkdir " + dir$ + "\doors"
dir1$ = "Mkdir " + dir$
SHELL "ECHO OFF"
SHELL dir1$
SHELL userdir$
SHELL filedir$
SHELL doordir$
'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'************************USERS******************
OPEN user$ FOR OUTPUT AS #1
del = 0
DO UNTIL del = 40
del = del + 1
PRINT #1, "NONE"
LOOP
CLOSE #1
OPEN usernum$ FOR OUTPUT AS #1
PRINT #1, 0
CLOSE #1
OPEN userpass$ FOR OUTPUT AS #1
del = 0
DO UNTIL del = 40
del = del + 1
PRINT #1, "NOPASS"
LOOP
CLOSE #1
OPEN useraccess$ FOR OUTPUT AS #1
del = 0
DO UNTIL del = 40
del = del + 1
PRINT #1, 0
LOOP
CLOSE #1
OPEN useraddress$ FOR OUTPUT AS #1
del = 0
DO UNTIL del = 40
del = del + 1
PRINT #1, "NOADDRESS"
LOOP
CLOSE #1



OPEN userbirth$ FOR OUTPUT AS #1
del = 0
DO UNTIL del = 40
del = del + 1
PRINT #1, "NOBIRTH"
LOOP
CLOSE #1
'***********************************************
OPEN file$ FOR OUTPUT AS #2
OPEN door$ FOR OUTPUT AS #3
CLOSE #2
CLOSE #3
dirs$ = dir$ + "\Dirs.dat"
OPEN dirs$ FOR OUTPUT AS #1
user$ = dir$ + "\Users\users.dat"
usernum$ = dir$ + "\users\usernum.dat"
userpass$ = dir$ + "\users\pass.dat"
userbirth$ = dir$ + "\users\birth.dat"
useraccess$ = dir$ + "\users\access.dat"
useraddress$ = dir$ + "\users\address.dat"
file$ = dir$ + "\files\files.dat"
door$ = dir$ + "\doors\doors.dat"
PRINT #1, user$
PRINT #1, file$
PRINT #1, door$
PRINT #1, usernum$
PRINT #1, userpass$
PRINT #1, userbirth$
PRINT #1, useraccess$
PRINT #1, useraddress$
CLOSE #1
END

