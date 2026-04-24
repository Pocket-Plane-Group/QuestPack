EXTEND_BOTTOM CALAHA 1
  IF ~!Global("TalkedToCalahan","GLOBAL",1)~ THEN REPLY ~Smuggling, eh? Tell me more.~ GOTO CA_18
  IF ~Global("TalkedToCalahan","GLOBAL",1)
GlobalGT("AsylumPlot","GLOBAL",39)~ THEN REPLY ~I was wondering...can you smuggle people into Athkatla?~ GOTO CA_19
END

EXTEND_BOTTOM CALAHA 6
  IF ~!Global("TalkedToCalahan","GLOBAL",1)~ THEN REPLY ~Smuggling, eh? Tell me more.~ GOTO CA_18
  IF ~Global("TalkedToCalahan","GLOBAL",1)
GlobalGT("AsylumPlot","GLOBAL",39)~ THEN REPLY ~I was wondering...can you smuggle people into Athkatla?~ GOTO CA_19
END

EXTEND_BOTTOM CALAHA 10
  IF ~GlobalGT("AsylumPlot","GLOBAL",39)~ THEN REPLY ~I was wondering...can you smuggle people into Athkatla?~ GOTO CA_19
END

EXTEND_BOTTOM CALAHA 14
  IF ~!Global("TalkedToCalahan","GLOBAL",1)~ THEN REPLY ~Smuggling, eh? Tell me more.~ GOTO CA_18
  IF ~Global("TalkedToCalahan","GLOBAL",1)
GlobalGT("AsylumPlot","GLOBAL",39)~ THEN REPLY ~I was wondering...can you smuggle people into Athkatla?~ GOTO CA_19
END

APPEND CALAHA

IF ~~ THEN BEGIN CA_18
  SAY ~Nothin' much t' tell. I take a few things here 'n' there. Ye can even get people across if yer lucky.~
  IF ~GlobalGT("AsylumPlot","GLOBAL",39)~ THEN REPLY ~Can you smuggle people into Athkatla?~ GOTO CA_19
  IF ~Global("HelpGinia","GLOBAL",1)
Global("TalkedToCalahan","GLOBAL",0)~ THEN REPLY ~I'm here to speak to you about Ginia and Ason.~ GOTO 3
  IF ~~ THEN REPLY ~I see. Tell me, what do you know of the Asylum?~ GOTO 6
  IF ~~ THEN REPLY ~I'll be going now.~ GOTO 4
END

IF ~~ THEN BEGIN CA_19
  SAY ~Mmm, ye'd have t' be very lucky indeed to get someone 'cross there. It's tricky, but I'd give 't a go.~
     =
      ~Calahan'd get one pers'n there at best...for 500gp, perhaps?~

  IF ~PartyGoldLT(500)~ THEN REPLY ~I can't afford it right now.~ GOTO CA_20

  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleAerie","GLOBAL",1)
InParty("Aerie")~ THEN REPLY ~Take Aerie, the elven girl.~ GOTO CA_21
  IF ~PartyGoldGT(499)
Alignment("Anomen",MASK_GOOD)
OR(2)
Global("D0SmuggleAnomen","GLOBAL",1)
InParty("Anomen")~ THEN REPLY ~Take Anomen, the knight.~ GOTO CA_22
  IF ~PartyGoldGT(499)
