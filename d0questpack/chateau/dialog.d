REPLACE BODHI

IF ~Global("BodhiJob","GLOBAL",2)
!Global("WorkingForAran","GLOBAL",1)
Dead("Vulova")
Global("PlantedEvidence","GLOBAL",1)
~ THEN BEGIN 61 // from:
  SAY #22111 /* ~Well done. I trust you gave no mercy? Did you enjoy the task? Yes, I'm sure you did. Now, on to more important things.~ [BODHIX22] */
  IF ~~ THEN REPLY #22113 /* ~More important things? Was this man's murder not important?!~ */ DO ~AddXPObject(Player1,28500)
AddXPObject(Player2,28500)
AddXPObject(Player3,28500)
AddXPObject(Player4,28500)
AddXPObject(Player5,28500)
AddXPObject(Player6,28500)
~ GOTO 66
  IF ~~ THEN REPLY #22114 /* ~I have done much for you. When will you help me with Imoen?~ */ DO ~AddXPObject(Player1,28500)
AddXPObject(Player2,28500)
AddXPObject(Player3,28500)
AddXPObject(Player4,28500)
AddXPObject(Player5,28500)
AddXPObject(Player6,28500)
~ GOTO 68
  IF ~~ THEN REPLY #22115 /* ~I await your instuctions.~ */ DO ~AddXPObject(Player1,28500)
AddXPObject(Player2,28500)
AddXPObject(Player3,28500)
AddXPObject(Player4,28500)
AddXPObject(Player5,28500)
AddXPObject(Player6,28500)
~ GOTO 70
END

IF ~NumDeadGT("Flyfgt",6)
!Dead("Palern")
Global("BodhiJob","GLOBAL",3)
Global("RescuedPalern","GLOBAL",1)
!Global("WorkingForAran","GLOBAL",1)
~ THEN BEGIN 62 // from:
  SAY #22112 /* ~Well done.  No doubt that informant will make things difficult for the Shadow Thieves.  They will be under scrutiny, and will have to be cautious.  Now on to important things.~ [BODHIX23] */
  IF ~~ THEN REPLY #22116 /* ~The rescue of this person was not important? Then why did I do it?~ */ DO ~AddXPObject(Player1,28500)
AddXPObject(Player2,28500)
AddXPObject(Player3,28500)
AddXPObject(Player4,28500)
AddXPObject(Player5,28500)
AddXPObject(Player6,28500)
~ GOTO 66
  IF ~~ THEN REPLY #22117 /* ~I have done everything you have asked. When will you help me find Imoen?~ */ DO ~AddXPObject(Player1,28500)
AddXPObject(Player2,28500)
AddXPObject(Player3,28500)
AddXPObject(Player4,28500)
AddXPObject(Player5,28500)
AddXPObject(Player6,28500)
~ GOTO 68
  IF ~~ THEN REPLY #22118 /* ~What would you have me do?~ */ DO ~AddXPObject(Player1,28500)
AddXPObject(Player2,28500)
AddXPObject(Player3,28500)
AddXPObject(Player4,28500)
AddXPObject(Player5,28500)
AddXPObject(Player6,28500)
~ GOTO 70
END

IF ~~ THEN BEGIN 65 // from: 64.0 63.0
  SAY #22121 /* ~The attack will have put the Shadow Thieves on edge, and that was half the purpose anyway. On to more important things.~ */
  IF ~~ THEN REPLY #22122 /* ~If the task was of no importance, why did you have me attempt it?~ */ GOTO 66
  IF ~~ THEN REPLY #22123 /* ~I have tried to do as you have asked. When will you help me find Imoen?~ */ GOTO 69
  IF ~~ THEN REPLY #22124 /* ~I await your next order, Bodhi.~ */ GOTO 70
END

END

APPEND BODHI

IF ~PartyHasItem("D0COMPON")~ THEN BEGIN WellDone
SAY ~Once again, you have done well. Oh, and what irony!
