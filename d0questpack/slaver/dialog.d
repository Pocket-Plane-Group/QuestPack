// Busting slaver out of jail

/* BEGIN D0JAISLA

IF ~NumTimesTalkedTo(0)~ Jail1
SAY ~Please!  Help an old man in trouble!~
++ ~Silence, lawbreaking scum!  I have no wish to speak to petty criminals.~ GOTO Jail2
++ ~What is it you need, my good man?~ GOTO Jail3
++ ~I cannot help you now.  I have other matters to attend to.~ GOTO Jail4
END

IF ~~ Jail2
SAY ~But you must understand: I am no petty criminal! I was wrongfully imprisoned, framed by a slaver group operating in the city.~
+ ~OR(2)
Dead("Lehtinan")
Global("HendakTold","GLOBAL",1)~ + ~The slavers again?  I detest them.  I'd free you just to disrupt their operation.~ GOTO Jail5
+ ~!Dead("Lehtinan")
!Global("HendakTold","GLOBAL",1)~ + ~Slavers?  I detest slavery.  I'd free you just to disrupt their operation.~ GOTO Jail5
++ ~I don't believe you.  Evidently you stood trial and were found guilty.  You must face the consequences of your actions.~ GOTO Jail6
END

IF ~~ Jail3
SAY ~Free me from this place, I beg you! Steal the key from the guard, and unlock my cell!~
++ ~First, tell me why you are incarcerated here.~ GOTO Jail7
++ ~You must be joking. I have no intention of unleashing lowlife onto the streets.~ GOTO Jail2
++ ~I could do. If the reward is right.~ GOTO JailReward
++ ~But that would be a most unlawful action. I fear I cannot help you.~ GOTO JailAgain2
++ ~No problem. I'll be back in a minute.~
END

IF ~~ Jail4
SAY ~It will not take a moment of your time. I have one simple request, and that is all.~
IF ~~ THEN GOTO Jail3
END

IF ~~ Jail5
SAY ~Yes! Free me, please! Steal the key from the guard, and unlock my cell!~
++ ~Actually, as much as I'd like to upset the slavers, I'd rather not free you.~ GOTO JailAgain2
++ ~I could do. If the reward is right.~
++ ~No problem. I'll be back in a minute.~
END

IF ~~ Jail6
SAY ~Trial?  Open your eyes!  You cannot have missed the talk of bribery of the guards, of corruption in the Council itself.~
= ~The prison is a place for the influential groups in Athkatla to dispose of their inconveniences.  Much neater than killing.  No questions asked.~
++ ~Yes, perhaps you are right-- outside this very prison, a mob was preparing a public execution as the guards turned a blind eye.  It seems this city's 'justice' cannot be relied upon.~
++ ~Nevertheless, I am in no position to pass judgement on you.  Here you must stay until you can prove your innocence.~
++ ~

IF ~~ Jail7

IF ~~ JailReward
SAY ~I fear I have nothing to offer you. Perhaps my case will rest on your conscience. Either unlock my cell, or leave me be.~
IF ~~ THEN EXIT
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN JailAgain
SAY ~Either unlock my cell, or leave me be.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JailAgain2
SAY ~Well, I have presented my case. Either unlock my cell, or leave me be.~
IF ~~ THEN EXIT
END


~And so you left me to rot?!  Not even so much as a coin to the guards! If that's how you reward loyalty...~
~Quiet, Fekir!  The intruders approach.  Let us dispatch them first.~ */

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// Lehtinan's new task
/* EXTEND_BOTTOM LEHTIN 23
IF ~!Dead("Haegan")~ THEN DO ~GiveItemCreate("PLAT01",LastTalkedToBy,0,0,0)
GiveItemCreate("SW1H03",LastTalkedToBy,0,0,0)~ GOTO NewTask0
END

EXTEND_BOTTOM LEHTIN 24
IF ~!Dead("Haegan")~ THEN DO ~GiveItemCreate("SW1H03",LastTalkedToBy,0,0,0)~ GOTO NewTask0
END

APPEND LEHTIN
IF ~~ THEN BEGIN NewTask0
SAY ~(Hurmm). I have another favour to ask of you, if you are willing. It may involve a little dirty work, but you will profit as from every dealing with me. What do you say?~
IF ~~ THEN REPLY ~Sounds good to me. What do you need?~ GOTO NewTask1
IF ~~ THEN REPLY ~I think I've already helped you out enough. I'm not interested in doing anything more.~ GOTO NewTask2
END

IF ~~ THEN BEGIN NewTask1
SAY ~I am expecting a delivery of slaves from my associate, Captain Haegan. Rather typically, he has not delivered on time, and with Hendak dead it is all the more pressing that I find a replacement.~
= ~To save expenses bribing the guards, the slaves are usually escorted through the sewers beneath the slums. You will find a hidden entrance in the backrooms. Make your way through to the slaver compound and escort the slaves back.~
IF ~~ THEN REPLY ~What would be my payment for this task?~ GOTO NewTask3
IF ~!Global("LehtinanPaid","GLOBAL",1)~ THEN REPLY ~Good enough for me. I will go at once.~ GOTO NewTask4a
IF ~Global("LehtinanPaid","GLOBAL",1)~ THEN REPLY ~Good enough for me. I will go at once.~ GOTO NewTask4b
IF ~~ THEN REPLY ~I think I've already helped you out enough. I'm not interested in doing anything more.~ GOTO NewTask2
END

IF ~~ THEN BEGIN NewTask2
SAY ~As you wish. That is entirely your choice... (hurrmm...) and your loss, of course.~
IF ~!Global("LehtinanPaid","GLOBAL",1)~ THEN GOTO 25
IF ~Global("LehtinanPaid","GLOBAL",1)~ THEN GOTO 26
END

IF ~~ THEN BEGIN NewTask3
SAY ~I assure you, I will provide something adequate. My partners and associates always profit most handsomely.~
IF ~!Global("LehtinanPaid","GLOBAL",1)~ THEN REPLY ~Good enough for me. I will go at once.~ GOTO NewTask4a
IF ~Global("LehtinanPaid","GLOBAL",1)~ THEN REPLY ~Good enough for me. I will go at once.~ GOTO NewTask4b
IF ~~ THEN REPLY ~I think I've already helped you out enough. I'm not interested in doing anything more.~ GOTO NewTask2
END

IF ~~ THEN BEGIN NewTask4a
SAY ~My thanks again. Talk to Bernard when you wish to buy something and you shall get a special discount. I wish you luck.~
IF ~~ THEN DO ~AddJournalEntry(@58,QUEST)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobal("SlavingJerk","GLOBAL",2)
SetGlobal("LehtinanCheap","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN NewTask4b
SAY ~My thanks again. By all means, make the most of the facilities the Copper Coronet has to offer. I wish you luck.~
IF ~~ THEN DO ~AddJournalEntry(@58,QUEST)
IncrementGlobal("D0Change","GLOBAL",-1)
SetGlobal("SlavingJerk","GLOBAL",2)
SetGlobal("LehtinanCheap","GLOBAL",1)~ EXIT
END


IF WEIGHT #-1 ~Blah~ THEN BEGIN ComeBack0
SAY ~You're back! (hurrrmm) I hardly expected you to return. Proved too much for Haegan and his men, did you?~
IF ~~ THEN REPLY ~I did indeed. You knew he would attack?~ GOTO ComeBack1
IF ~~ THEN REPLY ~What is going on here? I thought we had a deal?!~ GOTO ComeBack1
END

IF ~Blah~ THEN BEGIN ComeBack1
SAY ~You knew too much. But that matters not now-- with Haegan dead, he will serve easily enough as a scapegoat without being able to implicate me. Now, stay or leave, but our dealings are at and end.~
IF ~~ THEN DO ~SetGlobal(fdgfdg)
EraseJournalEntry(15705)
EraseJournalEntry(16553)
EraseJournalEntry(34114)
EraseJournalEntry(34118)
EraseJournalEntry(34119)
EraseJournalEntry(9979)
AddJournalEntry(fdgdfg)~ EXIT
END

IF WEIGHT #-1 ~Blahblah~ THEN BEGIN ComeBack2
SAY ~If you wish something, speak with Bernard.~
IF ~~ THEN EXIT
END
END */

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// Dialogue negotiation with slavers in slums

