APPEND ANOMENJ

IF ~~ THEN BEGIN KP_AN_INTERJECT_1
  SAY @0
  IF ~~ THEN EXTERN D0KAYPAL KP_7
END

IF ~~ THEN BEGIN KP_AN_INTERJECT_2
  SAY @1
  IF ~~ THEN EXTERN D0KAYPAL KP_7
END

IF ~~ THEN BEGIN KP_AN_INTERJECT_3
  SAY @2
  IF ~~ THEN EXTERN D0KAYPAL KP_7
END

END

//////////////////////////////////////////////////////////////////////

APPEND KELDORJ

IF ~~ THEN BEGIN KP_K_INTERJECT_1
  SAY @3
  IF ~OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Anomen")
!Name("Anomen",LastTalkedToBy(Myself))~ THEN EXTERN D0KAYPAL KP_7
END

END

//////////////////////////////////////////////////////////////////////

BEGIN D0KAYPAL

IF ~NumTimesTalkedTo(0)
!Global("D0Reynald","GLOBAL",2)
GlobalLT("D0Reynald","GLOBAL",7)~ THEN BEGIN KP_1
  SAY @4
     =
      @5
  IF ~~ THEN REPLY @6 GOTO KP_2

  IF ~Global("JoinMe","LOCALS",0)
Alignment(Player1,MASK_GOOD)
ReputationLT(Player1,11)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_3
  IF ~Global("JoinMe","LOCALS",0)
Alignment(Player1,LAWFUL_GOOD)
ReputationGT(Player1,10)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_4
  IF ~Global("JoinMe","LOCALS",0)
!Alignment(Player1,LAWFUL_GOOD)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,10)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_5
  IF ~Global("JoinMe","LOCALS",0)
!Alignment(Player1,MASK_GOOD)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_6

  IF ~OR(2)
