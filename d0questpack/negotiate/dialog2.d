REPLACE UDVITH
IF ~~ THEN BEGIN 42 // from: 41.0
  SAY #50463 /* ~And you, my friend, my helpful stranger, I am true to my word. You shall receive your due, just as I have promised.~ */
  IF ~HasItem("scrl8z",Myself)
HasItem("scrl9g",Myself)
HasItem("scrl9e",Myself)
HasItem("scrl9v",Myself)
HasItem("scrl9r",Myself)
HasItem("rods01",Myself)
HasItem("helm17",Myself)~ THEN DO ~SetGlobal("udMind","GLOBAL",41)
AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)~ GOTO V_3
  IF ~OR(7)
!HasItem("scrl8z",Myself)
!HasItem("scrl9g",Myself)
!HasItem("scrl9e",Myself)
!HasItem("scrl9v",Myself)
!HasItem("scrl9r",Myself)
!HasItem("rods01",Myself)
!HasItem("helm17",Myself)~ THEN DO ~SetGlobal("udMind","GLOBAL",41)
AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)~ GOTO V_2
END
END

APPEND UDVITH
IF ~~ THEN BEGIN V_2
SAY @0
IF ~~ THEN GOTO V_13a
END

IF ~~ THEN BEGIN V_3
SAY @1
= @2
= @3
IF ~~ THEN GOTO V_6
END

IF ~~ THEN BEGIN V_6
SAY @4
IF ~~ THEN REPLY @5 GOTO V_7a
IF ~~ THEN REPLY @6 GOTO V_7b
IF ~~ THEN REPLY @7 GOTO V_7c
IF ~~ THEN REPLY @8 GOTO V_7d
IF ~~ THEN REPLY @9 GOTO V_7e
IF ~~ THEN REPLY @10 GOTO V_7f
IF ~~ THEN REPLY @11 GOTO V_9
END