REPLACE SLAVER2
IF ~True()~ THEN BEGIN 3 // from:
SAY #19779 /* ~Get lost.  It be none o' yer business.~ */
IF ~~ THEN REPLY @0 GOTO SL_1
IF ~~ THEN REPLY @1 GOTO SL_2
IF ~~ THEN REPLY @2 GOTO SL_3
END
END

APPEND SLAVER2
IF ~~ THEN BEGIN SL_1
SAY @3
IF ~~ THEN REPLY @1 GOTO SL_2a
IF ~~ THEN REPLY @4 GOTO SL_2c
IF ~~ THEN REPLY @5 GOTO SL_3
IF ~~ THEN REPLY @6 GOTO SL_4
IF ~~ THEN REPLY @7 GOTO SL_5
END

IF ~~ THEN BEGIN SL_2
SAY @8
IF ~~ THEN REPLY @9 GOTO SL_2b
IF ~~ THEN REPLY @4 GOTO SL_2c
IF ~~ THEN REPLY @5 GOTO SL_3
IF ~~ THEN REPLY @6 GOTO SL_4
IF ~~ THEN REPLY @7 GOTO SL_5
END

IF ~~ THEN BEGIN SL_2a
SAY @10
IF ~~ THEN REPLY @11 GOTO SL_2b
IF ~~ THEN REPLY @4 GOTO SL_2c
IF ~~ THEN REPLY @5 GOTO SL_3
IF ~~ THEN REPLY @6 GOTO SL_4
IF ~~ THEN REPLY @7 GOTO SL_5
END

