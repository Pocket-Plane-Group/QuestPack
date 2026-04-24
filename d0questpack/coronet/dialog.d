/*
REPLACE BRUS2

IF WEIGHT #1 ~True()~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN GOTO BR_1
END

END

APPEND BRUS2

IF ~~ THEN BEGIN BR_1
  SAY @1
  IF ~Class(Player1,FIGHTER_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 4
  IF ~Class(Player1,BARD_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 5
  IF ~Class(Player1,CLERIC_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 7
  IF ~Class(Player1,THIEF_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 8
  IF ~Class(Player1,RANGER_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 9
  IF ~Class(Player1,PALADIN_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 10
  IF ~Class(Player1,MAGE_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 11
  IF ~Class(Player1,DRUID_ALL)~ THEN DO ~SetGlobal("D0BrusLender","GLOBAL",1)~ GOTO 12
END

END
*/

ADD_TRANS_ACTION BRUS2 BEGIN 0 END BEGIN 1 2 3 4 5 6 7 8 END ~SetGlobal("D0BrusLender","GLOBAL",1)~

INTERJECT_COPY_TRANS BRUS2 2 D0BRUS2
== BRUS2 @1
END

INTERJECT_COPY_TRANS BRUS2 3 D0BRUS2
== BRUS2 @1
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0BOY

IF ~GlobalLT("D0Poor","GLOBAL",4)~ THEN BEGIN BOY_1
  SAY @2
  IF ~~ THEN EXTERN D0LENDER BOY_2
END

IF ~~ THEN BEGIN BOY_3
  SAY @3
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~GlobalGT("D0Poor","GLOBAL",3)
GlobalLT("D0Poor","GLOBAL",6)~ THEN BEGIN BOY_4
  SAY @4
  IF ~~ THEN DO ~AddJournalEntry(@426,QUEST)
SetGlobal("D0Poor","GLOBAL",6)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN BOY_5
  SAY @5
  IF ~~ THEN EXTERN D0THUG TH_1
END

IF ~~ THEN BEGIN BOY_6
  SAY @6
  IF ~~ THEN EXTERN D0POOR PO_19
END

IF ~~ THEN BEGIN BOY_7
  SAY @7
  IF ~~ THEN EXTERN D0POOR PO_20
END

IF ~Global("D0Poor","GLOBAL",9)~ THEN BEGIN BOY_8
  SAY @8
  IF ~~ THEN EXTERN D0POOR PO_22
END

IF ~~ THEN BEGIN BOY_9
  SAY @9
  IF ~~ THEN EXTERN D0POOR PO_23
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0LENDER

IF ~~ THEN BEGIN BOY_2
  SAY @10
  IF ~~ THEN EXTERN D0BOY BOY_3
END

IF ~!AreaCheck("ar1602")
Global("D0Lender","GLOBAL",0)~ THEN BEGIN LE_1
  SAY @11
  IF ~~ THEN REPLY @12 GOTO LE_2
  IF ~CheckStatLT(LastTalkedToBy(Myself),13,INT)~ THEN REPLY @13 GOTO LE_2
  IF ~CheckStatLT(LastTalkedToBy(Myself),13,INT)~ THEN REPLY @14 GOTO LE_2a
  IF ~CheckStatGT(LastTalkedToBy(Myself),12,INT)~ THEN REPLY @15 GOTO LE_2a
  IF ~OR(2)
GlobalGT("D0Poor","GLOBAL",0)
Global("D0BrusLender","GLOBAL",1)
OR(2)
GlobalGT("D0Poor","GLOBAL",0)
Global("D0LenderTale","GLOBAL",1)
OR(2)
GlobalGT("D0Poor","GLOBAL",0)
CheckStatGT(LastTalkedToBy(Myself),14,INT)~ THEN REPLY @16 GOTO LE_5
  IF ~~ THEN REPLY @17 GOTO LE_3
  IF ~CheckStatLT(LastTalkedToBy(Myself),15,INT)~ THEN REPLY @18 GOTO LE_4
  IF ~CheckStatGT(LastTalkedToBy(Myself),14,INT)~ THEN REPLY @19 GOTO LE_4a
END

IF ~~ THEN BEGIN LE_2
  SAY @20
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_2a
  SAY @21
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_3
  SAY @22
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_3a
  SAY @22
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN LE_4
  SAY @23
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_4a
  SAY @24
  IF ~~ THEN DO ~SetGlobal("D0Blackmail","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN LE_5
  SAY @25
  IF ~GlobalGT("D0Poor","GLOBAL",0)~ THEN REPLY @26 GOTO LE_5a
  IF ~CheckStatGT(LastTalkedToBy(Myself),15,INT)
CheckStatGT(LastTalkedToBy(Myself),15,CHR)~ THEN REPLY @27 GOTO LE_5d
  IF ~~ THEN REPLY @28 GOTO LE_5b
  IF ~CheckStatLT(LastTalkedToBy(Myself),14,CHR)~ THEN REPLY @29 GOTO LE_3
  IF ~CheckStatGT(LastTalkedToBy(Myself),13,CHR)~ THEN REPLY @30 GOTO LE_3
  IF ~~ THEN REPLY @31 GOTO LE_3
END

IF ~~ THEN BEGIN LE_5a
  SAY @32
  IF ~~ THEN REPLY @33 GOTO LE_6
  IF ~CheckStatLT(LastTalkedToBy(Myself),10,WIS)~ THEN REPLY @34 GOTO LE_6
  IF ~CheckStatGT(LastTalkedToBy(Myself),9,WIS)~ THEN REPLY @35 GOTO LE_6
END

IF ~~ THEN BEGIN LE_5b
  SAY @36
  IF ~!Global("D0Blackmail","LOCALS",1)~ THEN REPLY @37 GOTO LE_5c
  IF ~Global("D0Blackmail","LOCALS",1)~ THEN REPLY @38 GOTO LE_5c
  IF ~GlobalGT("D0Poor","GLOBAL",0)~ THEN REPLY @39 GOTO LE_5a
  IF ~~ THEN REPLY @40 GOTO LE_3
END

IF ~~ THEN BEGIN LE_5c
  SAY @41
  IF ~~ THEN REPLY @33 GOTO LE_6
  IF ~CheckStatLT(LastTalkedToBy(Myself),14,WIS)~ THEN REPLY @34 GOTO LE_6
  IF ~CheckStatGT(LastTalkedToBy(Myself),15,WIS)~ THEN REPLY @35 GOTO LE_6
END

IF ~~ THEN BEGIN LE_5d
  SAY @42
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_6
  SAY @43
  IF ~~ THEN REPLY @44 GOTO LE_8
  IF ~~ THEN REPLY @45 GOTO LE_9
  IF ~~ THEN REPLY @46 GOTO LE_7
  IF ~~ THEN REPLY @47 GOTO LE_10
  IF ~CheckStatGT(LastTalkedToBy(Myself),15,WIS)~ THEN REPLY @48 GOTO LE_6a
  IF ~CheckStatLT(LastTalkedToBy(Myself),16,WIS)~ THEN REPLY @49 GOTO LE_6a
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_6%)~ THEN REPLY @50 GOTO LE_Shadow
  IF ~GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN REPLY @50 GOTO LE_Shadow2
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_6a
  SAY @53
  IF ~~ THEN GOTO LE_6a_LetKelseyTalkHere
END

IF ~~ THEN BEGIN LE_6a_LetKelseyTalkHere
SAY @54
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_6%)~ THEN REPLY @55 GOTO LE_Shadow
  IF ~GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN REPLY @55 GOTO LE_Shadow2
  IF ~~ THEN REPLY @56 GOTO LE_7
  IF ~~ THEN REPLY @57 GOTO LE_10
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_7
  SAY @58
  IF ~~ THEN REPLY @44 GOTO LE_8
  IF ~~ THEN REPLY @45 GOTO LE_9
  IF ~~ THEN REPLY @47 GOTO LE_10
  IF ~~ THEN REPLY @49 GOTO LE_6a
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_6%)~ THEN REPLY @50 GOTO LE_Shadow
  IF ~GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN REPLY @50 GOTO LE_Shadow2
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_Shadow
SAY @59
  IF ~~ THEN REPLY @47 GOTO LE_10
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_Shadow2
SAY @60
  IF ~~ THEN REPLY @47 GOTO LE_10
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_8
  SAY @61
  IF ~IsValidForPartyDialog("Korgan")
Global("D0KorganInterject","LOCALS",0)~ THEN DO ~SetGlobal("D0KorganInterject","LOCALS",1)~ EXTERN KORGANJ LE_8a
  IF ~OR(2)
!IsValidForPartyDialog("Korgan")
!Global("D0KorganInterject","LOCALS",0)~ THEN REPLY @47 GOTO LE_10
  IF ~OR(2)
!IsValidForPartyDialog("Korgan")
!Global("D0KorganInterject","LOCALS",0)
Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~OR(2)
!IsValidForPartyDialog("Korgan")
!Global("D0KorganInterject","LOCALS",0)~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_8a_2
SAY @62
  IF ~~ THEN REPLY @47 GOTO LE_10
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_9
  SAY @63
  IF ~~ THEN REPLY @64 GOTO LE_8
  IF ~~ THEN REPLY @47 GOTO LE_10
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @52 GOTO LE_3a
END

IF ~~ THEN BEGIN LE_10
  SAY @65
  IF ~~ THEN REPLY @66 GOTO LE_12
  IF ~~ THEN REPLY @67 GOTO LE_13
  IF ~~ THEN REPLY @68 GOTO LE_14
  IF ~~ THEN REPLY @69 GOTO LE_15
  IF ~~ THEN REPLY @70 GOTO LE_16
  IF ~~ THEN REPLY @71 GOTO LE_16
  IF ~~ THEN REPLY @72 GOTO LE_17
  IF ~~ THEN REPLY @73 GOTO LE_18
  IF ~~ THEN REPLY @74 GOTO LE_11
END

IF ~~ THEN BEGIN LE_11
  SAY @75
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN LE_12
  SAY @76
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN LE_13
  SAY @77
     =
      @78
     =
      @79
  IF ~~ THEN REPLY @80 GOTO LE_22
  IF ~~ THEN REPLY @81 GOTO LE_11
END

IF ~~ THEN BEGIN LE_14
  SAY @82
     =
      @83
     =
      @79
  IF ~~ THEN REPLY @80 GOTO LE_23
  IF ~~ THEN REPLY @81 GOTO LE_11
END

IF ~~ THEN BEGIN LE_15
  SAY @84
     =
      @85
     =
      @79
  IF ~~ THEN REPLY @80 GOTO LE_24
  IF ~~ THEN REPLY @81 GOTO LE_11
END

IF ~~ THEN BEGIN LE_16
  SAY @86
  IF ~IsValidForPartyDialog("Minsc")
Global("D0MinscInterject","LOCALS",0)~ THEN DO ~SetGlobal("D0MinscInterject","LOCALS",1)~ EXTERN MINSCJ LE_16_Minsc
  IF ~OR(2)
!IsValidForPartyDialog("Minsc")
!Global("D0MinscInterject","LOCALS",0)~ THEN GOTO LE_16_gay
END

