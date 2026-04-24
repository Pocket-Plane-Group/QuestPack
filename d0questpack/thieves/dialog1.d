// CHAPTER 2 MAE'VAR STUFF

EXTEND_BOTTOM MAEVAR 0
  IF ~IsValidForPartyDialogue("Edwin")
InParty("Edwin")~ THEN REPLY @76 EXTERN EDWINJ ED_MV_1 // BEFORE MISSIONS
  IF ~!IsValidForPartyDialogue("Edwin")
InParty("Edwin")~ THEN REPLY @76 DO ~SetGlobal("D0EdMae","LOCALS",1)~ GOTO MV_1 // BEFORE MISSIONS
  IF ~!InParty("Edwin")~ THEN REPLY @76 GOTO MV_1 // BEFORE MISSIONS
END

APPEND YOSHJ
IF ~~ THEN BEGIN YO_MV_2
SAY @77
IF ~~ THEN EXTERN MAEVAR MV_3
END

IF ~~ THEN BEGIN YO_MV_8a
SAY @77
IF ~~ THEN EXTERN MAEVAR MV_9
END

IF ~~ THEN BEGIN YO_MV_8b
SAY @77
IF ~~ THEN EXTERN MAEVAR MV_10
END
END

REPLACE MAEVAR
IF ~~ THEN BEGIN 43
  SAY @78
  IF ~~ THEN REPLY @79 GOTO MV_4
  IF ~~ THEN REPLY @80 GOTO MV_5 // AFTER MISSIONS
END
END

APPEND MAEVAR

IF ~~ THEN BEGIN MV_1
  SAY @81
  IF ~~ THEN REPLY @82 GOTO MV_2
  IF ~~ THEN REPLY @83 GOTO MV_3
  IF ~~ THEN REPLY @84 GOTO MV_3
END

IF ~~ THEN BEGIN MV_2
  SAY @85
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN REPLY @86 EXTERN YOSHJ YO_MV_2
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN REPLY @86 GOTO MV_3
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN REPLY @87 EXTERN YOSHJ YO_MV_2
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN REPLY @87 GOTO MV_3
  IF ~~ THEN REPLY @88 GOTO MV_3
END

IF ~~ THEN BEGIN MV_3
  SAY @89
  IF ~~ THEN DO ~Shout(89)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN MV_4
  SAY @90
  IF ~~ THEN UNSOLVED_JOURNAL #34235 /* ~Find proof of Mae'Var's treachery.

Mae'Var trusts me well enough, and has accepted me into the guild.  Perhaps now I have time to look around and see if there is any evidence to be had.  Edwin might know something, but only if it is in his best interests, I am sure. ~ */ DO ~SetGlobal("SeeEdwinAgain","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN MV_5
  SAY @91
  IF ~~ THEN REPLY @92 GOTO MV_6
  IF ~IsValidForPartyDialogue("Edwin")
InParty("Edwin")~ THEN REPLY @76 EXTERN EDWINJ ED_MV_1a
  IF ~!IsValidForPartyDialogue("Edwin")
InParty("Edwin")~ THEN REPLY @76 DO ~SetGlobal("D0EdMae","LOCALS",1)~ GOTO MV_7
  IF ~!InParty("Edwin")~ THEN REPLY @76 GOTO MV_7
  IF ~~ THEN REPLY @93 GOTO MV_1
END

IF ~~ THEN BEGIN MV_6
  SAY @94
  IF ~~ THEN UNSOLVED_JOURNAL #34235 /* ~Find proof of Mae'Var's treachery.

Mae'Var trusts me well enough, and has accepted me into the guild.  Perhaps now I have time to look around and see if there is any evidence to be had.  Edwin might know something, but only if it is in his best interests, I am sure. ~ */ DO ~SetGlobal("SeeEdwinAgain","LOCALS",1)~ EXIT
END

IF WEIGHT #-1 ~Global("SeeEdwinAgain","LOCALS",1)
Global("D0Maevar","GLOBAL",0)
!Allegiance(Myself,ENEMY)
!Dead("Edwin")~ THEN BEGIN MV_6a
SAY @95
  IF ~!Detect("Edwin")~ THEN REPLY @79 GOTO MV_4
  IF ~Detect("Edwin")~ THEN REPLY @79 GOTO MV_6b
  IF ~~ THEN REPLY @80 GOTO MV_5 // AFTER MISSIONS
END

IF ~~ THEN BEGIN MV_6b
SAY @96
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MV_7
  SAY @97
  IF ~~ THEN REPLY @82 GOTO MV_8
  IF ~~ THEN REPLY @83 GOTO MV_3
  IF ~~ THEN REPLY @98 GOTO MV_3
END

