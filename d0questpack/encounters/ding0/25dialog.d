REPLACE ORPHAN1
IF ~Global("FRaise","GLOBAL",0)~ THEN BEGIN 3 // from: 2.0
  SAY #73321 /* ~Daddy got hit by the fire and fell down.  I can't wake him up, no matter what.  Please help my daddy.~ */
  IF ~~ THEN REPLY #73334 /* ~Your daddy's dead.  There's nothing I can do.~ */ GOTO 4
  IF ~OR(2)
Name("Jaheira",LastTalkedToBy(Myself))
Class(LastTalkedToBy(Myself),CLERIC_ALL)
OR(4)
Name("Jaheira",LastTalkedToBy(Myself))
HaveSpellParty(CLERIC_RAISE_DEAD)
HaveSpellParty(1729) // Mass Raise Dead
HaveSpellParty(CLERIC_RESURRECTION)~ THEN REPLY #73335 /* ~I... might... be able to help you with a spell, let's see...~ */ DO ~ClearAllActions()
StartCutSceneMode()
FadeToColor([20.0],0)
Wait(2)
MoveViewPoint([2402.1482],0)
ActionOverride(LastTalkedToBy(Myself),JumpToPoint([2386.1386]))
ActionOverride(LastTalkedToBy(Myself),Face(0))
FadeFromColor([20.0],0)
Wait(1)
ActionOverride(LastTalkedToBy(Myself),ForceSpellRES("jworphan","orphan2"))
Wait(5)
EndCutSceneMode()~ EXIT
  IF ~PartyHasItem("scrl63")
OR(4)
Class(LastTalkedToBy(Myself),CLERIC_ALL)
Class(LastTalkedToBy(Myself),DRUID_ALL)
Class(LastTalkedToBy(Myself),PALADIN_ALL)
Class(LastTalkedToBy(Myself),RANGER_ALL)~ THEN REPLY @58 DO ~ClearAllActions()
TakePartyItemNum("scrl63",1)
DestroyItem("scrl63")
StartCutSceneMode()
FadeToColor([20.0],0)
Wait(2)
MoveViewPoint([2402.1482],0)
ActionOverride(LastTalkedToBy(Myself),JumpToPoint([2386.1386]))
ActionOverride(LastTalkedToBy(Myself),Face(0))
FadeFromColor([20.0],0)
Wait(1)
ActionOverride(LastTalkedToBy(Myself),ForceSpellRES("jworphan","orphan2"))
Wait(5)
EndCutSceneMode()~ EXIT
  IF ~PartyHasItem("rods03")~ THEN REPLY #73989 /* ~Perhaps the rod of resurrection might be able to restore him.  Let's see...~ */ DO ~ClearAllActions()
StartCutSceneMode()
FadeToColor([20.0],0)
Wait(2)
MoveViewPoint([2402.1482],0)
ActionOverride(LastTalkedToBy(Myself),JumpToPoint([2386.1386]))
ActionOverride(LastTalkedToBy(Myself),Face(0))
FadeFromColor([20.0],0)
Wait(2)
ActionOverride(LastTalkedToBy(Myself),ReallyForceSpellRES("jworphan","orphan2"))
Wait(2)
EndCutSceneMode()~ EXIT
/*   IF ~Class(LastTalkedToBy(Myself),MAGE_ALL)
OR(2)
HaveSpellParty(WIZARD_LIMITED_WISH)
HaveSpellParty(WIZARD_WISH)~ THEN REPLY ~A wish should be able to do it. This could be risky, though.~ GOTO Wish */
/*   IF ~OR(2)
Class(LastTalkedToBy(Myself),MAGE_ALL)
Class(LastTalkedToBy(Myself),BARD_ALL)
!HaveSpellParty(WIZARD_LIMITED_WISH)
!HaveSpellParty(WIZARD_WISH)
PartyHasItem("scrla4")~ THEN REPLY ~A wish should be able to do it. This could be risky, though.~ GOTO ScrollLimitedWish */
/*   IF ~OR(2)
Class(LastTalkedToBy(Myself),MAGE_ALL)
Class(LastTalkedToBy(Myself),BARD_ALL)
!HaveSpellParty(WIZARD_LIMITED_WISH)
!HaveSpellParty(WIZARD_WISH)
!PartyHasItem("scrla4")
PartyHasItem("scrlb4")~ THEN REPLY ~A wish should be able to do it. This could be risky, though.~ GOTO ScrollWish */
//   IF ~PartyHasItem("u!kbot2")~ THEN REPLY ~The genie from Jafir's flask should be able to help. Worth a try.~ GOTO UBWish
  IF ~!Class(LastTalkedToBy(Myself),CLERIC_ALL)
!Class(LastTalkedToBy(Myself),DRUID_ALL)
OR(6)
Class(Player1,CLERIC_ALL)
Class(Player2,CLERIC_ALL)
Class(Player3,CLERIC_ALL)
Class(Player4,CLERIC_ALL)
Class(Player5,CLERIC_ALL)
Class(Player6,CLERIC_ALL)~ THEN REPLY @59 GOTO 6
  IF ~OR(2)
Class(LastTalkedToBy(Myself),CLERIC_ALL)
Class(LastTalkedToBy(Myself),DRUID_ALL)
OR(6)
Class(Player1,CLERIC_ALL)
Class(Player2,CLERIC_ALL)
Class(Player3,CLERIC_ALL)
Class(Player4,CLERIC_ALL)
Class(Player5,CLERIC_ALL)
Class(Player6,CLERIC_ALL)~ THEN REPLY @60 GOTO 6
IF ~!Class(Player1,CLERIC_ALL)
!Class(Player2,CLERIC_ALL)
!Class(Player3,CLERIC_ALL)
!Class(Player4,CLERIC_ALL)
!Class(Player5,CLERIC_ALL)
!Class(Player6,CLERIC_ALL)
InParty("Jaheira")
!Name("Jaheira",LastTalkedToBy(Myself))~ THEN REPLY @61 GOTO Jaheira
  IF ~~ THEN REPLY #73339 /* ~Get used to it, child.  Life's tough, now get lost.~ */ GOTO 1
END
END

APPEND ORPHAN1
IF ~~ THEN BEGIN Jaheira
  SAY @62
  IF ~~ THEN EXIT
END

/* IF ~~ THEN BEGIN Wish
SAY ~Oh, please, try it!  I... *sob!*  I just want my daddy back!~
IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
FadeToColor([20.0],0)
Wait(2)
MoveViewPoint([2402.1482],0)
ActionOverride(LastTalkedToBy(Myself),JumpToPoint([2386.1386]))
ActionOverride(LastTalkedToBy(Myself),Face(0))
FadeFromColor([20.0],0)
Wait(2)
ActionOverride(LastTalkedToBy(Myself),ForceSpell(Myself,WIZARD_LIMITED_WISH))
Wait(6)
ActionOverride("WISH01",FaceObject(LastTalkedToBy("orphan1"))
ActionOverride("WISH01",DisplayStringHead(Myself,@63))
Wait(3)
ActionOverride(LastTalkedToBy(Myself),DisplayStringHead(Myself,@64))
Wait(3)
ActionOverride("WISH01",DisplayStringHead(Myself,@65))
Wait(1)
ActionOverride("WISH01",ReallyForceSpellRES("jworphan","orphan2"))
Wait(2)
ActionOverride("WISH01",DisplayStringHead(Myself,@66))
EndCutSceneMode()~ EXIT
END */
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