IF ~~ THEN BEGIN LE_16_gay
SAY @87
     =
      @88
  IF ~~ THEN REPLY @66 GOTO LE_12
  IF ~~ THEN REPLY @67 GOTO LE_13
  IF ~~ THEN REPLY @68 GOTO LE_14
  IF ~~ THEN REPLY @69 GOTO LE_15
  IF ~~ THEN REPLY @74 GOTO LE_11
END

IF ~~ THEN BEGIN LE_17
  SAY @89
  IF ~IsValidForPartyDialog("Minsc")
Global("D0MinscInterject","LOCALS",0)~ THEN DO ~SetGlobal("D0MinscInterject","LOCALS",1)~ EXTERN MINSCJ LE_17_Minsc
  IF ~OR(2)
!IsValidForPartyDialog("Minsc")
!Global("D0MinscInterject","LOCALS",0)~ THEN GOTO LE_17_gay
END

IF ~~ THEN BEGIN LE_17_gay
SAY  @87
     =
      @88
  IF ~~ THEN REPLY @66 GOTO LE_12
  IF ~~ THEN REPLY @67 GOTO LE_13
  IF ~~ THEN REPLY @68 GOTO LE_14
  IF ~~ THEN REPLY @69 GOTO LE_15
  IF ~~ THEN REPLY @74 GOTO LE_11
END

IF ~~ THEN BEGIN LE_18
  SAY @90
  IF ~~ THEN REPLY @66 GOTO LE_12
  IF ~~ THEN REPLY @67 GOTO LE_13
  IF ~~ THEN REPLY @68 GOTO LE_14
  IF ~~ THEN REPLY @69 GOTO LE_15
  IF ~~ THEN REPLY @70 GOTO LE_16
  IF ~~ THEN REPLY @71 GOTO LE_16
  IF ~~ THEN REPLY @72 GOTO LE_17
  IF ~~ THEN REPLY @74 GOTO LE_11
END


IF ~!AreaCheck("ar1602")
Global("D0Lender","GLOBAL",1)~ THEN BEGIN LE_20
  SAY @91
  IF ~~ THEN REPLY @92 GOTO LE_21
  IF ~CheckStatLT(LastTalkedToBy(Myself),10,WIS)~ THEN REPLY @34 GOTO LE_6
  IF ~CheckStatGT(LastTalkedToBy(Myself),9,WIS)~ THEN REPLY @35 GOTO LE_6
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @93 GOTO LE_11
END

IF ~~ THEN BEGIN LE_21
  SAY @94
  COPY_TRANS D0LENDER LE_10
END

IF ~~ THEN BEGIN LE_22
  SAY @95
  IF ~~ THEN DO ~AddJournalEntry(@427,QUEST)
GiveGoldForce(100)
SetGlobal("D0Beat","GLOBAL",0)
SetGlobal("D0Attack","GLOBAL",0)
SetGlobal("D0Lender","GLOBAL",2)
SetGlobal("D0OwedCelile","GLOBAL",125)
SetGlobal("D0Days","GLOBAL",2)
SetGlobalTimer("D0Day2","GLOBAL",ONE_DAY)
SetGlobalTimer("D0Day1","GLOBAL",TWO_DAYS)~ EXIT
END

IF ~~ THEN BEGIN LE_23
  SAY @96
  IF ~~ THEN DO ~AddJournalEntry(@428,QUEST)
GiveGoldForce(1000)
SetGlobal("D0Beat","GLOBAL",0)
SetGlobal("D0Attack","GLOBAL",0)
SetGlobal("D0Lender","GLOBAL",2)
SetGlobal("D0OwedCelile","GLOBAL",1250)
SetGlobal("D0Days","GLOBAL",4)
SetGlobalTimer("D0Day4","GLOBAL",ONE_DAY)
SetGlobalTimer("D0Day3","GLOBAL",TWO_DAYS)
SetGlobalTimer("D0Day2","GLOBAL",THREE_DAYS)
SetGlobalTimer("D0Day1","GLOBAL",FOUR_DAYS)~ EXIT
END

IF ~~ THEN BEGIN LE_24
  SAY @97
  IF ~~ THEN DO ~AddJournalEntry(@429,QUEST)
GiveGoldForce(5000)
SetGlobal("D0Beat","GLOBAL",0)
SetGlobal("D0Attack","GLOBAL",0)
SetGlobal("D0Lender","GLOBAL",2)
SetGlobal("D0OwedCelile","GLOBAL",6250)
SetGlobal("D0Days","GLOBAL",6)
SetGlobalTimer("D0Day6","GLOBAL",ONE_DAY)
SetGlobalTimer("D0Day5","GLOBAL",TWO_DAYS)
SetGlobalTimer("D0Day4","GLOBAL",THREE_DAYS)
SetGlobalTimer("D0Day3","GLOBAL",FOUR_DAYS)
SetGlobalTimer("D0Day2","GLOBAL",FIVE_DAYS)
SetGlobalTimer("D0Day1","GLOBAL",SIX_DAYS)~ EXIT
END

IF ~!AreaCheck("ar1602")
Global("D0Lender","GLOBAL",2)
GlobalTimerNotExpired("D0Day1","GLOBAL")~ THEN BEGIN LE_25
  SAY @98
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71

  IF ~Global("D0OwedCelile","GLOBAL",125)~ THEN REPLY @99 GOTO LE_26
  IF ~Global("D0OwedCelile","GLOBAL",1250)~ THEN REPLY @99 GOTO LE_27
  IF ~Global("D0OwedCelile","GLOBAL",6250)~ THEN REPLY @99 GOTO LE_28
  IF ~Global("D0OwedCelile","GLOBAL",12500)~ THEN REPLY @99 GOTO LE_29
  IF ~Global("D0OwedCelile","GLOBAL",31250)~ THEN REPLY @99 GOTO LE_30
  IF ~Global("D0OwedCelile","GLOBAL",62500)~ THEN REPLY @99 GOTO LE_31

  IF ~Global("D0Days","GLOBAL",10)~ THEN REPLY @100 GOTO LE_34
  IF ~Global("D0Days","GLOBAL",8)~ THEN REPLY @100 GOTO LE_36
  IF ~Global("D0Days","GLOBAL",6)~ THEN REPLY @100 GOTO LE_38
  IF ~Global("D0Days","GLOBAL",4)~ THEN REPLY @100 GOTO LE_40
  IF ~Global("D0Days","GLOBAL",2)~ THEN REPLY @100 GOTO LE_42

  IF ~Global("D0OwedCelile","GLOBAL",125)
PartyGoldGT(124)~ THEN REPLY @101 DO ~TakePartyGold(125)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",TWO_DAYS)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_32
  IF ~Global("D0OwedCelile","GLOBAL",125)
PartyGoldLT(125)~ THEN REPLY @102 GOTO LE_33

  IF ~Global("D0OwedCelile","GLOBAL",1250)
PartyGoldGT(1249)~ THEN REPLY @101 DO ~TakePartyGold(1250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",TWO_DAYS)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_32
  IF ~Global("D0OwedCelile","GLOBAL",1250)
PartyGoldLT(1250)~ THEN REPLY @102 GOTO LE_33

  IF ~Global("D0OwedCelile","GLOBAL",6250)
PartyGoldGT(6249)~ THEN REPLY @101 DO ~TakePartyGold(6250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",TWO_DAYS)~ GOTO LE_32
  IF ~Global("D0OwedCelile","GLOBAL",6250)
PartyGoldLT(6250)~ THEN REPLY @102 GOTO LE_33

  IF ~Global("D0OwedCelile","GLOBAL",12500)
PartyGoldGT(12499)~ THEN REPLY @101 DO ~TakePartyGold(12500)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",TWO_DAYS)~ GOTO LE_32
  IF ~Global("D0OwedCelile","GLOBAL",12500)
PartyGoldLT(12500)~ THEN REPLY @102 GOTO LE_33

  IF ~Global("D0OwedCelile","GLOBAL",31250)
PartyGoldGT(31249)~ THEN REPLY @101 DO ~TakePartyGold(31250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",ONE_DAY)~ GOTO LE_32
  IF ~Global("D0OwedCelile","GLOBAL",31250)
PartyGoldLT(31250)~ THEN REPLY @102 GOTO LE_33

  IF ~Global("D0OwedCelile","GLOBAL",62500)
PartyGoldGT(62499)~ THEN REPLY @101 DO ~TakePartyGold(62500)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",ONE_DAY)~ GOTO LE_32
  IF ~Global("D0OwedCelile","GLOBAL",62500)
PartyGoldLT(62500)~ THEN REPLY @102 GOTO LE_33

  IF ~~ THEN REPLY @103 GOTO LE_45

  IF ~~ THEN REPLY @104 GOTO LE_44
END

IF ~~ THEN BEGIN LE_26
  SAY @105
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_27
  SAY @106
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_28
  SAY @107
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_29
  SAY @108
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_30
  SAY @109
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN LE_31
  SAY @110
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_32
  SAY @111
  IF ~~ THEN REPLY @112 DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)~ GOTO LE_47
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)~ GOTO LE_71
  IF ~~ THEN REPLY @113 DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)~ GOTO LE_46
END

IF ~~ THEN BEGIN LE_33
  SAY @114
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_34
  SAY @115
  IF ~True()~ THEN GOTO LE_59
  IF ~GlobalTimerNotExpired("D0Day10","GLOBAL")~ THEN GOTO LE_43a
  IF ~GlobalTimerExpired("D0Day10","GLOBAL")~ THEN GOTO LE_43b
  IF ~GlobalTimerExpired("D0Day9","GLOBAL")~ THEN GOTO LE_43c
  IF ~GlobalTimerExpired("D0Day8","GLOBAL")~ THEN GOTO LE_43d
  IF ~GlobalTimerExpired("D0Day7","GLOBAL")~ THEN GOTO LE_43e
  IF ~GlobalTimerExpired("D0Day6","GLOBAL")~ THEN GOTO LE_43f
  IF ~GlobalTimerExpired("D0Day5","GLOBAL")~ THEN GOTO LE_43g
  IF ~GlobalTimerExpired("D0Day4","GLOBAL")~ THEN GOTO LE_43h
  IF ~GlobalTimerExpired("D0Day3","GLOBAL")~ THEN GOTO LE_43i
  IF ~GlobalTimerExpired("D0Day2","GLOBAL")~ THEN GOTO LE_43j
END

IF ~~ THEN BEGIN LE_36
  SAY @115
  IF ~True()~ THEN GOTO LE_59
  IF ~GlobalTimerNotExpired("D0Day8","GLOBAL")~ THEN GOTO LE_43c
  IF ~GlobalTimerExpired("D0Day8","GLOBAL")~ THEN GOTO LE_43d
  IF ~GlobalTimerExpired("D0Day7","GLOBAL")~ THEN GOTO LE_43e
  IF ~GlobalTimerExpired("D0Day6","GLOBAL")~ THEN GOTO LE_43f
  IF ~GlobalTimerExpired("D0Day5","GLOBAL")~ THEN GOTO LE_43g
  IF ~GlobalTimerExpired("D0Day4","GLOBAL")~ THEN GOTO LE_43h
  IF ~GlobalTimerExpired("D0Day3","GLOBAL")~ THEN GOTO LE_43i
  IF ~GlobalTimerExpired("D0Day2","GLOBAL")~ THEN GOTO LE_43j