IF ~~ THEN BEGIN MV_8
  SAY @85
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN REPLY @86 EXTERN YOSHJ YO_MV_8a
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN REPLY @86 GOTO MV_9
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN REPLY @87 EXTERN YOSHJ YO_MV_8b
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN REPLY @87 GOTO MV_10
  IF ~~ THEN REPLY @88 GOTO MV_3
END

IF ~~ THEN BEGIN MV_9
  SAY @99
  IF ~~ THEN GOTO MV_11
END

IF ~~ THEN BEGIN MV_10
  SAY @100
  IF ~~ THEN GOTO MV_11
END

IF ~~ THEN BEGIN MV_11
  SAY @101
      =
      @102
  IF ~~ THEN REPLY @103 GOTO MV_3
  IF ~~ THEN REPLY @104 DO ~GiveItemCreate("d0letter",LastTalkedToBy(Myself),1,0,0)~ GOTO MV_12
  IF ~!GlobalGT("Linvail","GLOBAL",0)~ THEN REPLY @105 GOTO MV_13
END

IF ~~ THEN BEGIN MV_12
  SAY @106
  IF ~~ THEN DO ~AddJournalEntry(@224,QUEST)
SetGlobal("D0Maevar","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN MV_13
  SAY @107
  IF ~~ THEN REPLY @108 GOTO MV_13a
  IF ~~ THEN REPLY @103 GOTO MV_3
  IF ~~ THEN REPLY @104 DO ~GiveItemCreate("d0letter",LastTalkedToBy(Myself),1,0,0)~ GOTO MV_12
END

IF ~~ THEN BEGIN MV_13a
  SAY @109
  IF ~~ THEN REPLY @110 GOTO MV_13b
  IF ~~ THEN REPLY @111 GOTO MV_3
  IF ~~ THEN REPLY @104 DO ~GiveItemCreate("d0letter",LastTalkedToBy(Myself),1,0,0)~ GOTO MV_12
END

IF ~~ THEN BEGIN MV_13b
  SAY @112
  IF ~~ THEN DO ~Shout(89)
Enemy()~ EXIT
END

//////////////////////////////////////////////////////////////////////

IF WEIGHT #-1 ~Global("KillMae","GLOBAL",0)
OR(2)
Global("D0Maevar","GLOBAL",1)
Global("D0Maevar","GLOBAL",2)~ THEN BEGIN MV_14
  SAY @113
  IF ~~ THEN REPLY @103 GOTO MV_3
  IF ~Global("D0Maevar","GLOBAL",1)~ THEN REPLY @114 GOTO MV_15
  IF ~Global("D0Maevar","GLOBAL",2)~ THEN REPLY @115 GOTO MV_16
  IF ~GlobalGT("MaeVarExposed","GLOBAL",0)~ THEN REPLY @116 GOTO MV_14a
END

IF ~~ THEN BEGIN MV_14a
SAY @117

// NOTE: ADD MENTION OF "HOW DID YOU EVER GET THOSE DOCUMENTS?" HERE, ALLOWING BETRAYAL OF EDWIN.

  IF ~~ THEN DO ~Shout(89)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN MV_15
  SAY @118
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MV_16
  SAY @119
     =
      @120
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_6%)~ THEN DO ~SetGlobal("GoSeeEdwin","GLOBAL",2)
GiveItemCreate("d0dart01",LastTalkedToBy(Myself),1,0,0)
GiveItemCreate("potn36",LastTalkedToBy(Myself),1,0,0)
GiveItemCreate("potn10",LastTalkedToBy(Myself),2,0,0)
GiveGoldForce(6500)
EraseJournalEntry(34194)
EraseJournalEntry(34198)
EraseJournalEntry(34201)
EraseJournalEntry(34205)
EraseJournalEntry(34207)
EraseJournalEntry(34211)
EraseJournalEntry(34217)
EraseJournalEntry(34218)
EraseJournalEntry(34220)
EraseJournalEntry(34232)
EraseJournalEntry(34233)
EraseJournalEntry(34234)
EraseJournalEntry(34235)
EraseJournalEntry(34236)
EraseJournalEntry(34237)
EraseJournalEntry(34238)
EraseJournalEntry(34239)
EraseJournalEntry(34240)
EraseJournalEntry(34241)
EraseJournalEntry(34243)
EraseJournalEntry(@224)
AddXPObject(Player1,10500)
AddXPObject(Player2,10500)
AddXPObject(Player3,10500)
AddXPObject(Player4,10500)
AddXPObject(Player5,10500)
AddXPObject(Player6,10500)
SetGlobal("D0Maevar","GLOBAL",3)
SetGlobal("D0RenalPrisoner","GLOBAL",1)
SetGlobalTimer("D0RenalRevenge","GLOBAL",THREE_DAYS)~ SOLVED_JOURNAL @121 EXIT
  IF ~!GlobalLT("chapter","GLOBAL",%bg2_chapter_6%)~ THEN DO ~SetGlobal("GoSeeEdwin","GLOBAL",2)
