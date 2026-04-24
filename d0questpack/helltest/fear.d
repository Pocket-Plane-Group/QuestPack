// creator  : C:\PROGRA~2\BLACKI~1\BGII-S~1\WEIDU\WEIDU.EXE (version 19)
// argument :
// game     : C:\Program Files\Black Isle\BGII - SoA
// source   : C:\Program Files\Black Isle\BGII - SoA\override\
// dialog   : C:\Program Files\Black Isle\BGII - SoA\dialog.tlk
// dialogF  : (none)

REPLACE ~HELLFEAR~

IF ~~ THEN BEGIN 13 // from: 12.0
  SAY @11
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 15 // from: 14.1 14.0 18.1 18.0
  SAY #54786
  IF ~~ THEN DO ~SetGlobal("Player1Fear","GLOBAL",1)
IncrementGlobal("C7Counter","GLOBAL",1)
ActionOverride("hellbeh1",Enemy())
ActionOverride("hellbeh2",Enemy())
CreateVisualEffect("spplanar",[414.395])
DestroySelf()~ JOURNAL #23557 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN 17 // from: 14.3 18.3
  SAY #54790
  IF ~~ THEN DO ~GiveItemCreate("clck30",LastTalkedToBy,0,0,0)
SetGlobal("Player1Fear","GLOBAL",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
CreateVisualEffect("spplanar",[414.395])
Wait(2)
DestroySelf()~ JOURNAL #9738 FLAGS 64 EXIT
END

IF ~False()~ THEN BEGIN 19 // from:
  SAY #54801
  IF ~~ THEN DO ~CreateVisualEffect("spplanar",[414.395])
SetGlobal("Player1Fear","GLOBAL",1)
IncrementGlobal("C7Counter","GLOBAL",1)
ActionOverride("hellbeh1",Enemy())
ActionOverride("hellbeh2",Enemy())
Wait(2)
DestroySelf()~ JOURNAL #9980 FLAGS 64 EXIT
END

END

EXTEND_BOTTOM ~HELLFEAR~ 14
  IF ~~ THEN REPLY @12 GOTO fear30
END

EXTEND_BOTTOM ~HELLFEAR~ 18
  IF ~~ THEN REPLY @12 GOTO fear30
END

APPEND ~HELLFEAR~

IF ~~ THEN BEGIN fear30 // from: 14.4 18.4
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 15
  IF ~~ THEN REPLY @15 GOTO 17
  IF ~~ THEN REPLY @16 GOTO fear31
END

IF ~~ THEN BEGIN fear31 // from: 30.2
  SAY @17
  IF ~~ THEN GOTO fear32
END

IF ~~ THEN BEGIN fear32 // from: 31.0
  SAY #54790
  IF ~~ THEN DO ~GiveItemCreate("clck30",LastTalkedToBy,0,0,0)
SetGlobal("Player1Fear","GLOBAL",3)
IncrementGlobal("C7SinCounter","GLOBAL",1)
CreateVisualEffect("spplanar",[414.395])
Wait(2)
DestroySelf()~ JOURNAL #9738 FLAGS 64 EXIT
END

END

REPLACE ~HELLSARE~

IF ~~ THEN BEGIN 30 // from: 29.0
  SAY #55177
  IF ~~ THEN REPLY #55178 GOTO 32
  IF ~~ THEN REPLY #55179 GOTO 32
  IF ~~ THEN REPLY @41 GOTO sare33
  IF ~~ THEN REPLY @42 GOTO sare33
  IF ~~ THEN REPLY #55180 GOTO 31
  IF ~~ THEN REPLY #55181 GOTO 31
END

IF ~~ THEN BEGIN 31 // from: 30.3 30.2 26.3
  SAY #55182
  IF ~~ THEN DO ~SetGlobal("Player1Wrath","GLOBAL",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
Enemy()~ JOURNAL #46841 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN 32 // from: 30.1 30.0
  SAY #55183
  IF ~~ THEN DO ~SetGlobal("Player1Wrath","GLOBAL",1)
IncrementGlobal("C7Counter","GLOBAL",1)
Enemy()~ JOURNAL #5742 FLAGS 64 EXIT
END

END

APPEND ~HELLSARE~

IF ~~ THEN BEGIN sare33
  SAY #55183
  IF ~~ THEN DO ~SetGlobal("Player1Wrath","GLOBAL",3)
IncrementGlobal("C7SinCounter","GLOBAL",1)
Enemy()~ JOURNAL #5742 FLAGS 64 EXIT
END

END