IF ~~ THEN BEGIN SL_2b
SAY @12
IF ~~ THEN DO ~Shout(1)
ActionOverride("SlumsSlaver3",Enemy())
Enemy()~ EXIT
END

IF ~~ THEN BEGIN SL_2c
SAY @13
IF ~~ THEN DO ~Shout(1)
ActionOverride("SlumsSlaver3",Enemy())
Enemy()~ EXIT
END

IF ~~ THEN BEGIN SL_3
SAY @14
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SL_4
SAY @15
IF ~~ THEN REPLY @11 GOTO SL_2b
IF ~~ THEN REPLY @5 GOTO SL_3
IF ~~ THEN REPLY @7 GOTO SL_5
END

IF ~~ THEN BEGIN SL_5
SAY @16
IF ~~ THEN REPLY @17 GOTO SL_2b
IF ~~ THEN REPLY @18 GOTO SL_2c
IF ~~ THEN REPLY @5 GOTO SL_3
END
END

REPLACE SLAVER3
IF ~True()~ THEN BEGIN 1 // from:
SAY #19782 /* ~Stand aside, fool, or you'll regret it.~ */
IF ~~ THEN REPLY @19 GOTO SL2_1
IF ~~ THEN REPLY @20 GOTO SL2_1
IF ~~ THEN REPLY @21 GOTO SL2_2
END
END

APPEND SLAVER3
IF ~~ THEN BEGIN SL2_1
SAY @22
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SL2_2
SAY @23
IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM LEHTIN 7
IF ~GlobalGT("TalkedToArenthis","GLOBAL",0)
GlobalLT("KamirWard","GLOBAL",3)
Global("D0SlaveGirl","GLOBAL",0)~ THEN REPLY @24 GOTO LE_1
END

EXTEND_BOTTOM LEHTIN 0
IF ~GlobalGT("TalkedToArenthis","GLOBAL",0)
GlobalLT("KamirWard","GLOBAL",3)
Global("D0SlaveGirl","GLOBAL",0)
Global("Backroom","GLOBAL",1)
OR(3)
GlobalGT("SlavingJerk","GLOBAL",0)
GlobalGT("KnowSlaves","GLOBAL",0)
GlobalGT("HendakTold","GLOBAL",0)~ THEN REPLY @24 GOTO LE_1
END

EXTEND_BOTTOM LEHTIN 14
IF ~GlobalGT("TalkedToArenthis","GLOBAL",0)
GlobalLT("KamirWard","GLOBAL",3)
Global("D0SlaveGirl","GLOBAL",0)
Global("Backroom","GLOBAL",1)
OR(3)
GlobalGT("SlavingJerk","GLOBAL",0)
GlobalGT("KnowSlaves","GLOBAL",0)
GlobalGT("HendakTold","GLOBAL",0)~ THEN REPLY @24 GOTO LE_1
END