EraseJournalEntry(34194)
EraseJournalEntry(34198)
EraseJournalEntry(34201)
EraseJournalEntry(34205)
EraseJournalEntry(34207)
EraseJournalEntry(34211)
EraseJournalEntry(34217)
EraseJournalEntry(34218)
EraseJournalEntry(34220)
EraseJournalEntry(34232)
EraseJournalEntry(34233)
EraseJournalEntry(34234)
EraseJournalEntry(34235)
EraseJournalEntry(34236)
EraseJournalEntry(34237)
EraseJournalEntry(34238)
EraseJournalEntry(34239)
EraseJournalEntry(34240)
EraseJournalEntry(34241)
EraseJournalEntry(34243)
EraseJournalEntry(@224)
AddXPObject(Player1,10500)
AddXPObject(Player2,10500)
AddXPObject(Player3,10500)
AddXPObject(Player4,10500)
AddXPObject(Player5,10500)
AddXPObject(Player6,10500)
SetGlobal("D0Maevar","GLOBAL",3)
SetGlobalTimer("D0RenalRevenge","GLOBAL",THREE_DAYS)
SetGlobal("D0RenalPrisoner","GLOBAL",1)
SetGlobalTimer("D0MaevarTimer","GLOBAL",FIVE_DAYS)~ SOLVED_JOURNAL @121 EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",3)~ THEN BEGIN MV_17
  SAY @122
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE RENAL
IF ~~ THEN BEGIN 69 // from: 68.0 66.0 64.0
  SAY @123
  IF ~~ THEN GOTO D0RENALWEIDUISGAY1
END

IF WEIGHT #9 /* Triggers after states #: 49 95 100 101 108 109 even though they appear after this state */
~Global("RenalJob","GLOBAL",1)
Global("D0Spiel","LOCALS",1)~ THEN BEGIN 33 // from:
  SAY #21271 /* ~Aha!  It is <CHARNAME>, our good friend returned to us!  Excuse me while I rub my hands in anticipation.  I trust you have the evidence I am looking for?~ */
  IF ~PartyHasItem("MISC4V")~ THEN REPLY #21292 /* ~Yes, I have the evidence you need in these writings.  It seems that Mae'Var has been making overtures to the Night Knives. ~ */ DO ~AddexperienceParty(48250)
TakePartyItem("MISC4V")
TakePartyItem("MISC4T")
SetGlobal("MaeVarExposed","GLOBAL",1)
SetGlobal("D0Spiel","LOCALS",2)~ GOTO 41
  IF ~Global("TalkedToEmbarl","GLOBAL",1)~ THEN REPLY #21272 /* ~I spoke to a thief named Embarl who overheard Mae'Var planning to assassinate you.~ */ DO ~SetGlobal("D0Spiel","LOCALS",2)~ GOTO 34
  IF ~~ THEN REPLY #21288 /* ~No, I don't have any evidence, yet.~ */ DO ~SetGlobal("D0Spiel","LOCALS",2)~ GOTO 37
END

IF WEIGHT #10 /* Triggers after states #: 49 95 100 101 108 109 even though they appear after this state */
~Global("RenalJob","GLOBAL",1)
GlobalGT("D0Spiel","LOCALS",1)
Gender(LastTalkedToBy(Myself),FEMALE)~ THEN BEGIN 38 // from:
  SAY @124
  IF ~PartyHasItem("MISC4V")~ THEN REPLY #21292 /* ~Yes, I have the evidence you need in these writings.  It seems that Mae'Var has been making overtures to the Night Knives. ~ */ DO ~AddexperienceParty(48250)
TakePartyItem("MISC4V")
TakePartyItem("MISC4T")
SetGlobal("MaeVarExposed","GLOBAL",1)~ GOTO 41
  IF ~Global("TalkedToEmbarl","GLOBAL",1)~ THEN REPLY #21272 /* ~I spoke to a thief named Embarl who overheard Mae'Var planning to assassinate you.~ */ GOTO 34
  IF ~~ THEN REPLY #21288 /* ~No, I don't have any evidence, yet.~ */ GOTO 37
END

IF WEIGHT #10 /* Triggers after states #: 49 95 100 101 108 109 even though they appear after this state */
~Global("RenalJob","GLOBAL",1)
GlobalGT("D0Spiel","LOCALS",1)
!Gender(LastTalkedToBy(Myself),FEMALE)~ THEN BEGIN 38 // from:
  SAY @125
  IF ~PartyHasItem("MISC4V")~ THEN REPLY #21292 /* ~Yes, I have the evidence you need in these writings.  It seems that Mae'Var has been making overtures to the Night Knives. ~ */ DO ~AddexperienceParty(48250)