Alignment("Anomen",MASK_GENEUTRAL)
OR(2)
Global("D0SmuggleAnomen","GLOBAL",1)
InParty("Anomen")~ THEN REPLY ~Take Anomen, the warrior.~ GOTO CA_22
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleCernd","GLOBAL",1)
InParty("Cernd")~ THEN REPLY ~Take Cernd, the shapeshifter.~ GOTO CA_23
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleEdwin","GLOBAL",1)
InParty("Edwin")~ THEN REPLY ~Take Edwin, the Red Wizard.~ GOTO CA_24
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleHaerDalis","GLOBAL",1)
InParty("HaerDalis")~ THEN REPLY ~Take Haer'Dalis, the tiefling.~ GOTO CA_25
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleImoen","GLOBAL",1)
InParty("Imoen2")~ THEN REPLY ~Take Imoen, my sister.~ GOTO CA_26
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleJaheira","GLOBAL",1)
InParty("Jaheira")~ THEN REPLY ~Take Jaheira, the harper.~ GOTO CA_27
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleJan","GLOBAL",1)
InParty("Jan")~ THEN REPLY ~Take Jan, the gnomish inventor.~ GOTO CA_28
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleKeldorn","GLOBAL",1)
InParty("Keldorn")~ THEN REPLY ~Take Keldorn, the paladin.~ GOTO CA_29
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleKelsey","GLOBAL",1)
InParty("J#Kelsey")~ THEN REPLY ~Take Kelsey, the sorcerer.~ GOTO CA_30
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleKorgan","GLOBAL",1)
InParty("Korgan")~ THEN REPLY ~Take Korgan, the dwarven fighter.~ GOTO CA_31
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleMazzy","GLOBAL",1)
InParty("Mazzy")~ THEN REPLY ~Take Mazzy, the halfling.~ GOTO CA_32
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleMinsc","GLOBAL",1)
InParty("Minsc")~ THEN REPLY ~Take Minsc, the Rashemen ranger.~ GOTO CA_33
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleNalia","GLOBAL",1)
InParty("Nalia")~ THEN REPLY ~Take Nalia, the mage.~ GOTO CA_34
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleValygar","GLOBAL",1)
InParty("Valygar")~ THEN REPLY ~Take Valygar, the stalker.~ GOTO CA_35
  IF ~PartyGoldGT(499)
OR(2)
Global("D0SmuggleViconia","GLOBAL",1)
InParty("Viconia")~ THEN REPLY ~Take Viconia, the drow priestess.~ GOTO CA_36

  IF ~PartyGoldGT(499)
NumInPartyGT(2)~ THEN REPLY ~Take me, then. My companions will remain here.~ GOTO CA_37
  IF ~PartyGoldGT(499)
NumInParty(2)~ THEN REPLY ~Take me, then. My companion will remain here.~ GOTO CA_37
  IF ~PartyGoldGT(499)
NumInParty(1)~ THEN REPLY ~Take me, then.~ GOTO CA_37

  IF ~~ THEN REPLY ~Never mind. Forget I asked.~ GOTO 4
END

IF ~~ THEN BEGIN CA_20
  SAY ~Suit yerself. Ye'd better be quick if ye wanna be gettin' off the island. Not many ships right now.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN CA_21
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleAerie","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_22
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleAnomen","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_23
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleCernd","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_24
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleEdwin","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_25
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleHaerDalis","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_26
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleImoen","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_27
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleJaheira","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_28
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleJan","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_29
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleKeldorn","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_30
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleKelsey","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_31
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleKorgan","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_32
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleMazzy","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_33
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleMinsc","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_34
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleNalia","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_35
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleValygar","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_36
  SAY ~Drow? I ain't takin' no drow. Ye have any idea how much trouble that'd cause for ol' Calahan?~
  IF ~PartyGoldGT(999)~ THEN REPLY ~Perhaps 1000 gold would make it worth your while?~ GOTO CA_36a
  IF ~~ THEN REPLY ~Never mind, then.~ GOTO 4
END

IF ~~ THEN BEGIN CA_36a
  SAY ~Hmm. I s'pose that'd do it. Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(1000)