APPEND LEHTIN
IF ~~ THEN BEGIN LE_1
SAY @25
IF ~~ THEN REPLY @26 GOTO LE_2
IF ~~ THEN REPLY @27 GOTO 5
IF ~~ THEN REPLY @28 GOTO 5
END

IF ~~ THEN BEGIN LE_2
SAY @29
IF ~~ THEN REPLY @30 GOTO LE_3
IF ~~ THEN REPLY @28 GOTO 5
END

IF ~~ THEN BEGIN LE_3
SAY @31
IF ~~ THEN DO ~AddJournalEntry(@59,QUEST)
SetGlobal("D0SlaveGirl","GLOBAL",1)~ EXIT
END

IF WEIGHT #-1 ~Global("D0SlaveGirl","GLOBAL",8)~ THEN BEGIN LE_4
SAY @32
= @33
IF ~Global("Backroom","GLOBAL",1)~ THEN DO ~SetGlobal("D0SlaveGirl","GLOBAL",9)
IncrementGlobal("D0Virtue","GLOBAL",-2)
GiveGoldForce(5000)~ GOTO LE_5
IF ~Global("Backroom","GLOBAL",0)~ THEN DO ~SetGlobal("D0SlaveGirl","GLOBAL",9)
IncrementGlobal("D0Virtue","GLOBAL",-2)
GiveGoldForce(5000)~ GOTO LE_6
END

IF ~~ THEN BEGIN LE_5
SAY @34
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN LE_6
SAY @35
IF ~~ THEN GOTO 10
END

IF WEIGHT #-1 ~Global("D0SlaveGirl","GLOBAL",7)~ THEN BEGIN LE_7
SAY @36
IF ~~ THEN DO ~SetGlobal("D0SlaveGirl","GLOBAL",9)~ EXIT
END
END

BEGIN D0QPSLAV

IF ~NumTimesTalkedTo(0)~ THEN BEGIN SL_1
SAY @37
IF ~~ THEN DO ~SetGlobal("D0SlaveGirl","GLOBAL",3)~ EXIT
END

IF ~Detect("arenthis")~ THEN BEGIN SL_2
SAY @38
IF ~~ THEN DO ~SetGlobal("D0SlaveGirl","GLOBAL",4)~ EXTERN ARENTHIS AR_1
END

IF ~~ THEN BEGIN SL_3
SAY @39
IF ~ReputationGT(Player1,10)~ THEN EXTERN ARENTHIS AR_2
IF ~!ReputationGT(Player1,10)~ THEN EXTERN ARENTHIS AR_3
END

IF ~~ THEN BEGIN SL_4
SAY @40
IF ~~ THEN DO ~SetCutSceneLite(TRUE)
SetGlobal("D0SlaveGirl","GLOBAL",6)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN SL_5
SAY @41
= @42
IF ~~ THEN EXTERN MOURNER7 RI_1
END

APPEND MOURNER7
IF ~~ THEN BEGIN RI_1
SAY @43
IF ~~ THEN EXTERN ARENTHIS AR_4
END

IF ~~ THEN BEGIN RI_2
SAY @44
= @45
IF ~~ THEN EXTERN KAMIR 19
END
END

APPEND ARENTHIS
IF ~~ THEN BEGIN AR_1
SAY @46
IF ~~ THEN EXTERN D0QPSLAV SL_3
END

IF ~~ THEN BEGIN AR_2
SAY @47
= @48
IF ~!Dead("kamir")~ THEN DO ~SetCutSceneLite(TRUE)
CreateCreature("kamir",[2310.1542],0)
ActionOverride("kamir",MoveToPoint([2202.1733]))
ActionOverride("kamir",StartDialogNoSet("arenthis"))~ EXIT
IF ~Dead("kamir")~ THEN EXTERN D0QPSLAV SL_5
END

IF ~~ THEN BEGIN AR_3
SAY @49
= @48
IF ~!Dead("kamir")~ THEN DO ~SetCutSceneLite(TRUE)
CreateCreature("kamir",[2310.1542],0)
ActionOverride("kamir",MoveToPoint([2202.1733]))
ActionOverride("kamir",StartDialogNoSet("arenthis"))~ EXIT
IF ~Dead("kamir")~ THEN EXTERN D0QPSLAV SL_5
END