END

IF ~~ THEN BEGIN LE_38
  SAY @115
  IF ~True()~ THEN GOTO LE_59
  IF ~GlobalTimerNotExpired("D0Day6","GLOBAL")~ THEN GOTO LE_43e
  IF ~GlobalTimerExpired("D0Day6","GLOBAL")~ THEN GOTO LE_43f
  IF ~GlobalTimerExpired("D0Day5","GLOBAL")~ THEN GOTO LE_43g
  IF ~GlobalTimerExpired("D0Day4","GLOBAL")~ THEN GOTO LE_43h
  IF ~GlobalTimerExpired("D0Day3","GLOBAL")~ THEN GOTO LE_43i
  IF ~GlobalTimerExpired("D0Day2","GLOBAL")~ THEN GOTO LE_43j
END

IF ~~ THEN BEGIN LE_40
  SAY @115
  IF ~True()~ THEN GOTO LE_59
  IF ~GlobalTimerNotExpired("D0Day4","GLOBAL")~ THEN GOTO LE_43g
  IF ~GlobalTimerExpired("D0Day4","GLOBAL")~ THEN GOTO LE_43h
  IF ~GlobalTimerExpired("D0Day3","GLOBAL")~ THEN GOTO LE_43i
  IF ~GlobalTimerExpired("D0Day2","GLOBAL")~ THEN GOTO LE_43j
END

IF ~~ THEN BEGIN LE_42
  SAY @115
  IF ~True()~ THEN GOTO LE_59
  IF ~GlobalTimerNotExpired("D0Day2","GLOBAL")~ THEN GOTO LE_43i
  IF ~GlobalTimerExpired("D0Day2","GLOBAL")~ THEN GOTO LE_43j
END

IF ~~ THEN BEGIN LE_43a
  SAY @116
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43b
  SAY @117
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43c
  SAY @118
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43d
  SAY @119
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43e
  SAY @120
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43f
  SAY @121
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43g
  SAY @122
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43h
  SAY @123
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43i
  SAY @124
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_43j
  SAY @125
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_44
  SAY @126
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_45
  SAY @127
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_46
  SAY @128
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN LE_47
  SAY @129
  IF ~~ THEN REPLY @66 GOTO LE_49
  IF ~~ THEN REPLY @67 GOTO LE_50

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_51
  IF ~GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_NoLend_OneDay

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")~ THEN REPLY @69 GOTO LE_52
  IF ~GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @69 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @69 GOTO LE_NoLend_TwoDays

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @70 GOTO LE_53
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_TwoDays
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_ThreeDays

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @71 GOTO LE_54
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_TwoDays
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_ThreeDays

  IF ~~ THEN REPLY @72 GOTO LE_55
  IF ~~ THEN REPLY @73 GOTO LE_56
  IF ~~ THEN REPLY @74 GOTO LE_46
END

IF ~~ THEN BEGIN LE_NoLend_OneDay
SAY @130
  IF ~~ THEN REPLY @66 GOTO LE_49
  IF ~~ THEN REPLY @67 GOTO LE_50
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_51
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")~ THEN REPLY @69 GOTO LE_52
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @70 GOTO LE_53
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @71 GOTO LE_54
  IF ~~ THEN REPLY @93 GOTO LE_46
END

IF ~~ THEN BEGIN LE_NoLend_TwoDays
SAY @131
  IF ~~ THEN REPLY @66 GOTO LE_49
  IF ~~ THEN REPLY @67 GOTO LE_50
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_51
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")~ THEN REPLY @69 GOTO LE_52
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @70 GOTO LE_53
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @71 GOTO LE_54
  IF ~~ THEN REPLY @93 GOTO LE_46
END

IF ~~ THEN BEGIN LE_NoLend_ThreeDays
SAY @132
  IF ~~ THEN REPLY @66 GOTO LE_49
  IF ~~ THEN REPLY @67 GOTO LE_50
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_51
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")~ THEN REPLY @69 GOTO LE_52
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @70 GOTO LE_53
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @71 GOTO LE_54
  IF ~~ THEN REPLY @93 GOTO LE_46
END

IF ~!AreaCheck("ar1602")
Global("D0Lender","GLOBAL",3)~ THEN BEGIN LE_48
  SAY @133
  IF ~~ THEN REPLY @134 GOTO LE_47
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71
  IF ~~ THEN REPLY @93 GOTO LE_46
END

IF ~~ THEN BEGIN LE_49
  SAY @135
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN LE_50
  SAY @136
     =
      @137
  IF ~~ THEN REPLY @80 GOTO LE_22
  IF ~~ THEN REPLY @81 GOTO LE_46
END

IF ~~ THEN BEGIN LE_51
  SAY @138
     =
      @139
  IF ~~ THEN REPLY @80 GOTO LE_23
  IF ~~ THEN REPLY @81 GOTO LE_46
END

IF ~~ THEN BEGIN LE_52
  SAY @140
     =
      @141
  IF ~~ THEN REPLY @80 GOTO LE_24
  IF ~~ THEN REPLY @81 GOTO LE_46
END

IF ~~ THEN BEGIN LE_53
  SAY @142
     =
      @143
  IF ~~ THEN REPLY @80 GOTO LE_57
  IF ~~ THEN REPLY @81 GOTO LE_46
END

IF ~~ THEN BEGIN LE_54
  SAY @142
      =
      @144
  IF ~~ THEN REPLY @80 GOTO LE_58
  IF ~~ THEN REPLY @81 GOTO LE_46
END

IF ~~ THEN BEGIN LE_55
  SAY @145
     =
      @146
  IF ~~ THEN REPLY @66 GOTO LE_49
  IF ~~ THEN REPLY @67 GOTO LE_50
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_51
  IF ~GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_NoLend_OneDay

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")~ THEN REPLY @69 GOTO LE_52
  IF ~GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @69 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @69 GOTO LE_NoLend_TwoDays

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @70 GOTO LE_53
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_TwoDays
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_ThreeDays

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @71 GOTO LE_54
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_TwoDays
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_ThreeDays
  IF ~~ THEN REPLY @74 GOTO LE_46
END

IF ~~ THEN BEGIN LE_56
  SAY @147
  IF ~~ THEN REPLY @66 GOTO LE_49
  IF ~~ THEN REPLY @67 GOTO LE_50
  IF ~!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_51
  IF ~GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @68 GOTO LE_NoLend_OneDay

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")~ THEN REPLY @69 GOTO LE_52
  IF ~GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @69 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @69 GOTO LE_NoLend_TwoDays

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @70 GOTO LE_53
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_TwoDays
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @70 GOTO LE_NoLend_ThreeDays

  IF ~!GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")~ THEN REPLY @71 GOTO LE_54
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_OneDay
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
!GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_TwoDays
  IF ~GlobalTimerNotExpired("D0LendLimitTimer3","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer2","LOCALS")
GlobalTimerNotExpired("D0LendLimitTimer1","LOCALS")~ THEN REPLY @71 GOTO LE_NoLend_ThreeDays
  IF ~~ THEN REPLY @72 GOTO LE_55
  IF ~~ THEN REPLY @74 GOTO LE_46
END

IF ~~ THEN BEGIN LE_57
  SAY @148
  IF ~~ THEN DO ~AddJournalEntry(@430,QUEST)
GiveGoldForce(10000)
SetGlobal("D0Beat","GLOBAL",0)
SetGlobal("D0Attack","GLOBAL",0)
SetGlobal("D0Lender","GLOBAL",2)
SetGlobal("D0OwedCelile","GLOBAL",12500)
SetGlobal("D0Days","GLOBAL",8)
SetGlobalTimer("D0Day8","GLOBAL",ONE_DAY)
SetGlobalTimer("D0Day7","GLOBAL",TWO_DAYS)
SetGlobalTimer("D0Day6","GLOBAL",THREE_DAYS)
SetGlobalTimer("D0Day5","GLOBAL",FOUR_DAYS)
SetGlobalTimer("D0Day4","GLOBAL",FIVE_DAYS)
SetGlobalTimer("D0Day3","GLOBAL",SIX_DAYS)
SetGlobalTimer("D0Day2","GLOBAL",SEVEN_DAYS)
SetGlobalTimer("D0Day1","GLOBAL",EIGHT_DAYS)~ EXIT
END

IF ~~ THEN BEGIN LE_58
  SAY @149
  IF ~~ THEN DO ~AddJournalEntry(@431,QUEST)
GiveGoldForce(25000)
SetGlobal("D0Beat","GLOBAL",0)
SetGlobal("D0Attack","GLOBAL",0)
SetGlobal("D0Lender","GLOBAL",2)
SetGlobal("D0OwedCelile","GLOBAL",31250)
SetGlobal("D0Days","GLOBAL",10)
SetGlobalTimer("D0Day10","GLOBAL",ONE_DAY)
SetGlobalTimer("D0Day9","GLOBAL",TWO_DAYS)
SetGlobalTimer("D0Day8","GLOBAL",THREE_DAYS)
SetGlobalTimer("D0Day7","GLOBAL",FOUR_DAYS)
SetGlobalTimer("D0Day6","GLOBAL",FIVE_DAYS)
SetGlobalTimer("D0Day5","GLOBAL",SIX_DAYS)
SetGlobalTimer("D0Day4","GLOBAL",SEVEN_DAYS)
SetGlobalTimer("D0Day3","GLOBAL",EIGHT_DAYS)
SetGlobalTimer("D0Day2","GLOBAL",NINE_DAYS)
SetGlobalTimer("D0Day1","GLOBAL",TEN_DAYS)~ EXIT
END

IF ~!AreaCheck("ar1602")
Global("D0Lender","GLOBAL",2)
GlobalTimerExpired("D0Day1","GLOBAL")~ THEN BEGIN LE_59
  SAY @150
  IF ~Global("D0Poor","GLOBAL",2)~ THEN REPLY @51 GOTO LE_71

  IF ~Global("D0OwedCelile","GLOBAL",125)~ THEN REPLY @99 GOTO LE_60
  IF ~Global("D0OwedCelile","GLOBAL",1250)~ THEN REPLY @99 GOTO LE_61
  IF ~Global("D0OwedCelile","GLOBAL",6250)~ THEN REPLY @99 GOTO LE_62
  IF ~Global("D0OwedCelile","GLOBAL",12500)~ THEN REPLY @99 GOTO LE_63
  IF ~Global("D0OwedCelile","GLOBAL",31250)~ THEN REPLY @99 GOTO LE_64
  IF ~Global("D0OwedCelile","GLOBAL",62500)~ THEN REPLY @99 GOTO LE_65

  IF ~Global("D0OwedCelile","GLOBAL",125)
PartyGoldGT(124)~ THEN REPLY @101 DO ~TakePartyGold(125)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",TWO_DAYS)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_66
  IF ~Global("D0OwedCelile","GLOBAL",125)
