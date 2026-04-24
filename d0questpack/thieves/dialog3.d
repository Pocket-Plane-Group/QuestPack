//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// FIX UTTERLY RETARDED RESPONSES TO ARAN

REPLACE ARAN
IF ~~ THEN BEGIN 34 // from: 33.0 32.0 31.0
  SAY #43031 /* ~It was the Shadow Thieves that attacked Irenicus in Waukeen's Promenade. We have followed you ever since then.~ */
  IF ~~ THEN REPLY @376 GOTO 35
  IF ~~ THEN REPLY @377 GOTO 35
  IF ~~ THEN REPLY @378 GOTO 35
  IF ~~ THEN REPLY @379 GOTO 35
  IF ~CheckStatLT(LastTalkedToBy(Myself),10,INT)~ THEN REPLY #43034 /* ~You were in league with him? No, he was fighting hooded figures.~ */ GOTO 35
  IF ~~ THEN REPLY #43035 /* ~Bastards. That attack ruined everything. I was free to find him!~ */ GOTO DUMB_1
END
END

APPEND ARAN
IF ~~ THEN BEGIN DUMB_1
SAY @380
IF ~~ THEN GOTO 35
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0MSNGR2

IF ~NumTimesTalkedTo(0)~ THEN BEGIN MSG2_1
  SAY @381
  IF ~~ THEN REPLY @382 GOTO MSG2_2
  IF ~~ THEN REPLY @383 GOTO MSG2_3
  IF ~~ THEN REPLY @384 GOTO MSG2_4
END

IF ~~ THEN BEGIN MSG2_2
  SAY @385
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",30)
AddJournalEntry(@515,QUEST)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN MSG2_3
  SAY @386
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",31)
AddJournalEntry(@515,QUEST)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN MSG2_4
  SAY @387
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",32)
AddJournalEntry(@515,QUEST)
EscapeArea()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM HABREGA 0
IF ~Global("D0WaitingAssault","LOCALS",1)~ THEN REPLY @388 DO ~EraseJournalEntry(@516)
SetGlobal("D0WaitingAssault","LOCALS",2)~ GOTO BR_6
END

EXTEND_BOTTOM HABREGA 1
IF ~Global("D0WaitingAssault","LOCALS",1)~ THEN REPLY @388 DO ~EraseJournalEntry(@516)
SetGlobal("D0WaitingAssault","LOCALS",2)~ GOTO BR_6
END

APPEND HABREGA

IF WEIGHT #-1 ~NumTimesTalkedTo(0)
Global("D0Maevar2","GLOBAL",30)~ THEN BEGIN BR_1_1
  SAY @389
     =
      @390
     =
      @391
     =
      @392
  IF ~ReputationGT(Player1,10)~ THEN REPLY @393 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @394 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @395 GOTO BR_4
  IF ~ReputationLT(Player1,11)~ THEN REPLY @393 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @394 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @395 GOTO BR_5
END

IF WEIGHT #-1 ~NumTimesTalkedTo(0)
Global("D0Maevar2","GLOBAL",31)~ THEN BEGIN BR_1_2
  SAY @396
     =
      @390
     =
      @391
     =
      @392
  IF ~ReputationGT(Player1,10)~ THEN REPLY @393 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @394 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @395 GOTO BR_4
  IF ~ReputationLT(Player1,11)~ THEN REPLY @393 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @394 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @395 GOTO BR_5
END

IF WEIGHT #-1 ~NumTimesTalkedTo(0)
Global("D0Maevar2","GLOBAL",32)~ THEN BEGIN BR_1_3
  SAY @397
     =
      @390
     =
      @391
     =
      @392
  IF ~ReputationGT(Player1,10)~ THEN REPLY @393 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @394 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @395 GOTO BR_4
  IF ~ReputationLT(Player1,11)~ THEN REPLY @393 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @394 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @395 GOTO BR_5
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
Global("D0Maevar2","GLOBAL",30)~ THEN BEGIN BR_1_4
  SAY @398
     =
      @399
     =
      @391
     =
      @392
  IF ~ReputationGT(Player1,10)~ THEN REPLY @393 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @394 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @395 GOTO BR_4
  IF ~ReputationLT(Player1,11)~ THEN REPLY @393 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @394 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @395 GOTO BR_5
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
Global("D0Maevar2","GLOBAL",31)~ THEN BEGIN BR_1_5
  SAY @400
     =
      @399
     =
      @391
     =
      @392
  IF ~ReputationGT(Player1,10)~ THEN REPLY @393 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @394 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @395 GOTO BR_4
  IF ~ReputationLT(Player1,11)~ THEN REPLY @393 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @394 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @395 GOTO BR_5
