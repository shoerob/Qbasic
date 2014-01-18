 CLS
    OPEN "write.exe" FOR INPUT AS #1
    Stuff$ = INPUT$(5120, #1)
    CLOSE

PRINT Stuff$

    OPEN "write2.exe" FOR OUTPUT AS #1
    PRINT #1, Stuff$        'Print first 3 characters.
    CLOSE
  
    

