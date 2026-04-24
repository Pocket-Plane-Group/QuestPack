BEGIN ~Besamen~

IF ~Global("SpokeToBesamen","GLOBAL",0)~ BesamenMeet
SAY @0
++ @1 DO ~SetGlobal("SpokeToBesamen","GLOBAL",1)~ GOTO BesamenIntroduce
++ @2 DO ~SetGlobal("SpokeToBesamen","GLOBAL",1)~ GOTO BesamenIntroduce
++ @3 DO ~SetGlobal("SpokeToBesamen","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ BesamenIntroduce
SAY @4
= @5
= @6
= @7
= @8
++ @9 GOTO BesamenStory
++ @10 GOTO BesamenStory
++ @11 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenAttack
SAY @13
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ BesamenStory
SAY @14
= @15
= @16
= @17
= @18
++ @19 GOTO BesamenRich
++ @20 GOTO BesamenGoodTimes
++ @21 GOTO BesamenRich2
++ @11 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenGoodTimes
SAY @22
++ @23 GOTO BesamenDeath
++ @11 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenRich
SAY @24
= @25
= @26
= @27
= @28
++ @29 DO ~SetGlobal("D0BesamenStory","GLOBAL",1)~ GOTO BesamenDeath
++ @20 DO ~SetGlobal("D0BesamenStory","GLOBAL",1)~ GOTO BesamenGoodTimes
++ @11 DO ~SetGlobal("D0BesamenStory","GLOBAL",1)~ GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenRich2
SAY @30
= @25
= @31
= @27
= @28
++ @29 GOTO BesamenDeath
++ @20 GOTO BesamenGoodTimes
++ @32 GOTO BesamenGreed
++ @11 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenGreed
SAY @33
= @34
= @35
= @36
= @37
= @38
= @39
++ @40 GOTO BesamenWhatToDo
++ @41 GOTO BesamenSune
++ @42 GOTO BesamenCurse
++ @43 GOTO BesamenCurse
++ @44 GOTO BesamenDunno
++ @11 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenDeath
SAY @45
= @35
= @36
= @37
= @38
= @39
++ @40 GOTO BesamenWhatToDo
++ @41 GOTO BesamenSune
++ @42 GOTO BesamenCurse
++ @43 GOTO BesamenCurse
++ @44 GOTO BesamenDunno
++ @11 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ BesamenWhatToDo
SAY @46
= @47
= @48
++ @49 GOTO BesamenFindBaisera
++ @50 GOTO BesamenFindBaisera
++ @51 GOTO BesamenForce
++ @52 GOTO BesamenCant
++ @53 GOTO BesamenAttack
END

IF ~~ THEN BEGIN BesamenCurse
SAY @54
++ @55 GOTO BesamenSune
++ @56 GOTO BesamenDunno
++ @57 GOTO BesamenBoring
++ @12 GOTO BesamenAttack
END

IF ~~ THEN BEGIN BesamenDunno
SAY @58
= @47
= @48
++ @49 GOTO BesamenFindBaisera
++ @50 GOTO BesamenFindBaisera
++ @51 GOTO BesamenForce
++ @52 GOTO BesamenCant
++ @53 GOTO BesamenAttack
END

IF ~~ BesamenSune
SAY @59
++ @60 GOTO BesamenSune2
++ @61 GOTO BesamenUgly
++ @62 GOTO BesamenBoring
++ @63 GOTO BesamenAttack
END

IF ~~ BesamenUgly
SAY @64
= @65
= @48
++ @49 GOTO BesamenFindBaisera
++ @50 GOTO BesamenFindBaisera
++ @51 GOTO BesamenForce
++ @52 GOTO BesamenCant
++ @53 GOTO BesamenAttack
END

IF ~~ BesamenSune2
SAY @66
= @48
++ @49 GOTO BesamenFindBaisera
++ @50 GOTO BesamenFindBaisera
++ @51 GOTO BesamenForce
++ @52 GOTO BesamenCant
++ @53 GOTO BesamenAttack
END

IF ~~ BesamenForce
SAY @67
++ @68 GOTO BesamenFindBaisera
++ @69 GOTO BesamenFindBaisera
++ @52 GOTO BesamenCant
++ @70 GOTO BesamenAttack
END

IF ~~ BesamenCant
SAY @71
++ @72 GOTO BesamenFindBaisera
++ @73 GOTO BesamenBoring
++ @74 GOTO BesamenAttack
END

IF ~~ BesamenFindBaisera
SAY @75
++ @76 DO ~SetGlobal("Findbaisera","GLOBAL",1)
SetGlobal("AskFindbaisera","LOCALS",1)~ GOTO BesamenByeBye
++ @77 DO ~SetGlobal("Findbaisera","GLOBAL",1)
SetGlobal("AskFindbaisera","LOCALS",1)~ GOTO BesamenByeBye
++ @78 GOTO BesamenBoring
++ @79 GOTO BesamenAttack
END

IF ~~ BesamenBoring
SAY @80
IF ~Global("D0BesamenStory","GLOBAL",1)
Global("Findbaisera","GLOBAL",0)~ THEN DO ~SetGlobal("AskFindbaisera","LOCALS",0)
AddJournalEntry(@153,QUEST)~ EXIT
IF ~OR(2)
Global("D0BesamenStory","GLOBAL",0)
GlobalGT("Findbaisera","GLOBAL",0)~ THEN DO ~SetGlobal("AskFindbaisera","LOCALS",0)~ EXIT
END

IF ~~ BesamenByeBye
SAY @81
IF ~~ THEN DO ~AddJournalEntry(@154,QUEST)~ EXIT
END

IF ~Global("SpokeToBesamen","GLOBAL",1)
Global("AskFindbaisera","LOCALS",0)~ BesamenPondering
SAY @82
= @83
IF ~~ THEN EXIT
END

IF ~Global("SpokeToBesamen","GLOBAL",1)
GlobalGT("AskFindbaisera","LOCALS",0)~ BesamenPondering
SAY @84
IF ~OR(2)
!Dead("Baisera")
!GlobalGT("FindBaisera","GLOBAL",1)~ THEN REPLY @85 GOTO BesamenByeBye
IF ~Dead("Baisera")
GlobalGT("FindBaisera","GLOBAL",1)~ THEN REPLY @86 GOTO BesamenSMASH
IF ~~ THEN REPLY @87 GOTO BesamenBoring
END

IF ~~ THEN BEGIN BesamenSMASH
SAY @88
IF ~~ THEN REPLY @89 GOTO BesamenSMASH2
IF ~~ THEN REPLY @90 GOTO BesamenSMASH2
END

IF ~~ THEN BEGIN BesamenSMASH2
SAY @91
IF ~~ THEN DO ~Enemy()~ EXIT
END

EXTEND_BOTTOM SHOP01 0
IF ~GlobalLT("D0MiraToldBaisera","GLOBAL",3)
OR(2)
Global("FindBaisera","GLOBAL",1)
Global("D0BesamenStory","GLOBAL",1)~ THEN REPLY @92 GOTO MiraBaisera
END

EXTEND_BOTTOM SHOP01 10
IF ~GlobalLT("D0MiraToldBaisera","GLOBAL",3)
OR(2)
Global("FindBaisera","GLOBAL",1)
Global("D0BesamenStory","GLOBAL",1)~ THEN REPLY @92 GOTO MiraBaisera
END

APPEND SHOP01
IF WEIGHT #-1 ~Global("D0MiraToldBaisera","GLOBAL",2)~ MiraCheersBruv
SAY @147
IF ~~ THEN DO ~SetGlobal("D0MiraToldBaisera","GLOBAL",3)~ GOTO MiraCheersBruv2
END

IF ~~ THEN BEGIN MiraCheersBruv2
SAY @148
COPY_TRANS SHOP01 10
END

IF ~~ MiraBaisera
SAY @93
++ @94 GOTO MiraBaisera2
++ @95 EXIT
END

IF ~~ MiraBaisera2
SAY @96
++ @97 DO ~SetGlobal("FindBaisera","GLOBAL",2)
SetGlobal("D0MiraToldBaisera","GLOBAL",1)
AddJournalEntry(@155,QUEST)~ GOTO MiraBaisera3
END

IF ~~ MiraBaisera3
SAY @98
IF ~~ THEN EXIT
END
END

BEGIN ~Baisera~

IF ~NumTimesTalkedTo(0)
!AreaCheck("ar0811")~ BaiseraMeet
SAY @99
= @100
IF ~!Dead("Besamen")
OR(2)
Global("D0BesamenStory","GLOBAL",1)
GlobalGT("FindBaisera","GLOBAL",0)~ THEN REPLY @101 DO ~SetGlobal("FindBaisera","GLOBAL",3)~ GOTO BaiseraNews
IF ~Dead("Besamen")
OR(2)
Global("D0BesamenStory","GLOBAL",1)
GlobalGT("FindBaisera","GLOBAL",0)~ THEN REPLY @102 DO ~SetGlobal("FindBaisera","GLOBAL",3)~ GOTO BaiseraNews
IF ~OR(2)
Global("D0BesamenStory","GLOBAL",1)
GlobalGT("FindBaisera","GLOBAL",0)~ THEN REPLY @103 GOTO BaiseraIgnore
IF ~!Global("D0BesamenStory","GLOBAL",1)
!GlobalGT("FindBaisera","GLOBAL",0)~ THEN EXIT
END

IF ~!NumTimesTalkedTo(0)
!AreaCheck("ar0811")~ BaiseraMeet
SAY @99
IF ~OR(2)
Global("D0BesamenStory","GLOBAL",1)
GlobalGT("FindBaisera","GLOBAL",0)~ THEN REPLY @101 DO ~SetGlobal("FindBaisera","GLOBAL",3)~ GOTO BaiseraNews
IF ~OR(2)
Global("D0BesamenStory","GLOBAL",1)
GlobalGT("FindBaisera","GLOBAL",0)~ THEN REPLY @103 GOTO BaiseraIgnore
IF ~!Global("D0BesamenStory","GLOBAL",1)
!GlobalGT("FindBaisera","GLOBAL",0)~ THEN EXIT
END

IF ~~ BaiseraNews
SAY @104
= @105
+ ~!Dead("Besamen")~ + @106 GOTO BaiseraBesamenAlive
+ ~Dead("Besamen")~ + @107 GOTO BaiseraBesamenAlive
+ ~Dead("Besamen")~ + @108 GOTO BaiseraBesamenKilled
++ @103 GOTO BaiseraIgnore
END

IF WEIGHT #-1 ~Global("D0BesamenTaunt","LOCALS",1)
!AreaCheck("ar0811")~ THEN BEGIN BaiseraBesamenKilled
SAY @109
IF ~~ THEN DO ~SetGlobal("D0BesamenTaunt","LOCALS",1)~ EXIT
END

IF ~~ BaiseraBesamenAlive
SAY @110
++ @111 GOTO BaiseraBesamenKilled
++ @112 GOTO BaiseraBlessing
++ @113 GOTO BaiseraIgnore
END

IF ~~ BaiseraBlessing
SAY @114
+ ~!Dead("Besamen")~ + @115 GOTO BaiseraCrypt
+ ~Dead("Besamen")~ + @116 GOTO BaiseraBesamenKilled
++ @117 GOTO BaiseraCrypt
++ @103 GOTO BaiseraIgnore
END

IF ~~ BaiseraCrypt
SAY @118
++ @119 GOTO BaiseraLeave
++ @120 GOTO BaiseraLeave
++ @103 GOTO BaiseraIgnore
END

IF ~~ BaiseraIgnore
SAY @121
IF ~~ THEN EXIT
END

IF ~~ BaiseraLeave
SAY @122
IF ~~ THEN DO ~SetGlobal("BaiseraCrypt","GLOBAL",1)
AddJournalEntry(@156,QUEST)
EscapeArea()~ EXIT
END

IF ~Global("BaiseraSpeaks","GLOBAL",1)
!Dead("Besamen")~ BaiseraInCrypt
SAY @123
++ @124 DO ~SetGlobal("BaiseraSpeaks","GLOBAL",2)~ EXTERN besamen BesamenBaiseraCrypt
++ @125 DO ~SetGlobal("BaiseraSpeaks","GLOBAL",2)~ EXTERN besamen BesamenBaiseraCrypt
END

IF ~Global("BaiseraSpeaks","GLOBAL",1)
Dead("Besamen")~ BaiseraInCrypt2
SAY @126
IF ~~ THEN DO ~SetGlobal("D0BesamenTaunt","LOCALS",2)
Enemy()~ EXIT
END

IF ~OR(2)
Global("BesamenDead","GLOBAL",1)
Global("BesamenDead","GLOBAL",2)~ BesamenDead
SAY @127
+ ~Global("D0MiraToldBaisera","GLOBAL",1)~ + @128 DO ~SetGlobal("D0MiraToldBaisera","GLOBAL",2)~ GOTO BaiseraBye
+ ~!Global("D0MiraToldBaisera","GLOBAL",1)~ + @1282 GOTO BaiseraBye
++ @129 GOTO BaiseraBye2
END

IF ~~ BaiseraBye
SAY @130
+ ~PartyGoldGT(499)~ + @131 GOTO BaiseraByeX2
++ @132 GOTO BaiseraByeX
++ @133 GOTO BaiseraByeX
++ @134 GOTO BaiseraByeX
END

IF ~~ BaiseraByeX
SAY @135
IF ~~ THEN DO ~ReputationInc(1) AddexperienceParty(10000)
EraseJournalEntry(@156)
EraseJournalEntry(@155)
EraseJournalEntry(@154)
EraseJournalEntry(@153)
AddJournalEntry(@157,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ BaiseraByeX2
SAY @136
= @137
IF ~~ THEN DO ~TakePartyGold(500) ReputationInc(1) IncrementGlobal("D0Change","GLOBAL",1) AddexperienceParty(10000)
EraseJournalEntry(@156)
EraseJournalEntry(@155)
EraseJournalEntry(@154)
EraseJournalEntry(@153)
AddJournalEntry(@157,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ BaiseraBye2
SAY @138
IF ~~ THEN DO ~ReputationInc(1) AddexperienceParty(10000)
EraseJournalEntry(@156)
EraseJournalEntry(@155)
EraseJournalEntry(@154)
EraseJournalEntry(@153)
AddJournalEntry(@157,QUEST_DONE)
EscapeArea()~ EXIT
END

CHAIN IF ~Global("BaiseraCrypt","GLOBAL",2)~ THEN besamen BesamenBaiseraCrypt
@139
== Baisera @140
== Besamen @141
== Baisera @142
== Baisera @143
== Besamen @144
== Baisera @145
== Besamen @146
END
IF ~~ THEN DO ~ActionOverride("Besamen",Kill(Myself)) SetGlobal("BesamenDead","GLOBAL",1)~ EXIT

EXTEND_BOTTOM SHOP04 0 2 4
IF ~Global("EngeBesamen","LOCALS",0)
GlobalGT("D0BesamenStory","GLOBAL",0)~ THEN REPLY @149 DO ~SetGlobal("EngeBesamen","LOCALS",1)~ GOTO Enge1
END

APPEND SHOP04
IF ~~ THEN BEGIN Enge1
SAY @150
  IF ~~ THEN REPLY @151 GOTO 3
  IF ~~ THEN REPLY @152 GOTO 1
END
END