END

IF WEIGHT #-1 ~!NumTimesTalkedTo(0)
Global("D0Maevar2","GLOBAL",32)~ THEN BEGIN BR_1_6
  SAY @401
     =
      @399
     =
      @391
     =
      @392
  IF ~ReputationGT(Player1,10)~ THEN REPLY @393 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @394 GOTO BR_2
  IF ~ReputationGT(Player1,10)~ THEN REPLY @395 GOTO BR_4
  IF ~ReputationLT(Player1,11)~ THEN REPLY @393 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @394 GOTO BR_3
  IF ~ReputationLT(Player1,11)~ THEN REPLY @395 GOTO BR_5
END

IF ~~ THEN BEGIN BR_2a
  SAY @402
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",1)
AddJournalEntry(@516,QUEST)
SetGlobal("D0WaitingAssault","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN BR_6
  SAY @403
     =
      @404
     =
      @405
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",34)
EraseJournalEntry(@515)
EraseJournalEntry(@516)
AddJournalEntry(@360,QUEST)~ EXIT
END

IF ~~ THEN BEGIN BR_7
  SAY @406
  IF ~~ THEN REPLY @407 GOTO BR_6
  IF ~~ THEN REPLY @408 GOTO BR_2a
  IF ~~ THEN REPLY @409 GOTO BR_10
  IF ~~ THEN REPLY @410 GOTO BR_9
END

IF ~~ THEN BEGIN BR_8
  SAY @411
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",33)
EraseJournalEntry(@515)
EraseJournalEntry(@516)~ EXIT
END

IF ~~ THEN BEGIN BR_9
  SAY @412
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",33)
EraseJournalEntry(@515)
EraseJournalEntry(@516)~ EXIT
END

IF ~~ THEN BEGIN BR_10
  SAY @413
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",33)
EraseJournalEntry(@515)
EraseJournalEntry(@516)~ EXIT
END

IF WEIGHT #-1 ~OR(2)
Global("D0Maevar2","GLOBAL",34)
Global("D0Maevar2","GLOBAL",35)
!Dead("Aran")~ THEN BEGIN BR_11
  SAY @414
  IF ~Global("knowsmurders","GLOBAL",1)
Global("MurdersSolved","GLOBAL",0)~ THEN REPLY #30611 /* ~What can you tell me of the murders in the Bridge District?~ */ GOTO BR_12
  IF ~PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY #37775 /* ~I solved the Bridge District murders. Tanner Rejiek did it, and killed the inspector too. Here is the body.~ */ DO ~TakePartyItem("misc5m")~ GOTO 10
  IF ~!PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY #37776 /* ~I solved the Bridge District murders. Tanner Rejiek did it, and killed the inspector too.~ */ GOTO 11
  IF ~PartyHasItem("misc9h")
!Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY #49926 /* ~I have the head of the child-killer Neb.  He is dead and will bother no one any longer.~ */ GOTO 23
  IF ~PartyHasItem("misc9h")
Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY #49931 /* ~I have the head of the child-killing dwarf Neb.  I expect a bounty for the service of killing him.~ */ GOTO 23
  IF ~~ THEN REPLY @415 GOTO 2
END

IF ~~ THEN BEGIN BR_12
  SAY @416
     =
      @417
  IF ~~ THEN REPLY @418 GOTO BR_13
  IF ~~ THEN REPLY @415 GOTO 2
END

IF ~~ THEN BEGIN BR_13
  SAY @419
  IF ~~ THEN REPLY @420 GOTO 2
  IF ~~ THEN REPLY @415 GOTO 2
END

IF WEIGHT #-2 ~GlobalGT("D0Maevar2","GLOBAL",0)
Global("D0LinvailReward","LOCALS",0)
Dead("Aran")
Global("D0PrisonersFree","GLOBAL",1)~ THEN BEGIN BR_14
  SAY @421
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",36)
SetGlobal("D0LinvailReward","LOCALS",1)
AddXPObject(Player1,37500)
AddXPObject(Player2,37500)
AddXPObject(Player3,37500)
AddXPObject(Player4,37500)
AddXPObject(Player5,37500)
AddXPObject(Player6,37500)
GiveGoldForce(2500)
ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)
EraseJournalEntry(@360)
EraseJournalEntry(@362)
AddJournalEntry(@361,QUEST_DONE)~ GOTO BR_15
END

