BEGIN ~DCOWL1~

IF ~NumTimesTalkedTo(0)
!Detect("Edwin")~ THEN BEGIN R_0
SAY #22298 /* ~Hold!  How dare you intrude on my studies!~ */
IF ~~ THEN REPLY #22299 /* ~I am here to end your life, Cowled Wizard!~ */ GOTO R_1
IF ~~ THEN REPLY @0 GOTO R_0a
IF ~Global("tptImoenDead","GLOBAL",0)~ THEN REPLY @1 GOTO R_0b
IF ~~ THEN REPLY @2 GOTO R_4
IF ~~ THEN REPLY #22300 /* ~Oh?  Pardon me, then, I'll be on my way.~ */ GOTO R_2
END

IF ~~ THEN BEGIN R_0a
SAY @3
IF ~~ THEN DO ~DialogueInterrupt(FALSE)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN R_0b
SAY @4
IF ~~ THEN DO ~DialogueInterrupt(FALSE)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN R_1 // from: 0.0
SAY #22301 /* ~Bah!  I'll not suffer such insolence!~ */
IF ~~ THEN DO ~DialogueInterrupt(FALSE)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN R_2 // from: 0.1
SAY #22302 /* ~Out, then!  Out you go or you shall suffer the wrath of my great magic!~ */
IF ~~ THEN DO ~SetGlobal("RayicWaits","GLOBAL",1)~ EXIT
END

IF ~GlobalGT("RayicWaits","GLOBAL",0)~ THEN BEGIN R_3 // from:
SAY #22304 /* ~You were warned!  Now I, Rayic Gethras, shall deal with you as the ignorant peasant that you are!~ */
IF ~~ THEN DO ~DialogueInterrupt(FALSE)
Enemy()~ EXIT
END

//////////////////////////////////////////////////////////////////////

IF ~Global("D0Rayic","GLOBAL",2)
Global("SeenEdwin","LOCALS",2)~ THEN BEGIN R1_0
SAY @5
IF ~~ THEN DO ~AddexperienceParty(10000)
GiveGoldForce(2000)
SetGlobal("RayicWaits","GLOBAL",1)~ EXIT
END

IF ~Detect("Edwin")
!Dead("Edwin")
Global("D0Rayic","GLOBAL",1)
PartyHasItem("d0qprayi")
HasItem("d0qprayi","Edwin")~ THEN BEGIN R0_0a
SAY @6
= @7
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
TakePartyItem("d0qprayi")
EraseJournalEntry(@75)
DialogueInterrupt(FALSE)~ EXTERN EDWINJ E_W_3
END

IF ~Detect("Edwin")
!Dead("Edwin")
Global("D0Rayic","GLOBAL",1)
PartyHasItem("d0qprayi")
!HasItem("d0qprayi","Edwin")~ THEN BEGIN R0_0b
SAY @8
= @9
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
TakePartyItem("d0qprayi")
EraseJournalEntry(@75)
DialogueInterrupt(FALSE)~ EXTERN EDWINJ E_W_3
END

IF ~Detect("Edwin")
!Dead("Edwin")
Global("D0Rayic","GLOBAL",1)
!PartyHasItem("d0qprayi")~ THEN BEGIN R0_0c
SAY @8
= @10
= @11
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
// GiveItemCreate("misc07",Myself,1476,0,0)
EraseJournalEntry(@75)
Enemy()
DialogueInterrupt(FALSE)~ EXTERN EDWINJ E_W_3
END

IF ~Detect("Edwin")
!Dead("Edwin")
!Global("D0Rayic","GLOBAL",1)
PartyHasItem("d0qprayi")~ THEN BEGIN R0_0d
SAY @12
= @13
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
EraseJournalEntry(@75)
Enemy()
DialogueInterrupt(FALSE)~ EXTERN EDWINJ E_W_3
END

IF ~Detect("Edwin")
!Dead("Edwin")
!Global("D0Rayic","GLOBAL",1)
!PartyHasItem("d0qprayi")~ THEN BEGIN R0_0e
SAY @14
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
EraseJournalEntry(@75)
Enemy()
DialogueInterrupt(FALSE)~ EXTERN EDWINJ E_W_3
END

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

