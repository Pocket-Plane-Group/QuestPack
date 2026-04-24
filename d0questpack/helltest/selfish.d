// creator  : C:\PROGRA~2\BLACKI~1\BGII-S~1\WEIDU\WEIDU.EXE (version 19)
// argument :
// game     : C:\Program Files\Black Isle\BGII - SoA
// source   : C:\Program Files\Black Isle\BGII - SoA\override\
// dialog   : C:\Program Files\Black Isle\BGII - SoA\dialog.tlk
// dialogF  : (none)

REPLACE ~HELLSELF~

IF ~~ THEN BEGIN 23 // from: 22.0
  SAY #55114 /* ~The path that you take to the Tear will affect another this day.  Another who is innocent of the action you take, and yet affected by it just the same.~ [HELSEL11] */
  IF ~~ THEN DO ~SetGlobal("D0TookInnocent","LOCALS",1)~ GOTO 26
  IF ~NumInPartyGT(1)
InPartyAllowDead(Player2)
InParty(Player2)~ THEN DO ~SetGlobal("D0TookInnocent","LOCALS",2)~ GOTO 24
END

IF ~~ THEN BEGIN 25 // from: 24.0
  SAY #55116
  IF ~~ THEN REPLY @43 GOTO self34
  IF ~!Gender(Player2,FEMALE)~ THEN REPLY @47 GOTO self34
  IF ~Gender(Player2,FEMALE)~ THEN REPLY @44 GOTO self34
  IF ~~ THEN REPLY @45 GOTO self34
  IF ~~ THEN REPLY @46 GOTO self36
END

IF ~~ THEN BEGIN 27 // from:
  SAY #55119
  IF ~~ THEN REPLY @43 GOTO self33
  IF ~~ THEN REPLY @47 GOTO self33
  IF ~~ THEN REPLY @45 GOTO self33
  IF ~~ THEN REPLY @46 GOTO self35
END

IF ~Global("OpenedDoor6","AR2904",1)
Global("D0TookInnocent","LOCALS",2)~ THEN BEGIN 28 // from:
  SAY #55120
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",2)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)~ JOURNAL #6427 FLAGS 64 GOTO 32
END

IF ~Global("OpenedDoor6","AR2904",1)
Global("D0TookInnocent","LOCALS",1)~ THEN BEGIN 29 // from:
  SAY #55121
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",2)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)~ JOURNAL #6436 FLAGS 64 GOTO 32
END

IF ~Global("OpenedDoor5","AR2904",1)
NumInPartyGT(1)~ THEN BEGIN 30 // from:
  SAY #55122
  IF ~~ THEN DO ~ForceSpell(Player2Fill,HELL_DISPELL)
SetGlobal("Player1Selfish","GLOBAL",1)
IncrementGlobal("C7Counter","GLOBAL",1)~ JOURNAL #6437 FLAGS 64 GOTO 32
END

IF ~Global("OpenedDoor5","AR2904",1)
NumInParty(1)~ THEN BEGIN 31 // from:
  SAY #55124
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",1)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
IncrementGlobal("C7Counter","GLOBAL",1)
CreateVisualEffectObject("SPFIREPI","hellvict")
ActionOverride("hellvict",DestroySelf())~ JOURNAL #6438 FLAGS 64 GOTO 32
END

END

APPEND ~HELLSELF~

IF WEIGHT #-1 ~	GlobalTimerNotExpired("C7SelfishFightTime","AR2904")
Global("D0TookInnocent","LOCALS",1)
Dead("hellvict")~ THEN BEGIN D0SELF1a
  SAY #55121 /* ~The consequence of your choice is thus... the innocent is murdered, as a result of your actions if not your intent.  Such is the path of Destiny, forged by those with the will to know they are pre-eminent.~ [HELSEL16] */
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",2)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
~ UNSOLVED_JOURNAL #6436 /* ~Finding Irenicus in Hell

I have made my way through the path I chose and the Tear of Bhaal is mine. The innocent man, however, was destroyed agonizingly in the process.  This seemed to have some meaning to the demon, although I know not what.~ */ GOTO 32
END

IF WEIGHT #-1 ~	GlobalTimerNotExpired("C7SelfishFightTime","AR2904")
Global("D0TookInnocent","LOCALS",2)
Died(Player2)~ THEN BEGIN D0SELF1b
  SAY #55120 /* ~The consequence of your choice is thus... your companion is destroyed, as a result of your actions if not your intent.  Such is the path of Destiny, forged by those with the will to know they are pre-eminent.~ [HELSEL15] */
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",2)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
IncrementGlobal("C7Counter","GLOBAL",-1)
IncrementGlobal("C7SinCounter","GLOBAL",2)
~ UNSOLVED_JOURNAL #6427 /* ~Finding Irenicus in Hell