IF ~~ THEN BEGIN BR_15
  SAY @422
     =
      @423
  IF ~PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY @424 DO ~TakePartyItem("misc5m")~ GOTO 10
  IF ~!PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY @425 GOTO 11
  IF ~PartyHasItem("misc9h")
!Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY @426 GOTO 23
  IF ~PartyHasItem("misc9h")
Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY @427 GOTO 23
  IF ~~ THEN REPLY @428 GOTO BR_17
  IF ~~ THEN REPLY @429 GOTO BR_18a
  IF ~~ THEN REPLY @415 GOTO 2
END

IF WEIGHT #-2 ~GlobalGT("D0Maevar2","GLOBAL",0)
Global("D0LinvailReward","LOCALS",0)
Dead("Aran")
Global("D0PrisonersFree","GLOBAL",0)~ THEN BEGIN BR_14
  SAY @430
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",36)
SetGlobal("D0LinvailReward","LOCALS",1)
AddXPObject(Player1,37500)
AddXPObject(Player2,37500)
AddXPObject(Player3,37500)
AddXPObject(Player4,37500)
AddXPObject(Player5,37500)
AddXPObject(Player6,37500)
GiveGoldForce(2500)
ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)
EraseJournalEntry(@360)
EraseJournalEntry(@362)
AddJournalEntry(@361,QUEST_DONE)~ GOTO BR_15
END

IF WEIGHT #-1 ~Global("D0Maevar2","GLOBAL",37)
!GlobalGT("D0LockAran","GLOBAL",0)~ THEN BEGIN BR_16
  SAY @431
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar2","GLOBAL",37)
GlobalGT("D0LockAran","GLOBAL",0)~ THEN BEGIN BR_16a
  SAY @432
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",38)~ EXIT
END

IF ~~ THEN BEGIN BR_17
  SAY @433
  IF ~~ THEN REPLY @434 GOTO BR_18
  IF ~~ THEN REPLY @435 GOTO BR_19
  IF ~~ THEN REPLY @436 GOTO BR_18
END

IF ~~ THEN BEGIN BR_18
  SAY @437
     =
      @438
  IF ~PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY @424 DO ~TakePartyItem("misc5m")~ GOTO 10
  IF ~!PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY @425 GOTO 11
  IF ~PartyHasItem("misc9h")
!Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY @426 GOTO 23
  IF ~PartyHasItem("misc9h")
Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY @427 GOTO 23
  IF ~~ THEN REPLY @439 GOTO BR_18a
  IF ~~ THEN REPLY @415 GOTO 2
END

IF ~~ THEN BEGIN BR_18a
  SAY @440
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BR_19
  SAY @441
     =
      @438
  IF ~PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY @424 DO ~TakePartyItem("misc5m")~ GOTO 10
  IF ~!PartyHasItem("misc5m")
Global("ToldInspector","GLOBAL",1)
!Global("MurdersSolved","GLOBAL",1)~ THEN REPLY @425 GOTO 11
  IF ~PartyHasItem("misc9h")
!Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY @426 GOTO 23
  IF ~PartyHasItem("misc9h")