TakePartyItem("MISC4V")
TakePartyItem("MISC4T")
SetGlobal("MaeVarExposed","GLOBAL",1)~ GOTO 41
  IF ~Global("TalkedToEmbarl","GLOBAL",1)~ THEN REPLY #21272 /* ~I spoke to a thief named Embarl who overheard Mae'Var planning to assassinate you.~ */ GOTO 34
  IF ~~ THEN REPLY #21288 /* ~No, I don't have any evidence, yet.~ */ GOTO 37
END

IF WEIGHT #11 /* Triggers after states #: 49 95 100 101 108 109 even though they appear after this state */
~Global("RenalJob","GLOBAL",1)
Global("D0Spiel","LOCALS",0)~ THEN BEGIN 39 // from:
  SAY #21290 /* ~Ah, <CHARNAME>!  I was just counting some loot from a delightful outing we had not long ago and I thought of you.  Mask help me if I didn't smile just a little!~ */
  IF ~~ THEN DO ~SetGlobal("D0Spiel","LOCALS",1)~ GOTO 40
END

IF ~~ THEN BEGIN 40 // from: 39.0
  SAY #21291 /* ~You won't make that smile disappear, will you?  You've brought news, perhaps?  You've brought some evidence of Mae'Var's foulness?  Do tell, <CHARNAME>.~ */
  IF ~PartyHasItem("MISC4V")~ THEN REPLY #21292 /* ~Yes, I have the evidence you need in these writings.  It seems that Mae'Var has been making overtures to the Night Knives. ~ */ DO ~AddexperienceParty(48250)
TakePartyItem("MISC4V")
TakePartyItem("MISC4T")
SetGlobal("MaeVarExposed","GLOBAL",1)~ GOTO 41
  IF ~Global("TalkedToEmbarl","GLOBAL",1)~ THEN REPLY #21272 /* ~I spoke to a thief named Embarl who overheard Mae'Var planning to assassinate you.~ */ GOTO 34
  IF ~~ THEN REPLY #21273 /* ~No, I don't have anything to tell you at the moment.~ */ GOTO 37
END
END

APPEND RENAL
IF ~~ THEN BEGIN D0RENALWEIDUISGAY1
SAY @126
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Yoshimo")~ THEN DO ~GiveItem("sw1h10",LastTalkedToBy(Myself))~ GOTO 77
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~GiveItem("sw1h10",LastTalkedToBy(Myself))~ EXTERN ~KELDORJ~ 149
  IF ~!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Anomen")~ THEN DO ~GiveItem("sw1h10",LastTalkedToBy(Myself))~ EXTERN ~ANOMENJ~ 218
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Yoshimo")~ THEN DO ~GiveItem("sw1h10",LastTalkedToBy(Myself))~ EXTERN ~YOSHJ~ 74
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND EDWINJ
IF ~~ THEN BEGIN ED_MV_1
SAY @127
IF ~~ THEN DO ~SetGlobal("D0EdMae","LOCALS",1)~ EXTERN MAEVAR MV_1
END

IF ~~ THEN BEGIN ED_MV_1a
SAY @127
IF ~~ THEN DO ~SetGlobal("D0EdMae","LOCALS",1)~ EXTERN MAEVAR MV_7
END

IF WEIGHT #-1 ~Global("D0EdMae","LOCALS",2)~ THEN BEGIN ED_MV_2
SAY @128
= @129
IF ~~ THEN DO ~SetGlobal("D0EdMae","LOCALS",3)~ EXIT
END
END

APPEND EDWIN

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",1)
Global("D0Betrayal","LOCALS",0)~ THEN BEGIN ED_1
  SAY @128
      =
      @130
      =
      @131
      =
      @132
      =
      @133
      =
      @134
  IF ~~ THEN REPLY #61950 /* ~I'd rather see you at the bottom of a peat bog, you lice-ridden, maniacal bastard!~ */ GOTO ED_2
  IF ~~ THEN REPLY #61951 /* ~As I recall, Edwin, you once promised me a year of service...~ */ GOTO ED_3
  IF ~~ THEN REPLY @135 GOTO ED_5
  IF ~~ THEN REPLY #61953 /* ~Certainly... join with me.~ */ GOTO ED_5
END

IF ~~ THEN BEGIN ED_2
  SAY @136
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN ED_3
  SAY @137
  IF ~~ THEN REPLY @138 DO ~Enemy()~ EXIT
  IF ~~ THEN REPLY @139 GOTO ED_2
  IF ~~ THEN REPLY #61958 /* ~No, I've no need of you right now.~ */ GOTO ED_5
  IF ~~ THEN REPLY @140 GOTO ED_5
END

IF ~~ THEN BEGIN ED_5
  SAY @141
      =
      @142
  IF ~~ THEN DO ~SetGlobal("D0Betrayal","LOCALS",1)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Betrayal","LOCALS",1)
