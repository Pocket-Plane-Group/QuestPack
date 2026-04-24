// creator  : C:\PROGRA~2\BLACKI~1\BGII-S~1\WEIDU\WEIDU.EXE (version 19)
// argument :
// game     : C:\Program Files\Black Isle\BGII - SoA
// source   : C:\Program Files\Black Isle\BGII - SoA\override\
// dialog   : C:\Program Files\Black Isle\BGII - SoA\dialog.tlk
// dialogF  : (none)

REPLACE ~HELLGEN~

IF ~NumTimesTalkedTo(0)
!Global("C7Geas","GLOBAL",4)~ THEN BEGIN 0 // from:
  SAY #55055
  IF ~~ THEN REPLY #55056 GOTO 1
  IF ~~ THEN REPLY #55065 GOTO 2
  IF ~~ THEN REPLY #55066 GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 0.2
  SAY #55072
  IF ~~ THEN DO ~SetGlobal("Player1Greed","GLOBAL",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
Enemy()~ JOURNAL #10250 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN 10 // from: 7.1
  SAY #55092
  IF ~~ THEN DO ~TakePartyItem("MISCBC")
GiveItem("MISCB7",LastTalkedToBy)
AddexperienceParty(20000)
SetGlobal("Player1Greed","GLOBAL",1)
IncrementGlobal("C7Counter","GLOBAL",1)
CreateVisualEffect("spplanar",[362.918])
Wait(2)
DestroySelf()~ JOURNAL #15713 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN 12 // from: 13.0 9.0 8.1
  SAY #55094
  IF ~~ THEN DO ~SetGlobal("Player1Greed","GLOBAL",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
Enemy()~ JOURNAL #10250 FLAGS 64 EXIT
END

IF ~GlobalLT("C7Geas","GLOBAL",2)~ THEN BEGIN 15 // from:
  SAY #55100
  IF ~~ THEN REPLY #55101 GOTO 5
  IF ~PartyHasItem("MISCBC")~ THEN REPLY #55102 GOTO 7
  IF ~PartyHasItem("MISCBC")~ THEN REPLY #55103 GOTO 8
  IF ~!PartyHasItem("MISCBC")~ THEN REPLY #55104 GOTO 9
  IF ~~ THEN REPLY @18 GOTO greed16
  IF ~Global("C7Geas","GLOBAL",1)~ THEN REPLY @19 GOTO greed19
END

END

EXTEND_BOTTOM ~HELLGEN~ 7
  IF ~~ THEN REPLY @18 GOTO greed16
END

EXTEND_BOTTOM ~HELLGEN~ 13
  IF ~~ THEN REPLY @18 GOTO greed16
END

APPEND ~HELLGEN~

IF ~~ THEN BEGIN greed16 // from: 7.3 13.3 15.3
  SAY @20
  IF ~~ THEN REPLY #55087 GOTO 12
  IF ~~ THEN REPLY @21 GOTO 10
  IF ~~ THEN REPLY @22 GOTO greed17
END

IF ~~ THEN BEGIN greed17 // from: 16.2
  SAY @23
  IF ~~ THEN REPLY #55087 GOTO 12
  IF ~~ THEN REPLY @21 GOTO 10
  IF ~~ THEN REPLY @24 DO ~SetGlobal("C7Geas","GLOBAL",1)~ GOTO greed18
END

IF ~~ THEN BEGIN greed18 // from: 17.2
  SAY @25
  IF ~~ THEN REPLY @26 GOTO 11
  IF ~~ THEN REPLY @27 GOTO greed19
END

IF ~~ THEN BEGIN greed19 // from: 18.1
  SAY @28
  IF ~~ THEN DO ~SetGlobal("C7Geas","GLOBAL",2)
StartCutSceneMode()
StartCutScene("CutC7G")~ EXIT
END

IF ~Global("C7Geas","GLOBAL",2)~ THEN BEGIN greed20 // from:
  SAY @29
  IF ~~ THEN DO ~SetGlobal("C7Geas","GLOBAL",3)
GiveItem("MISCB7",LastTalkedToBy)
AddexperienceParty(20000)
SetGlobal("Player1Greed","GLOBAL",3)
IncrementGlobal("C7SinCounter","GLOBAL",1)
CreateVisualEffect("spplanar",[362.918])
Wait(2)
DestroySelf()~ JOURNAL @30 FLAGS 64 EXIT
END

IF ~Global("C7Geas","GLOBAL",3)~ THEN BEGIN greed21 // from:
  SAY @31
  IF ~~ THEN EXIT
END

IF ~Global("C7Geas","GLOBAL",4)~ THEN BEGIN greed22 // from:
  SAY @32
  IF ~PartyHasItem("MISCBC")~ THEN REPLY @33 GOTO greed23
  IF ~PartyHasItem("MISCBC")~ THEN REPLY @34 GOTO greed24
  IF ~!PartyHasItem("MISCBC")~ THEN REPLY @35 GOTO greed26
END

IF ~~ THEN BEGIN greed23 // from: 22.0
  SAY #55092
  IF ~~ THEN DO ~TakePartyItem("MISCBC")
EraseJournalEntry(@30)
SetGlobal("C7Geas","GLOBAL",5)
CreateVisualEffect("spplanar",[1980.1530])
Wait(2)
DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN greed24 // from: 22.1
  SAY @36
  IF ~~ THEN REPLY @37 GOTO greed23
  IF ~~ THEN REPLY @38 GOTO greed25
END

IF ~~ THEN BEGIN greed25 // from: 24.1
  SAY @39
  IF ~~ THEN DO ~StartCutSceneMode()
Kill(Player1)
EndCutSceneMode()~ EXIT
END

IF ~~ THEN BEGIN greed26 // from 22.2
  SAY @40
  IF ~~ THEN GOTO greed25
END

END
