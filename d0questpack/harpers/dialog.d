/* EXTEND_BOTTOM TOWNC01 0 3 6 10 16 27 33 39 45 51 56 62 68 73 78 83 90 93 99 102
IF ~AreaCheck("ar0300")
GlobalGT("LyrosJob","GLOBAL",0)
Global("D0HarpersInDocks","LOCALS",0)
GlobalLT("HarperJob","GLOBAL",2)~ THEN REPLY ~Did you know, there's a secret Harper hideout right here in the Docks? It's the orange building by the quay.~ DO ~SetGlobal("D0RylockAngry","AR0300",1)
SetGlobal("D0HarpersInDocks","LOCALS",1)
SetGlobalTimer("D0HarperCrierRevenge","GLOBAL",ONE_DAY)~ GOTO HarperPlot
END

APPEND TOWNC01
IF ~~ THEN BEGIN HarperPlot
SAY ~A Harper plot, right here in Athkatla? That's news indeed! Hear ye, hear ye!~
IF ~IsValidForPartyDialogue("Jaheira")~ THEN EXTERN JAHEIRAJ NotTooHappy
IF ~!IsValidForPartyDialogue("Jaheira")~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0HarpersInDocks","LOCALS",1)
Global("D0HarperCrierRevenge2","GLOBAL",0)
RandomNum(3,1)~ THEN BEGIN HarperPlot2
SAY ~Good day and good business! Harpers word of the day today! What action will the Council take against the secret organization?~
IF ~~ THEN DO ~SetGlobal("D0HarpersInDocks","LOCALS",2)~ EXIT
END
END

APPEND JAHEIRAJ
IF ~~ THEN BEGIN NotTooHappy
SAY ~<CHARNAME>, what have you done? The Harpers will be angered at such rumourmongering, as am I. No doubt they will handle the situation appropriately, but I will not tolerate such lack of prudence. Goodbye.~
IF ~GlobalGT("D0JahShaz","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@165)
TakePartyItem("sw1h50")
LeaveParty()
EscapeArea()~ EXIT
IF ~!GlobalGT("D0JahShaz","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@165)
LeaveParty()
EscapeArea()~ EXIT
END
END

APPEND RYLOCK
IF WEIGHT #-1 ~Global("D0RylockAngry","AR0300",1)~ THEN BEGIN ANGRYRumours
SAY ~You have made a mistake, <CHARNAME>. Telling others of our whereabouts is not welcome, and you will be dealt with.~
IF ~~ THEN DO ~SetGlobal("D0RylockAngry","AR0300",2)~ EXIT
END
END

BEGIN D0QPHAR1
IF ~NumTimesTalkedTo(0)~ THEN BEGIN HarperRevengeRandom
SAY ~Know that the Harpers do not appreciate the spreading of rumours about their affairs. The crier will remain silent, and let this serve as a warning to you.~
IF ~~ THEN EXIT
END */

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND JAHEIRAJ

IF WEIGHT #-1 ~GlobalGT("D0Harpers","GLOBAL",3)
InParty(Myself)~ THEN BEGIN PROTEST_1
  SAY @0
  IF ~~ THEN DO ~LeaveParty()
SetGlobal("NPCFight","LOCALS",1)
ChangeAIScript("wtarsgt",DEFAULT)
ChangeAIScript("druidx",SPECIFICS)
ChangeAIScript("useitem",GENERAL)
SetDialog("")
Enemy()~ EXIT
END

IF WEIGHT #-2 ~Global("D0JahShaz","GLOBAL",5)
GlobalTimerExpired("D0NotGoingBernard","LOCALS")
CombatCounter(0)
InParty(Myself)
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ BEGIN JA_SHAZ_COMPLAIN_1
SAY @1
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",6)
SetGlobalTimer("D0NotGoingBernard","LOCALS",TWO_DAYS)~ EXIT
END

IF WEIGHT #-2 ~Global("D0JahShaz","GLOBAL",6)
GlobalTimerExpired("D0NotGoingBernard","LOCALS")
!HasItem("sw1h50",Myself)
CombatCounter(0)
InParty(Myself)
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ BEGIN JA_SHAZ_COMPLAIN_2
SAY @2
IF ~!Global("JaheiraRomanceActive","GLOBAL",3)
!Global("JaheiraRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",4)
SetGlobalTimer("D0JahShazTimer","GLOBAL",SIX_DAYS)
SetGlobal("JaheiraRomanceActive","GLOBAL",3)
EraseJournalEntry(@165)
LeaveParty()
EscapeArea()~ EXIT
IF ~OR(2)
Global("JaheiraRomanceActive","GLOBAL",3)
Global("JaheiraRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",4)
SetGlobalTimer("D0JahShazTimer","GLOBAL",FIVE_DAYS)
EraseJournalEntry(@165)
LeaveParty()
EscapeArea()~ EXIT
END