OR(2)
  GlobalGT("D0Maevar","GLOBAL",2)
  Dead("MaeVar")~ THEN BEGIN ED_8
  SAY @145
      =
      @146
  IF ~~ THEN REPLY #61950 /* ~I'd rather see you at the bottom of a peat bog, you lice-ridden, maniacal bastard!~ */ GOTO ED_2
  IF ~~ THEN REPLY #61951 /* ~As I recall, Edwin, you once promised me a year of service...~ */ GOTO ED_10
  IF ~~ THEN REPLY @135 GOTO ED_11
  IF ~~ THEN REPLY #61953 /* ~Certainly... join with me.~ */ GOTO ED_12
END

IF WEIGHT #-1 ~Global("D0Betrayal","LOCALS",1)
Global("D0Maevar","GLOBAL",1)~ THEN BEGIN ED_6
  SAY @143
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0Betrayal","LOCALS",1)
Global("D0Maevar","GLOBAL",2)~ THEN BEGIN ED_7
  SAY @144
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ED_10
  SAY @137
  IF ~~ THEN REPLY @138 DO ~Enemy()~ EXIT
  IF ~~ THEN REPLY @139 GOTO ED_2
  IF ~GlobalLT("D0Maevar","GLOBAL",3)~ THEN REPLY #61958 /* ~No, I've no need of you right now.~ */ GOTO ED_5
  IF ~GlobalGT("D0Maevar","GLOBAL",2)~ THEN REPLY #61958 /* ~No, I've no need of you right now.~ */ GOTO ED_11
  IF ~GlobalLT("D0Maevar","GLOBAL",3)~ THEN REPLY @140 GOTO ED_5
  IF ~GlobalGT("D0Maevar","GLOBAL",2)~ THEN REPLY @140 GOTO ED_12
END

IF ~~ THEN BEGIN ED_11
  SAY @147
  IF ~~ THEN DO ~SetGlobal("D0Betrayal","LOCALS",3)~ EXIT
END

IF ~~ THEN BEGIN ED_12
  SAY #6480 /* ~I must commend you on your good sense. You've made a significant move into the realm of good fortune.~ */
  IF ~Global("toldEdwinImoen","LOCALS",0)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY #42148 /* ~I should tell you first, Edwin, that my ultimate goal is to rescue Imoen... which may be quite a dangerous task.~ */ DO ~SetGlobal("D0EdwinRescueImoen","GLOBAL",1) SetGlobal("D0Betrayal","LOCALS",2)~ GOTO 50
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY #58665 /* ~Just so you know, I intend to track down a powerful mage by the name of Irenicus... a dangerous task if you're not prepared for one.~ */ DO ~SetGlobal("D0Betrayal","LOCALS",2)~ GOTO 60
  IF ~~ THEN REPLY #42149 /* ~Alright, then, let's go.~ */ DO ~SetGlobal("D0Betrayal","LOCALS",3)
JoinParty()~ EXIT
END

IF WEIGHT #-1
~GlobalGT("D0Maevar","GLOBAL",2)
Global("D0Betrayal","LOCALS",3)~ THEN BEGIN ED_13
  SAY #61949 /* ~Ah!  If it is not my old friend... ahhh... er... bah!  It does not matter!  I know an opportunity for profit when I see <HIMHER>!~ */
  IF ~~ THEN GOTO ED_14a
END

IF ~~ THEN BEGIN ED_14a
  SAY #61947 /* ~Perhaps you have changed your mind, then, and now fully realize the potential I hold within my magical powers?  If you are pleasant, we could journey together for a time.~ */
  IF ~~ THEN REPLY #61950 /* ~I'd rather see you at the bottom of a peat bog, you lice-ridden, maniacal bastard!~ */ GOTO ED_2
  IF ~~ THEN REPLY #61951 /* ~As I recall, Edwin, you once promised me a year of service...~ */ GOTO ED_10
  IF ~~ THEN REPLY #61952 /* ~No thanks.  I've no need of you at present.~ */ GOTO 71
  IF ~~ THEN REPLY #61953 /* ~Certainly... join with me.~ */ GOTO ED_12
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",2)
Global("D0Betrayal","LOCALS",0)~ THEN BEGIN ED_13
  SAY @128
      =
      @148
      =
      @131
      =
      @132
      =
      @133
      =
      @149
      =
      @150
  IF ~~ THEN DO ~SetGlobal("D0Betrayal","LOCALS",2)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",2)
Global("D0Betrayal","LOCALS",2)~ THEN BEGIN ED_14
  SAY @151
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~GlobalGT("D0Maevar","GLOBAL",2)
Global("D0Betrayal","LOCALS",2)~ THEN BEGIN ED_15
  SAY @152
      =
      @153
  IF ~~ THEN REPLY #61950 /* ~I'd rather see you at the bottom of a peat bog, you lice-ridden, maniacal bastard!~ */ GOTO ED_2
  IF ~~ THEN REPLY #61951 /* ~As I recall, Edwin, you once promised me a year of service...~ */ GOTO ED_10
  IF ~~ THEN REPLY @135 GOTO ED_11
  IF ~~ THEN REPLY #61953 /* ~Certainly... join with me.~ */ GOTO ED_12
