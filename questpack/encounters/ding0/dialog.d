//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM CROBAR01 1
IF ~Global("D0Lich","LOCALS",0)
Dead("grvlch01")~ THEN REPLY @0 GOTO Lich1
END

APPEND CROBAR01
IF ~~ THEN BEGIN Lich1
SAY @1
  = @2
++ @3 GOTO Lich2
+ ~PartyHasItem("sw1h31")~ + @4 GOTO Lich3
++ @5 GOTO Lich4
END

IF ~~ THEN BEGIN Lich2
SAY @6
= @7
  IF ~~ THEN REPLY @8 GOTO Lich5
  IF ~~ THEN REPLY @9 DO ~StartStore("crobar01",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY #45349 /* ~No thank you. Some other time.~ */ GOTO 3
  IF ~Global("BonnieClyde","GLOBAL",1)~ THEN REPLY #45371 /* ~Can you tell me anything about Aulava and Tiiro?~ */ GOTO 4
END

IF ~~ THEN BEGIN Lich3
SAY @10
++ @11 GOTO Lich2
++ @12 GOTO Lich4
END

IF ~~ THEN BEGIN Lich4
SAY @13
  IF ~~ THEN REPLY @8 GOTO Lich5
  IF ~~ THEN REPLY @9 DO ~StartStore("crobar01",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY #45349 /* ~No thank you. Some other time.~ */ GOTO 3
  IF ~Global("BonnieClyde","GLOBAL",1)~ THEN REPLY #45371 /* ~Can you tell me anything about Aulava and Tiiro?~ */ GOTO 4
END

IF ~~ THEN BEGIN Lich5
SAY @14
  IF ~~ THEN REPLY @9 DO ~StartStore("crobar01",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY #45349 /* ~No thank you. Some other time.~ */ GOTO 3
  IF ~Global("BonnieClyde","GLOBAL",1)~ THEN REPLY #45371 /* ~Can you tell me anything about Aulava and Tiiro?~ */ GOTO 4
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0VAMSIM
IF ~~ THEN BEGIN Blah
SAY @15
IF ~~ THEN REPLY @16 EXTERN PPBODHI4 Sime2
// IF ~~ THEN REPLY ~She's no friend of mine!~ EXTERN PPBODHI4 Sime2
END

APPEND PPBODHI4
IF ~~ THEN BEGIN Sime
SAY @17
IF ~~ THEN EXTERN D0VAMSIM Blah
END

IF ~~ THEN BEGIN Sime2
SAY @18
  IF ~~ THEN REPLY #49450 /* ~You said I would have a chance to escape! You have not given me time!~ */ GOTO 20
  IF ~~ THEN REPLY #49451 /* ~I expected you to come. You'd be a fool to let me reach Irenicus.~ */ GOTO 20
  IF ~~ THEN REPLY #49452 /* ~Come now, there must be something I can do to appease you.~ */ GOTO 20
END
END

EXTEND_BOTTOM PPBODHI4 19
IF ~Global("D0SimeVampire","GLOBAL",1)
Detect("vampsime")~ THEN DO ~SetGlobal("D0SimeVampire","GLOBAL",2)~ GOTO Sime
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// MADULF + PALADIN QUEST

APPEND UHOGRE01
IF WEIGHT #-1 ~Global("D0OgresHelpPaladins","AR1100",2)~ THEN BEGIN Madulf1
SAY @19
IF ~~ THEN DO ~SetGlobal("D0OgresHelpPaladins","AR1100",3)~ EXIT
END

IF WEIGHT #-1 ~Global("D0OgresHelpPaladins","AR1100",4)~ THEN BEGIN Madulf2
SAY @20
IF ~~ THEN DO ~SetGlobal("D0OgresHelpPaladins","AR1100",5)
EscapeAreaMove("ar1100",3228,721,0)
ActionOverride("uhogre02",EscapeAreaMove("ar1100",3227,656,0))
ActionOverride("uhogre03",EscapeAreaMove("ar1100",3378,703,0))
ActionOverride("uhogre04",EscapeAreaMove("ar1100",3436,749,4))
ActionOverride("uhogre05",EscapeAreaMove("ar1100",3179,696,14))~ EXIT
END
END

REPLACE ALYNAR
IF ~~ THEN BEGIN 2 // from: 1.0
  SAY #40841 /* ~Fight well, <CHARNAME>, and see our brethren safely home.~ */
  IF ~GlobalGT("OgreAlliance","GLOBAL",0)
!Dead("madulf")
!Allegiance("madulf",ENEMY)~ THEN DO ~SetGlobal("D0OgresHelpPaladins","AR1100",1)
EscapeArea()~ EXIT
  IF ~OR(3)
!GlobalGT("OgreAlliance","GLOBAL",0)
Dead("madulf")
Allegiance("madulf",ENEMY)~ THEN DO ~EscapeArea()~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// RAKSHASAS + FLAIL

APPEND TRRAK01
IF WEIGHT #-1 ~OR(11)
PartyHasItem("blun14a")
PartyHasItem("blun14b")
PartyHasItem("blun14c")
PartyHasItem("blun14d")
PartyHasItem("blun14e")
PartyHasItem("blun14f")
PartyHasItem("blun14g")
PartyHasItem("blun14h")
PartyHasItem("blun14i")
PartyHasItem("blun30a")
PartyHasItem("blun30b")~ THEN BEGIN Flail
SAY @21
IF ~~ THEN GOTO 4
END

IF WEIGHT #-1 ~OR(4)
PartyHasItem("blun14")
PartyHasItem("blun30")
PartyHasItem("blun30c")
PartyHasItem("blun30d")~ THEN BEGIN PartFlail
SAY @22
IF ~~ THEN GOTO 4
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// NICE TO KIDS!

ADD_TRANS_ACTION DLOST BEGIN 1 END BEGIN END ~SetGlobal("D0KnowChildLost","AR0300",1)~

EXTEND_BOTTOM DLOST 1 2
IF ~~ THEN REPLY @23 GOTO KidNew1
END

REPLACE DLOST
IF ~~ THEN BEGIN 3 // from: 2.1 1.2 0.2
  SAY #25442 /* ~b-b-b-but...I...I... (sniff!)  wwaaAAAAHHHH!!~ */
  IF ~!IsValidForPartyDialogue("VICONIA")
!IsValidForPartyDialogue("KELDORN")~ THEN DO ~SetGlobal("D0DocksOrphan","AR0300",2)
EscapeArea()~ EXIT
  IF ~IsValidForPartyDialogue("VICONIA")~ THEN DO ~SetGlobal("D0DocksOrphan","AR0300",2)~ EXTERN ~VICONIJ~ 55
  IF ~!IsValidForPartyDialogue("VICONIA")
IsValidForPartyDialogue("KELDORN")~ THEN DO ~SetGlobal("D0DocksOrphan","AR0300",2)~ EXTERN ~KELDORJ~ 137
END

IF ~~ THEN BEGIN 4 // from: 1.1
  SAY #25444 /* ~Y-y-yes, <SIRMAAM>.  Th-thank you.  (sniff!)  Ye're an awfully nice person.~ */
  IF ~~ THEN DO ~SetGlobal("D0DocksOrphan","AR0300",3)
EscapeArea()~ EXIT
END
END

APPEND DLOST
IF ~~ THEN BEGIN KidNew1
SAY @24
IF ~~ THEN DO ~SetGlobal("D0DocksOrphan","AR0300",1)~ EXIT
END

IF WEIGHT #-1 ~Global("D0DocksOrphan","AR0300",4)~ THEN BEGIN KidNew2
SAY @25
IF ~Global("D0Reward","LOCALS",0)
!Global("D0KnowChildLost","AR0300",1)~ THEN DO ~SetGlobal("D0Reward","LOCALS",1)
AddExperienceParty(2500)
SetName(9406)~ EXIT
IF ~!Global("D0Reward","LOCALS",0)
!Global("D0KnowChildLost","AR0300",1)~ EXIT

IF ~PartyGoldGT(0)
Detect("d0ftown2")
Global("D0Reward","LOCALS",0)
Global("D0KnowChildLost","AR0300",1)~ THEN REPLY @26 DO ~SetGlobal("D0Reward","LOCALS",1)
SetGlobal("D0KnowChildLost","AR0300",2)
AddExperienceParty(2500)
TakePartyGold(10)
SetName(9406)~ EXTERN D0FTOWN2 KidNew998
IF ~PartyGoldGT(0)
Detect("d0ftown2")
!Global("D0Reward","LOCALS",0)
Global("D0KnowChildLost","AR0300",1)~ THEN REPLY @26 DO ~SetGlobal("D0KnowChildLost","AR0300",2)
TakePartyGold(10)~ EXTERN D0FTOWN2 KidNew998

IF ~Global("D0Reward","LOCALS",0)
Global("D0KnowChildLost","AR0300",1)~ THEN REPLY @27 DO ~SetGlobal("D0Reward","LOCALS",1)
AddExperienceParty(2500)
SetName(9406)~ GOTO KidNew999
IF ~!Global("D0Reward","LOCALS",0)
Global("D0KnowChildLost","AR0300",1)~ THEN REPLY @27 GOTO KidNew999
IF ~Global("D0Reward","LOCALS",0)
Global("D0KnowChildLost","AR0300",1)~ THEN REPLY @28 DO ~SetGlobal("D0Reward","LOCALS",1)
AddExperienceParty(2500)
SetName(9406)~ GOTO KidNew999
IF ~!Global("D0Reward","LOCALS",0)
Global("D0KnowChildLost","AR0300",1)~ THEN REPLY @28 GOTO KidNew999
END

IF ~~ THEN BEGIN KidNew999
SAY @29
IF ~~ THEN EXIT
END
END

REPLACE D0FTOWN2
IF WEIGHT #3 /* Triggers after states #: 4 5 even though they appear after this state */
~RandomNum(4,2)
!GlobalGT("D0DocksOrphan","AR0300",0)~ THEN BEGIN 1 // from:
  SAY @30
  IF ~~ THEN EXIT
END
END

REPLACE DFTOWN2
IF WEIGHT #3 /* Triggers after states #: 4 5 even though they appear after this state */
~RandomNum(4,2)~ THEN BEGIN 1 // from:
  SAY #14448
  IF ~~ THEN EXIT
END
END

APPEND D0FTOWN2
IF ~~ THEN BEGIN KidNew998
SAY @31
IF ~~ THEN DO ~ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)~ EXIT
END

IF WEIGHT #3 /* Triggers after states #: 4 5 even though they appear after this state */
~RandomNum(4,2)
Global("D0DocksOrphan","AR0300",4)~ THEN BEGIN New1
  SAY @32
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~OR(3)
Global("D0DocksOrphan","AR0300",1)
Global("D0DocksOrphan","AR0300",2)
Global("D0DocksOrphan","AR0300",3)~ THEN BEGIN New2
  SAY @30
  IF ~Global("D0DocksOrphan","AR0300",1)~ THEN REPLY @33 GOTO New3
  IF ~Global("D0DocksOrphan","AR0300",2)~ THEN REPLY @34 GOTO New4
  IF ~Global("D0DocksOrphan","AR0300",3)~ THEN REPLY @35 GOTO New3
  IF ~~ THEN REPLY @36 GOTO New5
END

IF ~~ THEN BEGIN New3
SAY @37
IF ~~ THEN DO ~SetGlobal("D0DocksOrphan","AR0300",4)
FadeToColor([30.0],0)
SmallWait(2)
ActionOverride("dlost",JumpToPoint([3675.2325])
ActionOverride("dlost",FaceObject("d0ftown2"))
SmallWait(2)
FadeFromColor([30.0],0)
Wait(2)
ActionOverride("dlost",StartDialogNoSet([PC]))~ EXIT
END

IF ~~ THEN BEGIN New4
SAY @38
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN New5
SAY @39
IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// MUMMYS

BEGIN ~MUMFIG01~

IF ~RandomNum(5,2)~ THEN BEGIN MUMMY1 // from:
  SAY @40
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~RandomNum(5,3)~ THEN BEGIN MUMMY2
  SAY @41
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~RandomNum(5,4)~ THEN BEGIN MUMMY3
  SAY @42
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~RandomNum(5,5)~ THEN BEGIN MUMMY4
  SAY @43
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~True()~ THEN BEGIN MUMMY5
  SAY #61126 /* ~Wha--!!? Where am I? What has happened?~ */
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0QPCOW1 // Cowled Wizard
BEGIN D0QPCOW2 // Cowled Wizard Apprentice
IF ~~ GRR_1
SAY @44
IF ~~ THEN DO ~DialogInterrupt(FALSE)
ActionOverride("d0qpcow1",DialogInterrupt(FALSE))
ActionOverride("d0qpcow3",DialogInterrupt(FALSE))
ActionOverride("d0qpcow1",MoveToObject("d0qpcow3"))
MoveToObject("d0qpcow3")
SmallWait(2)
ActionOverride("d0qpcow3",ReallyForceSpell(Myself,DRYAD_TELEPORT))
ActionOverride("d0qpcow1",ReallyForceSpell(Myself,DRYAD_TELEPORT))
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END
BEGIN D0QPCOW3 // Mage

CHAIN IF ~NumTimesTalkedTo(0)~ THEN D0QPCOW1 A_1
@45
== D0QPCOW2 @46
== D0QPCOW1 @47
== D0QPCOW2 @48
== D0QPCOW3 @49
== D0QPCOW1 @50
== D0QPCOW2 @51
== D0QPCOW1 @52
== D0QPCOW3 @53
= @54
== D0QPCOW1 @55
== D0QPCOW2 @56
== D0QPCOW3 @57
EXTERN D0QPCOW2 GRR_1

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

/* EXTEND_BOTTOM BODFGT03 6
IF ~~ THEN REPLY ~As you say, master.~ GOTO GR_1
END

APPEND BODFGT03
IF WEIGHT #-1 ~AreaCheck("AR0801")~ THEN BEGIN GR_0
SAY ~Ah, <CHARNAME>, foolish of you to think that the mistress would not see through your deception!~
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN GR_1
SAY ~I shall meet you there tonight. Do not falter. And now, I am gone.~
IF ~~ THEN DO ~SetGlobal("D0Gracen","GLOBAL",1)
EscapeArea()~ UNSOLVED_JOURNAL #47831 EXIT
END
END */

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
