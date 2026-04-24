REPLACE ~SHOP08~
IF ~~ THEN BEGIN 1 // from: 0.1
  SAY #29419 /* ~As ye will. (Can't read, eh? 'Tis a fine pickle the Amnian school system's get itself into.)~ */
  IF ~!ReputationGT(Player1,15)~ THEN EXIT
  IF ~ReputationGT(Player1,15)~ THEN GOTO 2
END
END

APPEND ~SHOP08~

IF WEIGHT #-5 ~Global("A#IM5Quest","GLOBAL",0)
NumTimesTalkedTo(0)~ THEN BEGIN Start
SAY @0
= @1
IF ~~ THEN REPLY @2 DO ~StartStore("shop08",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @3 GOTO Start3
IF ~~ THEN REPLY @4 DO ~SetGlobal("A#IM5Quest","GLOBAL",1)~ GOTO StolenScrolls
IF ~~ THEN REPLY @5 GOTO Start3
END

IF WEIGHT #-5 ~Global("A#IM5Quest","GLOBAL",0)
!NumTimesTalkedTo(0)~ THEN BEGIN Start2
SAY @6
IF ~~ THEN REPLY @2 DO ~StartStore("shop08",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @3 GOTO Start3
IF ~~ THEN REPLY @4 DO ~SetGlobal("A#IM5Quest","GLOBAL",1)~ GOTO StolenScrolls
IF ~~ THEN REPLY @5 GOTO Start3
END

IF ~~ THEN BEGIN Start3
SAY @7
IF ~~ THEN EXIT
END

IF WEIGHT #-4 ~Global("A#IM5Quest","GLOBAL",1)~ THEN BEGIN StartSecond
SAY @8
IF ~~ THEN REPLY @9 GOTO Start3
IF ~~ THEN REPLY @10 DO ~StartStore("shop08",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @11 GOTO HelpOffer
IF ~~ THEN REPLY @12 GOTO HelpOffer
END

IF WEIGHT #-3 ~OR(2)
Global("A#IM5Quest","GLOBAL",2)
Global("A#IM5Quest","GLOBAL",3)~ THEN BEGIN NotDone
SAY @13
IF ~Global("A#IM5Combat","GLOBAL",1)~ THEN REPLY @14 GOTO Dead
IF ~Global("A#IM5Combat","GLOBAL",1)~ THEN REPLY @15 GOTO Dead
IF ~Global("A#IM5Combat","GLOBAL",1)~ THEN REPLY @16 GOTO Dead
IF ~Global("A#IM5Combat","GLOBAL",1)~ THEN REPLY @17 GOTO Dead
IF ~Global("A#IM5Free","GLOBAL",1)~ THEN REPLY @18 GOTO KramFree
IF ~Global("A#IM5Free","GLOBAL",1)~ THEN REPLY @19 GOTO KramFree
IF ~Global("A#IM5Free","GLOBAL",2)~ THEN REPLY @20 GOTO KramMagic
IF ~~ THEN REPLY @21 GOTO NotDone2
IF ~~ THEN REPLY @22 DO ~StartStore("shop08",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN NotDone2
SAY @23
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("A#IM5Quest","GLOBAL",4)
GlobalTimerExpired("A#IM5Kram2","GLOBAL")~ THEN BEGIN HiredKram
SAY @24
= @25
IF ~~ THEN REPLY @26 DO ~SetGlobal("A#IM5Quest","GLOBAL",5)~ GOTO 1
IF ~~ THEN REPLY @27 DO ~SetGlobal("A#IM5Quest","GLOBAL",5)
StartStore("shop08",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @28 GOTO 1
END

IF ~~ THEN BEGIN KramFree
SAY @29
= @30
IF ~~ THEN REPLY @3 DO ~EraseJournalEntry(@117)
AddJournalEntry(@118,QUEST_DONE)
AddexperienceParty(15000)
SetGlobal("A#IM5Quest","GLOBAL",4)
SetGlobalTimer("A#IM5Kram2","GLOBAL",ONE_DAY)~ GOTO Start3
IF ~~ THEN REPLY @31 DO ~EraseJournalEntry(@117)
AddJournalEntry(@118,QUEST_DONE)
AddexperienceParty(15000)
SetGlobal("A#IM5Quest","GLOBAL",4)
StartStore("shop08",LastTalkedToBy())
SetGlobalTimer("A#IM5Kram2","GLOBAL",ONE_DAY)~ EXIT
END

IF ~~ THEN BEGIN KramMagic
SAY @32
= @30
IF ~~ THEN REPLY @3 DO ~EraseJournalEntry(@117)
AddJournalEntry(119,QUEST_DONE)
AddexperienceParty(15000)
SetGlobal("A#IM5Quest","GLOBAL",4)~ GOTO Start3
IF ~~ THEN REPLY @31 DO ~EraseJournalEntry(@117)
AddJournalEntry(119,QUEST_DONE)
AddexperienceParty(15000)
SetGlobal("A#IM5Quest","GLOBAL",4)
StartStore("shop08",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN Dead
SAY @33
= @34
IF ~~ THEN REPLY @3 DO ~EraseJournalEntry(@117)
AddJournalEntry(@120,QUEST_DONE)
AddexperienceParty(10000)
SetGlobal("A#IM5Quest","GLOBAL",5)~ EXIT
IF ~~ THEN REPLY @31 DO ~EraseJournalEntry(@117)
AddJournalEntry(@120,QUEST_DONE)
SetGlobal("A#IM5Quest","GLOBAL",5)
AddexperienceParty(10000)
StartStore("shop08",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN StolenScrolls
SAY @35
IF ~~ THEN REPLY @9 GOTO Start3
IF ~~ THEN REPLY @10 DO ~StartStore("shop08",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @11 GOTO HelpOffer
IF ~~ THEN REPLY @12 GOTO HelpOffer
END

IF ~~ THEN BEGIN HelpOffer
SAY @36
IF ~~ THEN REPLY @37 GOTO Leads
IF ~~ THEN REPLY @38 GOTO Leads
END

IF ~~ THEN BEGIN Leads
SAY @39
= @40
IF ~~ THEN REPLY @41 GOTO Start3
IF ~~ THEN REPLY @42 GOTO Cheers
IF ~~ THEN REPLY @43 DO ~AddJournalEntry(@117,QUEST)
SetGlobal("A#IM5Quest","GLOBAL",2)
StartStore("shop08",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN Cheers
SAY @44
IF ~~ THEN DO ~AddJournalEntry(@117,QUEST)
SetGlobal("A#IM5Quest","GLOBAL",2)~ EXIT
END

END

BEGIN ~A#KRAM~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN KramChat
SAY @45
= @46
IF ~~ THEN REPLY @47 GOTO Wait
IF ~~ THEN REPLY @48 GOTO Explain
IF ~~ THEN REPLY @49 GOTO Explain
IF ~~ THEN REPLY @50 GOTO Wait
IF ~~ THEN REPLY @51 GOTO Wait
END

IF ~~ THEN BEGIN Wait
SAY @52
IF ~~ THEN REPLY @53 GOTO Explain
IF ~~ THEN REPLY @54 GOTO Combat
IF ~~ THEN REPLY @55 GOTO Explain
IF ~~ THEN REPLY @56 GOTO GuardsNow
END

IF ~~ THEN BEGIN Combat
SAY @57
= @58
IF ~~ THEN DO ~SetGlobal("A#IM5Quest","GLOBAL",3)
SetGlobal("A#IM5Combat","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN GuardsNow
SAY @59
IF ~~ THEN GOTO Combat
END

IF ~~ THEN BEGIN Scrolls
SAY @60
= @61
IF ~~ THEN DO ~SetGlobal("A#IM5Quest","GLOBAL",3)
SetGlobal("A#IM5Free","GLOBAL",1)
GiveItem("SCRL72",Player1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN TurnAround
SAY @62
= @63
IF ~~ THEN DO ~SetGlobal("A#IM5Quest","GLOBAL",3)
SetGlobal("A#IM5Free","GLOBAL",1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Alleviate
SAY @64
IF ~PartyHasItemIdentified("ring30")~ THEN REPLY @65 GOTO Alleviate5
IF ~~ THEN REPLY @66 GOTO Alleviate3
IF ~~ THEN REPLY @67 GOTO Alleviate3
IF ~~ THEN REPLY @68 GOTO Alleviate2
END

IF ~~ THEN BEGIN Alleviate2
SAY @69
IF ~~ THEN GOTO Alleviate4
END

IF ~~ THEN BEGIN Alleviate3
SAY @70
IF ~~ THEN GOTO Alleviate4
END

IF ~~ THEN BEGIN Alleviate4
SAY @71
IF ~~ THEN REPLY @72 GOTO Alleviate
IF ~~ THEN REPLY @73 GOTO Combat
IF ~~ THEN REPLY @74 GOTO GuardsNow
IF ~~ THEN REPLY @75 GOTO Scrolls
IF ~~ THEN REPLY @76 GOTO GuardsNow
IF ~~ THEN REPLY @77 GOTO TurnAround
END

IF ~~ THEN BEGIN Alleviate5
SAY @78
IF ~~ THEN REPLY @79 GOTO Alleviate7
IF ~~ THEN REPLY @80 GOTO Alleviate6
IF ~~ THEN REPLY @81 GOTO Alleviate6
IF ~~ THEN REPLY @82 GOTO Alleviate2
END

IF ~~ THEN BEGIN Alleviate6
SAY @83
IF ~~ THEN REPLY @84 GOTO Alleviate2
IF ~~ THEN REPLY @85 GOTO Alleviate8
IF ~~ THEN REPLY @86 GOTO Alleviate2
END

IF ~~ THEN BEGIN Alleviate7
SAY @87
IF ~~ THEN DO ~TakePartyItem("ring30")
IncrementGlobal("D0Change","GLOBAL",2)
SetGlobal("A#IM5Quest","GLOBAL",3)
SetGlobal("A#IM5Free","GLOBAL",2)
AddExperienceParty(10000)
ReputationInc(1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Alleviate8
SAY @88
IF ~~ THEN DO ~TakePartyItem("ring30")
IncrementGlobal("D0Change","GLOBAL",1)
SetGlobal("A#IM5Quest","GLOBAL",3)
SetGlobal("A#IM5Free","GLOBAL",2)
AddExperienceParty(10000)
GiveGoldForce(100)
GiveItemCreate("scrl72",LastTalkedToBy(Myself),4,0,0)
DestroyItem("scrl72")
DestroyItem("scrl72")
DestroyItem("scrl72")
DestroyItem("scrl72")
ReputationInc(1)
EscapeArea()~ EXIT
END

BEGIN ~A#KRAM2~

IF ~RandomNum(3,1)~ THEN BEGIN Option1
SAY @89
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN Option2
SAY @90
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN Option3
SAY @91
IF ~~ THEN EXIT
END

CHAIN IF ~~ THEN ~A#KRAM~ Explain
@92
== ~KORGANJ~ IF ~InParty("Korgan")
!StateCheck("Korgan",1064941)
!StateCheck("Korgan",STATE_CONFUSED)~ THEN @93
== ~A#KRAM~ @94
== ~AERIEJ~ IF ~InParty("Aerie")
!StateCheck("Aerie",1064941)
!StateCheck("Aerie",STATE_CONFUSED)~ THEN @95
== ~NALIAJ~ IF ~InParty("Nalia")
!StateCheck("Nalia",1064941)
!StateCheck("Nalia",STATE_CONFUSED)~ THEN @96
== ~A#KRAM~ @97
== ~A#KRAM~ @98
== ~EDWINJ~ IF ~InParty("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @99
== ~IMOEN2J~ IF ~InParty("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)
InParty("Imoen2")
!StateCheck("Imoen2",1064941)
!StateCheck("Imoen2",STATE_CONFUSED)~ THEN @100
== ~A#KRAM~ @101
== ~A#KRAM~ @102
== ~KELDORJ~ IF ~InParty("Keldorn")
!StateCheck("Keldorn",1064941)
!StateCheck("Keldorn",STATE_CONFUSED)~ THEN @103
== ~A#KRAM~ @104
END
IF ~~ THEN REPLY @105 EXTERN ~A#KRAM~ Combat
IF ~~ THEN REPLY @106 EXTERN ~A#KRAM~ GuardsNow
IF ~~ THEN REPLY @107 EXTERN ~A#KRAM~ Combat
IF ~~ THEN REPLY @108 EXTERN ~A#KRAM~ Moved
IF ~~ THEN REPLY @109 GOTO Alleviate

CHAIN IF ~~ THEN ~A#KRAM~ Moved
@110
== ~CERNDJ~ IF ~InParty("Cernd")
!Dead("Cernd")~ THEN @111
== ~HAERDAJ~ IF ~InParty("Haerdalis")
!Dead("Haerdalis")~ THEN @112
== ~A#KRAM~ @113
== ~KORGANJ~ IF ~InParty("Korgan")
 !Dead("Korgan")~ THEN @114
== ~AERIEJ~ IF ~InParty("Aerie")
!Dead("Aerie")~ THEN @115
== ~A#KRAM~ @116
END
IF ~~ THEN REPLY @73 EXTERN ~A#KRAM~ Combat
IF ~~ THEN REPLY @74 EXTERN ~A#KRAM~ GuardsNow
IF ~~ THEN REPLY @75 EXTERN ~A#KRAM~ Scrolls
IF ~~ THEN REPLY @76 EXTERN ~A#KRAM~ GuardsNow
IF ~~ THEN REPLY @77 EXTERN ~A#KRAM~ TurnAround
IF ~~ THEN REPLY @109 GOTO Alleviate
