BEGIN D0QPWIWI

IF ~NumTimesTalkedTo(0)~ THEN BEGIN W1
SAY @0
IF ~~ THEN REPLY @1 GOTO W2
IF ~~ THEN REPLY @2 GOTO W2
IF ~~ THEN REPLY @3 GOTO W2
END

IF ~~ THEN BEGIN W2
SAY @4
= @5
= @6
IF ~~ THEN DO ~SetGlobal("D0Wilbur","GLOBAL",3)
StartStore("d0qpwiwi",LastTalkedToBy(Myself))~ EXIT
END

IF ~Global("D0Wilbur","GLOBAL",3) Global("fl#qpWilburTalked","GLOBAL",0)~ THEN BEGIN W3
SAY @7
IF ~~ THEN DO ~SetGlobal("fl#qpWilburTalked","GLOBAL",1)
CreateItem("d0qpwisw",0,0,0)
EscapeArea()~ EXIT
END

IF ~Global("D0Wilbur","GLOBAL",4) Global("fl#qpWilburTalked","GLOBAL",0)~ THEN BEGIN W3
SAY @8
IF ~~ THEN DO ~SetGlobal("fl#qpWilburTalked","GLOBAL",1) EscapeArea()~ EXIT
END

BEGIN D0QPWIGI

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Warning1
SAY @9
IF ~~ THEN REPLY @10 DO ~CreateVisualEffectObject("SPDISPM2",Myself)
SmallWait(1)
CreateVisualEffectObject("SPFLESHS",Myself)
SmallWait(2)
CreateVisualEffectObject("SPFIRSD2",Myself)
ChangeAnimation("d0qpwima")~ EXIT
END

BEGIN D0QPWIMA

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Warning2
SAY @11
IF ~!PartyHasItem("d0qpwisw")~ THEN REPLY @12 GOTO M1
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @12 GOTO M2
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @13 GOTO M4
IF ~~ THEN REPLY @14 GOTO M9
IF ~~ THEN REPLY @15 GOTO M6
IF ~~ THEN REPLY @16 GOTO M7
IF ~~ THEN REPLY @17 GOTO M7
IF ~~ THEN REPLY @18 GOTO M5
IF ~~ THEN REPLY @19 GOTO M3
END


IF ~~ THEN BEGIN M1
SAY @20
IF ~~ THEN DO ~SetGlobal("D0Wilbur","GLOBAL",6)
SetGlobalTimer("D0WilburTimer","GLOBAL",42)
Enemy()~ SOLVED_JOURNAL @21 EXIT
END

IF ~~ THEN BEGIN M2
SAY @22
IF ~~ THEN DO ~SetGlobal("D0Wilbur","GLOBAL",6)
SetGlobalTimer("D0WilburTimer","GLOBAL",42)
Enemy()~ SOLVED_JOURNAL @23 EXIT
END

IF ~~ THEN BEGIN M3
SAY @24
IF ~~ THEN DO ~SetGlobal("D0Wilbur","GLOBAL",6)
SetGlobalTimer("D0WilburTimer","GLOBAL",42)
Enemy()~ SOLVED_JOURNAL @23 EXIT
END

IF ~~ THEN BEGIN M4
SAY @25
IF ~!IsValidForPartyDialog("Keldorn")~ THEN DO ~TakePartyItem("d0qpwisw")
ReallyForceSpell(Myself,SWOOSH_GONE)~ SOLVED_JOURNAL @26 EXIT
IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~TakePartyItem("d0qpwisw")~ EXTERN KELDORJ Interject1
END

IF ~~ THEN BEGIN M5
SAY @27
IF ~~ THEN DO ~SetGlobal("D0Wilbur","GLOBAL",6)
SetGlobalTimer("D0WilburTimer","GLOBAL",42)
Enemy()~ SOLVED_JOURNAL @23 EXIT
END

IF ~~ THEN BEGIN M6
SAY @28
IF ~!PartyHasItem("d0qpwisw")~ THEN REPLY @12 GOTO M1
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @12 GOTO M2
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @13 GOTO M4
IF ~~ THEN REPLY @29 GOTO M9
IF ~~ THEN REPLY @18 GOTO M5
IF ~~ THEN REPLY @19 GOTO M3
END

IF ~~ THEN BEGIN M7
SAY @30
IF ~!PartyHasItem("d0qpwisw")~ THEN REPLY @12 GOTO M1
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @12 GOTO M2
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @13 GOTO M4
IF ~~ THEN REPLY @29 GOTO M9
IF ~~ THEN REPLY @15 GOTO M8
IF ~~ THEN REPLY @18 GOTO M5
IF ~~ THEN REPLY @19 GOTO M3
END

IF ~~ THEN BEGIN M8
SAY @31
IF ~!PartyHasItem("d0qpwisw")~ THEN REPLY @32 GOTO M1
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @32 GOTO M2
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @33 GOTO M4
IF ~~ THEN REPLY @29 GOTO M9
IF ~~ THEN REPLY @18 GOTO M5
IF ~~ THEN REPLY @19 GOTO M3
END

IF ~~ THEN BEGIN M9
SAY @34
IF ~!PartyHasItem("d0qpwisw")~ THEN REPLY @35 GOTO M1
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @35 GOTO M2
IF ~PartyHasItem("d0qpwisw")~ THEN REPLY @33 GOTO M4
IF ~~ THEN REPLY @18 GOTO M5
IF ~~ THEN REPLY @19 GOTO M3
END

IF ~~ THEN BEGIN Interject1a
SAY @36
IF ~~ THEN DO ~ReallyForceSpell(Myself,SWOOSH_GONE)~ SOLVED_JOURNAL @26 EXIT
END

APPEND KELDORJ
IF ~~ THEN BEGIN Interject1
SAY @37
IF ~~ THEN EXTERN D0QPWIMA Interject1a
END
END

BEGIN D0QPWIC1
IF ~Global("GTFO","LOCALS",1)~ THEN BEGIN Chide
SAY @38
IF ~~ THEN DO ~SetGlobal("GTFO","LOCALS",2)
ReallyForceSpell(Myself,DRYAD_TELEPORT)
ReputationInc(-1)
AddexperienceParty(5000)~ EXIT
END