PartyGoldLT(125)~ THEN REPLY @102 GOTO LE_67

  IF ~Global("D0OwedCelile","GLOBAL",1250)
PartyGoldGT(1249)~ THEN REPLY @101 DO ~TakePartyGold(1250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",TWO_DAYS)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_66
  IF ~Global("D0OwedCelile","GLOBAL",1250)
PartyGoldLT(1250)~ THEN REPLY @102 GOTO LE_67

  IF ~Global("D0OwedCelile","GLOBAL",6250)
PartyGoldGT(6249)~ THEN REPLY @101 DO ~TakePartyGold(6250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_66
  IF ~Global("D0OwedCelile","GLOBAL",6250)
PartyGoldLT(6250)~ THEN REPLY @102 GOTO LE_67

  IF ~Global("D0OwedCelile","GLOBAL",12500)
PartyGoldGT(12499)~ THEN REPLY @101 DO ~TakePartyGold(12500)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_66
  IF ~Global("D0OwedCelile","GLOBAL",12500)
PartyGoldLT(12500)~ THEN REPLY @102 GOTO LE_67

  IF ~Global("D0OwedCelile","GLOBAL",31250)
PartyGoldGT(31249)~ THEN REPLY @101 DO ~TakePartyGold(31250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",ONE_DAY)~ GOTO LE_66
  IF ~Global("D0OwedCelile","GLOBAL",31250)
PartyGoldLT(31250)~ THEN REPLY @102 GOTO LE_67

  IF ~Global("D0OwedCelile","GLOBAL",62500)
PartyGoldGT(62499)~ THEN REPLY @101 DO ~TakePartyGold(62500)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",ONE_DAY)~ GOTO LE_66
  IF ~Global("D0OwedCelile","GLOBAL",62500)
PartyGoldLT(62500)~ THEN REPLY @102 GOTO LE_67

  IF ~~ THEN REPLY @103 GOTO LE_68

  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_60
  SAY @151
  IF ~PartyGoldGT(124)~ THEN REPLY @101 DO ~TakePartyGold(125)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",TWO_DAYS)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_66
  IF ~PartyGoldLT(125)~ THEN REPLY @102 GOTO LE_67
  IF ~~ THEN REPLY @103 GOTO LE_68
  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_61
  SAY @152
  IF ~PartyGoldGT(1249)~ THEN REPLY @101 DO ~TakePartyGold(1250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",TWO_DAYS)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",THREE_DAYS)~ GOTO LE_66
  IF ~PartyGoldLT(1250)~ THEN REPLY @102 GOTO LE_67
  IF ~~ THEN REPLY @103 GOTO LE_68
  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_62
  SAY @153
  IF ~PartyGoldGT(6249)~ THEN REPLY @101 DO ~TakePartyGold(6250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",TWO_DAYS)~ GOTO LE_66
  IF ~PartyGoldLT(6250)~ THEN REPLY @102 GOTO LE_67
  IF ~~ THEN REPLY @103 GOTO LE_68
  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_63
  SAY @154
  IF ~PartyGoldGT(12499)~ THEN REPLY @101 DO ~TakePartyGold(12500)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",ONE_DAY)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",TWO_DAYS)~ GOTO LE_66
  IF ~PartyGoldLT(12500)~ THEN REPLY @102 GOTO LE_67
  IF ~~ THEN REPLY @103 GOTO LE_68
  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_64
  SAY @155
  IF ~PartyGoldGT(31249)~ THEN REPLY @101 DO ~TakePartyGold(31250)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",ONE_DAY)~ GOTO LE_66
  IF ~PartyGoldLT(31250)~ THEN REPLY @102 GOTO LE_67
  IF ~~ THEN REPLY @103 GOTO LE_68
  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_65
  SAY @156
  IF ~PartyGoldGT(62499)~ THEN REPLY @101 DO ~TakePartyGold(62500)
SetGlobalTimer("D0LendLimitTimer1","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer2","LOCALS",0)
SetGlobalTimer("D0LendLimitTimer3","LOCALS",ONE_DAY)~ GOTO LE_66
  IF ~PartyGoldLT(62500)~ THEN REPLY @102 GOTO LE_67
  IF ~~ THEN REPLY @103 GOTO LE_68
  IF ~~ THEN REPLY @104 GOTO LE_69
END

IF ~~ THEN BEGIN LE_66
  SAY @157
  IF ~~ THEN REPLY @112 DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)~ GOTO LE_47
  IF ~~ THEN REPLY @113 DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)~ GOTO LE_46
END

IF ~~ THEN BEGIN LE_67
  SAY @158
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN LE_68
  SAY @159
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN LE_69
  SAY @160
  IF ~~ THEN DO ~SetGlobal("D0Lender","GLOBAL",4)~ EXIT
END

IF ~!AreaCheck("ar1602")
OR(2)
Global("D0Lender","GLOBAL",4)
Global("D0Beat","GLOBAL",1)
GlobalTimerExpired("D0Day1","GLOBAL")~ THEN BEGIN LE_70
  SAY @161
  COPY_TRANS SAFE D0LENDER LE_59
END

IF ~~ THEN BEGIN LE_71
  SAY @162
  IF ~~ THEN REPLY @163 GOTO LE_72
  IF ~~ THEN REPLY @164 GOTO LE_73
END

IF ~~ THEN BEGIN LE_72
  SAY @165
     =
      @166
  IF ~~ THEN REPLY @167 GOTO LE_74
END

IF ~~ THEN BEGIN LE_73
  SAY @168
     =
      @169
     =
      @166
  IF ~~ THEN REPLY @167 GOTO LE_74
END

IF ~~ THEN BEGIN LE_74
  SAY @170
     =
      @171
  IF ~!Global("D0Lender","GLOBAL",2)~ THEN DO ~AddJournalEntry(@432,QUEST)
SetGlobal("D0Poor","GLOBAL",3)~ GOTO LE_78
  IF ~Global("D0Lender","GLOBAL",2)~ THEN DO ~AddJournalEntry(@432,QUEST)
SetGlobal("D0Poor","GLOBAL",3)~ GOTO LE_77
  IF ~OR(2)
Global("D0Lender","GLOBAL",4)
GlobalLT("D0Days","GLOBAL",-1)~ THEN DO ~AddJournalEntry(@432,QUEST)
SetGlobal("D0Poor","GLOBAL",3)~ GOTO LE_75
  IF ~Global("D0Lender","GLOBAL",2)
GlobalLT("D0Days","GLOBAL",1)
GlobalGT("D0Days","GLOBAL",-2)~ THEN DO ~AddJournalEntry(@432,QUEST)
SetGlobal("D0Poor","GLOBAL",3)~ GOTO LE_76
END

IF ~~ THEN BEGIN LE_75
  SAY @172
  COPY_TRANS SAFE D0LENDER LE_59
END

IF ~~ THEN BEGIN LE_76
  SAY @173
  COPY_TRANS SAFE D0LENDER LE_59
END

IF ~~ THEN BEGIN LE_77
  SAY @174
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN LE_78
  SAY @175
  IF ~Global("D0Lender","GLOBAL",0)~ THEN DO ~SetGlobal("D0Lender","GLOBAL",1)~ EXIT
  IF ~!Global("D0Lender","GLOBAL",0)~ THEN EXIT
END

IF ~AreaCheck("ar1602")~ THEN BEGIN LE_79
  SAY @176
= @177
  IF ~~ THEN DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)
Enemy()
SetGlobal("D0CelileAttack","AR1602",1)~ EXIT
END

APPEND KORGANJ
IF ~~ THEN BEGIN LE_8a
SAY @178
IF ~~ THEN EXTERN D0LENDER LE_8a_2
END
END

APPEND MINSCJ
IF ~~ THEN BEGIN LE_16_Minsc
SAY @179
IF ~~ THEN EXTERN D0LENDER LE_16_gay
END

IF ~~ THEN BEGIN LE_17_Minsc
SAY @179
IF ~~ THEN EXTERN D0LENDER LE_17_gay
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0DEBT

IF ~NumTimesTalkedTo(0)
!GlobalGT("D0Poor","GLOBAL",9)~ THEN BEGIN DE_1
  SAY @180
  IF ~~ THEN DO ~SetGlobal("D0Attack","GLOBAL",3)~ EXIT
END

IF ~NumTimesTalkedTo(0)
GlobalGT("D0Poor","GLOBAL",9)~ THEN BEGIN DE_2
  SAY @181
  IF ~!Global("D0OwedCelile","GLOBAL",125)
!Global("D0OwedCelile","GLOBAL",1250)
!Global("D0OwedCelile","GLOBAL",6250)
!Global("D0OwedCelile","GLOBAL",12500)
!Global("D0OwedCelile","GLOBAL",31250)
!Global("D0OwedCelile","GLOBAL",62500)~ THEN DO ~SetGlobal("D0Attack","GLOBAL",3)~ EXIT
  IF ~Global("D0OwedCelile","GLOBAL",125)~ THEN GOTO DE_3
  IF ~Global("D0OwedCelile","GLOBAL",1250)~ THEN GOTO DE_4
  IF ~Global("D0OwedCelile","GLOBAL",6250)~ THEN GOTO DE_5
  IF ~Global("D0OwedCelile","GLOBAL",12500)~ THEN GOTO DE_6
  IF ~Global("D0OwedCelile","GLOBAL",31250)~ THEN GOTO DE_7
  IF ~Global("D0OwedCelile","GLOBAL",62500)~ THEN GOTO DE_8
END

IF ~~ THEN BEGIN DE_3
  SAY @182
  IF ~PartyGoldGT(124)~ THEN REPLY @183 DO ~TakePartyGold(125)~ GOTO DE_9
  IF ~PartyGoldGT(124)~ THEN REPLY @184 DO ~TakePartyGold(125)~ GOTO DE_9
  IF ~~ THEN REPLY @185 GOTO DE_10
  IF ~!PartyGoldGT(124)~ THEN REPLY @186 GOTO DE_11
  IF ~!PartyGoldGT(124)~ THEN REPLY @187 GOTO DE_11
END

IF ~~ THEN BEGIN DE_4
  SAY @188
  IF ~PartyGoldGT(1249)~ THEN REPLY @183 DO ~TakePartyGold(1250)~ GOTO DE_9
  IF ~PartyGoldGT(1249)~ THEN REPLY @184 DO ~TakePartyGold(1250)~ GOTO DE_9
  IF ~~ THEN REPLY @189 GOTO DE_10
  IF ~!PartyGoldGT(1249)~ THEN REPLY @186 GOTO DE_11
  IF ~!PartyGoldGT(1249)~ THEN REPLY @187 GOTO DE_11
END

IF ~~ THEN BEGIN DE_5
  SAY @190
  IF ~PartyGoldGT(6249)~ THEN REPLY @183 DO ~TakePartyGold(6250)~ GOTO DE_9
  IF ~PartyGoldGT(6249)~ THEN REPLY @184 DO ~TakePartyGold(6250)~ GOTO DE_9
  IF ~~ THEN REPLY @185 GOTO DE_10
  IF ~!PartyGoldGT(6249)~ THEN REPLY @186 GOTO DE_11
  IF ~!PartyGoldGT(6249)~ THEN REPLY @187 GOTO DE_11
