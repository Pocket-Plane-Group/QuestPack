APPEND DCOWL1

IF WEIGHT #-1 ~GlobalGT("chapter","GLOBAL",%bg2_chapter_7%)
!Detect("Edwin")~ THEN BEGIN TOB_1
SAY @576
IF ~~ THEN DO ~CreateCreatureObjectDoor("d0qpback",Myself,1,0,0)
CreateCreatureObjectDoor("d0qpback",Myself,1,0,0)
Enemy()~ EXIT
END

IF WEIGHT #-1 ~GlobalGT("chapter","GLOBAL",%bg2_chapter_7%)
Detect("Edwin")~ THEN BEGIN TOB_2
SAY @577
IF ~IsValidForPartyDialog("Edwin")~ THEN GOTO TOB_4
IF ~!IsValidForPartyDialog("Edwin")~ THEN EXTERN EDWIN25J ED_TOB_1
END

IF ~~ THEN BEGIN TOB_3
SAY @578
IF ~~ THEN DO ~CreateCreatureObjectDoor("d0qpback",Myself,1,0,0)
CreateCreatureObjectDoor("d0qpback",Myself,1,0,0)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN TOB_4
SAY @579
IF ~~ THEN DO ~CreateCreatureObjectDoor("d0qpback",Myself,1,0,0)
CreateCreatureObjectDoor("d0qpback",Myself,1,0,0)
Enemy()~ EXIT
END

END

APPEND EDWIN25J

IF ~~ THEN BEGIN ED_TOB_1
SAY @580
= @581
IF ~~ THEN EXTERN DCOWL1 TOB_3
END

END