IF WEIGHT #-2 ~Global("D0JahShaz","GLOBAL",6)
GlobalTimerExpired("D0NotGoingBernard","LOCALS")
HasItem("sw1h50",Myself)
CombatCounter(0)
InParty(Myself)
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ BEGIN JA_SHAZ_COMPLAIN_2a
SAY @3
IF ~!Global("JaheiraRomanceActive","GLOBAL",3)
!Global("JaheiraRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",4)
SetGlobal("JaheiraRomanceActive","GLOBAL",3)
EraseJournalEntry(@165)
LeaveParty()
TakePartyItem("sw1h50")
EscapeArea()~ EXIT
IF ~OR(2)
Global("JaheiraRomanceActive","GLOBAL",3)
Global("JaheiraRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",4)
EraseJournalEntry(@165)
LeaveParty()
TakePartyItem("sw1h50")
EscapeArea()~ EXIT
END

IF WEIGHT #-2 ~PartyHasItemIdentified("sw1h50")
!HasItem("sw1h50",Myself)
Global("D0JahShaz","GLOBAL",3)
!AreaCheck("ar0407")
!AreaCheckObject("ar0407",Myself)
!AreaCheckObject("ar0407",Player1)
!Dead("Bernard")
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN BEGIN JA_SHAZ_1
SAY @4
IF ~~ THEN GOTO JS_2
END

IF WEIGHT #-2 ~PartyHasItemIdentified("sw1h50")
HasItem("sw1h50",Myself)
Global("D0JahShaz","GLOBAL",3)
!AreaCheck("ar0407")
!AreaCheckObject("ar0407",Myself)
!AreaCheckObject("ar0407",Player1)
!Dead("Bernard")
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN BEGIN JA_SHAZ_2
SAY @5
IF ~~ THEN GOTO JS_2
END

IF WEIGHT #-1 ~PartyHasItem("sw1h50")
!HasItem("sw1h50",Myself)
Global("D0JahShaz","GLOBAL",3)
!AreaCheck("ar0407")
!AreaCheckObject("ar0407",Myself)
!AreaCheckObject("ar0407",Player1)
!Dead("Bernard")
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN BEGIN JA_SHAZ_3
SAY @6
= @7
IF ~~ THEN GOTO JS_2
END

IF WEIGHT #-1 ~PartyHasItem("sw1h50")
HasItem("sw1h50",Myself)
Global("D0JahShaz","GLOBAL",3)
!AreaCheck("ar0407")
!AreaCheckObject("ar0407",Myself)
!AreaCheckObject("ar0407",Player1)
!Dead("Bernard")
OR(2)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)~ THEN BEGIN JA_SHAZ_4
SAY @8
= @7
IF ~~ THEN GOTO JS_2
END

IF ~~ THEN BEGIN JS_2
SAY @9
IF ~~ THEN GOTO JS_3
END

IF ~~ THEN BEGIN JS_3
SAY @10
IF ~~ THEN REPLY @11 GOTO JS_4
IF ~~ THEN REPLY @12 GOTO JS_6
IF ~~ THEN REPLY @13 GOTO JS_5
END

IF ~~ THEN BEGIN JS_4
SAY @14
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",5)
SetGlobalTimer("D0NotGoingBernard","LOCALS",TWO_DAYS)
AddJournalEntry(@165,QUEST)~ EXIT
END

IF ~~ THEN BEGIN JS_5
SAY @15
IF ~!Global("JaheiraRomanceActive","GLOBAL",3)
!Global("JaheiraRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",4)
SetGlobalTimer("D0JahShazTimer","GLOBAL",SIX_DAYS)
SetGlobal("JaheiraRomanceActive","GLOBAL",3)
LeaveParty()
EscapeArea()~ EXIT
IF ~OR(2)
Global("JaheiraRomanceActive","GLOBAL",3)
Global("JaheiraRomanceActive","GLOBAL",0)~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",4)
SetGlobalTimer("D0JahShazTimer","GLOBAL",FIVE_DAYS)
LeaveParty()
EscapeArea()~ EXIT
END

// D0JahShaz at 4 = Jaheira coming back with reinforcements.
// D0JahShaz at 5/6 = Taking it to Bernard.

IF ~~ THEN BEGIN JS_6
SAY @16
IF ~~ THEN REPLY @11 GOTO JS_4
IF ~OR(2)
CheckStatGT(Player1,15,WIS)
CheckStatGT(Player1,15,INT)~ THEN REPLY @17 GOTO JS_7
IF ~~ THEN REPLY @18 GOTO JS_5
END

IF ~~ THEN BEGIN JS_7
SAY @19
IF ~~ THEN REPLY @11 GOTO JS_4
IF ~~ THEN REPLY @18 GOTO JS_5
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0JAHREV
IF ~NumTimesTalkedTo(0)~ THEN BEGIN JaheiraRevenge1
SAY @20
IF ~~ THEN REPLY @21 GOTO JaheiraRevenge2
IF ~~ THEN REPLY @22 GOTO JaheiraRevenge3
IF ~~ THEN REPLY @23 GOTO JaheiraRevenge4
IF ~~ THEN REPLY @24 GOTO JaheiraRevenge5
END

