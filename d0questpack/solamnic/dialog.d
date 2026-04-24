// ALLOW SOLAMNIC KNIGHTS TO ESCAPE PLANAR SPHERE EVEN WHEN NOT A MAGE.

REPLACE_TRIGGER_TEXT OBSSOL01 ~Class(Player,MAGE_ALL)~ ~Class(Player1,MAGE_ALL)~

REPLACE OBSSOL01
IF ~~ THEN BEGIN 26 // from: 25.0
  SAY @0
  IF ~~ THEN REPLY #40662 /* ~And just how do you expect me to do that?~ */ DO ~SetGlobal("TalkedPCSphere","LOCALS",1)
SetGlobal("SolamnicKnights","GLOBAL",1)~ GOTO SK_14
  IF ~~ THEN REPLY #40663 /* ~I will see what can be done, but I do not think the sphere is capable of it.~ */ DO ~SetGlobal("TalkedPCSphere","LOCALS",1)
SetGlobal("SolamnicKnights","GLOBAL",1)~ GOTO SK_15
  IF ~~ THEN REPLY #40664 /* ~You have not experienced this plane of existence yet. Perhaps you would like it.~ */ DO ~SetGlobal("TalkedPCSphere","LOCALS",1)
SetGlobal("SolamnicKnights","GLOBAL",1)~ GOTO SK_16
  IF ~~ THEN REPLY @1 GOTO SK_1
END

IF WEIGHT #-1 ~Global("TalkedPCSphere","LOCALS",1)~ THEN BEGIN 20 // from:
  SAY #42261 /* ~Hello, <CHARNAME>, have you a good word for us? Is there anything that can be done for us? Can we be sent home?~ */
  IF ~~ THEN REPLY #42262 /* ~I do not know yet. I will try and see what can be done.~ */ GOTO SK_15
  IF ~Global("SolamnicKnights","GLOBAL",3)~ THEN REPLY #42263 /* ~I have arranged for a mage to come and send you home. It was quite expensive.~ */ GOTO 21
  IF ~Global("SolamnicPrelate","GLOBAL",1)~ THEN REPLY #42264 /* ~I spoke with the Prelate of the Order of the Radiant Heart. They would love to have you.~ */ GOTO SK_22
  IF ~~ THEN REPLY @1 GOTO SK_1
END
END

APPEND OBSSOL01
IF ~~ THEN BEGIN SK_1
  SAY #61449 /* ~Then we are trapped here.  As Knights of Solamnia we shall bear this with good grace.  We will travel your world and lend our swords and ours souls to the cause of the right.  Perhaps we may meet again.~ */
  IF ~~ THEN DO ~ActionOverride("obssol02",EscapeArea())
ActionOverride("obssol03",EscapeArea())
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN SK_14 // from: 13.0
  SAY @2
  IF ~~ THEN REPLY #40692 /* ~I will see what can be done. Now leave me.~ */ GOTO SK_15
  IF ~~ THEN REPLY #40693 /* ~Don't bother me with your problems. I do as I like.~ */ GOTO SK_16
END

IF ~~ THEN BEGIN SK_15 // from: 20.0 14.0 13.1
  SAY #40694 /* ~That is all we can ask. We have little choice.~ */
  IF ~~ THEN DO ~AddJournalEntry(@5,QUEST)~ EXIT
END

IF ~~ THEN BEGIN SK_16 // from: 14.1 13.2
  SAY #40695 /* ~I do not dispute that. I only ask that you see what can be done.~ */
  IF ~~ THEN DO ~AddJournalEntry(@5,QUEST)~ EXIT
END

IF ~~ THEN BEGIN SK_22
  SAY #42266 /* ~I see. You are suggesting that we make what lives we can within this paladins' order. Perhaps... perhaps we should. ~ */
= #42267 /* ~The likelihood of our return home is minimal. We must move on. We will go to this Order, and we will offer our lives to their cause.~ */
= #42268 /* ~Thank you, <CHARNAME>, I am grateful, if not happy. It is not home, but it will serve.~ */
  IF ~~ THEN DO ~AddExperienceParty(45000)