SetGlobal("D0SmuggleViconia","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_37
  SAY ~Then we're agree'd. I'll send ye wen ye're ready. Come back 'ere when ye are.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmugglePlayer","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_21a
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleAerie","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_22a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleAnomen","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_23a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleCernd","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_24a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleEdwin","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_25a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleHaerDalis","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_26a
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleImoen","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_27a
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleJaheira","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_28a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleJan","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_29a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleKeldorn","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_30a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleKelsey","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_31a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleKorgan","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_32a
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleMazzy","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_33a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleMinsc","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_34a
  SAY ~Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleNalia","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_35a
  SAY ~Then we're agree'd. Bring 'im t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~SetGlobal("D0SmuggleValygar","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_36b
  SAY ~Drow? I ain't takin' no drow. Ye have any idea how much trouble that'd cause for ol' Calahan?~
  IF ~PartyGoldGT(499)~ THEN REPLY ~Perhaps an extra 500 gold would make it worth your while?~ GOTO CA_36c
  IF ~~ THEN REPLY ~Never mind, then.~ GOTO 4
END

IF ~~ THEN BEGIN CA_36c
  SAY ~Hmm. I s'pose that'd do it. Then we're agree'd. Bring 'er t' me when yer ready. I'll be findin' a ship thats goin' to Athkatla.~
  IF ~~ THEN DO ~TakePartyGold(500)
SetGlobal("D0SmuggleViconia","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN CA_37a
  SAY ~Then we're agree'd. I'll send ye wen ye're ready. Come back 'ere when ye are.~
  IF ~~ THEN DO ~SetGlobal("D0SmugglePlayer","GLOBAL",2)~ EXIT
END

IF WEIGHT #-1 ~Global"D0SmugglePlayer","GLOBAL",2)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN CA_38
  SAY ~Yer back then. Are ye ready t' go?~
  IF ~~ THEN REPLY ~Actually, could you take someone else instead?~ DO ~SetGlobal("D0SmugglePlayer","GLOBAL",0)~ GOTO CA_39
  IF ~~ THEN REPLY ~Not yet, give me a bit more time.~ GOTO CA_40
  IF ~~ THEN REPLY ~Yes. Let's go.~ GOTO CA_41
END

IF WEIGHT #-1 ~Global"D0SmugglePlayer","GLOBAL",2)
!InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN CA_38a
  SAY ~Tell yer leader t' come talk to me.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN CA_39
  SAY ~Aye. Who'd ye have me take? Ye've already pay'd yer 500gp.~

  IF ~OR(2)
Global("D0SmuggleAerie","GLOBAL",1)
InParty("Aerie")~ THEN REPLY ~Take Aerie, the elven girl.~ GOTO CA_21a
  IF ~Alignment("Anomen",MASK_GOOD)
OR(2)
Global("D0SmuggleAnomen","GLOBAL",1)
InParty("Anomen")~ THEN REPLY ~Take Anomen, the knight.~ GOTO CA_22a
  IF ~Alignment("Anomen",MASK_GENEUTRAL)
OR(2)
Global("D0SmuggleAnomen","GLOBAL",1)
InParty("Anomen")~ THEN REPLY ~Take Anomen, the warrior.~ GOTO CA_22a
  IF ~OR(2)
Global("D0SmuggleCernd","GLOBAL",1)
InParty("Cernd")~ THEN REPLY ~Take Cernd, the shapeshifter.~ GOTO CA_23a
  IF ~OR(2)
Global("D0SmuggleEdwin","GLOBAL",1)
InParty("Edwin")~ THEN REPLY ~Take Edwin, the Red Wizard.~ GOTO CA_24a
  IF ~OR(2)
Global("D0SmuggleHaerDalis","GLOBAL",1)
InParty("HaerDalis")~ THEN REPLY ~Take Haer'Dalis, the tiefling.~ GOTO CA_25a
  IF ~OR(2)
Global("D0SmuggleImoen","GLOBAL",1)
InParty("Imoen2")~ THEN REPLY ~Take Imoen, my sister.~ GOTO CA_26a
  IF ~OR(2)
Global("D0SmuggleJaheira","GLOBAL",1)
InParty("Jaheira")~ THEN REPLY ~Take Jaheira, the harper.~ GOTO CA_27a
  IF ~OR(2)
Global("D0SmuggleJan","GLOBAL",1)
InParty("Jan")~ THEN REPLY ~Take Jan, the gnomish inventor.~ GOTO CA_28a
  IF ~OR(2)
Global("D0SmuggleKeldorn","GLOBAL",1)
InParty("Keldorn")~ THEN REPLY ~Take Keldorn, the paladin.~ GOTO CA_29a
  IF ~OR(2)
Global("D0SmuggleKelsey","GLOBAL",1)
InParty("J#Kelsey")~ THEN REPLY ~Take Kelsey, the sorcerer.~ GOTO CA_30a
  IF ~OR(2)
Global("D0SmuggleKorgan","GLOBAL",1)
InParty("Korgan")~ THEN REPLY ~Take Korgan, the dwarven fighter.~ GOTO CA_31a
  IF ~OR(2)
Global("D0SmuggleMazzy","GLOBAL",1)
InParty("Mazzy")~ THEN REPLY ~Take Mazzy, the halfling.~ GOTO CA_32a
  IF ~OR(2)
Global("D0SmuggleMinsc","GLOBAL",1)
InParty("Minsc")~ THEN REPLY ~Take Minsc, the Rashemen ranger.~ GOTO CA_33a
  IF ~OR(2)
Global("D0SmuggleNalia","GLOBAL",1)
InParty("Nalia")~ THEN REPLY ~Take Nalia, the mage.~ GOTO CA_34a
  IF ~OR(2)
Global("D0SmuggleValygar","GLOBAL",1)
InParty("Valygar")~ THEN REPLY ~Take Valygar, the stalker.~ GOTO CA_35a
  IF ~OR(2)
Global("D0SmuggleViconia","GLOBAL",1)
InParty("Viconia")~ THEN REPLY ~Take Viconia, the drow priestess.~ GOTO CA_36a

  IF ~NumInPartyGT(2)~ THEN REPLY ~Take me. My companions will remain here.~ GOTO CA_37a
  IF ~NumInParty(2)~ THEN REPLY ~Take me. My companion will remain here.~ GOTO CA_37a
  IF ~NumInParty(1)~ THEN REPLY ~Take me.~ GOTO CA_37a

  IF ~~ THEN REPLY ~I'd rather you didn't take anyone. Can I have my money back?~ GOTO CA_42
END

IF ~~ THEN BEGIN CA_40
  SAY ~As ye wish. Dun' be too long, though.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN CA_41
  SAY ~Then let's be goin'. The ship's ready. A few words of warnin'... keep yer head down durin' the trip. Ye don't wanna let 'em know yer aboard.~
  IF ~NumInParty(1)~ THEN GOTO CA_41a
  IF ~NumInParty(2)
Gender(Player2,MALE)~ THEN GOTO CA_41b1
  IF ~NumInParty(2)
!Gender(Player2,MALE)~ THEN GOTO CA_41b2
  IF ~NumInPartyGT(2)~ THEN GOTO CA_41c
END

IF ~~ THEN BEGIN CA_41a
  SAY ~So let's get ye sorted...~
  IF ~~ THEN DO ~StartCutSceneMode()
FadeToColor([20.0],0)
ActionOverride(Player2,LeaveParty())
ActionOverride(Player3,LeaveParty())
ActionOverride(Player4,LeaveParty())
ActionOverride(Player5,LeaveParty())
ActionOverride(Player6,LeaveParty())
FadeFromColor([20.0],0)
ActionOverride(Player1,MoveBetweenAreas("D00001",[100.100],10))~ EXIT
END

IF ~~ THEN BEGIN CA_41b1
  SAY ~Ye'd best be sayin' goodbye t' yer friend. Ye won't be seeing 'im for a while.~
  IF ~~ THEN GOTO CA_41a
END

IF ~~ THEN BEGIN CA_41b2
  SAY ~Ye'd best be sayin' goodbye t' yer friend. Ye won't be seeing 'er for a while.~
  IF ~~ THEN GOTO CA_41a
END

IF ~~ THEN BEGIN CA_41c
  SAY ~Ye'd best be sayin' goodbye t'all yer friends. Ye won't be seeing 'em for a while.~
  IF ~~ THEN GOTO CA_41a
END

IF ~~ THEN BEGIN CA_42
  SAY ~Nay, I've already 'ad to pay for passage. So who'd ye have me take?~
  IF ~OR(2)
Global("D0SmuggleAerie","GLOBAL",1)
InParty("Aerie")~ THEN REPLY ~Take Aerie, the elven girl.~ GOTO CA_21a
  IF ~Alignment("Anomen",MASK_GOOD)
OR(2)
Global("D0SmuggleAnomen","GLOBAL",1)
InParty("Anomen")~ THEN REPLY ~Take Anomen, the knight.~ GOTO CA_22a
  IF ~Alignment("Anomen",MASK_GENEUTRAL)
OR(2)
Global("D0SmuggleAnomen","GLOBAL",1)
InParty("Anomen")~ THEN REPLY ~Take Anomen, the warrior.~ GOTO CA_22a
  IF ~OR(2)
Global("D0SmuggleCernd","GLOBAL",1)
InParty("Cernd")~ THEN REPLY ~Take Cernd, the shapeshifter.~ GOTO CA_23a
  IF ~OR(2)
Global("D0SmuggleEdwin","GLOBAL",1)
InParty("Edwin")~ THEN REPLY ~Take Edwin, the Red Wizard.~ GOTO CA_24a
  IF ~OR(2)
Global("D0SmuggleHaerDalis","GLOBAL",1)
InParty("HaerDalis")~ THEN REPLY ~Take Haer'Dalis, the tiefling.~ GOTO CA_25a
  IF ~OR(2)
Global("D0SmuggleImoen","GLOBAL",1)
InParty("Imoen2")~ THEN REPLY ~Take Imoen, my sister.~ GOTO CA_26a
  IF ~OR(2)
Global("D0SmuggleJaheira","GLOBAL",1)
InParty("Jaheira")~ THEN REPLY ~Take Jaheira, the harper.~ GOTO CA_27a
  IF ~OR(2)
Global("D0SmuggleJan","GLOBAL",1)
InParty("Jan")~ THEN REPLY ~Take Jan, the gnomish inventor.~ GOTO CA_28a
  IF ~OR(2)
Global("D0SmuggleKeldorn","GLOBAL",1)
InParty("Keldorn")~ THEN REPLY ~Take Keldorn, the paladin.~ GOTO CA_29a
  IF ~OR(2)
Global("D0SmuggleKelsey","GLOBAL",1)
InParty("J#Kelsey")~ THEN REPLY ~Take Kelsey, the sorcerer.~ GOTO CA_30a
  IF ~OR(2)
Global("D0SmuggleKorgan","GLOBAL",1)
InParty("Korgan")~ THEN REPLY ~Take Korgan, the dwarven fighter.~ GOTO CA_31a
  IF ~OR(2)
Global("D0SmuggleMazzy","GLOBAL",1)
InParty("Mazzy")~ THEN REPLY ~Take Mazzy, the halfling.~ GOTO CA_32a
  IF ~OR(2)
Global("D0SmuggleMinsc","GLOBAL",1)
InParty("Minsc")~ THEN REPLY ~Take Minsc, the Rashemen ranger.~ GOTO CA_33a
  IF ~OR(2)
Global("D0SmuggleNalia","GLOBAL",1)
InParty("Nalia")~ THEN REPLY ~Take Nalia, the mage.~ GOTO CA_34a
  IF ~OR(2)
Global("D0SmuggleValygar","GLOBAL",1)
InParty("Valygar")~ THEN REPLY ~Take Valygar, the stalker.~ GOTO CA_35a
  IF ~OR(2)
Global("D0SmuggleViconia","GLOBAL",1)
InParty("Viconia")~ THEN REPLY ~Take Viconia, the drow priestess.~ GOTO CA_36a

  IF ~NumInPartyGT(2)~ THEN REPLY ~Take me. My companions will remain here.~ GOTO CA_37a
  IF ~NumInParty(2)~ THEN REPLY ~Take me. My companion will remain here.~ GOTO CA_37a
  IF ~NumInParty(1)~ THEN REPLY ~Take me.~ GOTO CA_37a

  Keep the money then. I don't want anybody to go.
END