IF ~Global("D0Rayic","GLOBAL",1)
!Detect("Edwin")~ THEN BEGIN R0_1
SAY @15
IF ~~ THEN REPLY @16 GOTO R0_1_a
IF ~!InPartyAllowDead("Edwin")~ THEN REPLY @17 GOTO R0_1_c
IF ~InPartyAllowDead("Edwin")
Dead("Edwin")~ THEN REPLY @18 GOTO R0_1_d
IF ~~ THEN REPLY @19 GOTO R0_1_b
END

IF ~~ THEN BEGIN R0_1_a
SAY @20
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN R0_1_b
SAY @21
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
EraseJournalEntry(@75)
DialogueInterrupt(FALSE)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN R0_1_c
SAY @22
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN R0_1_d
SAY @23
= @24
IF ~!PartyHasItem("d0qprayi")~ THEN REPLY @25 GOTO R0_1_e_1
IF ~PartyHasItem("d0qprayi")~ THEN REPLY @25 GOTO R0_1_e_2
IF ~~ THEN REPLY @26 GOTO R0_1_g
IF ~~ THEN REPLY @27 DO ~SetGlobal("D0NoRayicVirtueDrop","GLOBAL",1)~ GOTO R0_1_f
END

IF ~~ THEN BEGIN R0_1_e_1
SAY @28
= @11
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
// GiveItemCreate("misc07",Myself,1476,0,0)
EraseJournalEntry(@75)
Enemy()
DialogueInterrupt(FALSE)~ EXIT
END

IF ~~ THEN BEGIN R0_1_e_2
SAY @29
IF ~~ THEN DO ~TakePartyItem("d0qprayi")
ActionOverride("Edwin",LeaveParty())
GiveGoldForce(1500)
SetGlobal("D0Rayic","GLOBAL",2)
EraseJournalEntry(@75)~ GOTO R0_1_e_3
END