SetGlobal("SolamnicPrelate","GLOBAL",2)
ActionOverride("obssol02",EscapeAreaObject("Tran0400"))
ActionOverride("obssol03",EscapeAreaObject("Tran0400"))
EraseJournalEntry(55626)
EraseJournalEntry(55639)
EraseJournalEntry(55640)
EraseJournalEntry(55643)
EraseJournalEntry(55641)
EraseJournalEntry(55642)
EraseJournalEntry(@5)
EraseJournalEntry(@6)
EraseJournalEntry(@7)
EraseJournalEntry(@8)
EraseJournalEntry(@9)
EscapeAreaObject("Tran0400")
AddJournalEntry(@10,QUEST_DONE)~ EXIT
END
END

REPLACE HPRELATE
IF ~~ THEN BEGIN 28 // from: 27.0
  SAY #42238 /* ~Have them come and I shall give them lodgings. There is always evil to strive against, even if thay are not in their home plane. They can do their work here.~ */
  IF ~GlobalGT("PCSphere","GLOBAL",0)~ THEN REPLY #42239 /* ~Good. That will get them out of my way.~ */ DO ~SetGlobal("SolamnicPrelate","GLOBAL",1)~ UNSOLVED_JOURNAL #55642 /* ~Mage Stronghold: The Knights at the Order.

I have spoken with the prelate of the Most Noble Order of the Radiant Heart. He has said that the Solamnic Knights can stay as with them as honored guests. It's a viable alternative if they can't get home another way. ~ */ GOTO 25
  IF ~GlobalGT("PCSphere","GLOBAL",0)~ THEN REPLY #42240 /* ~I thank you, though they would rather go home. ~ */ DO ~SetGlobal("SolamnicPrelate","GLOBAL",1)~ UNSOLVED_JOURNAL #55642 /* ~Mage Stronghold: The Knights at the Order.

I have spoken with the prelate of the Most Noble Order of the Radiant Heart. He has said that the Solamnic Knights can stay as with them as honored guests. It's a viable alternative if they can't get home another way. ~ */ GOTO 25
  IF ~!GlobalGT("PCSphere","GLOBAL",0)~ THEN REPLY #42239 /* ~Good. That will get them out of my way.~ */ DO ~SetGlobal("SolamnicPrelate","GLOBAL",1)
AddJournalEntry(@6,QUEST)~ GOTO 25
  IF ~!GlobalGT("PCSphere","GLOBAL",0)~ THEN REPLY #42240 /* ~I thank you, though they would rather go home. ~ */ DO ~SetGlobal("SolamnicPrelate","GLOBAL",1)
AddJournalEntry(@6,QUEST)~ GOTO 25
END
END

REPLACE RIBALD
IF ~~ THEN BEGIN 33 // from: 32.1 31.2
  SAY #42022 /* ~Then return when you can afford it. I can go no lower for the services of someone else.~ */
  IF ~GlobalGT("PCSphere","GLOBAL",0)~ THEN UNSOLVED_JOURNAL #55640 /* ~Mage Stronghold: Ribald can free the Knights.