Alignment(LastTalkedToBy,MASK_EVIL)~ THEN REPLY @427 GOTO 23
  IF ~~ THEN REPLY @439 GOTO BR_18a
  IF ~~ THEN REPLY @415 GOTO 2
END

END

CHAIN
IF ~~ THEN HABREGA BR_2
  @442
  = @443
  == EDWINJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Edwin")
!Dead("c6bodhi")~ THEN @444
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
!Dead("c6bodhi")~ THEN @445
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
Dead("c6bodhi")~ THEN @446
== KELDORJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Keldorn")~ THEN @447
== IMOEN2J IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Imoen2")~ THEN @448
== AERIEJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Aerie")~ THEN @449
END
  ++ @407 + BR_6
  ++ @408 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_2a
  ++ @450 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_7
  ++ @409 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_8
  ++ @410 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_9

CHAIN
IF ~~ THEN HABREGA BR_3
  @451
     =
      @452
  == EDWINJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Edwin")
!Dead("c6bodhi")~ THEN @444
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
!Dead("c6bodhi")~ THEN @445
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
Dead("c6bodhi")~ THEN @446
== KELDORJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Keldorn")~ THEN @447
== IMOEN2J IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Imoen2")~ THEN @448
== AERIEJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Aerie")~ THEN @449
END
  ++ @407 + BR_6
  ++ @408 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_2a
  ++ @450 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_7
  ++ @409 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_8
  ++ @410 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_9

CHAIN
IF ~~ THEN HABREGA BR_4
  @453
     =
      @452
  == EDWINJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Edwin")
!Dead("c6bodhi")~ THEN @444
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
!Dead("c6bodhi")~ THEN @445
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
Dead("c6bodhi")~ THEN @446
== KELDORJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Keldorn")~ THEN @447
== IMOEN2J IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Imoen2")~ THEN @448
== AERIEJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Aerie")~ THEN @449
END
  ++ @407 + BR_6
  ++ @408 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_2a
  ++ @450 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_7
  ++ @409 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_8
  ++ @410 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_9

CHAIN
IF ~~ THEN HABREGA BR_5
  @454
     =
      @452
  == EDWINJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Edwin")
!Dead("c6bodhi")~ THEN @444
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
!Dead("c6bodhi")~ THEN @445
== JAHEIRAJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Jaheira")
Dead("c6bodhi")~ THEN @446
== KELDORJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Keldorn")~ THEN @447
== IMOEN2J IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Imoen2")~ THEN @448
== AERIEJ IF ~Global("Interjects1Done","LOCALS",0)
IsValidForPartyDialog("Aerie")~ THEN @449
END
  ++ @407 + BR_6
  ++ @408 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_2a
  ++ @450 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_7
  ++ @409 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_8
  ++ @410 DO ~SetGlobal("Interjects1Done","LOCALS",1)~ + BR_9

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM BYLANNA 5
  IF ~Global("D0Maevar2","GLOBAL",34)
Global("D0AttackThieves","GLOBAL",0)~ THEN REPLY @455 GOTO BY_1
END

EXTEND_BOTTOM BYLANNA 6
  IF ~Global("D0Maevar2","GLOBAL",34)
Global("D0AttackThieves","GLOBAL",0)~ THEN REPLY @455 GOTO BY_1
END

APPEND BYLANNA

IF ~~ THEN BEGIN BY_1
  SAY @456
     =
      @457
  IF ~~ THEN DO ~SetGlobal("D0Maevar2","GLOBAL",37)
AddExperienceParty(12500)
AddJournalEntry(@362,QUEST)~ EXIT
END

IF WEIGHT #-1 ~Global("D0LockAran","GLOBAL",1)~ THEN BEGIN BY_2
  SAY @458
  IF ~~ THEN DO ~SetGlobal("D0LockAran","GLOBAL",2)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
AddJournalEntry(@517,QUEST_DONE)~ EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND ARNMAN01