IsValidForPartyDialog("Keldorn")
Name("Keldorn",LastTalkedToBy(Myself))~ THEN REPLY @8 EXTERN KELDORJ KP_K_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Keldorn")
!Name("Anomen",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Anomen")~ THEN REPLY @8 GOTO KP_7

  IF ~Gender(Player1,FEMALE)~ THEN REPLY @9 GOTO KP_8

  IF ~Class(Player1,PALADIN_ALL)
!FallenPaladin(Player1)~ THEN REPLY @10 GOTO KP_9
  IF ~OR(2)
!Class(Player1,PALADIN_ALL)
FallenPaladin(Player1)~ THEN REPLY @11 GOTO KP_9

//  IF ~InParty("Imoen") Global("ImoenRomanceActive","GLOBAL",2)~ THEN REPLY ~(Urinate on Imoen.)~ GOTO Bladder
END

IF ~~ THEN BEGIN KP_2
  SAY @12
= @13
= @14
  IF ~~ THEN REPLY @15 GOTO KP_10
  IF ~OR(2)
IsValidForPartyDialog("Keldorn")
Name("Keldorn",LastTalkedToBy(Myself))~ THEN REPLY @16 EXTERN KELDORJ KP_K_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN REPLY @16 EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN REPLY @16 EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @16 EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Keldorn")
!Name("Anomen",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Anomen")~ THEN REPLY @16 GOTO KP_7

  IF ~Gender(Player1,FEMALE)~ THEN REPLY @17 GOTO KP_8

  IF ~Class(Player1,PALADIN_ALL)
!FallenPaladin(Player1)~ THEN REPLY @18 GOTO KP_9
  IF ~OR(2)
!Class(Player1,PALADIN_ALL)
FallenPaladin(Player1)~ THEN REPLY @19 GOTO KP_9
END

IF ~~ THEN BEGIN KP_3
  SAY @20
  IF ~~ THEN REPLY @6 GOTO KP_2

  IF ~OR(2)
IsValidForPartyDialog("Keldorn")
Name("Keldorn",LastTalkedToBy(Myself))~ THEN REPLY @8 EXTERN KELDORJ KP_K_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Keldorn")
!Name("Anomen",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Anomen")~ THEN REPLY @8 GOTO KP_7

  IF ~Gender(Player1,FEMALE)~ THEN REPLY @21 GOTO KP_8

  IF ~Class(Player1,PALADIN_ALL)
!FallenPaladin(Player1)~ THEN REPLY @22 GOTO KP_9
  IF ~OR(2)
!Class(Player1,PALADIN_ALL)
FallenPaladin(Player1)~ THEN REPLY @23 GOTO KP_9
END

IF ~~ THEN BEGIN KP_4
  SAY @24
  IF ~~ THEN REPLY @6 GOTO KP_2

  IF ~OR(2)
IsValidForPartyDialog("Keldorn")
Name("Keldorn",LastTalkedToBy(Myself))~ THEN REPLY @8 EXTERN KELDORJ KP_K_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Keldorn")
!Name("Anomen",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Anomen")~ THEN REPLY @8 GOTO KP_7

  IF ~Gender(Player1,FEMALE)~ THEN REPLY @21 GOTO KP_8

  IF ~Class(Player1,PALADIN_ALL)
!FallenPaladin(Player1)~ THEN REPLY @22 GOTO KP_9
  IF ~OR(2)
!Class(Player1,PALADIN_ALL)
FallenPaladin(Player1)~ THEN REPLY @23 GOTO KP_9
END

IF ~~ THEN BEGIN KP_5
  SAY @25
  IF ~~ THEN REPLY @6 GOTO KP_2

  IF ~OR(2)
IsValidForPartyDialog("Keldorn")
Name("Keldorn",LastTalkedToBy(Myself))~ THEN REPLY @8 EXTERN KELDORJ KP_K_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Keldorn")
!Name("Anomen",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Anomen")~ THEN REPLY @8 GOTO KP_7

  IF ~Gender(Player1,FEMALE)~ THEN REPLY @21 GOTO KP_8

  IF ~Class(Player1,PALADIN_ALL)
!FallenPaladin(Player1)~ THEN REPLY @22 GOTO KP_9
  IF ~OR(2)
!Class(Player1,PALADIN_ALL)
FallenPaladin(Player1)~ THEN REPLY @23 GOTO KP_9
END

IF ~~ THEN BEGIN KP_6
  SAY @26
  IF ~~ THEN REPLY @6 GOTO KP_2

  IF ~OR(2)
IsValidForPartyDialog("Keldorn")
Name("Keldorn",LastTalkedToBy(Myself))~ THEN REPLY @8 EXTERN KELDORJ KP_K_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_GOOD)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_1
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_2
  IF ~!IsValidForPartyDialog("Keldorn")
OR(2)
IsValidForPartyDialog("Anomen")
Name("Anomen",LastTalkedToBy(Myself))
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN REPLY @8 EXTERN ANOMENJ KP_AN_INTERJECT_3
  IF ~!IsValidForPartyDialog("Keldorn")
!Name("Anomen",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Anomen")~ THEN REPLY @8 GOTO KP_7

  IF ~Gender(Player1,FEMALE)~ THEN REPLY @21 GOTO KP_8

  IF ~Class(Player1,PALADIN_ALL)
!FallenPaladin(Player1)~ THEN REPLY @22 GOTO KP_9
  IF ~OR(2)
!Class(Player1,PALADIN_ALL)
FallenPaladin(Player1)~ THEN REPLY @23 GOTO KP_9
END

IF ~~ THEN BEGIN KP_7
  SAY @27
  IF ~Global("JoinMe","LOCALS",0)
Alignment(Player1,MASK_GOOD)
ReputationLT(Player1,11)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_11
  IF ~Global("JoinMe","LOCALS",0)
Alignment(Player1,LAWFUL_GOOD)
ReputationGT(Player1,10)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_12
  IF ~Global("JoinMe","LOCALS",0)
!Alignment(Player1,LAWFUL_GOOD)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,10)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_13
  IF ~Global("JoinMe","LOCALS",0)
!Alignment(Player1,MASK_GOOD)~ THEN REPLY @7 DO ~SetGlobal("JoinMe","LOCALS",1)~ GOTO KP_14

  IF ~~ THEN REPLY @28 GOTO KP_15
  IF ~~ THEN REPLY @29 GOTO KP_16
  IF ~Dead("hlshang")~ THEN REPLY @30 GOTO KP_17
  IF ~~ THEN REPLY @31 GOTO KP_18
  IF ~~ THEN REPLY @32 GOTO KP_9
END

IF ~~ THEN BEGIN KP_8
  SAY @33
  IF ~~ THEN GOTO KP_7
END

IF ~~ THEN BEGIN KP_9
  SAY @34
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",2)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN KP_10
  SAY @35
  IF ~~ THEN GOTO KP_7
END

IF ~~ THEN BEGIN KP_11
  SAY @20
  IF ~~ THEN REPLY @36 GOTO KP_15
  IF ~~ THEN REPLY @37 GOTO KP_16
  IF ~Dead("hlshang")~ THEN REPLY @38 GOTO KP_17
  IF ~~ THEN REPLY @39 GOTO KP_18
  IF ~~ THEN REPLY @40 GOTO KP_9
END

IF ~~ THEN BEGIN KP_12
  SAY @24
  IF ~~ THEN REPLY @36 GOTO KP_15
  IF ~~ THEN REPLY @37 GOTO KP_16
  IF ~Dead("hlshang")~ THEN REPLY @38 GOTO KP_17
  IF ~~ THEN REPLY @39 GOTO KP_18
  IF ~~ THEN REPLY @40 GOTO KP_9
END

IF ~~ THEN BEGIN KP_13
  SAY @25
  IF ~~ THEN REPLY @36 GOTO KP_15
  IF ~~ THEN REPLY @37 GOTO KP_16
  IF ~Dead("hlshang")~ THEN REPLY @38 GOTO KP_17
  IF ~~ THEN REPLY @39 GOTO KP_18
  IF ~~ THEN REPLY @40 GOTO KP_9
END

IF ~~ THEN BEGIN KP_14
  SAY @26
  IF ~~ THEN REPLY @36 GOTO KP_15
  IF ~~ THEN REPLY @37 GOTO KP_16
  IF ~Dead("hlshang")~ THEN REPLY @38 GOTO KP_17
  IF ~~ THEN REPLY @39 GOTO KP_18
  IF ~~ THEN REPLY @40 GOTO KP_9
END

IF ~~ THEN BEGIN KP_15
  SAY @41
     =
      @42
  IF ~~ THEN REPLY @43 GOTO KP_19
  IF ~~ THEN REPLY @44 GOTO KP_19
  IF ~~ THEN REPLY @45 GOTO KP_20
END

IF ~~ THEN BEGIN KP_16
  SAY @46
  IF ~~ THEN REPLY @36 GOTO KP_15
  IF ~Dead("hlshang")~ THEN REPLY @38 GOTO KP_17
  IF ~~ THEN REPLY @39 GOTO KP_18
  IF ~~ THEN REPLY @40 GOTO KP_9
END

IF ~~ THEN BEGIN KP_17
  SAY @47
  IF ~~ THEN REPLY @36 GOTO KP_15
  IF ~~ THEN REPLY @37 GOTO KP_16
  IF ~~ THEN REPLY @39 GOTO KP_18
  IF ~~ THEN REPLY @40 GOTO KP_9
END

IF ~~ THEN BEGIN KP_18
  SAY @48
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",2)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN KP_19
  SAY @49
  IF ~~ THEN REPLY @50 GOTO KP_20
  IF ~~ THEN REPLY @51 GOTO KP_21
END

IF ~~ THEN BEGIN KP_20
  SAY @52
  IF ~~ THEN DO ~AddJournalEntry(@173,QUEST)
SetGlobal("D0Reynald","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN KP_21
  SAY @53
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",2)
EscapeArea()~ EXIT
END

IF ~GlobalGT("D0Reynald","GLOBAL",3)
GlobalLT("D0Reynald","GLOBAL",7)~ THEN BEGIN KP_22
  SAY @54
  IF ~Global("D0Reynald","GLOBAL",4)~ THEN REPLY @55 GOTO KP_23
  IF ~~ THEN REPLY @56 GOTO KP_24
END

IF ~~ THEN BEGIN KP_23
  SAY @57
  IF ~~ THEN REPLY @58 GOTO KP_25
  IF ~~ THEN REPLY @59 GOTO KP_18
END

IF ~~ THEN BEGIN KP_24
  SAY @60
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KP_25
  SAY @61
  IF ~~ THEN REPLY @62 GOTO KP_26
  IF ~~ THEN REPLY @63 GOTO KP_27
END

IF ~~ THEN BEGIN KP_26
  SAY @64
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",5)
AddexperienceParty(12500)
IncrementGlobal("D0Change","GLOBAL",1)
ReputationInc(1)
EraseJournalEntry(@173)
EraseJournalEntry(@174)
AddJournalEntry(@175,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN KP_27
  SAY @65
  IF ~~ THEN GOTO KP_26
END

IF ~Global("D0Reynald","GLOBAL",7)
!CombatCounter(0)~ THEN BEGIN KP_28
  SAY @66
  IF ~~ THEN EXIT
END

IF ~Global("D0Reynald","GLOBAL",7)
CombatCounter(0)~ THEN BEGIN KP_29
  SAY @67
  IF ~ReputationGT(Player1,15)~ THEN REPLY @68 GOTO KP_30
  IF ~ReputationLT(Player1,16)~ THEN REPLY @68 GOTO KP_30a
  IF ~~ THEN REPLY @69 GOTO KP_31
  IF ~~ THEN REPLY @70 GOTO KP_32
END

IF ~~ THEN BEGIN KP_30
  SAY @71
  IF ~~ THEN REPLY @72 GOTO KP_33
  IF ~~ THEN REPLY @73 GOTO KP_31
  IF ~~ THEN REPLY @74 GOTO KP_32
END

IF ~~ THEN BEGIN KP_30a
  SAY @75
  IF ~~ THEN REPLY @72 GOTO KP_33
  IF ~~ THEN REPLY @73 GOTO KP_31
  IF ~~ THEN REPLY @74 GOTO KP_32
END

IF ~~ THEN BEGIN KP_31
  SAY @76
  IF ~~ THEN REPLY @77 GOTO KP_32
  IF ~~ THEN REPLY @70 GOTO KP_32
END

IF ~~ THEN BEGIN KP_32
  SAY @78
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",8)
DialogInterrupt(FALSE)~ EXIT
END

IF ~~ THEN BEGIN KP_33
  SAY @79
     =
      @80
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",8)
DialogInterrupt(FALSE)~ EXIT
END

IF ~Dead("c6bodhi")
CombatCounter(0)~ THEN BEGIN KP_34
  SAY @81
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM HABREGA 0
  IF ~Global("D0Reynald","GLOBAL",3)~ THEN REPLY @82 DO ~SetGlobal("D0SpokenBregaGuard","MYAREA",1)~ GOTO BR_1
END

EXTEND_BOTTOM HABREGA 1
  IF ~Global("D0Reynald","GLOBAL",3)~ THEN REPLY @82 DO ~SetGlobal("D0SpokenBregaGuard","MYAREA",1)~ GOTO BR_1
END

APPEND HABREGA

IF ~~ THEN BEGIN BR_1
  SAY @83
  IF ~~ THEN REPLY @84 GOTO BR_2
  IF ~~ THEN REPLY @85 GOTO 2
  IF ~~ THEN REPLY @86 GOTO 2
END

IF ~~ THEN BEGIN BR_2
  SAY @87
  IF ~~ THEN REPLY @88 GOTO 2
  IF ~~ THEN REPLY @86 GOTO 2
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM BYLANNA 5
  IF ~Global("D0Reynald","GLOBAL",3)
!Global("D0SpokenBregaGuard","MYAREA",1)~ THEN REPLY @82 GOTO BY_1
  IF ~Global("D0Reynald","GLOBAL",3)
Global("D0SpokenBregaGuard","MYAREA",1)~ THEN REPLY @89 GOTO BY_1a
END

EXTEND_BOTTOM BYLANNA 6
  IF ~Global("D0Reynald","GLOBAL",3)
!Global("D0SpokenBregaGuard","MYAREA",1)~ THEN REPLY @82 GOTO BY_1
  IF ~Global("D0Reynald","GLOBAL",3)
Global("D0SpokenBregaGuard","MYAREA",1)~ THEN REPLY @89 GOTO BY_1a
END

APPEND BYLANNA

IF ~~ THEN BEGIN BY_1
  SAY @90
  IF ~~ THEN REPLY @91 GOTO BY_2
  IF ~~ THEN REPLY @92 GOTO BY_3
  IF ~~ THEN REPLY @93 GOTO BY_4
END

IF ~~ THEN BEGIN BY_1a
  SAY @94
  IF ~~ THEN REPLY @91 GOTO BY_2
  IF ~~ THEN REPLY @92 GOTO BY_3
  IF ~~ THEN REPLY @93 GOTO BY_4
END

IF ~~ THEN BEGIN BY_2
  SAY @95
  IF ~~ THEN REPLY @96 GOTO BY_5
  IF ~~ THEN REPLY @97 GOTO BY_6
  IF ~~ THEN REPLY @98 GOTO BY_4
END

IF ~~ THEN BEGIN BY_3
  SAY @99
  IF ~~ THEN DO ~AddJournalEntry(@174,QUEST)
SetGlobal("D0Reynald","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN BY_4
  SAY @100
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BY_5
  SAY @101
  IF ~CheckStatGT(LastTalkedToBy(Myself),16,INT)~ THEN REPLY @102 GOTO BY_5a
  IF ~~ THEN REPLY @103 GOTO BY_4
  IF ~~ THEN REPLY @97 GOTO BY_6
  IF ~~ THEN REPLY @98 GOTO BY_4
END

IF ~~ THEN BEGIN BY_5a
  SAY @104
  IF ~~ THEN REPLY @105 GOTO BY_4
  IF ~~ THEN REPLY @106 GOTO BY_6
  IF ~~ THEN REPLY @107 GOTO BY_6
  IF ~~ THEN REPLY @108 GOTO BY_4
END

IF ~~ THEN BEGIN BY_6
  SAY @109
  IF ~~ THEN DO ~AddJournalEntry(@174,QUEST)
SetGlobal("D0Reynald","GLOBAL",4)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Reynald","GLOBAL",5)~ THEN BEGIN BY_7
  SAY @110
  IF ~~ THEN DO ~SetGlobal("D0Reynald","GLOBAL",6)~ GOTO BY_8
END

IF ~~ THEN BEGIN BY_8
  SAY @111
  COPY_TRANS BYLANNA 6
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

CHAIN
IF WEIGHT #-1 ~See("d0kaypal")
Global("TalkReynald","LOCALS",0)~ THEN C6ERIC REYNALDCHAIN
  @112
  DO ~SetGlobal("TalkReynald","LOCALS",1)~
== D0KAYPAL
  @113
== C6ERIC
  @114
EXIT

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE KAYPAL02
IF WEIGHT #1 ~Global("KaylStartFight","GLOBAL",2)
Global("KaylPartyHelped","GLOBAL",1)
Global("ReynaldJob","GLOBAL",0)
Global("TalkedAfterFight","LOCALS",0)~ THEN BEGIN 2 // from:
  SAY #31728 /* ~Greetings to you, friend.  I am grateful for your aid against these dogs, and would know your name if you are willing to give it.~ */
  IF ~~ THEN REPLY #31730 /* ~Who I am matters not, just be grateful that I arrived when I did.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO 3
  IF ~!Global("D0FallenMsg","GLOBAL",3)~ THEN REPLY #31729 /* ~I am <CHARNAME>.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO 15
  IF ~Global("D0FallenMsg","GLOBAL",3)~ THEN REPLY #31729 /* ~I am <CHARNAME>.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO KP_2_15
END

IF WEIGHT #2 ~Global("KaylStartFight","GLOBAL",2)
Global("KaylPartyHelped","GLOBAL",0)
Global("ReynaldJob","GLOBAL",0)
Global("TalkedAfterFight","LOCALS",0)~ THEN BEGIN 13 // from:
  SAY #32113 /* ~You there... you watch us fight, yet lift no finger to assist.  So obviously you have business with us.  Might I ask its nature, and your name as well?~ */
  IF ~~ THEN REPLY #32114 /* ~We are searching for your leader, to discuss a business opportunity.  As for my name, it does not matter.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO 3
  IF ~!Global("D0FallenMsg","GLOBAL",3)~ THEN REPLY #59875 /* ~My name is <CHARNAME>, and I am seeking your leader, to discuss business.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO 15
  IF ~!Global("D0FallenMsg","GLOBAL",3)~ THEN REPLY #31729 /* ~I am <CHARNAME>.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO 15
  IF ~Global("D0FallenMsg","GLOBAL",3)~ THEN REPLY #59875 /* ~My name is <CHARNAME>, and I am seeking your leader, to discuss business.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO KP_2_15
  IF ~Global("D0FallenMsg","GLOBAL",3)~ THEN REPLY #31729 /* ~I am <CHARNAME>.~ */ DO ~SetGlobal("TalkedAfterFight","LOCALS",1)~ GOTO KP_2_15
END

IF ~~ THEN BEGIN 6 // from: 8.0 5.1
  SAY #31746 /* ~You'd best be prepared, the Order is strongly defended.  I, myself, would die quickly if I stepped near their Hall.  I wish you well, my <LADYLORD>.~ */
  IF ~Global("D0FallenMsg","GLOBAL",3)~ THEN DO ~SetGlobal("ReynaldJob","GLOBAL",1)
SetGlobal("KaylStartFight","GLOBAL",3)
AddJournalEntry(@176,QUEST)~ EXIT
  IF ~!Global("D0FallenMsg","GLOBAL",3)
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Anomen")~ THEN DO ~SetGlobal("ReynaldJob","GLOBAL",1)
SetGlobal("KaylStartFight","GLOBAL",3)~ UNSOLVED_JOURNAL #34245 /* ~Seek out and investigate the Fallen Paladins.

I have spoken to Reynald de Chatillon, a member of the Fallen Paladins, who promises to introduce me to Anarg if I can get ahold of a cup that belonged to Anarg and is still in the possession of the Order.  The cup, it seems, is largely ceremonial but important to Anarg personally.~ */ EXIT
  IF ~!Global("D0FallenMsg","GLOBAL",3)
IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("ReynaldJob","GLOBAL",1)
SetGlobal("KaylStartFight","GLOBAL",3)~ GOTO 23
  IF ~!Global("D0FallenMsg","GLOBAL",3)
!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Anomen")~ THEN DO ~SetGlobal("ReynaldJob","GLOBAL",1)
SetGlobal("KaylStartFight","GLOBAL",3)~ GOTO 24
END
END

APPEND KAYPAL02
IF ~~ THEN BEGIN KP_2_15
SAY @115
  IF ~~ THEN REPLY #59862 /* ~No, I don't think so.~ */ GOTO 7
  IF ~~ THEN REPLY #59863 /* ~If the pay is adequate, you might hire our services.~ */ GOTO 4
  IF ~~ THEN REPLY #59864 /* ~How did you come to leave the Order, if I might ask?~ */ GOTO 16
END
END

REPLACE_SAY KAYPAL02 2 @116

REPLACE_SAY KAYPAL02 8 @117

REPLACE_SAY KAYPAL02 9 @118

REPLACE_SAY KAYPAL02 11 @119

REPLACE_SAY KAYPAL02 13 @120

REPLACE KAYPAL01
IF ~NumTimesTalkedTo(0)
OR(2)
!InParty("Keldorn")
!See("Keldorn")~ THEN BEGIN 0 // from:
  SAY @121
  IF ~~ THEN REPLY #31779 /* ~No, I have changed my mind.~ */ GOTO 1
  IF ~~ THEN REPLY @122 DO ~AddexperienceParty(7250)~  GOTO AN_1
  IF ~~ THEN REPLY @123 DO ~AddexperienceParty(7250)~  GOTO AN_1
 IF ~~ THEN REPLY @124 DO ~AddexperienceParty(7250)~ GOTO 2
// Delete the line above when the two below are un-commented
//  IF ~!Dead("kayl2")~ THEN REPLY @124 DO ~AddexperienceParty(7250)~ GOTO 2
//  IF ~Dead("kayl2")~ THEN REPLY @124 GOTO AN_2
  IF ~Class(LastTalkedToBy(Myself),PALADIN_ALL)
!FallenPaladin(LastTalkedToBy(Myself))~ THEN REPLY @125DO ~AddexperienceParty(7250)~ EXTERN KAYPAL02 26
  IF ~OR(2)
!Class(LastTalkedToBy(Myself),PALADIN_ALL)
FallenPaladin(LastTalkedToBy(Myself))~ THEN REPLY @126 DO ~AddexperienceParty(7250)~ EXTERN KAYPAL02 26
END
END

REPLACE_ACTION_TEXT KAYL2 ~CreateItem("misc6i",0,0,0)~ ~~

EXTEND_BOTTOM KAYL2 19
// IF ~~ THEN REPLY ~Draw steel, corrupt scum! The Fallen Paladins are nobler knights than you ever were.~ GOTO RT_1
IF ~~ THEN REPLY @127 GOTO 42
END

APPEND KAYL2
IF ~~ THEN BEGIN RT_1
SAY @128
IF ~~ THEN DO ~SetGlobal("TempleShout0903","GLOBAL",1)
Enemy()~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0PALMSG
IF ~NumTimesTalkedTo(0)~ THEN BEGIN FPM_1
SAY @129
IF ~IsValidForPartyDialogue("Anomen")
Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN EXTERN ANOMENJ FPM_I_1
IF ~OR(2)
!IsValidForPartyDialogue("Anomen")
!Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN GOTO FPM_2
END

IF ~~ THEN BEGIN FPM_2
SAY @130
IF ~~ THEN REPLY @131 GOTO FPM_3
IF ~~ THEN REPLY @132 GOTO FPM_4
IF ~~ THEN REPLY @133 GOTO FPM_5
IF ~~ THEN REPLY @134 GOTO FPM_5
IF ~~ THEN REPLY @135 GOTO FPM_6
END

IF ~~ THEN BEGIN FPM_3
SAY @136
IF ~~ THEN DO ~SetGlobal("D0FallenMsg","GLOBAL",3)
AddJournalEntry(@177,QUEST)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN FPM_4
SAY @137
IF ~~ THEN DO ~SetGlobal("D0FallenMsg","GLOBAL",3)
AddJournalEntry(@177,QUEST)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN FPM_5
SAY @138
IF ~~ THEN DO ~SetGlobal("D0FallenMsg","GLOBAL",3)
AddJournalEntry(@177,QUEST)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN FPM_6
SAY @139
IF ~~ THEN DO ~SetGlobal("D0FallenMsg","GLOBAL",3)
AddJournalEntry(@177,QUEST)
EscapeArea()~ EXIT
END

APPEND ANOMENJ
IF ~~ THEN BEGIN FPM_I_1
SAY @140
IF ~~ THEN EXTERN D0PALMSG FPM_2
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND KAYSMG01

IF WEIGHT #-1 ~	Dead("kaypall")
NumDeadGT("kaypal",3)
!See(NearestEnemyOf(Myself))
See([PC])
Global("RindusLeaves","LOCALS",1)~ THEN BEGIN SM_1
SAY @141
IF ~~ THEN DO ~SetGlobal("RindusLeaves","LOCALS",2)
GiveGoldForce(500)
EscapeArea()~ EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND KAYPAL01
IF ~~ THEN BEGIN AN_1 // from: 0.0
  SAY @142
  IF ~Dead("kaypall")~ THEN DO ~SetGlobal("KaylAnargAttack","GLOBAL",1)
Enemy()~ EXIT
  IF ~!Dead("kaypall")~ THEN EXTERN ~KAYPAL02~ 27
END

IF ~~ THEN BEGIN AN_2
  SAY @143
= @144
IF ~~ THEN DO ~TakePartyItem("misc6i")
AddexperienceParty(15000)~ GOTO AN_3
END

IF ~~ THEN BEGIN AN_3
SAY @145
IF ~~ THEN EXTERN KAYPAL02 KP_101
END

IF ~~ THEN BEGIN AN_4
SAY @146
IF ~~ THEN EXTERN KAYPAL02 KP_102
END

IF ~Global("D0Fallen","GLOBAL",2)~ THEN BEGIN AN_5
SAY @147
IF ~~ THEN REPLY @148 GOTO AN_6
IF ~~ THEN REPLY @149 GOTO AN_7
END

IF ~~ THEN BEGIN AN_6
SAY @150
IF ~~ THEN DO ~SetGlobal("KaylAnargAttack","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN AN_7
SAY @151
= @152
IF ~~ THEN REPLY @153 GOTO AN_8
IF ~~ THEN REPLY @154 GOTO AN_6
IF ~~ THEN REPLY @155 GOTO AN_8
END

IF ~~ THEN BEGIN AN_8
SAY @156
IF ~~ THEN REPLY @157 GOTO AN_9
IF ~~ THEN REPLY @158 GOTO AN_10
END

IF ~~ THEN BEGIN AN_9
SAY @159
IF ~~ THEN DO ~SetGlobal("KaylAnargAttack","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN AN_10
SAY @160
= @161
IF ~~ THEN REPLY @162 GOTO AN_9
IF ~~ THEN REPLY @163 GOTO AN_9
IF ~~ THEN REPLY @164 GOTO AN_11
IF ~~ THEN REPLY @165 GOTO AN_12
END

IF ~~ THEN BEGIN AN_11
SAY @166
IF ~~ THEN DO ~SetGlobal("KaylAnargAttack","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN AN_12
SAY @167
IF ~~ THEN DO ~GiveItemCreate("d0qppois",Player1,1,0,0)~ GOTO AN_13
END

IF ~~ THEN BEGIN AN_13
SAY @168
= @169
IF ~~ THEN DO ~SetGlobal("D0Fallen","GLOBAL",3)
AddJournalEntry(@178,QUEST)~ EXIT
END

IF ~Global("D0Fallen","GLOBAL",3)~ THEN BEGIN AN_14
SAY @170
IF ~~ THEN EXIT
END
END



APPEND KAYPAL02
IF ~~ THEN BEGIN KP_101
SAY @171
= @172
IF ~~ THEN EXTERN KAYPAL01 AN_4
END

IF ~~ THEN BEGIN KP_102
  SAY #59884 /* ~Fight on your own, then!  I will not join you in this!  Obviously you are not the knight I thought you to be.~ */
  IF ~~ THEN DO ~SetGlobal("D0Fallen","GLOBAL",1)
SetCutSceneLite(TRUE)
EscapeArea()~ EXIT
END
END