Ribald in the adventurers' mart has the means to send the knights home, but he requires 9000 gold.~ */ EXIT
  IF ~!GlobalGT("PCSphere","GLOBAL",0)~ THEN DO ~AddJournalEntry(@7,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 34 // from: 32.0 31.1
  SAY #42025 /* ~A pleasure doing business with you. You are in that wondrously odd sphere, are you not? I'll have my friend come by there tomorrow. ~ */
  IF ~GlobalGT("PCSphere","GLOBAL",0)~ THEN REPLY #42026 /* ~How did you know where I needed your mage to go?~ */ UNSOLVED_JOURNAL #55641 /* ~Mage Stronghold: I have paid for the Knights.

Ribald has taken 9000 gold and has promised to send a mage to the sphere and teleport the knights home. At these prices, she better show up!~ */ GOTO 35
  IF ~GlobalGT("PCSphere","GLOBAL",0)~ THEN REPLY #42027 /* ~She had better not be late!~ */ UNSOLVED_JOURNAL #55641 /* ~Mage Stronghold: I have paid for the Knights.

Ribald has taken 9000 gold and has promised to send a mage to the sphere and teleport the knights home. At these prices, she better show up!~ */ GOTO 36
  IF ~!GlobalGT("PCSphere","GLOBAL",0)~ THEN DO ~AddJournalEntry(@8,QUEST)~ REPLY #42026 /* ~How did you know where I needed your mage to go?~ */ GOTO 35
  IF ~!GlobalGT("PCSphere","GLOBAL",0)~ THEN DO ~AddJournalEntry(@8,QUEST)~ REPLY #42027 /* ~She had better not be late!~ */ GOTO 36
END
END

REPLACE MGKHOL01
IF ~~ THEN BEGIN 4 // from:
  SAY #42258 /* ~And with that, we are gone. ~ */
  IF ~GlobalGT("PCSphere","GLOBAL",0)~ THEN DO ~AddExperienceParty(45000)
GiveItemCreate("BELT02",LastTalkedToBy,0,0,0)
CreateVisualEffectObject("ICCSWOUI",Myself)
Wait(1)
ActionOverride("obssol01",ForceSpell(Myself,DRYAD_TELEPORT))
ActionOverride("obssol02",ForceSpell(Myself,DRYAD_TELEPORT))
ActionOverride("obssol03",ForceSpell(Myself,DRYAD_TELEPORT))
EraseJournalEntry(55626)
EraseJournalEntry(55640)
EraseJournalEntry(55643)
EraseJournalEntry(55641)
EraseJournalEntry(55642)
EraseJournalEntry(@5)
EraseJournalEntry(@6)
EraseJournalEntry(@7)
EraseJournalEntry(@8)
EraseJournalEntry(@11)
SetGlobal("SolamnicPrelate","GLOBAL",1)
SetGlobal("Solamnicbuttplug","GLOBAL",1)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL #55639 /* ~Mage Stronghold: The Knights are free.

Khollynnus Paac arrived as was foretold and the Solamnic knights have been sent home. It is good to see them get what they wished.~ */ EXIT
  IF ~!GlobalGT("PCSphere","GLOBAL",0)~ THEN DO ~AddExperienceParty(45000)
GiveItemCreate("BELT02",LastTalkedToBy,0,0,0)
CreateVisualEffectObject("ICCSWOUI",Myself)
Wait(1)
ActionOverride("obssol01",ForceSpell(Myself,DRYAD_TELEPORT))
ActionOverride("obssol02",ForceSpell(Myself,DRYAD_TELEPORT))
ActionOverride("obssol03",ForceSpell(Myself,DRYAD_TELEPORT))
EraseJournalEntry(55626)
EraseJournalEntry(55640)
EraseJournalEntry(55643)
EraseJournalEntry(55641)
EraseJournalEntry(55642)
EraseJournalEntry(@5)
EraseJournalEntry(@6)
EraseJournalEntry(@7)
EraseJournalEntry(@8)
EraseJournalEntry(@11)
SetGlobal("SolamnicPrelate","GLOBAL",1)
SetGlobal("Solamnicbuttplug","GLOBAL",1)
ForceSpell(Myself,DRYAD_TELEPORT)
AddJournalEntry(@9,QUEST_DONE)~ EXIT
END
END

EXTEND_BOTTOM CORNEIL 0
IF ~Global("D0CorneilSolamnic","LOCALS",0)
!Dead("obssol01")
!Dead("obssol02")
!Dead("obssol03")
OR(2)
Global("SolamnicKnights","GLOBAL",1)
Global("SolamnicKnights","GLOBAL",4)~ THEN REPLY @3 GOTO CO_99
END

EXTEND_BOTTOM CORNEIL 4
IF ~Global("D0CorneilSolamnic","LOCALS",0)
!Dead("obssol01")
!Dead("obssol02")
!Dead("obssol03")
OR(2)
Global("SolamnicKnights","GLOBAL",1)
Global("SolamnicKnights","GLOBAL",4)~ THEN REPLY @3 GOTO CO_99
END

APPEND CORNEIL
IF ~~ THEN BEGIN CO_99
SAY @4
IF ~~ THEN DO ~SetGlobal("D0CorneilSolamnic","LOCALS",1)
AddJournalEntry(@11,QUEST)~ EXIT
END
END