IF ~~ THEN BEGIN JaheiraRevenge2
SAY @25
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",11)
IncrementGlobal("D0Change","GLOBAL",-1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN JaheiraRevenge3
SAY @26
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",12)
TakePartyItem("sw1h50")
GiveGoldForce(3000)
AddExperienceParty(10000)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JaheiraRevenge4
SAY @27
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",12)
TakePartyItem("sw1h50")
GiveGoldForce(3000)
AddExperienceParty(10000)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JaheiraRevenge5
SAY @28
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",11)
IncrementGlobal("D0Change","GLOBAL",-1)
Enemy()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

INTERJECT BERNARD 0 D0JaheiraBernardShaz
== JAHEIRAJ IF ~InParty("Jaheira")
OR(2)
Global("D0JahShaz","GLOBAL",5)
Global("D0JahShaz","GLOBAL",6)~ THEN @29
END BERNARD JAHSHAZ_1

INTERJECT BERNARD 22 D0JaheiraBernardShaz
== JAHEIRAJ IF ~InParty("Jaheira")
OR(2)
Global("D0JahShaz","GLOBAL",5)
Global("D0JahShaz","GLOBAL",6)~ THEN @29
END BERNARD JAHSHAZ_1

INTERJECT BERNARD 30 D0JaheiraBernardShaz
== JAHEIRAJ IF ~InParty("Jaheira")
OR(2)
Global("D0JahShaz","GLOBAL",5)
Global("D0JahShaz","GLOBAL",6)~ THEN @29
END BERNARD JAHSHAZ_1

INTERJECT BERNARD 37 D0JaheiraBernardShaz
== JAHEIRAJ IF ~InParty("Jaheira")
OR(2)
Global("D0JahShaz","GLOBAL",5)
Global("D0JahShaz","GLOBAL",6)~ THEN @29
END BERNARD JAHSHAZ_1

APPEND BERNARD
IF ~~ THEN BEGIN JAHSHAZ_1
SAY @30
IF ~~ THEN REPLY @31 DO ~TakePartyItem("sw1h50")~ GOTO JAHSHAZ_2
IF ~~ THEN REPLY @32 EXTERN JAHEIRAJ JS_5
END

IF ~~ THEN BEGIN JAHSHAZ_4
SAY @33
COPY_TRANS BERNARD 24
END
END

CHAIN
IF ~~ THEN BERNARD JAHSHAZ_2
@34
== JAHEIRAJ @35
== BERNARD @36
== JAHEIRAJ @37
== BERNARD @38
= @39
== BERNARD IF ~NumInPartyAliveGT(2)~ THEN @40
== BERNARD IF ~!NumInPartyAliveGT(2)~ THEN @41
END JAHEIRAJ JAHSHAZ_3

APPEND JAHEIRAJ
IF ~~ THEN BEGIN JAHSHAZ_3
SAY @42
IF ~~ THEN DO ~SetGlobal("D0JahShaz","GLOBAL",7)
SetGlobal("BernardTalkedToJaheira","GLOBAL",1)
EraseJournalEntry(@165)
AddJournalEntry(@166,QUEST_DONE)
GiveGoldForce(3000)
AddExperienceParty(12500)
DestroyItem("sw1h50")~ EXTERN BERNARD JAHSHAZ_4
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM RYLOCK 2
  IF ~~ THEN REPLY @43 GOTO RY_1
END

EXTEND_BOTTOM RYLOCK 5
  IF ~~ THEN REPLY @44 GOTO RY_1
END

EXTEND_BOTTOM RYLOCK 8
  IF ~~ THEN REPLY @45 GOTO RY_1
END

EXTEND_BOTTOM RYLOCK 9
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY @46 GOTO RY_2
END

APPEND RYLOCK

IF ~~ THEN BEGIN RY_1
  SAY @47
  IF ~~ THEN REPLY @48 GOTO RY_3
  IF ~~ THEN REPLY @49 GOTO RY_3
  IF ~~ THEN REPLY @50 GOTO RY_4
  IF ~~ THEN REPLY @51 GOTO RY_4
END

IF ~~ THEN BEGIN RY_2
  SAY @52
  IF ~~ THEN REPLY @53 GOTO RY_5
  IF ~~ THEN REPLY @54 GOTO RY_6
  IF ~~ THEN REPLY @55 GOTO RY_7
END

IF ~~ THEN BEGIN RY_3
  SAY @56
  IF ~~ THEN REPLY @53 GOTO RY_5
  IF ~~ THEN REPLY @57 GOTO RY_6
  IF ~~ THEN REPLY @55 GOTO RY_7
END

IF ~~ THEN BEGIN RY_4
  SAY @58
  IF ~~ THEN REPLY @59 GOTO RY_3
  IF ~~ THEN REPLY @60 GOTO 6
END

IF ~~ THEN BEGIN RY_5
  SAY @61
  IF ~~ THEN REPLY #22882 /* ~What sort of 'small task' are you talking about?~ */ GOTO 18
  IF ~~ THEN REPLY #22883 /* ~Sorry.  Either you let me in, now, or I tell everyone about your existence, here.~ */ GOTO 20
  IF ~~ THEN REPLY #22884 /* ~Bringing your friend wasn't enough?  Forget it.  I'm not interested.~ */ GOTO 21
END

IF ~~ THEN BEGIN RY_6
  SAY @62
  IF ~~ THEN REPLY #22882 /* ~What sort of 'small task' are you talking about?~ */ GOTO 18
  IF ~~ THEN REPLY #22883 /* ~Sorry.  Either you let me in, now, or I tell everyone about your existence, here.~ */ GOTO 20
  IF ~~ THEN REPLY #22884 /* ~Bringing your friend wasn't enough?  Forget it.  I'm not interested.~ */ GOTO 21
END

IF ~~ THEN BEGIN RY_7
  SAY @63
  IF ~~ THEN REPLY #22882 /* ~What sort of 'small task' are you talking about?~ */ GOTO 18
  IF ~~ THEN REPLY #22883 /* ~Sorry.  Either you let me in, now, or I tell everyone about your existence, here.~ */ GOTO 20
  IF ~~ THEN REPLY #22884 /* ~Bringing your friend wasn't enough?  Forget it.  I'm not interested.~ */ GOTO 21
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM BERINVAR 0
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO BE_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO BE_2
END

EXTEND_BOTTOM BERINVAR 1
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO BE_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO BE_2
END

EXTEND_BOTTOM BERINVAR 2
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 UNSOLVED_JOURNAL #47866 GOTO BE_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 UNSOLVED_JOURNAL #47866 GOTO BE_2
END

EXTEND_BOTTOM BERINVAR 5
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO BE_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO BE_2
END

EXTEND_BOTTOM BERINVAR 8
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO BE_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO BE_2
END

APPEND BERINVAR

IF ~~ THEN BEGIN BE_1
  SAY @66
  IF ~~ THEN REPLY #22977 /* ~I notice you're all wearing the same necklace here.  Is there a purpose to that?~ */ GOTO 1
  IF ~~ THEN REPLY #22981 /* ~What's so dangerous about the second floor?~ */ GOTO 2
  IF ~~ THEN REPLY #42552 /* ~What can you tell me of the Shadow Thieves here in the city?~ */ GOTO 5
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY #42553 /* ~I'm searching for a friend who has been taken by the Cowled Wizards... do you know anything about this?~ */ GOTO 6
  IF ~~ THEN REPLY #22980 /* ~No, I don't think so.~ */ GOTO 3
END

IF ~~ THEN BEGIN BE_2
  SAY @67
  IF ~!Name("Jaheira",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",7)
SetGlobal("AttackFirstHarpers","GLOBAL",1)
Enemy()~ EXIT
  IF ~OR(2)
Name("Jaheira",LastTalkedToBy(Myself))
IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",7)
SetGlobal("AttackFirstHarpers","GLOBAL",1)
Enemy()~ EXTERN JAHEIRAJ PROTEST_1
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM PACE 0
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO PA_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO PA_2
END

EXTEND_BOTTOM PACE 1
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO PA_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO PA_2
END

EXTEND_BOTTOM PACE 2
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO PA_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO PA_2
END

EXTEND_BOTTOM PACE 14
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO PA_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO PA_2
END

EXTEND_BOTTOM PACE 15
  IF ~Global("D0Harpers","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @64 GOTO PA_1
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO PA_2
END

APPEND PACE

IF ~~ THEN BEGIN PA_1
  SAY @68
  IF ~~ THEN REPLY @69 GOTO 1
  IF ~~ THEN REPLY #42537 /* ~Hmm.  Been with the Harpers long?~ */ GOTO 2
  IF ~~ THEN REPLY #42530 /* ~Perhaps you could tell me something about the Shadow Thieves in the city.~ */ GOTO 12
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY #42531 /* ~I'm searching for a friend of mine who has been captured by the Cowled Wizards... do you know anything of them?~ */ GOTO 15
  IF ~~ THEN REPLY #23313 /* ~A bit young, aren't you? For this type of work, I mean.~ */ GOTO 4
  IF ~~ THEN REPLY @70 GOTO 3
END

IF ~~ THEN BEGIN PA_2
  SAY @71
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM MERONIA 0
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 3
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 5
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 7
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 8
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 9
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 UNSOLVED_JOURNAL #47866 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 UNSOLVED_JOURNAL #47866 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 UNSOLVED_JOURNAL #47866 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 10
  IF ~OR(4)
Dead("Jaheira")
!InParty("Jaheira")
!See("Jaheira")
StateCheck("Jaheira",STATE_SLEEPING)
Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~OR(4)
Dead("Jaheira")
!InParty("Jaheira")
!See("Jaheira")
StateCheck("Jaheira",STATE_SLEEPING)
Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~OR(4)
Dead("Jaheira")
!InParty("Jaheira")
!See("Jaheira")
StateCheck("Jaheira",STATE_SLEEPING)
Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~OR(4)
Dead("Jaheira")
!InParty("Jaheira")
!See("Jaheira")
StateCheck("Jaheira",STATE_SLEEPING)
Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~OR(4)
Dead("Jaheira")
!InParty("Jaheira")
!See("Jaheira")
StateCheck("Jaheira",STATE_SLEEPING)
Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 15
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

EXTEND_BOTTOM MERONIA 19
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",0)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",1)~ THEN REPLY @73 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",2)~ GOTO THE_REAL_ME_1a
  IF ~Global("D0Harpers","GLOBAL",0)
Global("D0GotMontaron","GLOBAL",1)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")
Global("D0WarnedHarpersButNotBetray","GLOBAL",0)~ THEN REPLY @72 GOTO ME_1a
  IF ~Global("D0Harpers","GLOBAL",1)
Dead("Lyros")~ THEN REPLY @74 GOTO ME_9
  IF ~Global("D0Harpers","GLOBAL",6)
!PartyHasItem("misc5u")
!PartyHasItem("d0misc5u")~ THEN REPLY @65 GOTO ME_10
END

APPEND MERONIA

IF ~~ THEN BEGIN ME_1
SAY @75
IF ~~ THEN REPLY @76 GOTO THE_REAL_ME_1a
IF ~~ THEN REPLY @77 GOTO THE_REAL_ME_2
IF ~~ THEN REPLY @78 GOTO THE_REAL_ME_1_TWO_PART_C_BETA_TWELVE
IF ~~ THEN REPLY @79 GOTO 6
END

IF ~~ THEN BEGIN THE_REAL_ME_1a
SAY @80
IF ~~ THEN REPLY @81 GOTO THE_REAL_ME_1b
IF ~~ THEN REPLY @82 DO ~SetGlobal("D0WarnedHarpersButNotBetray","GLOBAL",1)~ GOTO THE_REAL_ME_1
END

IF ~~ THEN BEGIN THE_REAL_ME_1
SAY @83
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN THE_REAL_ME_1b
  SAY @84
     =
      @85
  IF ~~ THEN REPLY @86 GOTO ME_5
  IF ~~ THEN REPLY @87 GOTO ME_3
  IF ~~ THEN REPLY @88 GOTO ME_2
END

IF ~~ THEN BEGIN THE_REAL_ME_2
  SAY @89
  IF ~~ THEN REPLY #23051 /* ~Could you perhaps tell me a little about the Harpers?~ */ GOTO 1
  IF ~~ THEN REPLY #23052 /* ~Who are you and what do you do here?~ */ GOTO 3
  IF ~~ THEN REPLY #23053 /* ~What is this place?~ */ GOTO 4
  IF ~GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)
Global("tptImoenDead","GLOBAL",0)~ THEN REPLY #42573 /* ~A friend of mine has been captured by the Cowled Wizards... do you have any information on them?~ */ GOTO 11
  IF ~~ THEN REPLY #42574 /* ~What do you know about the Shadow Thieves?~ */ GOTO 16
  IF ~~ THEN REPLY @90 GOTO 6
END

IF ~~ THEN BEGIN THE_REAL_ME_1_TWO_PART_C_BETA_TWELVE
SAY @91
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ME_1a
  SAY @92
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ME_2
  SAY @93
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ME_3
  SAY @94
  IF ~~ THEN REPLY @95 GOTO ME_4
  IF ~~ THEN REPLY @88 GOTO ME_2
END

IF ~~ THEN BEGIN ME_4
  SAY @96
  IF ~~ THEN DO ~GiveItemCreate("d0bird",LastTalkedToBy(Myself),1,0,0)
AddexperienceParty(20000)
SetGlobal("D0Harpers","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN ME_5
  SAY @97
     =
      @98
  IF ~~ THEN REPLY @99 DO ~GiveItemCreate("misc5e",LastTalkedToBy(Myself),1,0,0)~ GOTO ME_6
  IF ~~ THEN REPLY @100 DO ~GiveItemCreate("misc5e",LastTalkedToBy(Myself),1,0,0)~ GOTO ME_7
  IF ~~ THEN REPLY @101 DO ~GiveItemCreate("misc5e",LastTalkedToBy(Myself),1,0,0)~ GOTO ME_8
  IF ~~ THEN REPLY @102 DO ~GiveItemCreate("misc5e",LastTalkedToBy(Myself),1,0,0)~ GOTO ME_7
END

IF ~~ THEN BEGIN ME_6
  SAY @103
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN ME_7
  SAY @104
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN ME_8
  SAY @105
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN ME_9
  SAY @106
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN ME_10
  SAY @107
  IF ~!Name("Jaheira",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",7)
SetGlobal("AttackFirstHarpers","GLOBAL",1)
Enemy()~ EXIT
  IF ~OR(2)
Name("Jaheira",LastTalkedToBy(Myself))
IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",7)
SetGlobal("AttackFirstHarpers","GLOBAL",1)
Enemy()~ EXTERN JAHEIRAJ PROTEST_1
END

END

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM LYROS 12
IF ~~ THEN REPLY @108 GOTO XZ_1
END

REPLACE LYROS

IF WEIGHT #2 /* Triggers after states #: 11 even though they appear after this state */
~Global("LyrosJob","GLOBAL",1)
~ THEN BEGIN 2 // from:
  SAY #22563 /* ~You're back, are you?  Is it safe for me to assume that you have succeeded in your mission or am I merely subject to a grueling social call?~ */
  IF ~~ THEN REPLY #22564 /* ~No, I haven't found out what happened to Montaron, yet.~ */ GOTO 3
  IF ~!PartyHasItem("MISC5D")
Global("TalkedToSpectres","GLOBAL",1)
!Global("D0Harpers","GLOBAL",2)~ THEN REPLY #22568 /* ~Yes, actually.  Montaron was turned into a bird and put in the Harper's aviary...but I don't have it with me.~ */ GOTO 4
  IF ~OR(2)
PartyHasItem("MISC5D")
PartyHasItem("D0BIRD")~ THEN REPLY #22569 /* ~I have found out what happened to him, yes.  He was turned into a bird...which I have with me, here.~ */ DO ~AddXPObject(Player1,35500)
AddXPObject(Player2,35500)
AddXPObject(Player3,35500)
AddXPObject(Player4,35500)
AddXPObject(Player5,35500)
AddXPObject(Player6,35500)~ GOTO 5
  IF ~PartyHasItem("D0BIRD")~ THEN REPLY @109 DO ~AddXPObject(Player1,15500)
AddXPObject(Player2,15500)
AddXPObject(Player3,15500)
AddXPObject(Player4,15500)
AddXPObject(Player5,15500)
AddXPObject(Player6,15500)~ GOTO LY_1
  IF ~~ THEN REPLY #22595 /* ~Forget your mission!  I've decided it would be far more satisfying to kill you!~ */ GOTO 9
END

IF ~~ THEN BEGIN 6 // from: 23.0
  SAY #22580 /* ~Before I reward you, I'll polymorph Monty into his proper form... just to make sure you're not lying.  Monty must have something interesting to say...~ */
  IF ~~ THEN DO ~SetGlobal("LyrosJob","GLOBAL",2)
TakePartyItem("MISC5D")
DestroyItem("MISC5D")
TakePartyItem("D0BIRD")
DestroyItem("D0BIRD")
ForceSpell(Myself,HARPASS_CHANGE)~ EXIT
END

IF WEIGHT #3 ~GlobalLT("D0Harpers","GLOBAL",3)~ THEN BEGIN 25 // from:
  SAY #31039 /* ~What in the..?? You're not Montaron!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 26 // from: 22.1 21.1 16.1
  SAY #42645 /* ~A reward?  It is not enough to save a fellow being in need?  Bah!  Very well... you shall have a reward in gold for your efforts and something else, as well...~ */
  IF ~~ THEN DO ~SetGlobal("D0TalkReward","LOCALS",1)~ GOTO 20
END

END

APPEND LYROS

IF ~~ THEN BEGIN XZ_1
SAY @110
COPY_TRANS LYROS 24
END

IF ~~ THEN BEGIN LY_1
  SAY @111
     =
      @112
  IF ~!Name("Jaheira",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",3)
SetGlobal("LyrosJob","GLOBAL",2)
TakePartyItem("D0BIRD")
DestroyItem("D0BIRD")
ForceSpell(Myself,HARPASS_CHANGE)~ EXIT
  IF ~OR(2)
Name("Jaheira",LastTalkedToBy(Myself))
IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",3)
SetGlobal("LyrosJob","GLOBAL",2)
TakePartyItem("D0BIRD")
DestroyItem("D0BIRD")
ForceSpell(Myself,HARPASS_CHANGE)~ EXTERN JAHEIRAJ PROTEST_1
END

IF WEIGHT #3 ~Global("D0Harpers","GLOBAL",3)~ THEN BEGIN LY_2
  SAY @113
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",4)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Harpers","GLOBAL",4)~ THEN BEGIN LY_3
  SAY @114
     =
      @115
  IF ~Global("D0TalkReward","LOCALS",1)~ THEN REPLY @116 GOTO LY_4
  IF ~~ THEN REPLY @117 GOTO LY_8
  IF ~~ THEN REPLY @118 GOTO LY_5
  IF ~~ THEN REPLY @119 GOTO LY_6
END

IF ~~ THEN BEGIN LY_4
  SAY @120
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",6)
AddJournalEntry(@167,QUEST)~ EXIT
END

IF ~~ THEN BEGIN LY_5
  SAY @121
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",6)
AddJournalEntry(@167,QUEST)~ EXIT
END

IF ~~ THEN BEGIN LY_6
  SAY @122
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",5)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Harpers","GLOBAL",5)~ THEN BEGIN LY_7
  SAY @123
  IF ~~ THEN REPLY @124 GOTO LY_8
  IF ~~ THEN REPLY #22561 /* ~No, I'm still not interested.~ */ GOTO 1
END

IF ~~ THEN BEGIN LY_8
  SAY @125
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",6)
AddJournalEntry(@167,QUEST)~ EXIT
END

IF WEIGHT #-1 ~GlobalGT("D0Harpers","GLOBAL",5)
GlobalLT("D0Harpers","GLOBAL",8)~ THEN BEGIN LY_9
  SAY @126
  IF ~Global("D0Harpers","GLOBAL",7)~ THEN REPLY @127 GOTO LY_10
  IF ~OR(2)
PartyHasItem("MISC5U")
PartyHasItem("D0MISC5U")~ THEN REPLY @128 GOTO LY_12
  IF ~~ THEN REPLY @129 GOTO LY_11
END

IF ~~ THEN BEGIN LY_10
  SAY @130
  IF ~~ THEN REPLY @131 GOTO LY_11
  IF ~OR(2)
PartyHasItem("MISC5U")
PartyHasItem("D0MISC5U")~ THEN REPLY @128 GOTO LY_12
END

IF ~~ THEN BEGIN LY_11
  SAY @132
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LY_12
  SAY @133
  IF ~Global("D0Harpers","GLOBAL",7)~ THEN REPLY @134 GOTO LY_13
  IF ~!Global("D0Harpers","GLOBAL",7)~ THEN REPLY @135 GOTO LY_14
  IF ~!Global("D0Harpers","GLOBAL",7)~ THEN REPLY @136 GOTO LY_15
  IF ~Global("D0TalkReward","LOCALS",1)~ THEN REPLY @137 GOTO LY_12a
END

IF ~~ THEN BEGIN LY_12a
  SAY @138
  IF ~Global("D0Harpers","GLOBAL",7)~ THEN REPLY @134 GOTO LY_13
  IF ~!Global("D0Harpers","GLOBAL",7)~ THEN REPLY @135 GOTO LY_14
  IF ~!Global("D0Harpers","GLOBAL",7)~ THEN REPLY @136 GOTO LY_15
END

IF ~~ THEN BEGIN LY_13
  SAY @139
     =
      @140
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",10)
SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
TakePartyItem("MISC5U")
TakePartyItem("D0MISC5U")
AddXPObject(Player1,27500)
AddXPObject(Player2,27500)
AddXPObject(Player3,27500)
AddXPObject(Player4,27500)
AddXPObject(Player5,27500)
AddXPObject(Player6,27500)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
EraseJournalEntry(@167)
AddJournalEntry(@168,QUEST_DONE)
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN BEGIN LY_14
  SAY @141
  IF ~!Name("Jaheira",LastTalkedToBy(Myself))
!IsValidForPartyDialog("Jaheira")~ THEN DO ~TakePartyItem("MISC5U")
TakePartyItem("D0MISC5U")
SetGlobal("D0Harpers","GLOBAL",8)
SetGlobal("AttackFirstHarpers","GLOBAL",1)
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
  IF ~OR(2)
Name("Jaheira",LastTalkedToBy(Myself))
IsValidForPartyDialog("Jaheira")~ THEN DO ~TakePartyItem("MISC5U")
TakePartyItem("D0MISC5U")
SetGlobal("D0Harpers","GLOBAL",8)
SetGlobal("AttackFirstHarpers","GLOBAL",1)
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXTERN JAHEIRAJ PROTEST_1
END

IF ~~ THEN BEGIN LY_15
  SAY @142
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",10)
SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
TakePartyItem("MISC5U")
TakePartyItem("D0MISC5U")
AddXPObject(Player1,22500)
AddXPObject(Player2,22500)
AddXPObject(Player3,22500)
AddXPObject(Player4,22500)
AddXPObject(Player5,22500)
AddXPObject(Player6,22500)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
EraseJournalEntry(@167)
AddJournalEntry(@169,QUEST_DONE)
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Harpers","GLOBAL",9)~ THEN BEGIN LY_16
  SAY @143
     =
      @144
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",10)
SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
AddXPObject(Player1,27500)
AddXPObject(Player2,27500)
AddXPObject(Player3,27500)
AddXPObject(Player4,27500)
AddXPObject(Player5,27500)
AddXPObject(Player6,27500)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
EraseJournalEntry(@167)
AddJournalEntry(@170,QUEST_DONE)
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

REPLACE_ACTION_TEXT LUSETTE ~SetGlobal("LyrosJob","GLOBAL",3)~ ~SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)~

REPLACE LUSETTE

IF ~~ THEN BEGIN 13 // from: 12.0
  SAY #23423 /* ~And now you too will fall to the Harpers! You are as irredeemable as this Zhentish desecrator! May your bones lay restless as his constructs did!~ */
  IF ~!Global("D0Harpers","GLOBAL",2)~ THEN DO ~SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
CloseDoor("DOOR0308")
Lock("DOOR0308")
Enemy()
AttackOneRound(NearestEnemyOf(Myself))
EscapeArea()
~ SOLVED_JOURNAL #47874 /* ~Find out what happened to Montaron.

The guile of the Harpers has lived up to their reputation.  Xzar and I were tricked into believing that the bird I retrieved from the Harper base would be Montaron.  It was actually a Harper assassin.  Xzar's Zhentarim background made him a target, and I have been led the entire way, a dupe.  I don't know what actually became of Montaron, although it seems likely that the evil thief is dead.~ */ EXIT
  IF ~Global("D0Harpers","GLOBAL",2)~ THEN DO ~SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
CloseDoor("DOOR0308")
Lock("DOOR0308")
Enemy()
AttackOneRound(NearestEnemyOf(Myself))
EscapeArea()~ SOLVED_JOURNAL @145 EXIT
END

END

APPEND LUSETTE

IF WEIGHT #-1 ~InParty("Jaheira")
Global("D0Harpers","GLOBAL",2)
!Global("AttackFirstHarpers","GLOBAL",1)
!ReputationLT(Player1,6)~ THEN BEGIN LU_1
  SAY #23365 /* ~And death will come on wings of song,
a song of long and winding guile,
and in the end your end I wend,
and in the end, a harp will smile!~ */
= @146
  IF ~~ THEN REPLY @147 GOTO LU_3
  IF ~~ THEN REPLY @148 GOTO LU_4a
  IF ~~ THEN REPLY @149 GOTO LU_4c
  IF ~~ THEN REPLY @150 GOTO LU_4b
  IF ~~ THEN REPLY #23379 /* ~Murderer! You will pay for this!~ */ GOTO LU_4
END

IF WEIGHT #-1 ~!InParty("Jaheira")
Global("D0Harpers","GLOBAL",2)
!Global("AttackFirstHarpers","GLOBAL",1)
!ReputationLT(Player1,6)~ THEN BEGIN LU_2
  SAY #62084 /* ~And so the fool dies...~ */
  IF ~~ THEN GOTO LU_1
END

IF ~~ THEN BEGIN LU_3
  SAY @151
  IF ~~ THEN GOTO LU_5
END

IF ~~ THEN BEGIN LU_4
  SAY @152
  IF ~~ THEN GOTO LU_5
END

IF ~~ THEN BEGIN LU_4a
  SAY @153
  IF ~~ THEN GOTO LU_5
END

IF ~~ THEN BEGIN LU_4b
  SAY @154
  IF ~~ THEN GOTO LU_5
END

IF ~~ THEN BEGIN LU_4c
  SAY @155
  IF ~~ THEN GOTO LU_5
END

IF ~~ THEN BEGIN LU_5
SAY #23383 /* ~A necromancer in the service of the Zhentarim, creating abominations for sale to the highest bidder. Far from their normal range, but not an unexpected enemy. ~ */
= @156
= @157
  IF ~!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Jan")~ THEN DO ~SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
CloseDoor("DOOR0308")
Lock("DOOR0308")
EscapeArea()~ SOLVED_JOURNAL @158 EXIT
  IF ~IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
CloseDoor("DOOR0308")
Lock("DOOR0308")
EscapeArea()~ SOLVED_JOURNAL @158 EXTERN ~JAHEIRAJ~ D0_H_1
  IF ~!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Jan")~ THEN DO ~SetGlobal("LyrosJob","GLOBAL",3)
SetGlobalTimer("D0MerTimer","GLOBAL",2400)
EraseJournalEntry(47848)
EraseJournalEntry(47851)
EraseJournalEntry(47854)
EraseJournalEntry(47862)
EraseJournalEntry(47863)
EraseJournalEntry(47864)
EraseJournalEntry(47866)
EraseJournalEntry(47873)
CloseDoor("DOOR0308")
Lock("DOOR0308")
EscapeArea()~ SOLVED_JOURNAL @158 EXTERN ~JANJ~ D0_H_2
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND RYLOCK
IF WEIGHT #-1 ~GlobalLT("LyrosJob","GLOBAL",3)
OR(2)
GlobalGT("D0Harpers","GLOBAL",5)
GlobalGT("HarperJob","GLOBAL",2)
!Global("RylockLeavesHarperDoor","AR0300",1)
!Allegiance(Myself,ENEMY)
Global("AttackFirstHarpers","GLOBAL",0)~ THEN BEGIN RYLOCK1
SAY @159
IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND JAHEIRAJ
IF ~~ THEN BEGIN D0_H_1
SAY @160
IF ~~ THEN EXIT
END
END

APPEND JANJ
IF ~~ THEN BEGIN D0_H_2
SAY @161
IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXIT
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ D0_H_1
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0XZAR

IF ~Global("D0Harpers","GLOBAL",11)~ THEN BEGIN XZ2_1
  SAY @162
     =
      @163
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",12)
SetCutSceneLite(TRUE)
FaceObject("D0Monty")
CreateVisualEffectObject("SPFLAMES",Myself)
ForceSpell("D0Monty",WIZARD_CONTROL_UNDEAD)
CreateVisualEffectObject("SPFIREPI",Myself)
Wait(2)
CreateVisualEffectObject("SPFLESH2","D0MONTY")
Wait(2)
StartDialogNoSet([PC])~ EXIT
END

IF ~Global("D0Harpers","GLOBAL",12)~ THEN BEGIN XZ2_2
  SAY @164
  IF ~~ THEN DO ~SetGlobal("D0Harpers","GLOBAL",13)
SetCutSceneLite(TRUE)
CreateVisualEffectObject("SPFIREPI","D0Monty")
ActionOverride("D0Monty",DestroySelf())
Wait(1)
CreateVisualEffectObject("SPFIREPI","D0Monty")
CreateCreature("D0Monty2",[293.412],0)
ActionOverride("D0Monty2",FaceObject("D0Xzar"))
Wait(1)
ActionOverride("D0Monty2",DisplayStringHead(Myself,@172))
ActionOverride("D0Monty2",Attack("D0Xzar"))
Wait(1)
DisplayStringHead(Myself,@173)
Wait(1)
MoveToObject("D0Monty2")
ActionOverride("D0Monty2",Attack("D0Xzar"))
DisplayStringHead(Myself,@174)
ReallyForceSpell(Myself,CLERIC_PROTECTION_FROM_FIRE)
ForceSpell(Myself,CLERIC_FLAME_STRIKE)
SetCutSceneLite(FALSE)
ActionOverride("D0Monty2",Kill(Myself))
AddJournalEntry(@171,QUEST_DONE)
Kill(Myself)~ EXIT
END