IF ~~ THEN BEGIN V_7a
SAY @12
IF ~~ THEN DO ~GiveItem("rods01",LastTalkedToBy)
GiveItem("scrl9g",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7b
SAY @12
IF ~~ THEN DO ~GiveItem("helm17",LastTalkedToBy)
GiveItem("scrl9v",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7c
SAY @12
IF ~~ THEN DO ~GiveItem("scrl8z",LastTalkedToBy)
GiveItem("scrl9e",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7d
SAY @12
IF ~~ THEN DO ~GiveItem("rods01",LastTalkedToBy)
GiveItem("helm17",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7e
SAY @12
IF ~~ THEN DO ~GiveItem("scrl9g",LastTalkedToBy)
GiveItem("scrl9e",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7f
SAY @12
IF ~~ THEN DO ~GiveItem("scrl9v",LastTalkedToBy)
GiveItem("scrl8z",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7g
SAY @12
IF ~~ THEN DO ~GiveItem("scrl9e",LastTalkedToBy)
GiveItem("scrl8z",LastTalkedToBy)
GiveItem("rods01",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7h
SAY @12
IF ~~ THEN DO ~GiveItem("scrl9g",LastTalkedToBy)
GiveItem("scrl9v",LastTalkedToBy)
GiveItem("helm17",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7i
SAY @12
IF ~~ THEN DO ~GiveItem("scrl9r",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7j
SAY @12
IF ~~ THEN DO ~GiveItem("rods01",LastTalkedToBy)
GiveItem("helm17",LastTalkedToBy)
GiveItem("scrl9e",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_7k
SAY @12
IF ~~ THEN DO ~GiveItem("scrl8z",LastTalkedToBy)
GiveItem("scrl9g",LastTalkedToBy)
GiveItem("scrl9e",LastTalkedToBy)~ GOTO V_8
END

IF ~~ THEN BEGIN V_8
  SAY #50468 /* ~It will serve you well, of that I am sure. Farewell, my friend, and take care in your journey.~ */
  IF ~~ THEN DO ~EraseJournalEntry(57533)
EraseJournalEntry(57534)
EraseJournalEntry(57851)
EraseJournalEntry(57854)
EraseJournalEntry(57856)
ForceSpell(Myself,SWOOSH_GONE)~ SOLVED_JOURNAL #57535 /* ~A Mage's Proposal.

I helped Vithal retrieve some valuable magic items from another plane. I received my fair share in the end.~ */ EXIT
END

IF ~~ THEN BEGIN V_9
  SAY #50469 /* ~I believe that I took the majority of the risk in this instance. I was the one that traversed the planes, you know. ~ */
IF ~CheckStatGT(LastTalkedToBy,12,CHR)
!Global("PlayerLooksLikeDrow","GLOBAL",1)~ GOTO V_10
IF ~CheckStatGT(LastTalkedToBy,16,CHR)
Global("PlayerLooksLikeDrow","GLOBAL",1)~ GOTO V_10
IF ~!CheckStatGT(LastTalkedToBy,12,CHR)
!Global("PlayerLooksLikeDrow","GLOBAL",1)~ GOTO V_12
IF ~!CheckStatGT(LastTalkedToBy,16,CHR)
Global("PlayerLooksLikeDrow","GLOBAL",1)~ GOTO V_12
END

IF ~~ THEN BEGIN V_10
  SAY @13
IF ~~ THEN GOTO V_11
END

IF ~~ THEN BEGIN V_11
SAY @14
IF ~~ THEN REPLY @15 GOTO V_7g
IF ~~ THEN REPLY @16 GOTO V_7h
IF ~~ THEN REPLY @17 GOTO V_7i
IF ~~ THEN REPLY @18 GOTO V_7j
IF ~~ THEN REPLY @19 GOTO V_7k
IF ~~ THEN REPLY @20 GOTO V_12
IF ~~ THEN REPLY @21 GOTO V_13b
END

IF ~~ THEN BEGIN V_12
  SAY #50475 /* ~And I must refuse your request. I have been more than reasonable, and yet you demand more. What I have given will suffice or we will face each other in battle. ~ */
IF ~Global("PlayerLooksLikeDrow","GLOBAL",1)
CheckStatGT(LastTalkedToBy,16,CHR)~ REPLY @22 GOTO V_11
IF ~Global("PlayerLooksLikeDrow","GLOBAL",1)
!CheckStatGT(LastTalkedToBy,16,CHR)~ REPLY @22 GOTO V_6
IF ~CheckStatGT(LastTalkedToBy,12,CHR)
!Global("PlayerLooksLikeDrow","GLOBAL",1)~ REPLY @22 GOTO V_11
IF ~!CheckStatGT(LastTalkedToBy,12,CHR)
!Global("PlayerLooksLikeDrow","GLOBAL",1)~ REPLY @22 GOTO V_6
IF ~~ THEN REPLY @23 GOTO V_13b
END

IF ~~ THEN BEGIN V_13a
  SAY #50476 /* ~I expected as much from a stranger in the Underdark. Very well, let us raise our weapons and spells and settle our feud. I regret it has come to this.~ */
  IF ~~ THEN DO ~EraseJournalEntry(57533)
EraseJournalEntry(57534)
EraseJournalEntry(57851)
EraseJournalEntry(57854)
EraseJournalEntry(57856)
Enemy()~ SOLVED_JOURNAL @24 EXIT
END

IF ~~ THEN BEGIN V_13b
  SAY #50476 /* ~I expected as much from a stranger in the Underdark. Very well, let us raise our weapons and spells and settle our feud. I regret it has come to this.~ */
  IF ~~ THEN DO ~EraseJournalEntry(57533)
EraseJournalEntry(57534)
EraseJournalEntry(57851)
EraseJournalEntry(57854)
EraseJournalEntry(57856)
Enemy()~ SOLVED_JOURNAL #57536 /* ~A Mage's Proposal.

I helped Vithal retrieve the items he sought. He tried to give me a small portion, but I demanded more. In the end I got what I deserved.~ */ EXIT
END
END