END

IF WEIGHT #-1 ~GlobalGT("D0Maevar","GLOBAL",2)
Global("D0Betrayal","LOCALS",0)~ THEN BEGIN ED_16
  SAY @128
      =
      @148
      =
      @131
      =
      @132
      =
      @133
      =
      @154
  IF ~~ THEN REPLY #61950 /* ~I'd rather see you at the bottom of a peat bog, you lice-ridden, maniacal bastard!~ */ GOTO ED_2
  IF ~~ THEN REPLY #61951 /* ~As I recall, Edwin, you once promised me a year of service...~ */ GOTO ED_10
  IF ~~ THEN REPLY @135 GOTO ED_11
  IF ~~ THEN REPLY #61953 /* ~Certainly... join with me.~ */ GOTO ED_12
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0NIGHTK

IF ~!NumTimesTalkedTo(0)
GlobalLT("D0Maevar","GLOBAL",4)~ THEN BEGIN LL_0
  SAY @155
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)
GlobalLT("D0Maevar","GLOBAL",4)~ THEN BEGIN LL_1
  SAY @156
  IF ~~ THEN REPLY @157 GOTO LL_2
  IF ~Global("AskReward","LOCALS",0)~ THEN DO ~SetGlobal("AskReward","LOCALS",1)~ REPLY @158 GOTO LL_3
  IF ~~ THEN REPLY @159 GOTO LL_4
  IF ~~ THEN REPLY @160 GOTO LL_5
  IF ~~ THEN REPLY @161 GOTO LL_5
END

IF ~~ THEN BEGIN LL_2
  SAY @162
  IF ~Global("AskReward","LOCALS",0)~ THEN DO ~SetGlobal("AskReward","LOCALS",1)~ REPLY @158 GOTO LL_3
  IF ~~ THEN REPLY @163 GOTO LL_4
  IF ~~ THEN REPLY @160 GOTO LL_5
  IF ~~ THEN REPLY @161 GOTO LL_5
END

IF ~~ THEN BEGIN LL_3
  SAY @164
  IF ~~ THEN REPLY @165 GOTO LL_5
  IF ~~ THEN REPLY @166 GOTO LL_4
  IF ~~ THEN REPLY @167 GOTO LL_5
END

IF ~~ THEN BEGIN LL_4
  SAY @168
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LL_5
  SAY @169
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER THIEF1 0 ~!GlobalGT("D0Maevar","GLOBAL",2)~
ADD_STATE_TRIGGER THIEF1 8 ~!GlobalGT("D0Maevar","GLOBAL",2)~

APPEND THIEF1

IF ~NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN TH1_1
  SAY #21354 /* ~Aye?  Can I help you?~ */
  IF ~~ THEN REPLY @170 GOTO TH1_2
  IF ~~ THEN REPLY #21356 /* ~Who are you?~ */ GOTO TH1_3
  IF ~~ THEN REPLY #21357 /* ~Never mind, I'll be going.~ */ GOTO TH1_4
END

IF ~~ THEN BEGIN TH1_2
  SAY @171
  IF ~~ THEN REPLY #21360 /* ~Who are you?~ */ GOTO TH1_3
  IF ~~ THEN REPLY #21361 /* ~I'll be leaving, now.~ */ GOTO TH1_4
END

IF ~~ THEN BEGIN TH1_3
  SAY #21362 /* ~Heh.  If you have to ask, you sure haven't been here long.  I be Sidge, one of the good fellows here in the Shadow Thieves.~ */
  IF ~~ THEN REPLY @170 GOTO TH1_2
  IF ~~ THEN REPLY #21365 /* ~I see.  Well, I'll be moving on, Sidge.~ */ GOTO TH1_4
END

IF ~~ THEN BEGIN TH1_4
  SAY #21366 /* ~As you wish.  Heh, watch yer belt pouch here, while yer at it.  Just a word of friendly advice, is all.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TH1_5
  SAY @172
  IF ~~ THEN REPLY #21376 /* ~I see.  Who are you, again?~ */ GOTO TH1_3
  IF ~~ THEN REPLY #21377 /* ~Thanks, then.  I'll be going.~ */ GOTO TH1_4
END

IF ~GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN TH1_6
  SAY #21380 /* ~Good day, once again.  Somethin' you needed?~ */
  IF ~~ THEN REPLY @170 GOTO TH1_2
  IF ~~ THEN REPLY #21382 /* ~Who are you?~ */ GOTO TH1_3
  IF ~~ THEN REPLY @173 GOTO TH1_5
  IF ~~ THEN REPLY #21384 /* ~No, I don't think so.~ */ GOTO TH1_4
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER THIEF2 7 ~!GlobalGT("D0Maevar","GLOBAL",2)~

