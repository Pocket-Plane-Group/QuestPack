REPLACE GAAL
IF ~~ THEN BEGIN 16 // from: 15.0
  SAY #21852 /* ~Excellent!  You have the honor, then, of having your vile orbs ripped from your head by the high priest of the One God!  Hold still...~ */
  IF ~~ THEN DO ~SetGlobal("D0PlayerWorshipEye","GLOBAL",1)
Wait(2)
FadeToColor([20.0],0)
Wait(2)
ApplySpellRES("d0qpue1",Player1)
Wait(2)
FadeFromColor([20.0],0)
StartDialogNoSet(Player1)~ EXIT
END
END

APPEND GAAL
IF WEIGHT #-1 ~Global("D0PlayerWorshipEye","GLOBAL",1)~ THEN BEGIN Explain
SAY ~

IF ~OR(2)
Class(Player1,RANGER_ALL)
Class(Player1,DRUID_ALL)
HasFamiliar~ THEN REPLY ~Can't my animal companion provide me with sight?~
IF ~OR(3)
Class(Player1,MAGE_ALL)
Class(Player1,BARD_ALL)
Class(Player1,THIEF_ALL)
HasFamiliar~ THEN REPLY ~Can't my familiar provide me with sight?~
IF ~NumInPartyGT(1)~ THEN REPLY ~No. My companions will guide me.~
IF ~~ THEN REPLY ~I can make do without any sight at all.~
