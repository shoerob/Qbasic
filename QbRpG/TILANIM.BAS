' Choppy Animation, but its good enough for the SoftShoe TILERPG Engine
SCREEN 13
DIM Antile(1 TO 20, 1 TO 20)

' Animation Sequence --May Have As Many As You Need
'AnMatx: X location of animation--Can be changed
'AnMaty: Y location of animation--Can be changed
'Anclr1: <=1 Clears The Screen/Spot><=0 Skips Clearing>
DO
file$ = "face1": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face2": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face3": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face4": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face5": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face6": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face7": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
file$ = "face8": Anmatx = 1: Anmaty = 1: AnClr1 = 1: GOSUB loadanim
LOOP
END

loadanim:
Anxcord1 = Anmatx
Anycord1 = Anmaty
Anxcord = Anxcord1
Anycord = Anycord1
Anya = 1
Anxa = 1
file$ = file$ + ".mtx"
OPEN file$ FOR INPUT AS #1
DO
Anxa = Anxa + 1
Anxcord = Anxcord + 1
IF Anxa = 21 THEN Anya = Anya + 1: Anycord = Anycord + 1: Anxa = 1: Anxcord = Anxcord1
IF Anya = 21 THEN CLOSE #1: IF AnClr1 = 1 THEN GOTO AnClr ELSE RETURN
INPUT #1, Anc
Antile(Anxa, Anya) = Anc
PSET (Anxcord, Anycord), Anc
Andel = Andel + 1
LOOP


AnClr:
IF animcls = 1 THEN animcls = 0: Clr1 = 0: RETURN
'file$ = "mat1": AnimCls = 1: GOTO loadanim  '1SlowMode/Choose Which Clearing Mode You Want
CLS : animcls = 1: RETURN  '2FastMode/Choose Which Clearing Mode You Want