IF ~~ THEN BEGIN R0_1_e_3
SAY @30
IF ~~ THEN DO ~AddexperienceParty(10000)
GiveGoldForce(500)
DestroyItem("d0qprayi")
DestroyItem("d0qprayi")
GiveItemCreate("d0qprayi",Myself,1,0,0)
SetGlobal("RayicWaits","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN R0_1_g
SAY @31
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
// GiveItemCreate("misc07",Myself,1476,0,0)
EraseJournalEntry(@75)
Enemy()
DialogueInterrupt(FALSE)~ EXIT
END

IF ~~ THEN BEGIN R0_1_f
SAY @32
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",2)
// GiveItemCreate("misc07",Myself,1476,0,0)
EraseJournalEntry(@75)
Enemy()
DialogueInterrupt(FALSE)~ EXIT
END

IF ~~ THEN BEGIN R_4
SAY @33
IF ~~ THEN REPLY @34 GOTO R_1
IF ~Global("tptImoenDead","GLOBAL",0)~ THEN REPLY @35 GOTO R_0b
IF ~~ THEN REPLY @36 GOTO R_5
IF ~~ THEN REPLY @37 GOTO R_2
END

IF ~~ THEN BEGIN R_5
SAY @38
IF ~~ THEN REPLY @39 GOTO R_6
IF ~~ THEN REPLY @40 GOTO R_5a
IF ~~ THEN REPLY @41 GOTO R_1
END

IF ~~ THEN BEGIN R_5a
SAY @42
= @43
= @44
IF ~Global("tptImoenDead","GLOBAL",0)~ THEN REPLY @45 GOTO R_6a
IF ~~ THEN REPLY @46 GOTO R_7
IF ~~ THEN REPLY @47 GOTO R_2
END

IF ~~ THEN BEGIN R_6
SAY @48
= @43
= @44
IF ~Global("tptImoenDead","GLOBAL",0)~ THEN REPLY @45 GOTO R_6a
IF ~~ THEN REPLY @46 GOTO R_7
IF ~~ THEN REPLY @47 GOTO R_2
END

IF ~~ THEN BEGIN R_6a
SAY @49
IF ~~ THEN REPLY @46 GOTO R_7
IF ~~ THEN REPLY @47 GOTO R_2
IF ~~ THEN REPLY @50 GOTO R_1
END

IF ~~ THEN BEGIN R_7
SAY @51
= @52
IF ~~ THEN REPLY @47 GOTO R_2
IF ~PartyGoldGT(1499)~ THEN REPLY @53 DO ~GiveItem("D0QPRayi",LastTalkedToBy(Myself))
TakePartyGold(1500)~ GOTO R_8
IF ~PartyGoldGT(1499)~ THEN REPLY @54 GOTO R_7a
IF ~PartyGoldLT(1500)~ THEN REPLY @55 GOTO R_9
IF ~~ THEN REPLY @56 GOTO R_9
IF ~~ THEN REPLY @57 GOTO R_1
END

IF ~~ THEN BEGIN R_7a
SAY @58
= @59
IF ~PartyGoldGT(1499)~ THEN REPLY @53 DO ~GiveItem("D0QPRayi",LastTalkedToBy(Myself))
TakePartyGold(1500)~ GOTO R_8
IF ~PartyGoldLT(1500)~ THEN REPLY @60 GOTO R_9
IF ~~ THEN REPLY @61 GOTO R_9
IF ~~ THEN REPLY @57 GOTO R_1
END

IF ~~ THEN BEGIN R_8
SAY @62
IF ~~ THEN DO ~SetGlobal("D0Rayic","GLOBAL",1)
AddJournalEntry(@75,QUEST)~ EXIT
END

IF ~~ THEN BEGIN R_9
SAY @63
IF ~~ THEN DO ~SetGlobal("RayicWaits","GLOBAL",1)~ EXIT
END

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

APPEND EDWIN
IF ~~ THEN BEGIN EW_1
SAY @64
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EW_2
SAY @65
IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN EW_3
SAY @66
IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN NEWSTATENOTQUITE4
  SAY @67
= @68
  IF ~~ THEN REPLY #6268 /* ~Murder? Torture? We have no desire to commit such acts.~ */ GOTO 5
  IF ~~ THEN REPLY #6269 /* ~Consider it done.~ */ GOTO 8
END
END

APPEND EDWINJ
IF ~~ THEN BEGIN E_W_3
SAY @69
IF ~~ THEN DO ~LeaveParty()
ChangeAIScript("d0edwinh",OVERRIDE)
Enemy()~ EXIT
END
END

REPLACE EDWIN
IF ~~ THEN BEGIN 3 // from: 34.0
  SAY #6265 /* ~Rayic Gethras is his name.  His house is a gray three-story behind a fence along the westward wall of the Docks District. If he is home, his door will be open.~ */
  IF ~~ THEN GOTO NEWSTATENOTQUITE4
END

IF WEIGHT #5 /* Triggers after states #: 44 67 69 70 even though they appear after this state */
~Global("EdwinJob","GLOBAL",1)~ THEN BEGIN 11 // from:
  SAY #6292 /* ~(My lackeys return, and none to soon) Has the Cowled fool been disposed of?~ [EDWIN74] */
  IF ~PartyHasItem("d0qprayi")~ THEN REPLY #6293 /* ~Yes. He's pushing up daisies as we speak, Edwin.~ */ DO ~EraseJournalEntry(34211)
SetGlobal("D0GiveEdwinRing","GLOBAL",1)
AddexperienceParty(20000)~ GOTO 36
  IF ~Dead("Rayic")
!PartyHasItem("d0qprayi")~ THEN REPLY @70 GOTO EW_1
  IF ~Global("D0Rayic","GLOBAL",1)~ THEN REPLY @71 GOTO EW_3
  IF ~~ THEN REPLY #6294 /* ~No, I haven't killed the damned wizard yet.~ */ GOTO 46
  IF ~~ THEN REPLY #6295 /* ~I've changed my mind about killing Rayic Gethras. ~ */ GOTO 47
END

IF ~~ THEN BEGIN 36 // from: 11.0
  SAY @72
  IF ~~ THEN DO ~TakePartyItem("d0qprayi")
DestroyItem("d0qprayi")~ GOTO EW_2
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM CORNEIL 0
IF ~Global("EdwinJob","GLOBAL",1)
Global("D0Rayic","GLOBAL",0)
Global("D0ReportEdwin","LOCALS",0)~ THEN REPLY @73 DO ~SetGlobal("D0ReportEdwin","LOCALS",1)~ GOTO CO_1
END

EXTEND_BOTTOM CORNEIL 4
IF ~Global("EdwinJob","GLOBAL",1)
Global("D0Rayic","GLOBAL",0)
Global("D0ReportEdwin","LOCALS",0)~ THEN REPLY @73 DO ~SetGlobal("D0ReportEdwin","LOCALS",1)~ GOTO CO_1
END

APPEND CORNEIL
IF ~~ THEN BEGIN CO_1
SAY @74
IF ~~ THEN EXIT
END
END