APPEND THIEF2
IF WEIGHT #99
~RandomNum(8,7)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN TH2_1
  SAY @174
  IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER THIEF3 4 ~!GlobalGT("D0Maevar","GLOBAL",2)~

APPEND THIEF3
IF WEIGHT #99
~RandomNum(6,5)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN TH3_1
  SAY @175
  IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER STGUARD3 0 ~!GlobalGT("D0Maevar","GLOBAL",2)~
ADD_STATE_TRIGGER STGUARD3 1 ~!GlobalGT("D0Maevar","GLOBAL",2)~

APPEND STGUARD3
IF WEIGHT #99
~RandomNum(3,1)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN STG3_1
  SAY @176
  IF ~~ THEN EXIT
END

IF WEIGHT #99
~RandomNum(3,2)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN STG3_2
  SAY @177
  IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER STGUARD2 3 ~!GlobalGT("D0Maevar","GLOBAL",2)~

APPEND STGUARD2
IF ~RandomNum(4,4)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN STG2_1
  SAY @178
  IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER STGUARD1 2 ~!GlobalGT("D0Maevar","GLOBAL",2)~

APPEND STGUARD1
IF ~Global("ShadowWork","GLOBAL",1)
Global("HQEntry","GLOBAL",0)
Global("GuardsSpeaksOnce","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN STG1_1
  SAY @179
  IF ~~ THEN DO ~SetGlobal("HQEntry","GLOBAL",1)
Unlock("DOOR0305")
Unlock("DOOR0306")~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE THIEF4
IF ~RandomNum(6,3)
!Global("TalkedToRenal","GLOBAL",1)
!GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN 2 // from:
  SAY #21669 /* ~Get and talk to Renal...he's the only one around here who wants anything to do with you.~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,2)
!GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN 1 // from:
  SAY #21668 /* ~I don't care if Renal wants business with you.  You smell rotten to me.~ */
  IF ~~ THEN EXIT
END
END

APPEND THIEF4
IF ~RandomNum(6,3)
!Global("TalkedToRenal","GLOBAL",1)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN 2 // from:
  SAY @180
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,2)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN 1 // from:
  SAY @181
  IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND THIEF7

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
!Gender(Player1,MALE)
!Dead("Maevar")
!Dead("Aran")
OR(2)
Global("D0AboutMaevar","LOCALS",0)
RandomNumGT(6,4)~ THEN BEGIN THF7_1
  SAY @182
  IF ~~ THEN DO ~SetGlobal("D0AboutMaevar","LOCALS",1)~ EXIT
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
Gender(Player1,MALE)
!Dead("Maevar")
!Dead("Aran")
OR(2)
Global("D0AboutMaevar","LOCALS",0)
RandomNumGT(6,4)~ THEN BEGIN THF7_1
  SAY @183
  IF ~~ THEN DO ~SetGlobal("D0AboutMaevar","LOCALS",1)~ EXIT
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
!Dead("Maevar")
Dead("Aran")
OR(2)
GlobalLT("D0AboutMaevar","LOCALS",2)
RandomNumGT(6,4)~ THEN BEGIN THF7_1
  SAY @184
  IF ~~ THEN DO ~SetGlobal("D0AboutMaevar","LOCALS",2)~ EXIT
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
Dead("Maevar")
OR(2)
GlobalLT("D0AboutMaevar","LOCALS",3)
RandomNumGT(6,4)~ THEN BEGIN THF7_1
  SAY @185
  IF ~~ THEN DO ~SetGlobal("D0AboutMaevar","LOCALS",3)~ EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND THIEF5

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
RandomNumGT(6,3)
!Dead("Aran")
!Dead("Maevar")~ THEN BEGIN THF5_1
  SAY @186
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
RandomNumGT(6,3)
Dead("Aran")
!Dead("Maevar")~ THEN BEGIN THF5_1
  SAY @187
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
GlobalGT("D0Maevar","GLOBAL",2)
RandomNumGT(6,3)
Dead("Maevar")~ THEN BEGIN THF5_1
  SAY @188
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE THIEF6
IF WEIGHT #5 /* Triggers after states #: 10 11 even though they appear after this state */
~RandomNum(3,2)
!GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN 8 // from:
  SAY #21734 /* ~I hear Renal's been breathin' down Mae'Var's back.  Don't know what the big deal is.  I could take that Renal any day.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #6 /* Triggers after states #: 10 11 even though they appear after this state */
~RandomNum(3,3)
!Dead("Edwin")
!InParty("Edwin")~ THEN BEGIN 9 // from:
  SAY #21735 /* ~That Edwin's so full of himself.  I should show him who's boss, ya know?~ */
  IF ~~ THEN EXIT
END
END

