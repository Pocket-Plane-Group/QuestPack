BEGIN ~SUKISS1~

IF ~NumTimesTalkedTo(0) Global("PPGSUKissed", "GLOBAL", 0)~ THEN SUMournful
SAY @0
=
@1
++ @2 GOTO SUYouGibber
++ @3 GOTO SUSackOfFlesh
++ @4 GOTO SUImperfectStupor
END

IF ~!NumTimesTalkedTo(0) Global("PPGSUKissed", "GLOBAL", 0)~ THEN SUKissHerDammit
SAY @5
++ @6 GOTO SUBlessedRefuse
++ @7 GOTO SUBlessedRefuse
++ @8 GOTO SUFool
++ @9 GOTO SUBegone
END

IF ~Global("PPGSUKissed", "GLOBAL", 1)~ THEN SUHealed
SAY @10
++ @11 GOTO SUPerfection
++ @12 GOTO SUNooo
++ @13 GOTO SUGoodbye
++ @14 GOTO SUFreedMe
END

IF ~~ THEN SUYouGibber
SAY @15
++ @16 GOTO SUSpineful
++ @17 GOTO SUNotSoFast
++ @18 GOTO SUIsThatSo
END

IF ~~ THEN SUSackOfFlesh
SAY @19
++ @20 GOTO SUSpineful
++ @17 GOTO SUNotSoFast
++ @21 GOTO SUIsThatSo
++ @22 GOTO SUMyCurse
END

IF ~~ THEN SUImperfectStupor
SAY @23
++ @24 GOTO SUMyMadness
++ @25 GOTO SUNotSoFast
++ @26 GOTO SUPoisonEars
END


IF ~~ THEN SUSpineful
SAY @27
IF ~~ THEN GOTO SUUsefulYet
END

IF ~~ THEN SUNotSoFast
SAY @28
++ @29 GOTO SUTawdryWorm
++ @30 GOTO SUMyMadness
++ @31 GOTO SUMyMadness
END

IF ~~ THEN SUIsThatSo
SAY @32
IF ~~ THEN GOTO SUUsefulYet
END

IF ~~ THEN SUMyCurse
SAY @33
IF ~~ THEN GOTO SUUsefulYet
END

IF ~~ THEN SUMyMadness
SAY @34
IF ~~ THEN GOTO SUUsefulYet
END


IF ~~ THEN SUPoisonEars
SAY @35
++ @36 GOTO SUUsefulYet
++ @37 GOTO SUUsefulYet
++ @38 GOTO SUSpineful
END

IF ~~ THEN SUTawdryWorm
SAY @39
IF ~~ THEN GOTO SUUsefulYet
END

IF ~~ THEN SUUsefulYet
SAY @40
=
@41
=
@42
=
@43
++ @44 GOTO SUReward
++ @45 GOTO SUFool
++ @46 GOTO SUKiss
END

IF ~~ THEN SUReward
SAY @47
++ @46 GOTO SUKiss
END

IF ~~ THEN SUFool
SAY @48
=
@49
IF ~~ THEN DO ~Enemy() Attack([PC])~ EXIT
END

IF ~~ THEN SUKiss
SAY @50
=
@51
++ @52 GOTO SUYes
++ @53 GOTO SUWasteBreath
++ @54 GOTO SUBlessedRefuse
++ @55 GOTO SUBlessedRefuse
++ @56 GOTO SUBegone
++ @57 GOTO SUFool
IF ~OR(12)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("AerieRomanceActive","GLOBAL",1)
Global("AerieRomanceActive","GLOBAL",2)
Global("JaheiraRomanceActive","GLOBAL",1)
Global("JaheiraRomanceActive","GLOBAL",2)
Global("ViconiaRomanceActive","GLOBAL",1)
Global("ViconiaRomanceActive","GLOBAL",2)
Global("J#KelseyRomanceActive","GLOBAL",1)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("PGNaliaRomanceActive","GLOBAL",1)
Global("PGNaliaRomanceActive","GLOBAL",2)~ THEN REPLY @58 GOTO SUBegone
END

IF ~~ THEN SUYes
SAY @59
++ @53 GOTO SUWasteBreath
++ @54 GOTO SUBlessedRefuse
++ @55 GOTO SUBlessedRefuse
++ @56 GOTO SUBegone
++ @57 GOTO SUFool
IF ~OR(12)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("AerieRomanceActive","GLOBAL",1)
Global("AerieRomanceActive","GLOBAL",2)
Global("JaheiraRomanceActive","GLOBAL",1)
Global("JaheiraRomanceActive","GLOBAL",2)
Global("ViconiaRomanceActive","GLOBAL",1)
Global("ViconiaRomanceActive","GLOBAL",2)
Global("J#KelseyRomanceActive","GLOBAL",1)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("PGNaliaRomanceActive","GLOBAL",1)
Global("PGNaliaRomanceActive","GLOBAL",2)~ THEN REPLY @60 GOTO SUBegone
END

IF ~~ THEN SUWasteBreath
SAY @61
++ @54 GOTO SUBlessedRefuse
++ @55 GOTO SUBlessedRefuse
++ @56 GOTO SUBegone
++ @57 GOTO SUFool
IF ~OR(12)
Global("AnomenRomanceActive","GLOBAL",1)
Global("AnomenRomanceActive","GLOBAL",2)
Global("AerieRomanceActive","GLOBAL",1)
Global("AerieRomanceActive","GLOBAL",2)
Global("JaheiraRomanceActive","GLOBAL",1)
Global("JaheiraRomanceActive","GLOBAL",2)
Global("ViconiaRomanceActive","GLOBAL",1)
Global("ViconiaRomanceActive","GLOBAL",2)
Global("J#KelseyRomanceActive","GLOBAL",1)
Global("J#KelseyRomanceActive","GLOBAL",2)
Global("PGNaliaRomanceActive","GLOBAL",1)
Global("PGNaliaRomanceActive","GLOBAL",2)~ THEN REPLY @60 GOTO SUBegone
END

IF ~~ THEN SUBlessedRefuse
SAY @62
++ @63 GOTO SUDone
++ @64 GOTO SUVolo
++ @65 GOTO SUApologies
END

IF ~~ THEN SUBegone
SAY @66
IF ~~ THEN EXIT
END

IF ~~ THEN SUDone
SAY @67
IF ~~ THEN DO ~SetGlobal("PPGSUKissed", "GLOBAL", 1) StartCutsceneMode() StartCutscene("SUKISSC1")~ EXIT
END

IF ~~ THEN SUVolo
SAY @68
IF ~~ THEN DO ~SetGlobal("PPGSUKissed", "GLOBAL", 1) StartCutsceneMode() StartCutscene("SUKISSC1")~ EXIT
END

IF ~~ THEN SUApologies
SAY @69
IF ~~ THEN DO ~SetGlobal("PPGSUKissed", "GLOBAL", 1) StartCutsceneMode() StartCutscene("SUKISSC1")~ EXIT
END

IF ~~ THEN SUPerfection
SAY @70
=
@71
IF ~~ THEN DO ~AddexperienceParty(5000) EscapeArea()~ EXIT
END

IF ~~ THEN SUNooo
SAY @72
IF ~~ THEN DO ~Enemy() Attack([PC])~ EXIT
END

IF ~~ THEN SUGoodbye
SAY @73
=
@71
IF ~~ THEN DO ~AddexperienceParty(5000) EscapeArea()~ EXIT
END

IF ~~ THEN SUFreedMe
SAY @74
=
@71
IF ~~ THEN DO ~AddexperienceParty(5000)
EscapeArea()~ EXIT
END
