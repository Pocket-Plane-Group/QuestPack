BEGIN ~lmindi~

IF ~!GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ I_0
SAY @0
IF ~~ THEN EXIT
END

IF ~GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)
Global("SpokeOnce","LOCALS",0)~ I_1
SAY @1
= @2
++ @3 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_2
++ @4 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_3
++ @5 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_4
++ @6 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_5
++ @7 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_6
END

IF ~~ THEN I_2
SAY @8
= @9
++ @10 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_4
++ @5 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_4
++ @7 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_6
END

IF ~~ THEN I_3
SAY @11
= @12
++ @10 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_4
++ @5 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_4
++ @7 DO ~SetGlobal("SpokeOnce","LOCALS",1)~ GOTO I_6
END

IF ~~ THEN I_4
SAY @13
=
@14
=
@15
=
@16
=
@17
=
@18
=
@19
=
@20
=
@21
=
@22
=
@23
=
@24
=
@25
=
@26
IF ~~ THEN GOTO I_4_KetoSpeak
END

IF ~~ THEN BEGIN I_4_KetoSpeak
SAY @27
IF ~~ THEN DO ~SetGlobal("SpokeOnce","LOCALS",2)
AddExperienceParty(5000)~ EXIT
END

IF ~~ THEN I_5
SAY @28
IF ~~ THEN EXIT
END

IF ~~ THEN I_6
SAY @29
IF ~~ THEN EXIT
END

IF ~Global("SpokeOnce","LOCALS",1)~ I_7
SAY @30
IF ~~ THEN EXIT
END

IF ~Global("SpokeOnce","LOCALS",2)~ I_8
SAY @31
IF ~~ THEN EXIT
END