IF WEIGHT #-1 ~Dead("Aran")
!AreaCheck("ar0329")
Global("D0PrisonersFree","GLOBAL",0)~ THEN BEGIN PR1_0
  SAY #38979 /* ~Ahhhh, leave me alone.  Aran ain't e'en thought o' me in years, he ain't about t' let me outta here.  Unless ye gots some good bread, there...does ye gots good bread?~ */
  IF ~Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @459 GOTO PR1_3
  IF ~!Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @460 GOTO PR1_3
  IF ~OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @461 GOTO PR1_3
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_1
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
!GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_1a
END

IF WEIGHT #-1 ~AreaCheck("ar0329")
Global("D0PrisonersFree","GLOBAL",0)~ THEN BEGIN PR1_1
  SAY @462
  IF ~Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @459 GOTO PR1_3
  IF ~!Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @460 GOTO PR1_3
  IF ~OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @461 GOTO PR1_3
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_1
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
!GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_1a
END

IF ~~ THEN BEGIN PRI1_2
  SAY @463
  IF ~Dead("Aran")~ THEN REPLY @459 GOTO PR1_3
  IF ~!Dead("Aran")~ THEN REPLY @460 GOTO PR1_3
  IF ~~ THEN REPLY @464 GOTO PR1_3
END

IF ~~ THEN BEGIN PR1_3
  SAY @465
      =
      @466
  IF ~~ THEN DO ~SetGlobal("D0PrisonersFree","GLOBAL",1)
ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)
DialogInterrupt(FALSE)
EscapeAreaDestroy(15)~ EXIT
END

END

APPEND AERIEJ
IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_1
  SAY @467
  IF ~~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ARNMAN01 PRI1_2
END

IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_1a
  SAY @468
  IF ~~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ARNMAN01 PRI1_2
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND ARNMAN02

IF WEIGHT #-1 ~OR(2)
AreaCheck("ar0329")
Dead("aran")
Global("D0PrisonersFree","GLOBAL",0)~ THEN BEGIN PR2_1
  SAY #38997 /* ~(grumble)  Is it night or day, yet?  I wouldn't mind seein' th' sun, or somethin'.  Mebbe a picture o' th' sun.  Or some heat...yeah...like a blanket...~ */
  IF ~Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @459 GOTO PR2_3
  IF ~!Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @460 GOTO PR2_3
  IF ~OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @461 GOTO PR2_3

  IF ~IsValidForPartyDialog("Anomen")
Global("D0AnoPrisonerComment","GLOBAL",0)
GlobalGT("D0Maevar2","GLOBAL",33)
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN EXTERN ANOMENJ D0_PRISONER_INTERJECT_99

  IF ~IsValidForPartyDialog("HaerDalis")
Global("D0HaerPrisonerComment","GLOBAL",0)
GlobalGT("D0Maevar2","GLOBAL",33)
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN EXTERN HAERDAJ D0_PRISONER_INTERJECT_999

  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_2
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
!GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_2a
END

IF ~~ THEN BEGIN PRI2_2
  SAY @469
  IF ~Dead("Aran")~ THEN REPLY @459 GOTO PR2_3
  IF ~!Dead("Aran")~ THEN REPLY @460 GOTO PR2_3
  IF ~~ THEN REPLY @470 GOTO PR2_3
END

IF ~~ THEN BEGIN PR2_3
  SAY @471
      =
      @466
  IF ~~ THEN DO ~SetGlobal("D0PrisonersFree","GLOBAL",1)
ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)
DialogInterrupt(FALSE)
EscapeAreaDestroy(15)~ EXIT
END

IF ~~ THEN BEGIN PR2_4
  SAY @472
  IF ~Dead("Aran")~ THEN REPLY @459 GOTO PR2_3
  IF ~!Dead("Aran")~ THEN REPLY @460 GOTO PR2_3
  IF ~~ THEN REPLY @461 GOTO PR2_3
END

IF ~~ THEN BEGIN PR2_5
  SAY @473
  IF ~Dead("Aran")~ THEN REPLY @459 GOTO PR2_3
  IF ~!Dead("Aran")~ THEN REPLY @460 GOTO PR2_3
  IF ~~ THEN REPLY @470 GOTO PR2_3