I have made my way through the path I chose and the Tear of Bhaal is mine.  My companion, however, was destroyed agonizingly in the process.  This seemed to have some meaning to the demon, although I know not what.~ */ GOTO 32
END

IF ~~ THEN BEGIN self33 // from: 27.0 27.1 27.2
  SAY @48
  IF ~~ THEN DO ~CreateVisualEffectObject("SPFLESHS","hellvict")

CreateVisualEffectObject("SPFLESHS",Myself)

ActionOverride("hellvict",JumpToPoint([502.1313]))

CreateCreature("CH7SPY",[569.1354],0)

JumpToPoint([419.1311])
~ JOURNAL #16557 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN self34 // from: 24.0 24.1 24.2
  SAY @48
  IF ~~ THEN DO ~ActionOverride(Player2Fill,MakeUnselectable(5))

CreateVisualEffectObject("SPFLESHS",Player2Fill)

CreateVisualEffectObject("SPFLESHS",Myself)

ActionOverride(Player2Fill,JumpToPoint([502.1313]))

CreateCreature("CH7SPY",[569.1354],0)

JumpToPoint([419.1311])

Wait(1)

ForceSpell(Player2Fill,HELL_HOLD)
~ JOURNAL #16671 FLAGS 64 EXIT
END

IF ~~ THEN BEGIN self35 // from: 27.3
  SAY @49
IF ~~ THEN REPLY @50 GOTO self33
IF ~~ THEN REPLY @51 GOTO self33
IF ~~ THEN REPLY @45 GOTO self33
IF ~~ THEN REPLY @52 DO ~SetGlobal("C7SelfishHostage","GLOBAL",1)~ GOTO self37
END

IF ~~ THEN BEGIN self36 // from: 24.3
  SAY @49
IF ~~ THEN REPLY @50 GOTO self34
IF ~~ THEN REPLY @51 GOTO self34
IF ~~ THEN REPLY @45 GOTO self34
IF ~~ THEN REPLY @52 DO ~SetGlobal("C7SelfishHostage","GLOBAL",2)~ GOTO self37
END

IF ~~ THEN BEGIN self37 // from: 35.3 36.3
  SAY @53
  IF ~Global("D0TookInnocent","LOCALS",1)~ THEN DO ~SetGlobalTimer("C7SelfishFightTime","AR2904",70)
SetGlobal("C7SelfishFight","GLOBAL",1)
Enemy()
CreateVisualEffectObject("SPFLESHS","hellvict")
ForceSpell("hellvict",HELL_HOLD)~ EXIT
  IF ~Global("D0TookInnocent","LOCALS",2)~ THEN DO ~SetGlobalTimer("C7SelfishFightTime","AR2904",70)
SetGlobal("C7SelfishFight","GLOBAL",1)
Enemy()
ActionOverride(Player2Fill,MakeUnselectable(5))
CreateVisualEffectObject("SPFLESHS",Player2Fill)
ForceSpell(Player2Fill,HELL_HOLD)~ EXIT
END

IF ~Global("C7SelfishFight","GLOBAL",1)
Global("D0TookInnocent","LOCALS",1)~ THEN BEGIN self38
  SAY @54
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",3)
IncrementGlobal("C7SinCounter","GLOBAL",1)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
CreateVisualEffectObject("SPFIREPI","hellvict")
ActionOverride("hellvict",DestroySelf())~ JOURNAL @55 FLAGS 64 GOTO 32
END

IF ~Global("C7SelfishFight","GLOBAL",1)
Global("D0TookInnocent","LOCALS",2)~ THEN BEGIN self39
  SAY @56
  IF ~~ THEN DO ~SetGlobal("Player1Selfish","GLOBAL",3)
IncrementGlobal("C7SinCounter","GLOBAL",1)
SetGlobal("OpenedDoor5","AR2904",2)
SetGlobal("OpenedDoor6","AR2904",2)
ForceSpell(Player2Fill,HELL_DISPELL)~ JOURNAL @55 FLAGS 64 GOTO 32
END

END

REPLACE_ACTION_TEXT_PROCESS HELLJON ~EraseJournalEntry(46841)~
~EraseJournalEntry(46841)
EraseJournalEntry(@55)~