APPEND THIEF6
IF WEIGHT #5 /* Triggers after states #: 10 11 even though they appear after this state */
~RandomNum(3,2)
GlobalGT("D0Maevar","GLOBAL",2)~ THEN BEGIN D1_8 // from:
  SAY @189
  IF ~~ THEN EXIT
END

IF WEIGHT #6 /* Triggers after states #: 10 11 even though they appear after this state */
~RandomNum(3,3)
Dead("Edwin")
!InParty("Edwin")~ THEN BEGIN D1_9 // from:
  SAY @190
  IF ~~ THEN EXIT
END

IF WEIGHT #6 /* Triggers after states #: 10 11 even though they appear after this state */
~RandomNum(3,3)
InParty("Edwin")~ THEN BEGIN D1_9 // from:
  SAY @191
  IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0RENREV

IF ~NumTimesTalkedTo(0)~ THEN BEGIN RR_1
SAY @192
IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO RR_2
IF ~!Alignment(Player1,MASK_GOOD)~ THEN GOTO RR_3
END

IF ~~ THEN BEGIN RR_2
SAY @193
= @194
= @195
= @196
= @197
= @198
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN RR_3
SAY @199
= @200
= @195
= @196
= @197
= @198
IF ~~ THEN DO ~Enemy()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0RENAL

IF ~Global("D0RenalPrisoner","GLOBAL",1)~ THEN BEGIN REN_1
  SAY @201
      =
      @202
  IF ~~ THEN REPLY @203 GOTO REN_2
  IF ~~ THEN REPLY @204 GOTO REN_6
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("AranJob","GLOBAL",0)~ THEN REPLY @205 GOTO REN_9
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
!GlobalGT("BodhiJob","GLOBAL",0)~ THEN REPLY @206 GOTO REN_9
  IF ~Global("D0Tell","LOCALS",0)~ THEN REPLY @207 DO ~SetGlobal("D0Tell","LOCALS",1)~ GOTO REN_3
  IF ~OR(3)
GlobalGT("BodhiJob","GLOBAL",3)
GlobalGT("D0AranHostile","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",5)
!Dead("Aran")~ THEN REPLY @208 GOTO REN_4
  IF ~Dead("Aran")~ THEN REPLY @209 GOTO REN_5
END

IF ~~ THEN BEGIN REN_2
  SAY @210
  IF ~~ THEN DO ~SetGlobal("D0RenalPrisoner","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN REN_3
  SAY @211
  IF ~~ THEN REPLY @212 GOTO REN_2
  IF ~OR(3)
GlobalGT("BodhiJob","GLOBAL",3)
GlobalGT("D0AranHostile","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",5)
!Dead("Aran")~ THEN REPLY @213 GOTO REN_4
  IF ~Dead("Aran")~ THEN REPLY @214 GOTO REN_5
END

IF ~~ THEN BEGIN REN_4
  SAY @215
  IF ~~ THEN DO ~SetGlobal("D0Kill","LOCALS",1)
SetGlobal("D0RenalPrisoner","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN REN_5
  SAY @216
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN REN_6
  SAY @217
  IF ~~ THEN REPLY @212 GOTO REN_2
  IF ~OR(3)
GlobalGT("BodhiJob","GLOBAL",3)
GlobalGT("D0AranHostile","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",5)
!Dead("Aran")~ THEN REPLY @213 GOTO REN_4
  IF ~Dead("Aran")~ THEN REPLY @214 GOTO REN_5
END

IF ~Global("D0RenalPrisoner","GLOBAL",2)
Global("D0Kill","LOCALS",1)~ THEN BEGIN REN_7
  SAY @218
  IF ~Dead("Aran")~ THEN REPLY @219 GOTO REN_5
  IF ~!Dead("Aran")~ THEN REPLY @220 GOTO REN_4
END

IF ~Global("D0RenalPrisoner","GLOBAL",2)
Global("D0Kill","LOCALS",0)~ THEN BEGIN REN_8
  SAY @221
  IF ~~ THEN REPLY @203 GOTO REN_2
  IF ~~ THEN REPLY @222 GOTO REN_6
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("AranJob","GLOBAL",0)~ THEN REPLY @205 GOTO REN_9
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
!GlobalGT("BodhiJob","GLOBAL",0)~ THEN REPLY @206 GOTO REN_9
  IF ~Global("D0Tell","LOCALS",0)~ THEN REPLY @207 DO ~SetGlobal("D0Tell","LOCALS",1)~ GOTO REN_3
  IF ~OR(3)
GlobalGT("BodhiJob","GLOBAL",3)
GlobalGT("D0AranHostile","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",5)
!Dead("Aran")~ THEN REPLY @208 GOTO REN_4
  IF ~Dead("Aran")~ THEN REPLY @209 GOTO REN_5
END

IF ~~ THEN BEGIN REN_9
  SAY @223
  IF ~~ THEN DO ~SetGlobal("D0RenalPrisoner","GLOBAL",2)~ EXIT
END
