REPLACE_ACTION_TEXT MINSCA ~OpenDoor("Cell02")~ ~OpenDoor("Cell02")
SetGlobal("D0MinscFreed","GLOBAL",1)~
REPLACE_ACTION_TEXT IMOEN10 ~JoinParty()~ ~JoinParty()
SetGlobal("D0PlayedSoA","GLOBAL",1)~

BEGIN SUMIST

IF ~NumTimesTalkedTo(0)~ THEN BEGIN SuMist1
SAY @0
++ @1 + SuMist2
IF ~!InParty("Anomen") !InParty("Jaheira") !InParty("Sarevok") !InParty("Valygar") !InParty("Aerie")~ THEN REPLY @2 + SuMist2
IF ~!InParty("Anomen") !InParty("Jaheira") !InParty("Sarevok") !InParty("Valygar") InParty("Aerie") !Dead("Aerie") !StateCheck("Aerie",STATE_SLEEPING)~ THEN REPLY @3 EXTERN AERIE25J AerieSez
IF ~!InParty("Anomen") !InParty("Jaheira") !InParty("Sarevok") InParty("Valygar") !Dead("Valygar") !StateCheck("Valygar",STATE_SLEEPING)~ THEN REPLY @3 EXTERN VALYG25J ValSez
IF ~!InParty("Anomen") !InParty("Jaheira") InParty("Sarevok") !Dead("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING)~ THEN REPLY @3 EXTERN SAREV25J SarrySez
IF ~!InParty("Anomen") InParty("Jaheira") !Dead("Jaheira") !StateCheck("Jaheira",STATE_SLEEPING)~ THEN REPLY @3 EXTERN JAHEI25J JaheiraSez
IF ~InParty("Anomen") !Dead("Anomen") !StateCheck("Anomen",STATE_SLEEPING)~ THEN REPLY @3 EXTERN ANOME25J AnoSez
++ @4 + SuMist2
END

IF ~~ THEN BEGIN SuMist2
SAY @5
++ @6 + SuMist3
++ @7 + SuMist3
++ @8 + SuMist3
++ @9 + SuMist3
END

IF ~~ THEN BEGIN SuMist3
SAY @10
=
@11
=
@12
++ @13 + SuMistDeny
++ @14 + SuMistRelease
++ @15 + SuMistMockery
++ @16 + SuMistRegrets
++ @17 + SuMistInstinct
++ @18 + SuMistDeny
END

IF ~~ THEN BEGIN SuMistDeny
SAY @19
=
@20
IF ~~ THEN DO ~AddexperienceParty(6000)
DialogInterrupt(FALSE)
CreateVisualEffectObject("SPFLESH2",Myself)
Wait(1)
DestroySelf()~
SOLVED_JOURNAL @21 EXIT
END

IF ~~ THEN BEGIN SuMistRelease
SAY @22
=
@23
=
@24

// Regret killing Sarevok
IF ~OR(2) !InParty("Sarevok") InPartyAllowDead("Sarevok") OR(2) !InParty("Sarevok") Dead("Sarevok")~ THEN REPLY @25 + SuMistSuckah
IF ~InParty("Sarevok") !Dead("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING)~ THEN REPLY @26 EXTERN SAREV25J SarrySentimental
IF ~InParty("Sarevok") !Dead("Sarevok") StateCheck("Sarevok",STATE_SLEEPING)~ THEN REPLY @26 + SuMistSuckah

// Regret letting Gorion die
IF ~InParty("Imoen2") !StateCheck("Imoen2",STATE_SLEEPING)~ THEN REPLY @27 EXTERN IMOEN25J ImoenGorion
IF ~OR(2) !InParty("Imoen2") StateCheck("Imoen2",STATE_SLEEPING) InParty("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING) Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @27 EXTERN SAREV25J SarryGorion1
IF ~OR(2) !InParty("Imoen2") StateCheck("Imoen2",STATE_SLEEPING) InParty("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING) !Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @27 EXTERN SAREV25J SarryGorion2
IF ~OR(2) !InParty("Imoen2") StateCheck("Imoen2",STATE_SLEEPING) OR(2) !InParty("Sarevok") StateCheck("Sarevok",STATE_SLEEPING)~ THEN REPLY @27 + SuMistSuckah

// Regret the BG2 plot
IF ~Global("WorkingForBodhi","GLOBAL",1)~ THEN REPLY @28 + SuMistSuckah
IF ~!Global("WorkingForBodhi","GLOBAL",1)~ THEN REPLY @29 + SuMistSuckah

// Regret leaving Imoen behind
IF ~!InParty("Imoen2")~ THEN REPLY @30 + SuMistSuckah

// Regret leaving Minsc/Jaheira behind
IF ~Global("D0PlayedSoA","GLOBAL",1) Global("JaheiraReleased","GLOBAL",0) !InParty("Jaheira") OR(2) GlobalGT("D0MinscFreed","GLOBAL",0) InParty("Minsc")~ THEN REPLY @31 + SuMistSuckah
IF ~Global("D0PlayedSoA","GLOBAL",1) Global("D0MinscFreed","GLOBAL",0) !InParty("Minsc") OR(2) GlobalGT("JaheiraReleased","GLOBAL",0) InParty("Jaheira")~ THEN REPLY @32 + SuMistSuckah
IF ~Global("D0PlayedSoA","GLOBAL",1) Global("D0MinscFreed","GLOBAL",0) !InParty("Minsc") Global("JaheiraReleased","GLOBAL",0) !InParty("Jaheira")~ THEN REPLY @33 + SuMistSuckah

// Regret dead NPCs
IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY @34 + SuMistSuckah
IF ~IsValidForPartyDialog("Jaheira")~ THEN REPLY @34 EXTERN JAHEI25J JaheiraIsSad

// Regret dead Yoshimo
IF ~GlobalGT("YoshimoAndHisBetrayal","GLOBAL",0)~ THEN REPLY @35 GOTO SuMistSuckah

// Regret dragging Keldorn here
IF ~InParty("Keldorn")~ THEN REPLY @36 EXTERN KELDO25J KeldornIsSoCool

// Regret letting Jan go to prison (and associated mockery)
IF ~Global("JanMove","GLOBAL",1) Global("JanFree","GLOBAL",0) !InParty("Jan")~ THEN REPLY @37 + SuMistSuckah
IF ~Global("JanMove","GLOBAL",1) Global("JanFree","GLOBAL",0) Global("SuMistMock", "GLOBAL", 0) !InParty("Jan")~ THEN REPLY @38 + SuMistMockery

// Regret leading Anomen to fail his test
IF ~InParty("Anomen") Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @39 EXTERN ANOME25J LoonyAnomen

// Regret destroying the druid grove
IF ~Global("GrovePoisoned","GLOBAL",1)
!InParty("Cernd")~ THEN REPLY @40 + SuMistSuckah
IF ~Global("GrovePoisoned","GLOBAL",1)
InParty("Cernd")~ THEN REPLY @40 EXTERN CERND25J CerndChides

// Evil guy
IF ~Alignment(Myself,MASK_EVIL)~ THEN REPLY @41 GOTO SuMistSuckah

// Mockery
IF ~GlobalGT("ParentsUpset","GLOBAL",0) Global("SuMistMock", "GLOBAL", 0)~ THEN REPLY @42 + SuMistMockery

// Angst
IF ~~ THEN REPLY @43 GOTO SuMistUnusual

// Things which aren't regrets
IF ~Global("SuMistInstinct", "GLOBAL", 0)~ THEN REPLY @44 + SuMistInstinct
++ @45 + SuMistDeny
++ @46 + SuMistDeny
++ @47 + SuMistDeny
END

IF ~~ THEN BEGIN SuMistUnusual
SAY @48
=
@49
IF ~~ THEN DO ~SetGlobal("SuMistPCPlayedASuckah", "GLOBAL", 1)
AddexperienceParty(6000)
DialogInterrupt(FALSE)
CreateVisualEffectObject("SPFLESH2",Myself)
Wait(1)
DestroySelf()~ SOLVED_JOURNAL @50 EXIT
END

IF ~~ THEN BEGIN SuMistMockery
SAY @51
=
@52
++ @53 + SuMistDeny
++ @54 + SuMistDeny
++ @55 DO ~SetGlobal("SuMistMock", "GLOBAL", 1)~ GOTO SuMistRelease
END

IF ~~ THEN BEGIN SuMistInstinct
SAY @56
=
@57
++ @53 + SuMistDeny
++ @58 + SuMistDeny
++ @55 DO ~SetGlobal("SuMistInstinct", "GLOBAL", 1)~ GOTO SuMistRelease
END

IF ~~ THEN BEGIN SuMistRegrets
SAY @59
=
@60
++ @53 + SuMistDeny
++ @58 + SuMistDeny
++ @55 + SuMistRelease
END

IF ~~ THEN BEGIN SuMistSuckah
SAY @61
=
@49
IF ~~ THEN DO ~SetGlobal("SuMistPCPlayedASuckah", "GLOBAL", 1)
AddexperienceParty(6000)
DialogInterrupt(FALSE)
CreateVisualEffectObject("SPFLESH2",Myself)
Wait(1)
DestroySelf()~ SOLVED_JOURNAL @50 EXIT
END

IF ~~ THEN BEGIN SarryRemorse
SAY @62
++ @53 + SuMistDeny
++ @58 + SuMistDeny
++ @55 DO ~SetGlobal("SuMistInstinct", "GLOBAL", 1)~ GOTO SuMistRelease
END

IF ~~ THEN BEGIN JaheiraIsSad2
SAY @63
=
@64
++ @53 + SuMistDeny
++ @58 + SuMistDeny
++ @55 DO ~SetGlobal("SuMistInstinct", "GLOBAL", 1)~ GOTO SuMistRelease
END


APPEND AERIE25J

IF ~~ THEN BEGIN AerieSez
SAY @65
IF ~~ THEN EXTERN SUMIST SuMist2
END

END

APPEND VALYG25J

IF ~~ THEN BEGIN ValSez
SAY @66
++ @67 + ValSez2
++ @68 + ValSez3
++ @69 + ValSez4
END

IF ~~ THEN BEGIN ValSez2
SAY @70
IF ~~ THEN EXTERN SUMIST SuMist2
END

IF ~~ THEN BEGIN ValSez3
SAY @71
IF ~~ THEN EXTERN SUMIST SuMist2
END

IF ~~ THEN BEGIN ValSez4
SAY @72
=
@73
IF ~~ THEN EXTERN SUMIST SuMist2
END

END

APPEND IMOEN25J

IF ~~ THEN BEGIN ImoenGorion
SAY @74
IF ~OR(2) !InParty("Sarevok") StateCheck("Sarevok",STATE_SLEEPING)~ THEN REPLY @75 EXTERN SUMIST SuMistDeny
IF ~OR(2) !InParty("Sarevok") StateCheck("Sarevok",STATE_SLEEPING)~ THEN REPLY @76 EXTERN SUMIST SuMistSuckah
IF ~InParty("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING) Alignment("Sarevok",MASK_EVIL)~ THEN EXTERN SAREV25J SarryGorion3
IF ~InParty("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING) !Alignment("Sarevok",MASK_EVIL)~ THEN EXTERN SAREV25J SarryGorion4
END

IF ~~ THEN BEGIN ImoenGorion2
SAY @77
IF ~~ THEN EXTERN SAREV25J SarryGorion8
END

END

APPEND SAREV25J

IF ~~ THEN BEGIN SarrySez
SAY @78
++ @79 + SarrySez2
++ @80 + SarrySez2
END

IF ~~ THEN BEGIN SarrySez2
SAY @81
=
@82
IF ~~ THEN EXTERN SUMIST SuMist2
END

IF ~~ THEN BEGIN SarrySentimental
SAY @83
IF ~~ THEN EXTERN SUMIST SuMistSuckah
END

IF ~~ THEN BEGIN SarryGorion1
SAY @84
= @85
IF ~~ THEN REPLY @86 EXTERN SUMIST SuMistDeny
IF ~~ THEN REPLY @87 EXTERN SUMIST SuMistSuckah
IF ~~ THEN REPLY @88 GOTO SarryGorion7
IF ~Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion5
IF ~!Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion6
END

IF ~~ THEN BEGIN SarryGorion2
SAY @84
IF ~~ THEN REPLY @90 EXTERN SUMIST SuMistDeny
IF ~~ THEN REPLY @91 EXTERN SUMIST SuMistSuckah
IF ~Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion5
IF ~!Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion6
END

IF ~~ THEN BEGIN SarryGorion3
SAY @92
= @93
IF ~~ THEN EXTERN IMOEN25J ImoenGorion2
END

IF ~~ THEN BEGIN SarryGorion4
SAY @94
IF ~~ THEN REPLY @90 EXTERN SUMIST SuMistDeny
IF ~~ THEN REPLY @91 EXTERN SUMIST SuMistSuckah
IF ~Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion5
IF ~!Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion6
END

IF ~~ THEN BEGIN SarryGorion5
SAY @95
IF ~~ THEN EXTERN SUMIST SarryRemorse
END

IF ~~ THEN BEGIN SarryGorion6
SAY @96
IF ~~ THEN EXTERN SUMIST SarryRemorse
END

IF ~~ THEN BEGIN SarryGorion7
SAY @97
IF ~~ THEN REPLY @98 EXTERN SUMIST SuMistSuckah
IF ~~ THEN REPLY @99 EXTERN SUMIST SuMistDeny
END

IF ~~ THEN BEGIN SarryGorion8
SAY @100
IF ~~ THEN REPLY @86 EXTERN SUMIST SuMistDeny
IF ~~ THEN REPLY @101 EXTERN SUMIST SuMistSuckah
IF ~~ THEN REPLY @88 GOTO SarryGorion7
IF ~Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion5
IF ~!Alignment("Sarevok",MASK_EVIL)~ THEN REPLY @89 GOTO SarryGorion6
END

END

APPEND JAHEI25J

IF ~~ THEN BEGIN JaheiraSez
SAY @102
++ @103 + JaheiraSez2
++ @104 + JaheiraSez3
END

IF ~~ THEN BEGIN JaheiraSez2
SAY @105
=
@106
IF ~~ THEN EXTERN SUMIST SuMist2
END

IF ~~ THEN BEGIN JaheiraSez3
SAY @107
IF ~~ THEN EXTERN SUMIST SuMist2
END

IF ~~ THEN BEGIN JaheiraIsSad
SAY @108
IF ~~ THEN EXTERN SUMIST JaheiraIsSad2
END

END

APPEND ANOME25J

IF ~~ THEN BEGIN AnoSez
SAY @109
=
@110
IF ~~ THEN EXTERN SUMIST SuMist2
END

IF ~~ THEN BEGIN LoonyAnomen
SAY @111
++ @112 EXTERN SUMIST SuMistDeny
++ @113 EXTERN SUMIST SuMistSuckah
END

END

APPEND KELDO25J

IF ~~ THEN BEGIN KeldornIsSoCool
SAY @114
=
@115
++ @116 EXTERN SUMIST SuMistDeny
++ @117 EXTERN SUMIST SuMistSuckah
END

END

APPEND CERND25J

IF ~~ THEN BEGIN CerndChides
SAY @118
IF ~~ THEN EXTERN SUMIST SuMistSuckah
END

END
