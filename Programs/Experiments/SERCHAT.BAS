'Serial Cable/Null Modem Chat By Robert Shoemate!!!
'Must Have Serial Cable Attached to both computers to Work.
'Press T to talk and Ctrl-Break to end



'!!!!<Change Com2 to com1 or whatever port Serial Cable is on
 OPEN "COM2:19200,N,8,1,CD0,CS0,DS0,OP0,RS,TB2048,RB2048" FOR RANDOM AS #1



 DO
PRINT #1, "": INPUT #1, wt$
 IF wt$ = "SAY" THEN GOSUB say1
  LOCATE 12, 1: PRINT ">"; what$
  a$ = INKEY$
 IF a$ = "T" OR a$ = "t" THEN GOSUB SEnd
LOOP
say1:
  PRINT "The Other Person Is Typing A Message..."
   INPUT #1, what$
  CLS
  RETURN
SEnd:
  PRINT #1, "SAY"
   LOCATE 1, 1: INPUT "What?>", wht$
   PRINT #1, wht$
LOCATE 1, 1: PRINT "Sending:"; wht$
RETURN