END

END

APPEND AERIEJ
IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_2
  SAY @467
  IF ~~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ARNMAN02 PRI2_2
  IF ~IsValidForPartyDialog("Anomen")
Global("D0AnoPrisonerComment","GLOBAL",0)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ANOMENJ D0_PRISONER_INTERJECT_99a
  IF ~IsValidForPartyDialog("HaerDalis")
Global("D0HaerPrisonerComment","GLOBAL",0)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN HAERDAJ D0_PRISONER_INTERJECT_999a
END

IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_2a
  SAY @468
  IF ~~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ARNMAN02 PRI2_2
  IF ~IsValidForPartyDialog("Anomen")
Global("D0AnoPrisonerComment","GLOBAL",0)~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ANOMENJ D0_PRISONER_INTERJECT_99
  IF ~IsValidForPartyDialog("HaerDalis")
Global("D0HaerPrisonerComment","GLOBAL",0)~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN HAERDAJ D0_PRISONER_INTERJECT_999
END
END

APPEND ANOMENJ
IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_99
  SAY @474
  IF ~~ THEN DO ~SetGlobal("D0AnoPrisonerComment","GLOBAL",1)~ EXTERN ARNMAN02 PR2_4
END

IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_99a
  SAY @474
  IF ~~ THEN DO ~SetGlobal("D0AnoPrisonerComment","GLOBAL",1)~ EXTERN ARNMAN02 PR2_5
END
END

APPEND HAERDAJ
IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_999
  SAY @475
  IF ~~ THEN DO ~SetGlobal("D0HaerPrisonerComment","GLOBAL",1)~ EXTERN ARNMAN02 PR2_4
END

IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_999a
  SAY @475
  IF ~~ THEN DO ~SetGlobal("D0HaerPrisonerComment","GLOBAL",1)~ EXTERN ARNMAN02 PR2_5
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND ARNMAN05

IF WEIGHT #-1 ~Allegiance(Myself,ENEMY)~ THEN BEGIN PR5_1
  SAY @476
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND ARNMAN06

IF WEIGHT #-1 ~Dead("Aran")
!AreaCheck("ar0329")
Global("D0PrisonersFree","GLOBAL",0)~ THEN BEGIN PR6_0
  SAY #39090 /* ~It's so...so cold down here.  And the other prisoners are bleaker than a dark pit in the Abyss.  I just...I just wish Aran would take pity on me and have it over with.~ */
  IF ~Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @459 GOTO PR6_3
  IF ~!Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @460 GOTO PR6_3
  IF ~OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @477 GOTO PR6_3
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_6
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
!GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_6a
END

IF WEIGHT #-1 ~AreaCheck("ar0329")
Global("D0PrisonersFree","GLOBAL",0)~ THEN BEGIN PR6_1
  SAY @478
  IF ~Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @459 GOTO PR6_3
  IF ~!Dead("Aran")
OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @460 GOTO PR6_3
  IF ~OR(2)
!IsValidForPartyDialog("Aerie")
Global("D0AeriePrisonerComment","GLOBAL",1)~ THEN REPLY @461 GOTO PR6_3
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_6
  IF ~IsValidForPartyDialog("Aerie")
!Global("D0AeriePrisonerComment","GLOBAL",1)
!GlobalGT("D0Maevar2","GLOBAL",33)~ THEN EXTERN AERIEJ D0_PRISONER_INTERJECT_6a
END

IF ~~ THEN BEGIN PRI6_2
  SAY @479
  IF ~Dead("Aran")~ THEN REPLY @459 GOTO PR6_3
  IF ~!Dead("Aran")~ THEN REPLY @460 GOTO PR6_3
  IF ~~ THEN REPLY @477 GOTO PR6_3
END

IF ~~ THEN BEGIN PR6_3
  SAY @480
  IF ~~ THEN DO ~SetGlobal("D0PrisonersFree","GLOBAL",1)
ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)
DialogInterrupt(FALSE)
EscapeAreaDestroy(15)~ EXIT
END