IF ~~ THEN BEGIN AR_4
SAY @50
IF ~~ THEN DO ~EraseJournalEntry(@59)
EraseJournalEntry(34382)
EraseJournalEntry(34383)
EraseJournalEntry(34384)
EraseJournalEntry(34385)
AddJournalEntry(@60,QUEST_DONE)
SetCutSceneLite(TRUE)
AddexperienceParty(7250)
SetGlobal("D0SlaveGirl","GLOBAL",8)
SetGlobal("KamirWard","GLOBAL",3)
ActionOverride("risa",MoveToObjectFollow("d0qpslav"))
Wait(2)
SetCutSceneLite(FALSE)
ActionOverride("risa",EscapeArea())
ActionOverride("d0qpslav",EscapeArea())~ EXIT
END
END

APPEND KAMIR
IF WEIGHT #-1 ~Global("D0SlaveGirl","GLOBAL",4)~ THEN BEGIN KA_1
SAY @51
IF ~~ THEN DO ~SetGlobal("D0SlaveGirl","GLOBAL",5)
SetCutSceneLite(TRUE)
ForceSpell(Myself,CLERIC_DETECT_EVIL)
Wait(1)
StartDialogNoSet("arenthis")~ EXIT
END

IF WEIGHT #-1 ~Global("D0SlaveGirl","GLOBAL",5)
!Alignment([PC],MASK_EVIL)~ THEN BEGIN KA_2a
SAY @52
IF ~~ THEN DO ~IncrementGlobal("D0Virtue","GLOBAL",-1)~ EXTERN D0QPSLAV SL_4
END

IF WEIGHT #-1 ~Global("D0SlaveGirl","GLOBAL",5)
Alignment([PC],MASK_EVIL)~ THEN BEGIN KA_2a
SAY @53
IF ~~ THEN DO ~IncrementGlobal("D0Virtue","GLOBAL",-1)
SetGlobal("D0BadSlaver","AR0800",1)
ReputationInc(-1)~ EXTERN D0QPSLAV SL_4
END

IF WEIGHT #-1 ~Global("D0SlaveGirl","GLOBAL",6)~ THEN BEGIN KA_3
SAY @54
= @55
IF ~~ THEN DO ~AddexperienceParty(7250)
EraseJournalEntry(@59)
EraseJournalEntry(34382)
EraseJournalEntry(34383)
EraseJournalEntry(34384)
EraseJournalEntry(34385)
AddJournalEntry(@61,QUEST_DONE)
SetGlobal("D0SlaveGirl","GLOBAL",7)
SetGlobal("KamirWard","GLOBAL",3)~ EXTERN MOURNER7 RI_2
END
END

EXTEND_BOTTOM kamir 23
IF ~Global("D0SlaveGirl","GLOBAL",7)~ DO ~EraseJournalEntry(34382)
EraseJournalEntry(34383)
EraseJournalEntry(34384)
EraseJournalEntry(34385)
AddexperienceParty(3000)
SetGlobal("KamirWard","GLOBAL",3)~ EXIT
END

EXTEND_BOTTOM MOURNER7 7
IF ~Global("D0BadSlaver","AR0800",1)~ THEN EXTERN KAMIR D0_23a
END

APPEND KAMIR
IF ~~ THEN BEGIN D0_23a
  SAY @56
  IF ~~ THEN DO ~EraseJournalEntry(34382)
EraseJournalEntry(34383)
EraseJournalEntry(34384)
EraseJournalEntry(34385)
SetGlobal("KamirWard","GLOBAL",3)~ EXIT
END
END

REPLACE ARENTHIS
IF ~Global("KamirWard","GLOBAL",3)
!Global("D0BadSlaver","AR0800",1)~ THEN BEGIN 16 // from:
  SAY #26751 /* ~I am most pleased at this wonderful turn of events.  Lathander's greatest blessing upon you, my <LADYLORD>, for the part you have played in this.  Sometimes...sometimes Faerun can be a kind place...~ */
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END
END

APPEND ARENTHIS
IF ~Global("KamirWard","GLOBAL",3)
Global("D0BadSlaver","AR0800",1)~ THEN BEGIN 16 // from:
  SAY @57
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END
END