END

IF ~~ THEN BEGIN DE_6
  SAY @191
  IF ~PartyGoldGT(12499)~ THEN REPLY @183 DO ~TakePartyGold(12500)~ GOTO DE_9
  IF ~PartyGoldGT(12499)~ THEN REPLY @184 DO ~TakePartyGold(12500)~ GOTO DE_9
  IF ~~ THEN REPLY @185 GOTO DE_10
  IF ~!PartyGoldGT(12499)~ THEN REPLY @186 GOTO DE_11
  IF ~!PartyGoldGT(12499)~ THEN REPLY @187 GOTO DE_11
END

IF ~~ THEN BEGIN DE_7
  SAY @192
  IF ~PartyGoldGT(31249)~ THEN REPLY @183 DO ~TakePartyGold(31250)~ GOTO DE_9
  IF ~PartyGoldGT(31249)~ THEN REPLY @184 DO ~TakePartyGold(31250)~ GOTO DE_9
  IF ~~ THEN REPLY @185 GOTO DE_10
  IF ~!PartyGoldGT(31249)~ THEN REPLY @186 GOTO DE_11
  IF ~!PartyGoldGT(31249)~ THEN REPLY @187 GOTO DE_11
END

IF ~~ THEN BEGIN DE_8
  SAY @193
  IF ~PartyGoldGT(62499)~ THEN REPLY @183 DO ~TakePartyGold(62500)~ GOTO DE_9
  IF ~PartyGoldGT(62499)~ THEN REPLY @184 DO ~TakePartyGold(62500)~ GOTO DE_9
  IF ~~ THEN REPLY @185 GOTO DE_10
  IF ~!PartyGoldGT(62499)~ THEN REPLY @186 GOTO DE_11
  IF ~!PartyGoldGT(62499)~ THEN REPLY @187 GOTO DE_11
END

