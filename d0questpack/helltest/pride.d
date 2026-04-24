// creator  : C:\PROGRA~2\BLACKI~1\BGII-S~1\WEIDU\WEIDU.EXE (version 19)
// argument :
// game     : C:\Program Files\Black Isle\BGII - SoA
// source   : C:\Program Files\Black Isle\BGII - SoA\override\
// dialog   : C:\Program Files\Black Isle\BGII - SoA\dialog.tlk
// dialogF  : (none)

REPLACE ~HDRAGSIL~

IF ~Global("Player1Pride","GLOBAL",1)~
THEN BEGIN 0 // from:
  SAY #58294
  IF ~~ THEN DO ~GiveItem("MISCB8",LastTalkedToBy)
StartCutSceneMode()
StartCutScene("cut76a")~
  EXIT
END

END

APPEND ~HDRAGSIL~

IF ~Global("Player1Pride","GLOBAL",2)~
THEN BEGIN dragsil1 // from:
  SAY @1
  IF ~~ THEN REPLY @2 GOTO dragsil7
  IF ~~ THEN REPLY @3 GOTO dragsil2
END

IF ~~ THEN BEGIN dragsil2 // from: 1.1
  SAY @4
  IF ~~ THEN REPLY @5 GOTO dragsil3
END

IF ~~ THEN BEGIN dragsil3 // from: 2.0
  SAY @6
  IF ~OR(2)
PartyHasItem("LEAT21")
PartyHasItem("MISC8H")~
  THEN GOTO dragsil5
  IF ~!PartyHasItem("LEAT21")
!PartyHasItem("MISC8H")~ THEN GOTO dragsil4
END

IF ~~ THEN BEGIN dragsil4 // from: 3.1
  SAY @7
  IF ~~ THEN DO ~GiveItem("MISCB8",LastTalkedToBy)
SetGlobal("Player1Pride","GLOBAL",3)
IncrementGlobal("C7SinCounter","GLOBAL",1)
StartCutSceneMode()
StartCutScene("cut76a")~ EXIT
END

IF ~~ THEN BEGIN dragsil5 // from: 3.0
  SAY @8
  IF ~~ THEN GOTO dragsil6
END

IF ~~ THEN BEGIN dragsil6 // from: 5.0
  SAY @9
  IF ~~ THEN GOTO dragsil7
END

IF ~~ THEN BEGIN dragsil7 // from: 2.0 6.0
  SAY @10
  IF ~~ THEN DO ~SetGlobal("Player1Pride","GLOBAL",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
Enemy()~ EXIT
END

END

REPLACE ~HELLPRID~

IF ~~ THEN BEGIN 22 // from: 25.2 24.0 23.1 23.0 21.1 21.0
  SAY #55134
  IF ~~ THEN DO ~SetGlobal("Player1Pride","GLOBAL",2)
CreateCreature("HDRAGSIL",[1024.592],2)
CreateVisualEffectObject("SPFIREPI",Myself)
DestroySelf()
~ JOURNAL #6443 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN 27 // from: 28.0 26.0
  SAY #55147
  IF ~~ THEN DO ~SetGlobal("Player1Pride","GLOBAL",1)
IncrementGlobal("C7Counter","GLOBAL",1)
CreateCreature("HDRAGSIL",[1024.592],2)
CreateVisualEffectObject("SPFIREPI",Myself)
DestroySelf()~ JOURNAL #23503 FLAGS 64 EXIT
END

END