END

APPEND AERIEJ
IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_6
  SAY @467
  IF ~~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ARNMAN06 PRI6_2
END

IF ~~ THEN BEGIN D0_PRISONER_INTERJECT_6a
  SAY @468
  IF ~~ THEN DO ~SetGlobal("D0AeriePrisonerComment","GLOBAL",1)~ EXTERN ARNMAN06 PRI6_2
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND ARNMAN07

IF WEIGHT #-1 ~Dead("Aran")
!Global("D0PrisonersFree","GLOBAL",1)~ THEN BEGIN PR7_1
  SAY #61161 /* ~....uhhhh.... (groan)~ */
  IF ~~ THEN REPLY @481 GOTO PR7_2
  IF ~~ THEN REPLY @482 GOTO PR7_2
END

IF ~~ THEN BEGIN PR7_2
  SAY #39112 /* ~AYYYYYAHHHHHHhhhh....hhnh...   nn...~ */
  IF ~~ THEN DO ~Kill(Myself)~ EXIT
END

IF ~Global("D0PrisonersFree","GLOBAL",1)~ THEN BEGIN PR7_3
  SAY @483
  IF ~~ THEN DO ~Kill(Myself)~ EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0GUARD2

IF ~Global("D0AttackThieves","GLOBAL",0)
GlobalLT("D0Maevar2","GLOBAL",37)~ THEN BEGIN AMN_1
  SAY @484
  IF ~OpenState("door0305",FALSE)~ THEN DO ~SetGlobal("D0AttackThieves","GLOBAL",1)
SetGlobal("D0AranHostile","GLOBAL",1)
SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
TriggerActivation("Tran0327",TRUE)
Unlock("door0305")
StartCutSceneMode()
MoveToObject("door0305")
OpenDoor("door0305")
EndCutSceneMode()~ EXIT
  IF ~OpenState("door0305",TRUE)~ THEN DO ~SetGlobal("D0AttackThieves","GLOBAL",1)
SetGlobal("D0AranHostile","GLOBAL",1)
SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
TriggerActivation("Tran0327",TRUE)
Unlock("door0305")
StartCutSceneMode()
MoveToObject("door0305")
EndCutSceneMode()~ EXIT
END

IF ~AreaCheck("ar0327")
CombatCounter(0)
!Detect(NearestEnemyOf(Myself))
!Allegiance(Myself,ENEMY)
GlobalLT("D0Maevar2","GLOBAL",37)
OpenState("SECRET01",TRUE)~ THEN BEGIN AMN_2a
  SAY @485
  IF ~~ THEN DO ~SetGlobal("D0Interact","LOCALS",1)~ EXIT
END

IF ~AreaCheck("ar0327")
CombatCounter(0)
!Detect(NearestEnemyOf(Myself))
!Allegiance(Myself,ENEMY)
GlobalLT("D0Maevar2","GLOBAL",37)
PartyHasItem("misc4s")
OpenState("SECRET01",FALSE)~ THEN BEGIN AMN_2b
  SAY @486
  IF ~~ THEN DO ~SetGlobal("D0Interact","LOCALS",1)~ EXIT
END

IF ~AreaCheck("ar0327")
CombatCounter(0)
!Detect(NearestEnemyOf(Myself))
!Allegiance(Myself,ENEMY)
GlobalLT("D0Maevar2","GLOBAL",37)
!PartyHasItem("misc4s")
OpenState("SECRET01",FALSE)~ THEN BEGIN AMN_2c
  SAY @487
  IF ~~ THEN DO ~SetGlobal("D0Interact","LOCALS",1)~ EXIT
END

IF ~AreaCheck("ar0329")
Global("D0Interact","LOCALS",1)
GlobalLT("D0Maevar2","GLOBAL",37)~ THEN BEGIN AMN_3
  SAY @488
  IF ~~ THEN DO ~SetGlobal("D0Interact","LOCALS",2)~ EXIT
END