IF ~~ THEN BEGIN DE_9
  SAY @194
  IF ~~ THEN DO ~SetGlobal("D0Attack","GLOBAL",2)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN DE_10
  SAY @195
  IF ~~ THEN DO ~SetGlobal("D0Attack","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN DE_11
  SAY @196
  IF ~~ THEN DO ~SetGlobal("D0Attack","GLOBAL",3)~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0POOR

IF ~NumTimesTalkedTo(0)
Global("D0Poor","GLOBAL",0)~ THEN BEGIN PO_1
  SAY @197
  IF ~~ THEN REPLY @198 GOTO PO_2
  IF ~~ THEN REPLY @199 GOTO PO_3
  IF ~~ THEN REPLY @200 GOTO PO_4
  IF ~~ THEN REPLY @201 GOTO PO_5
  IF ~~ THEN REPLY @202 GOTO PO_6
END

IF ~~ THEN BEGIN PO_2
  SAY @203
     =
      @204
     =
      @205
IF ~~ THEN GOTO PO_2_LetKelseyTalk
END

IF ~~ THEN BEGIN PO_2_LetKelseyTalk
SAY   @206
IF ~~ THEN GOTO PO_2_LetKelseyTalk2
END

IF ~~ THEN BEGIN PO_2_LetKelseyTalk2
SAY   @207
     =
      @208
  IF ~~ THEN REPLY @209 DO ~SetGlobal("D0Poor","GLOBAL",1)~ GOTO PO_7
  IF ~Dead("d0lender")~ THEN REPLY @210 GOTO PO_2a
  IF ~~ THEN REPLY @211 DO ~SetGlobal("D0Poor","GLOBAL",1)~ GOTO PO_4
END

IF ~~ THEN BEGIN PO_2a
  SAY @212
  IF ~~ THEN DO ~AddXPObject(Player1,2500)
AddXPObject(Player2,2500)
AddXPObject(Player3,2500)
AddXPObject(Player4,2500)
AddXPObject(Player5,2500)
AddXPObject(Player6,2500)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PO_3
  SAY @213
  IF ~~ THEN REPLY @198 GOTO PO_2
  IF ~~ THEN REPLY @200 GOTO PO_4
  IF ~~ THEN REPLY @201 GOTO PO_5
END

IF ~~ THEN BEGIN PO_4
  SAY @214
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PO_5
  SAY @215
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PO_6
  SAY @216
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PO_7
  SAY @217
IF ~~ THEN GOTO PO_7_LetKelseySpeak
END

IF ~~ THEN BEGIN PO_7_LetKelseySpeak
SAY  @218
  IF ~PartyGoldGT(6249)
!Dead("d0lender")~ THEN REPLY @219 GOTO PO_10
  IF ~Dead("d0lender")~ THEN REPLY @220 GOTO PO_2a
  IF ~~ THEN REPLY @221 GOTO PO_8
  IF ~~ THEN REPLY @222 GOTO PO_9
END

IF ~~ THEN BEGIN PO_8
  SAY @223
  IF ~~ THEN REPLY @224 GOTO PO_11
  IF ~~ THEN REPLY @225 GOTO PO_12
END

IF ~~ THEN BEGIN PO_9
  SAY @226
  IF ~~ THEN REPLY @224 GOTO PO_11
  IF ~~ THEN REPLY @227 GOTO PO_12
END

IF ~~ THEN BEGIN PO_10
  SAY @228
     =
      @229
  IF ~!IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("D0Poor2","GLOBAL",1)
IncrementGlobal("D0Change","GLOBAL",1)
ReputationInc(1)
TakePartyGold(6250)
EscapeArea()~ EXIT
  IF ~IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("D0Poor2","GLOBAL",1)
IncrementGlobal("D0Change","GLOBAL",1)
ReputationInc(1)
TakePartyGold(6250)
EscapeArea()~ EXTERN VICONIJ PO_10a
END

IF ~~ THEN BEGIN PO_11
  SAY @230
  IF ~~ THEN DO ~AddJournalEntry(@433,QUEST)
SetGlobal("D0Poor","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN PO_12
  SAY @231
  IF ~~ THEN REPLY @232 GOTO PO_5
  IF ~~ THEN REPLY @233 GOTO PO_6
  IF ~~ THEN REPLY @234 GOTO PO_11
  IF ~Dead("d0lender")~ THEN REPLY @235 GOTO PO_2a
  IF ~PartyGoldGT(6249)
!Dead("d0lender")~ THEN REPLY @236 GOTO PO_10
END

IF ~Global("D0Poor","GLOBAL",2)
!Dead("d0lender")~ THEN BEGIN PO_13
  SAY @237
  IF ~~ THEN EXIT
END

IF ~OR(2)
Global("D0Poor","GLOBAL",3)
Dead("d0lender")~ THEN BEGIN PO_14
  SAY @238
  IF ~Dead("d0lender")~ THEN REPLY @235 DO ~EraseJournalEntry(@433)
AddJournalEntry(@434,QUEST_DONE)~ GOTO PO_2a
  IF ~!Dead("d0lender")~ THEN REPLY @239 GOTO PO_15
  IF ~!Dead("d0lender")~ THEN REPLY @240 GOTO PO_16
END

IF ~~ THEN BEGIN PO_15
  SAY @241
  IF ~~ THEN DO ~EraseJournalEntry(@432)
AddJournalEntry(@435,QUEST)
AddXPObject(Player1,5000)
AddXPObject(Player2,5000)
AddXPObject(Player3,5000)
AddXPObject(Player4,5000)
AddXPObject(Player5,5000)
AddXPObject(Player6,5000)
SetGlobal("D0Poor","GLOBAL",4)
SetGlobalTimer("D0PoorAttack","GLOBAL",TWO_DAYS)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PO_16
  SAY @242
  IF ~~ THEN DO ~EraseJournalEntry(@432)
AddJournalEntry(@435,QUEST)
AddXPObject(Player1,5000)
AddXPObject(Player2,5000)
AddXPObject(Player3,5000)
AddXPObject(Player4,5000)
AddXPObject(Player5,5000)
AddXPObject(Player6,5000)
SetGlobal("D0Poor","GLOBAL",4)
SetGlobalTimer("D0PoorAttack","GLOBAL",TWO_DAYS)
EscapeArea()~ EXIT
END

IF ~Global("D0Poor","GLOBAL",6)~ THEN BEGIN PO_17
  SAY @243
  IF ~~ THEN EXTERN D0BOY BOY_5
END

IF ~Global("D0Poor","GLOBAL",7)~ THEN BEGIN PO_18
  SAY @244
  IF ~~ THEN EXTERN D0BOY BOY_6
END

IF ~~ THEN BEGIN PO_19
  SAY @245
     =
      @246
  IF ~~ THEN EXTERN D0BOY BOY_7
END

IF ~~ THEN BEGIN PO_20
  SAY @247
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",8)
ActionOverride("D0BOY",EscapeArea())~ EXIT
END

IF ~Global("D0Poor","GLOBAL",8)
!See("D0Boy")~ THEN BEGIN PO_21
  SAY @248
     =
      @249
     =
      @250
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",9)
CreateCreatureObjectOffScreen("D0BOY",Player1,0,0,0)
Wait(1)
ActionOverride("D0Boy",StartDialogNoSet(Player1))~ EXIT
END

IF ~~ THEN BEGIN PO_22
  SAY @251
  IF ~~ THEN EXTERN D0BOY BOY_9
END

IF ~~ THEN BEGIN PO_23
  SAY @252
     =
      @253
  IF ~~ THEN DO ~EraseJournalEntry(@426)
AddJournalEntry(@436,QUEST)
SetGlobal("D0Poor","GLOBAL",10)
ActionOverride("D0Boy",DestroySelf())~ EXIT
END

IF ~GlobalGT("D0Poor","GLOBAL",9)
!Global("D0Poor","GLOBAL",15)~ THEN BEGIN PO_24
  SAY @254
  IF ~Global("D0Poor","GLOBAL",11)~ THEN REPLY @255 GOTO PO_26
  IF ~Global("D0Poor","GLOBAL",12)~ THEN REPLY @256 GOTO PO_27
  IF ~Global("D0Poor","GLOBAL",13)~ THEN REPLY @257 GOTO PO_27
  IF ~Global("D0Poor","GLOBAL",14)~ THEN REPLY @258 GOTO PO_26
  IF ~Global("D0Poor","GLOBAL",16)~ THEN REPLY @259 GOTO PO_28
  IF ~~ THEN REPLY @260 GOTO PO_25
END

IF ~~ THEN BEGIN PO_25
  SAY @261
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PO_26
  SAY @262
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PO_27
  SAY @263
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PO_28
  SAY @264
     =
      @265
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",17)
EraseJournalEntry(@433)
EraseJournalEntry(@432)
EraseJournalEntry(@435)
EraseJournalEntry(@426)
EraseJournalEntry(@436)
EraseJournalEntry(@437)
EraseJournalEntry(@438)
EraseJournalEntry(@439)
EraseJournalEntry(@440)
EraseJournalEntry(@441)
EraseJournalEntry(@442)
EraseJournalEntry(@443)
AddXPObject(Player1,10000)
AddXPObject(Player2,10000)
AddXPObject(Player3,10000)
AddXPObject(Player4,10000)
AddXPObject(Player5,10000)
AddXPObject(Player6,10000)
AddJournalEntry(@444,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~Global("D0Poor","GLOBAL",15)~ THEN BEGIN PO_29
  SAY @266
     =
      @267
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",18)
EraseJournalEntry(@433)
EraseJournalEntry(@432)
EraseJournalEntry(@435)
EraseJournalEntry(@426)
EraseJournalEntry(@436)
EraseJournalEntry(@437)
EraseJournalEntry(@438)
EraseJournalEntry(@439)
EraseJournalEntry(@440)
EraseJournalEntry(@441)
EraseJournalEntry(@442)
EraseJournalEntry(@443)
AddXPObject(Player1,12500)
AddXPObject(Player2,12500)
AddXPObject(Player3,12500)
AddXPObject(Player4,12500)
AddXPObject(Player5,12500)
AddXPObject(Player6,12500)
AddJournalEntry(@445,QUEST_DONE)
EscapeArea()~ EXIT
END

APPEND_EARLY VICONIJ
IF ~~ THEN BEGIN PO_10a
SAY @268
IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0THUG

IF ~Global("D0Poor","GLOBAL",6)~ THEN BEGIN TH_1
  SAY @269
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",7)
StartCutSceneMode()
StartCutScene("D0Beat2")~ EXIT
END

IF ~Global("D0Poor","GLOBAL",10)~ THEN BEGIN TH_2
  SAY @270
     =
      @271
     =
      @272
     =
      @273
  IF ~~ THEN DO ~EraseJournalEntry(@427)
EraseJournalEntry(@428)
EraseJournalEntry(@429)
EraseJournalEntry(@430)
EraseJournalEntry(@431)
SetGlobal("D0Poor","GLOBAL",11)
SetGlobalTimer("D0KillGirl","GLOBAL",ONE_DAY)
AddJournalEntry(@437,QUEST)
EscapeArea()~ EXIT
END

IF ~Global("D0Poor","GLOBAL",11)
GlobalTimerNotExpired("D0KillGirl","GLOBAL")
HPPercentGT(Myself,19)~ THEN BEGIN TH_3
  SAY @274
  IF ~PartyGoldLT(6250)~ THEN REPLY @275 GOTO TH_5
  IF ~PartyGoldGT(6249)~ THEN REPLY @101 GOTO TH_4
  IF ~~ THEN REPLY @276 GOTO TH_6
  IF ~~ THEN REPLY @277 GOTO TH_7
  IF ~~ THEN REPLY @278 GOTO TH_8
END

IF ~~ THEN BEGIN TH_4
  SAY @279
  IF ~~ THEN REPLY @280 DO ~TakePartyGold(6250)~ GOTO TH_12
  IF ~~ THEN REPLY @281 GOTO TH_9
  IF ~~ THEN REPLY @282 GOTO TH_11
  IF ~~ THEN REPLY @277 GOTO TH_7
  IF ~~ THEN REPLY @278 GOTO TH_8
END

IF ~~ THEN BEGIN TH_5
  SAY @279
  IF ~~ THEN REPLY @281 GOTO TH_9
  IF ~~ THEN REPLY @282 GOTO TH_10
  IF ~~ THEN REPLY @277 GOTO TH_7
  IF ~~ THEN REPLY @278 GOTO TH_8
END

IF ~~ THEN BEGIN TH_6
  SAY @283
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TH_7
  SAY @284
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TH_8
  SAY @285
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TH_9
  SAY @286
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TH_10
  SAY @287
  IF ~~ THEN REPLY @281 DO ~AddJournalEntry(@438,QUEST)~ GOTO TH_9
  IF ~~ THEN REPLY @277 DO ~AddJournalEntry(@438,QUEST)~ GOTO TH_7
  IF ~~ THEN REPLY @278 DO ~AddJournalEntry(@438,QUEST)~ GOTO TH_8
END

IF ~~ THEN BEGIN TH_11
  SAY @287
  IF ~~ THEN REPLY @280 DO ~TakePartyGold(6250)
AddJournalEntry(@438,QUEST)~ GOTO TH_12
  IF ~~ THEN REPLY @281 DO ~AddJournalEntry(@438,QUEST)~ GOTO TH_9
  IF ~~ THEN REPLY @277 DO ~AddJournalEntry(@438,QUEST)~ GOTO TH_7
  IF ~~ THEN REPLY @278 DO ~AddJournalEntry(@438,QUEST)~ GOTO TH_8
END

IF ~~ THEN BEGIN TH_12
  SAY @288
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",12)
EraseJournalEntry(@438)
AddJournalEntry(@439,QUEST)
EscapeArea()~ EXIT
END

IF ~Global("D0Poor","GLOBAL",11)
GlobalTimerNotExpired("D0KillGirl","GLOBAL")
HPPercentLT(Myself,20)~ THEN BEGIN TH_13
  SAY @289
     =
      @290
     =
      @291
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",13)
EraseJournalEntry(@438)
AddJournalEntry(@440,QUEST)
EscapeArea()~ EXIT
END

IF ~Global("D0Poor","GLOBAL",14)
GlobalTimerExpired("D0KillGirl","GLOBAL")~ THEN BEGIN TH_14
  SAY @292
  IF ~~ THEN DO ~AddJournalEntry(@441,QUEST)
EscapeArea()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0THUG2

IF ~!GlobalTimerExpired("D0KillGirl","GLOBAL")
NumTimesTalkedTo(0)~ THEN BEGIN TH2_1
  SAY @293
  IF ~~ THEN EXTERN D0THUG3 TH3_1
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0THUG3

IF ~~ THEN BEGIN TH3_1
  SAY @294
  IF ~~ THEN DO ~ActionOverride("D0THUG2",Enemy())
Enemy()
ActionOverride("D0THUG2",Attack([PC]))
Attack([PC])~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0GIRL

IF ~OR(2)
Dead("D0THUG2")
!Detect("D0THUG2")
OR(2)
Dead("D0THUG3")
!Detect("D0THUG3")~ THEN BEGIN GI_1
  SAY @295
  IF ~~ THEN REPLY @296 GOTO GI_2
  IF ~~ THEN REPLY @297 GOTO GI_2
END

IF ~~ THEN BEGIN GI_2
  SAY @298
  IF ~~ THEN DO ~SetGlobal("D0Poor","GLOBAL",15)
AddJournalEntry(@442,QUEST)
EscapeArea()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0LORICK

IF ~NumTimesTalkedTo(0)~ THEN BEGIN LO_1
  SAY @299
  IF ~~ THEN GOTO LO_2
END

IF ~~ THEN BEGIN LO_2
  SAY @300
  IF ~GlobalGT("D0Poor","GLOBAL",0)~ THEN REPLY @301 GOTO LO_3
  IF ~GlobalGT("D0Poor","GLOBAL",0)~ THEN REPLY @302 GOTO LO_3
  IF ~!GlobalGT("D0Poor","GLOBAL",0)~ THEN EXIT
END

IF ~~ THEN BEGIN LO_3
  SAY @303
  IF ~~ THEN EXIT
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN LO_4
  SAY @304
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0DRUNK

IF ~NumTimesTalkedTo(0)~ THEN BEGIN DR_1
  SAY @305
  IF ~~ THEN REPLY @306 GOTO DR_2
  IF ~~ THEN REPLY @307 GOTO DR_3
  IF ~~ THEN REPLY @308 GOTO DR_4
END

IF ~~ THEN BEGIN DR_2
  SAY @309
  IF ~~ THEN REPLY @310 GOTO DR_5
  IF ~~ THEN REPLY @311 GOTO DR_6
END

IF ~~ THEN BEGIN DR_3
  SAY @312
  IF ~~ THEN REPLY @310 GOTO DR_5
  IF ~~ THEN REPLY @311 GOTO DR_6
END

IF ~~ THEN BEGIN DR_4
  SAY @313
  IF ~~ THEN REPLY @314 GOTO DR_5
  IF ~~ THEN REPLY @315 GOTO DR_6
END

IF ~~ THEN BEGIN DR_5
  SAY @316
= @317
= @318
= @319
= @320
= @321
= @322
  IF ~~ THEN REPLY @323 DO ~SetGlobal("D0LenderTale","GLOBAL",1)~ GOTO DR_7
  IF ~~ THEN REPLY @324 DO ~SetGlobal("D0LenderTale","GLOBAL",1)~ GOTO DR_7
END

IF ~~ THEN BEGIN DR_6
  SAY @325
  IF ~~ THEN EXIT
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN DR_7
  SAY @326
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE SETHLE

IF ~OR(2)
Global("TirdirGravekeeper","GLOBAL",1)
GlobalGT("D0Poor","GLOBAL",10)
OR(2)
Global("TirdirGravekeeper","GLOBAL",1)
Global("D0Spawn0812","GLOBAL",0)
OR(2)
Global("TirdirGravekeeper","GLOBAL",1)
Global("D0AskKidnap","LOCALS",0)~ THEN BEGIN 1 // from:
  SAY #9740 /* ~You got business here, or you just like walkin' on the graves?~ */
  IF ~Global("TirdirGravekeeper","GLOBAL",1)~ THEN REPLY #9743 /* ~Just taking a stroll. Didn't mean to bother you.~ */ GOTO 2
  IF ~!Global("TirdirGravekeeper","GLOBAL",1)~ THEN REPLY #9743 /* ~Just taking a stroll. Didn't mean to bother you.~ */ GOTO SE_1
  IF ~Global("TirdirGravekeeper","GLOBAL",1)~ THEN REPLY #9745 /* ~Busy day for you? Find yourself a little rushed?~ */ GOTO 4
  IF ~Global("TirdirGravekeeper","GLOBAL",1)~ THEN REPLY #9747 /* ~What in all the hells is going on here! I demand answers!~ */ GOTO 6
  IF ~GlobalGT("D0Poor","GLOBAL",10)
Global("D0Spawn0812","GLOBAL",0)
Global("D0AskKidnap","LOCALS",0)~ THEN REPLY @327 GOTO SE_2
END

END

APPEND SETHLE

IF ~~ THEN BEGIN SE_1
  SAY #9751 /* ~'at's alright then. You just watch your step and such. ~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SE_2
  SAY @328
  IF ~Global("TirdirGravekeeper","GLOBAL",1)~ THEN REPLY #9745 /* ~Busy day for you? Find yourself a little rushed?~ */ GOTO 4
  IF ~Global("TirdirGravekeeper","GLOBAL",1)~ THEN REPLY @329 GOTO 6
  IF ~~ THEN REPLY @330 GOTO SE_3
  IF ~~ THEN REPLY @331 GOTO SE_1
END

IF ~~ THEN BEGIN SE_3
  SAY @332
= @333
= @334
  IF ~~ THEN DO ~SetGlobal("D0AskKidnap","LOCALS",1)~ EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM SURLY 14
IF ~False() !NumTimesTalkedTo(0)
Dead("Lehtinan")~ THEN REPLY @335 GOTO SU_1
END

APPEND SURLY
IF ~~ THEN BEGIN SU_1
SAY @336
IF ~Global("D0JaheiraInterject","LOCALS",0)
IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0JaheiraInterject","LOCALS",1)~ EXTERN JAHEIRAJ SU_1x
IF ~OR(2)
!Global("D0JaheiraInterject","LOCALS",0)
!IsValidForPartyDialog("Jaheira")~ THEN REPLY @337 GOTO SU_2
IF ~OR(2)
!Global("D0JaheiraInterject","LOCALS",0)
!IsValidForPartyDialog("Jaheira")
Global("D0NaliaInterject","LOCALS",0)
IsValidForPartyDialog("Nalia")~ THEN REPLY @338 DO ~SetGlobal("D0NaliaInterject","LOCALS",1)~ EXTERN NALIAJ SU_1a
IF ~OR(2)
!Global("D0JaheiraInterject","LOCALS",0)
!IsValidForPartyDialog("Jaheira")
OR(2)
!Global("D0NaliaInterject","LOCALS",0)
!IsValidForPartyDialog("Nalia")~ THEN REPLY @338 DO ~SetGlobal("D0NaliaInterject","LOCALS",1)~ GOTO SU_3
IF ~OR(2)
!Global("D0JaheiraInterject","LOCALS",0)
!IsValidForPartyDialog("Jaheira")~ THEN REPLY @339 GOTO SU_4
IF ~OR(2)
!Global("D0JaheiraInterject","LOCALS",0)
!IsValidForPartyDialog("Jaheira")~ THEN REPLY @340 GOTO 12
END

IF ~~ THEN BEGIN SU_1x_2
SAY @341
IF ~~ THEN REPLY @337 GOTO SU_2
IF ~Global("D0NaliaInterject","LOCALS",0)
IsValidForPartyDialog("Nalia")~ THEN REPLY @338 DO ~SetGlobal("D0NaliaInterject","LOCALS",1)~ EXTERN NALIAJ SU_1a
IF ~OR(2)
!Global("D0NaliaInterject","LOCALS",0)
!IsValidForPartyDialog("Nalia")~ THEN REPLY @338 DO ~SetGlobal("D0NaliaInterject","LOCALS",1)~ GOTO SU_3
IF ~~ THEN REPLY @339 GOTO SU_4
IF ~~ THEN REPLY @340 GOTO 12
END

IF ~~ THEN BEGIN SU_2
SAY @342
= @343
IF ~IsValidForPartyDialog("Minsc")~ THEN DO ~AddexperienceParty(5000)
SetGlobal("D0Surly","GLOBAL",9)
EscapeArea()~ EXTERN MINSCJ SU_2a
IF ~!IsValidForPartyDialog("Minsc")
IsValidForPartyDialog("Cernd")~ THEN DO ~AddexperienceParty(5000)
SetGlobal("D0Surly","GLOBAL",9)
EscapeArea()~ EXTERN CERNDJ SU_2b
IF ~!IsValidForPartyDialog("Minsc")
!IsValidForPartyDialog("Cernd")~ THEN DO ~AddexperienceParty(5000)
SetGlobal("D0Surly","GLOBAL",9)
EscapeArea()~ EXIT
END
END

APPEND NALIAJ
IF ~~ THEN BEGIN SU_1a
SAY @344
IF ~~ THEN EXTERN SURLY SU_3
END
END

APPEND JAHEIRAJ
IF ~~ THEN BEGIN SU_1x
SAY @345
IF ~~ THEN EXTERN SURLY SU_1x_2
END
END

APPEND MINSCJ
IF ~~ THEN BEGIN SU_2a
SAY @346
IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN CERNDJ SU_2b
IF ~!IsValidForPartyDialog("Cernd")~ THEN EXIT
END
END

APPEND CERNDJ
IF ~~ THEN BEGIN SU_2b
SAY @347
IF ~~ THEN EXIT
END
END

APPEND_EARLY SURLY
IF ~~ THEN BEGIN SU_3
SAY @348
IF ~~ THEN REPLY @349 GOTO SU_5
IF ~~ THEN REPLY @350 GOTO SU_4
IF ~~ THEN REPLY @340 GOTO 12
END

IF ~~ THEN BEGIN SU_4
SAY @351
IF ~~ THEN DO ~AddexperienceParty(5000)
SetGlobal("D0Surly","GLOBAL",9)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN SU_5
SAY @352
IF ~~ THEN REPLY @353 GOTO SU_7
IF ~~ THEN REPLY @354 GOTO SU_6
IF ~~ THEN REPLY @355 GOTO SU_8
IF ~~ THEN REPLY @356 GOTO SU_4
END

IF ~~ THEN BEGIN SU_6
SAY @357
IF ~~ THEN DO ~AddexperienceParty(5000)
SetGlobal("D0Surly","GLOBAL",9)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN SU_7
SAY @358
IF ~~ THEN REPLY @359 GOTO SU_6
IF ~~ THEN REPLY @360 DO ~SetGlobal("Third","LOCALS",1)~ GOTO SU_8
IF ~~ THEN REPLY @361 GOTO SU_4
END

IF ~~ THEN BEGIN SU_8
SAY @362
IF ~~ THEN DO ~SetGlobal("Work","LOCALS",1)
AddexperienceParty(5000)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXIT

IF ~IsValidForPartyDialog("Cernd")~ THEN DO ~SetGlobal("Work","LOCALS",1)
AddexperienceParty(5000)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXTERN CERNDJ CerndSurlyComment

IF ~IsValidForPartyDialog("Minsc")~ THEN DO ~SetGlobal("Work","LOCALS",1)
AddexperienceParty(5000)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXTERN MINSCJ MinscSurlyComment

IF ~IsValidForPartyDialog("Jaheira")
!Global("JaheiraRomanceActive","GLOBAL",0)
!Global("JaheiraRomanceActive","GLOBAL",3)~ THEN DO ~SetGlobal("Work","LOCALS",1)
AddexperienceParty(5000)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXTERN JAHEIRAJ JaheiraSurlyRomanceComment
IF ~IsValidForPartyDialog("Jaheira")
OR(2)
Global("JaheiraRomanceActive","GLOBAL",0)
Global("JaheiraRomanceActive","GLOBAL",3)~ THEN DO ~SetGlobal("Work","LOCALS",1)
AddexperienceParty(5000)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXTERN JAHEIRAJ JaheiraSurlyNonRomanceComment
END
END

APPEND JAHEIRAJ
IF ~~ THEN BEGIN JaheiraSurlyNonRomanceComment
SAY @363
IF ~~ THEN DO ~LeaveParty()
Enemy()~ EXIT
IF ~IsValidForPartyDialog("Cernd")~ THEN DO ~LeaveParty()
Enemy()~ EXTERN CERNDJ CerndSurlyComment
IF ~IsValidForPartyDialog("Minsc")~ THEN DO ~LeaveParty()
Enemy()~ EXTERN MINSCJ MinscSurlyComment
END

IF ~~ THEN BEGIN JaheiraSurlyRomanceComment
SAY @364
IF ~~ THEN EXIT
IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN CERNDJ CerndSurlyComment
IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN MINSCJ MinscSurlyComment
END
END

APPEND MINSCJ
IF ~~ THEN BEGIN MinscSurlyComment
SAY @365
IF ~~ THEN DO ~LeaveParty()
Enemy()~ EXIT
IF ~IsValidForPartyDialog("Cernd")~ THEN DO ~LeaveParty()
Enemy()~ EXTERN CERNDJ CerndSurlyComment
END
END

APPEND CERNDJ
IF ~~ THEN BEGIN CerndSurlyComment
SAY @366
IF ~~ THEN DO ~TakePartyItem("misc8t")
LeaveParty()
EscapeArea()~ EXIT
END
END

APPEND SURLY
IF WEIGHT #-1 ~Global("Work","LOCALS",1)
!GlobalTimerExpired("D0Surly","LOCALS")~ THEN BEGIN SU_10
SAY @367
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("Work","LOCALS",1)
Global("Third","LOCALS",1)
GlobalTimerExpired("D0Surly","LOCALS")
RandomNum(3,1)~ THEN BEGIN SU_10
SAY @368
IF ~~ THEN REPLY @369 GOTO SU_6
IF ~~ THEN REPLY @370 GOTO SU_4
IF ~~ THEN REPLY @371 DO ~GiveGoldForce(130)~ GOTO SU_13
END

IF WEIGHT #-1 ~Global("Work","LOCALS",1)
Global("Third","LOCALS",1)
GlobalTimerExpired("D0Surly","LOCALS")
RandomNum(3,1)~ THEN BEGIN SU_10a
SAY @372
IF ~~ THEN REPLY @373 GOTO SU_14a
IF ~~ THEN REPLY @374 GOTO SU_6
IF ~~ THEN REPLY @370 GOTO SU_4
IF ~~ THEN REPLY @371 DO ~GiveGoldForce(100)~ GOTO SU_13
END

IF WEIGHT #-1 ~Global("Work","LOCALS",1)
Global("Third","LOCALS",1)
GlobalTimerExpired("D0Surly","LOCALS")
RandomNum(3,2)~ THEN BEGIN SU_11
SAY @375
IF ~~ THEN REPLY @376 GOTO SU_6
IF ~~ THEN REPLY @370 GOTO SU_4
IF ~~ THEN REPLY @377 DO ~GiveGoldForce(90)~ GOTO SU_13
END

IF WEIGHT #-1 ~Global("Work","LOCALS",1)
Global("Third","LOCALS",1)
GlobalTimerExpired("D0Surly","LOCALS")
RandomNum(3,2)~ THEN BEGIN SU_11a
SAY @378
IF ~~ THEN REPLY @373 GOTO SU_14b
IF ~~ THEN REPLY @376 GOTO SU_6
IF ~~ THEN REPLY @370 GOTO SU_4
IF ~~ THEN REPLY @377 DO ~GiveGoldForce(65)~ GOTO SU_13
END

IF WEIGHT #-1 ~Global("Work","LOCALS",1)
Global("Third","LOCALS",1)
GlobalTimerExpired("D0Surly","LOCALS")
RandomNum(3,3)~ THEN BEGIN SU_12
SAY @379
IF ~~ THEN REPLY @380 GOTO SU_6
IF ~~ THEN REPLY @370 GOTO SU_4
IF ~~ THEN REPLY @381 DO ~GiveGoldForce(150)~ GOTO SU_13
END

IF WEIGHT #-1 ~Global("Work","LOCALS",1)
Global("Third","LOCALS",1)
GlobalTimerExpired("D0Surly","LOCALS")
RandomNum(3,3)~ THEN BEGIN SU_12a
SAY @382
IF ~~ THEN REPLY @383 GOTO SU_14c
IF ~~ THEN REPLY @380 GOTO SU_6
IF ~~ THEN REPLY @370 GOTO SU_4
IF ~~ THEN REPLY @381 DO ~GiveGoldForce(110)~ GOTO SU_13
END

IF ~~ THEN BEGIN SU_13
SAY @384
IF ~~ THEN DO ~SetGlobal("Work","LOCALS",1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXIT
END

IF ~~ THEN BEGIN SU_14a
SAY @385
IF ~~ THEN REPLY @386 GOTO SU_6
IF ~~ THEN REPLY @387 DO ~GiveGoldForce(100)~ GOTO SU_13
IF ~~ THEN REPLY @388 DO ~GiveGoldForce(100)~ GOTO SU_15
IF ~~ THEN REPLY @389 GOTO SU_4
END

IF ~~ THEN BEGIN SU_14b
SAY @385
IF ~~ THEN REPLY @386 GOTO SU_6
IF ~~ THEN REPLY @387 DO ~GiveGoldForce(65)~ GOTO SU_13
IF ~~ THEN REPLY @388 DO ~GiveGoldForce(65)~ GOTO SU_15
IF ~~ THEN REPLY @389 GOTO SU_4
END

IF ~~ THEN BEGIN SU_14c
SAY @385
IF ~~ THEN REPLY @386 GOTO SU_6
IF ~~ THEN REPLY @387 DO ~GiveGoldForce(110)~ GOTO SU_13
IF ~~ THEN REPLY @388 DO ~GiveGoldForce(110)~ GOTO SU_15
IF ~~ THEN REPLY @389 GOTO SU_4
END

IF ~~ THEN BEGIN SU_15
SAY @390
IF ~~ THEN DO ~SetGlobal("Third","LOCALS",1)
SetGlobal("Work","LOCALS",1)
SetGlobalTimer("D0Surly","LOCALS",SEVEN_DAYS)~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE_TRIGGER_TEXT MAZZYJ ~See("surly")~ ~See("surly")
!Dead("surly")~

APPEND MAZZYJ
IF WEIGHT #-1 ~GlobalGT("GorfBystander","GLOBAL",2)
AreaCheck("ar0406")
Global("D0MazzySurly","LOCALS",0)
OR(2)
Dead("surly")
GlobalGT("D0Surly","GLOBAL",8)
Global("GorfMazzyTalk1","GLOBAL",1)
InParty("mazzy")
!Global("GorfBystander","GLOBAL",8)~ THEN BEGIN MAZ1
  SAY @391
  IF ~~ THEN DO ~SetGlobal("D0MazzySurly","LOCALS",1)~ EXIT
END

IF WEIGHT #-1 ~GlobalGT("GorfBystander","GLOBAL",2)
AreaCheck("ar0406")
GlobalGT("HendakReleased","AR0406",2)
See("hendak")
OR(2)
Dead("surly")
GlobalGT("D0Surly","GLOBAL",8)
Global("GorfMazzyTalk1","GLOBAL",1)
InParty("mazzy")
!Global("GorfBystander","GLOBAL",8)~ THEN BEGIN MAZ2
  SAY @392
  IF ~~ THEN DO ~SetGlobal("GorfMazzyTalk1","GLOBAL",2)~ EXTERN HENDAK MAZH1
END

IF WEIGHT #-1 ~GlobalGT("GorfBystander","GLOBAL",2)
AreaCheck("ar0406")
!GlobalGT("HendakReleased","AR0406",2)
See("lehtinan")
OR(2)
Dead("surly")
GlobalGT("D0Surly","GLOBAL",8)
Global("GorfMazzyTalk1","GLOBAL",1)
InParty("mazzy")
!Global("GorfBystander","GLOBAL",8)~ THEN BEGIN MAZ2
  SAY @392
  IF ~~ THEN DO ~SetGlobal("GorfMazzyTalk1","GLOBAL",2)~ EXTERN LEHTIN MAZH2
END
END

APPEND HENDAK
IF ~~ THEN BEGIN MAZH1
SAY @393
= @394
IF ~~ THEN DO ~ClearAllActions()
SetGlobal("GorfSurlyFight","AR0406",1)~ EXIT
END
END

APPEND LEHTIN
IF ~~ THEN BEGIN MAZH2
SAY @395
= @396
IF ~~ THEN DO ~ClearAllActions()
SetGlobal("GorfSurlyFight","AR0406",1)~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// SURLY RETURNS

APPEND SURLY
IF WEIGHT #-999 ~AreaCheck("ar0313")
Global("CerndSurlyReturns","GLOBAL",3)~ THEN BEGIN SurlyReturns0
SAY @397
IF ~~ THEN DO ~AddexperienceParty(1000)
EscapeArea()~ EXIT
END

IF WEIGHT #-999 ~AreaCheck("ar0313")
!Global("CerndSurlyReturns","GLOBAL",3)~ THEN BEGIN SurlyReturns1
SAY @398
IF ~~ THEN REPLY @399 DO ~SetGlobal("D0SurlyReturns","GLOBAL",1)~ GOTO SurlyReturns2
IF ~~ THEN REPLY @400 DO ~SetGlobal("D0SurlyReturns","GLOBAL",1)~ GOTO SurlyReturns3
IF ~OR(2)
!IsValidForPartyDialog("Cernd")
Global("CerndSurlyReturns","GLOBAL",1)
IsValidForPartyDialog("Minsc")
!Global("MinscSurlyReturns","GLOBAL",1)~ THEN DO ~SetGlobal("D0SurlyReturns","GLOBAL",1)~ EXTERN MINSCJ MinscSurlyReturns
IF ~IsValidForPartyDialog("Cernd")
!Global("CerndSurlyReturns","GLOBAL",1)~ THEN DO ~SetGlobal("D0SurlyReturns","GLOBAL",1)~ EXTERN CERNDJ CerndSurlyReturns
END

IF ~~ THEN BEGIN RespondToCernd
SAY @401
IF ~~ THEN REPLY @399 DO ~SetGlobal("D0SurlyReturns","GLOBAL",1)~ GOTO SurlyReturns2
IF ~~ THEN REPLY @400 GOTO SurlyReturns3
END

IF ~~ THEN BEGIN SurlyHatesMinsc2
SAY @402
IF ~~ THEN REPLY @403 DO ~SetGlobal("D0SurlyReturns","GLOBAL",1)~ GOTO SurlyReturns2
IF ~~ THEN REPLY @400 GOTO SurlyReturns3
END

IF ~~ THEN BEGIN SurlyHatesMinsc
SAY @404
IF ~~ THEN EXTERN MINSCJ MinscHatesSurly2
END

IF ~~ THEN BEGIN SurlyReturns2
SAY @405
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SurlyReturns3
SAY @406
IF ~~ THEN EXIT
END
END

APPEND MINSCJ
IF ~~ THEN BEGIN MinscSurlyReturns
SAY @407
IF ~~ THEN REPLY @408 DO ~SetGlobal("MinscSurlyReturns","GLOBAL",1)~ EXTERN SURLY SurlyHatesMinsc
IF ~~ THEN REPLY @409 DO ~SetGlobal("MinscSurlyReturns","GLOBAL",1)~ GOTO MinscHatesSurly
END

IF ~~ THEN BEGIN MinscHatesSurly
SAY @410
IF ~~ THEN EXTERN SURLY SurlyHatesMinsc2
END

IF ~~ THEN BEGIN MinscHatesSurly2
SAY @411
IF ~~ THEN DO ~ActionOverride("Surly",DisplayStringHead(Myself,@412))
ActionOverride("Surly",EscapeArea())
AddexperienceParty(1000)~ EXIT
END
END

APPEND CERNDJ
IF ~~ THEN BEGIN CerndSurlyReturns
SAY @413
IF ~IsValidForPartyDialog("Minsc")
!Global("MinscSurlyReturns","GLOBAL",1)~ THEN DO ~SetGlobal("CerndSurlyReturns","GLOBAL",1)~ EXTERN MINSCJ MinscSurlyReturns
IF ~OR(2)
!IsValidForPartyDialog("Minsc")
Global("MinscSurlyReturns","GLOBAL",1)~ THEN DO ~SetGlobal("CerndSurlyReturns","GLOBAL",1)~ EXTERN SURLY RespondToCernd
END
END

EXTEND_BOTTOM THUMB 0 6
IF ~Global("D0SurlyReturns","GLOBAL",1)
Exists("Surly")
!Dead("Surly")~ THEN REPLY @414 DO ~SetGlobal("D0SurlyReturns","GLOBAL",2)~ GOTO Thumb1
IF ~Global("D0SurlyReturns","GLOBAL",1)
OR(2)
!Exists("Surly")
Dead("Surly")~ THEN REPLY @415 DO ~SetGlobal("D0SurlyReturns","GLOBAL",2)~ GOTO Thumb1
END

APPEND THUMB
IF ~~ THEN BEGIN Thumb1
SAY @416
IF ~Dead("pirsea01")~ THEN REPLY @417 GOTO Thumb2
IF ~~ THEN REPLY @418 GOTO Thumb3
IF ~~ THEN REPLY @419 GOTO Thumb4
END

IF ~~ THEN BEGIN Thumb2
SAY @420
= @421
  IF ~Exists("Surly")
!Dead("Surly")~ THEN REPLY @422 GOTO Thumb5
  IF ~~ THEN REPLY #23581 /* ~Yes, I'd like a drink.~ */ GOTO 4
  IF ~Global("HiddenJob","GLOBAL",1)
Global("ThumbSeeker","GLOBAL",0)~ THEN REPLY #34724 /* ~I am a Seeker.~ */ DO ~SetGlobal("ThumbSeeker","GLOBAL",1)~ GOTO 7
  IF ~~ THEN REPLY #23583 /* ~No, actually, I'll be leaving again.~ */ GOTO 5
END

IF ~~ THEN BEGIN Thumb3
SAY @423
  IF ~~ THEN REPLY #23581 /* ~Yes, I'd like a drink.~ */ GOTO 4
  IF ~Global("HiddenJob","GLOBAL",1)
Global("ThumbSeeker","GLOBAL",0)~ THEN REPLY #34724 /* ~I am a Seeker.~ */ DO ~SetGlobal("ThumbSeeker","GLOBAL",1)~ GOTO 7
  IF ~~ THEN REPLY #23583 /* ~No, actually, I'll be leaving again.~ */ GOTO 5
END

IF ~~ THEN BEGIN Thumb4
SAY @424
  IF ~~ THEN REPLY #23581 /* ~Yes, I'd like a drink.~ */ GOTO 4
  IF ~Global("HiddenJob","GLOBAL",1)
Global("ThumbSeeker","GLOBAL",0)~ THEN REPLY #34724 /* ~I am a Seeker.~ */ DO ~SetGlobal("ThumbSeeker","GLOBAL",1)~ GOTO 7
  IF ~~ THEN REPLY #23583 /* ~No, actually, I'll be leaving again.~ */ GOTO 5
END

IF ~~ THEN BEGIN Thumb5
SAY @425
  IF ~~ THEN REPLY #23581 /* ~Yes, I'd like a drink.~ */ DO ~SetGlobal("D0SurlyReturns","GLOBAL",3)~ GOTO 4
  IF ~Global("HiddenJob","GLOBAL",1)
Global("ThumbSeeker","GLOBAL",0)~ THEN REPLY #34724 /* ~I am a Seeker.~ */ DO ~SetGlobal("D0SurlyReturns","GLOBAL",3)
SetGlobal("ThumbSeeker","GLOBAL",1)~ GOTO 7
  IF ~~ THEN REPLY #23583 /* ~No, actually, I'll be leaving again.~ */ DO ~SetGlobal("D0SurlyReturns","GLOBAL",3)~ GOTO 5
END
END