IF ~Global("D0Interact","LOCALS",2)
Dead("Aran")
GlobalLT("D0Maevar2","GLOBAL",37)~ THEN BEGIN AMN_4
  SAY @489
  IF ~~ THEN EXIT
END

IF ~GlobalGT("D0Maevar2","GLOBAL",36)~ THEN BEGIN AMN_5
  SAY @490
  IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0ARNLIE

IF WEIGHT #1 ~GlobalGT("D0Maevar2","GLOBAL",0)~ THEN BEGIN HAZ_1
  SAY @491
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF WEIGHT #-2 ~GlobalGT("D0Maevar","GLOBAL",4)~ THEN BEGIN HAZ_2
  SAY @492
  IF ~~ THEN DO ~DestroyItem("key12") Enemy()~ EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND ARNWAR08
IF WEIGHT #-1 ~GlobalGT("D0Maevar2","GLOBAL",33)
!Dead("booter02")
!OpenState("DOOR03",TRUE)~ THEN BEGIN TIZ_1
SAY @493
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~GlobalGT("D0Maevar2","GLOBAL",33)
Dead("booter02")
!OpenState("DOOR03",TRUE)~ THEN BEGIN TIZ_2
SAY @494
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~GlobalGT("D0Maevar2","GLOBAL",33)
OpenState("DOOR03",TRUE)~ THEN BEGIN TIZ_3
  SAY #39239 /* ~Praise Mask! Thank you for freeing me. My former guild isn't as friendly as I had hoped it would be.~ */
  IF ~~ THEN REPLY @495 GOTO TIZ_5
  IF ~~ THEN REPLY #39258 /* ~Tell me how to find Aran Linvail or I'll slit your throat!~ */ GOTO TIZ_4
END

IF ~~ THEN BEGIN TIZ_4
  SAY @496
= #39269 /* ~Aran's inner sanctum is protected by two magical doors. They can be neither picked nor bashed. You shall have to find a button for the first and a key for the second.~ */
= #39273 /* ~The button can be found somewhere to the north, at the end of a heavily trapped hallway. ~ */
= @497
= @498
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN TIZ_5
  SAY @499
= @500
= #39269 /* ~Aran's inner sanctum is protected by two magical doors. They can be neither picked nor bashed. You shall have to find a button for the first and a key for the second.~ */
= #39273 /* ~The button can be found somewhere to the north, at the end of a heavily trapped hallway. ~ */
= @497
= @498
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

CHAIN
IF WEIGHT #-1 ~OR(2)
GlobalGT("D0AranHostile","GLOBAL",0)
GlobalGT("D0Maevar2","GLOBAL",33)
Global("D0Interact","LOCALS",0)
!GlobalGT("BodhiJob","GLOBAL",0)~ THEN ARAN02 AR_1
  @501
  DO ~SetGlobal("D0Interact","LOCALS",1)
Enemy()~
  == KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @502
  == ARAN02 IF ~IsValidForPartyDialog("Keldorn")~ THEN @503
  == KELDORJ IF ~IsValidForPartyDialog("Keldorn")~ THEN @504
  == ARAN02 IF ~IsValidForPartyDialog("Imoen2")~ THEN @505
  == IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN @506
  == JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Imoen2")~ THEN @507
  == ANOMENJ IF ~IsValidForPartyDialog("Anomen")
Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN @508
  == ANOMENJ IF ~IsValidForPartyDialog("Anomen")
!Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN @509
  == MAZZYJ IF ~IsValidForPartyDialog("Mazzy")
OR(2)
IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Imoen2")~ THEN @510
  == MAZZYJ IF ~IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Imoen2")~ THEN @511
//  == KHADIONJ IF ~IsValidForPartyDialog("Khadion") THEN ~(Khadion's pants fall down.)~
  == ARAN02 @512
EXIT

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0GUARD3

IF ~True()~ THEN BEGIN D0G_1
SAY @513
IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND GAELAN2

IF WEIGHT #-1 ~!Global("WorkingForBodhi","GLOBAL",1)~ THEN BEGIN GAE
SAY @514
IF ~~ THEN DO ~Enemy()~ EXIT
END

END
