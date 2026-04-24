// MESSENGER

BEGIN D0MSNGR

IF ~NumTimesTalkedTo(0)~ THEN BEGIN MSG_1
  SAY @225
  IF ~InParty("Jaheira")
Detect("Jaheira")
!StateCheck("Jaheira",1064941)
!StateCheck("Jaheira",STATE_CONFUSED)~ THEN DO ~EscapeArea()~ EXTERN JAHEIRAJ J_MSG_1
  IF ~OR(4)
!InParty("Jaheira")
!Detect("Jaheira")
StateCheck("Jaheira",1064941)
StateCheck("Jaheira",STATE_CONFUSED)~ THEN DO ~AddJournalEntry(@357,QUEST)
EscapeArea()~ EXIT
END

APPEND JAHEIRAJ
IF ~~ THEN BEGIN J_MSG_1
SAY @226
IF ~~ THEN DO ~AddJournalEntry(@357,QUEST)~ EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// PLAYER SPEAKS WITH LARELL BEFORE MAE'VAR.

APPEND_EARLY D0NIGHTK

IF ~!NumTimesTalkedTo(0)
Global("D0Maevar","GLOBAL",4)~ THEN BEGIN LL_6
  SAY @227
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)
Global("D0Maevar","GLOBAL",4)~ THEN BEGIN LL_6a
  SAY @156
= @227
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// MAE'VAR'S ORDERS

APPEND MAEVAR

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",4)~ THEN BEGIN MV_18
  SAY @228
 IF ~InParty("Nalia")
Detect("Nalia")
!StateCheck("Nalia",1064941)
!StateCheck("Nalia",STATE_CONFUSED)~ THEN EXTERN NALIAJ N_MV_18
 IF ~OR(4)
!InParty("Nalia")
!Detect("Nalia")
StateCheck("Nalia",1064941)
StateCheck("Nalia",STATE_CONFUSED)~ THEN GOTO MV_18a
END

IF ~~ THEN BEGIN MV_18a
SAY @229
      =
      @230
      =
      @231
      =
      @232
  IF ~~ THEN REPLY @233 GOTO MV_19
  IF ~~ THEN REPLY @234 GOTO MV_20
  IF ~CheckStatGT(LastTalkedToBy(Myself),9,INT)~ THEN REPLY @235 GOTO MV_18c
  IF ~!CheckStatGT(LastTalkedToBy(Myself),9,INT)~ THEN REPLY @236 GOTO MV_18c
  IF ~~ THEN REPLY @237 GOTO MV_21
END

IF ~~ THEN BEGIN MV_18b
SAY @238
IF ~~ THEN GOTO MV_18a
END

IF ~~ THEN BEGIN MV_18c
SAY @239
  IF ~~ THEN REPLY @240 GOTO MV_19
  IF ~~ THEN REPLY @241 GOTO MV_20
  IF ~~ THEN REPLY @237 GOTO MV_21
END

IF ~~ THEN BEGIN MV_19
  SAY @242
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",5)
AddJournalEntry(@358,QUEST)~ EXIT
END

IF ~~ THEN BEGIN MV_20
  SAY @243
  IF ~~ THEN REPLY @233 GOTO MV_19
  IF ~CheckStatGT(LastTalkedToBy(Myself),9,INT)~ THEN REPLY @235 GOTO MV_18c
  IF ~!CheckStatGT(LastTalkedToBy(Myself),9,INT)~ THEN REPLY @236 GOTO MV_18c
  IF ~~ THEN REPLY @237 GOTO MV_21
END

IF ~~ THEN BEGIN MV_21
  SAY @244
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",5)
SetGlobal("D0MaeVarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
AddJournalEntry(@359,QUEST)
Shout(89)
Enemy()~ EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",5)~ THEN BEGIN MV_22
  SAY @245
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// BETRAYING MAE'VAR TO ARAN

EXTEND_BOTTOM ARAN 76
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)
!Dead("d0nightk")~ THEN REPLY @246 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)
SetGlobal("NotYetToldBodhi","LOCALS",1)~ GOTO AR_20
END

EXTEND_BOTTOM ARAN 86
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)
!Dead("d0nightk")~ THEN REPLY @247 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)~ GOTO AR_20
END

EXTEND_BOTTOM ARAN 92
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)
!Dead("d0nightk")~ THEN REPLY @248 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)~ GOTO AR_20
END

EXTEND_BOTTOM ARAN 94
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)
!Dead("d0nightk")~ THEN REPLY @248 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)~ GOTO AR_20
END

APPEND ARAN
IF WEIGHT #-1 ~Global("D0Interact","LOCALS",0)
Global("d0WarnedAran","GLOBAL",0)
!Global("D0AranHostile","GLOBAL",1)
GlobalGT("D0LarellHostile","GLOBAL",0)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)
GlobalGT("D0Maevar","GLOBAL",0)
!Dead("d0nightk")
!Dead("Maevar")~ THEN BEGIN AR_2
  SAY @249
      =
      @250
  IF ~~ THEN REPLY @233 DO ~SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
SetGlobal("d0WarnedAran","GLOBAL",1)
SetGlobal("D0Interact","LOCALS",1)
AddJournalEntry(@363,QUEST)~ GOTO AR_20z
  IF ~~ THEN REPLY @251 GOTO AR_21
END

IF WEIGHT #-1 ~Global("D0Interact","LOCALS",0)
Global("d0WarnedAran","GLOBAL",0)
!Global("D0AranHostile","GLOBAL",1)
GlobalGT("D0LarellHostile","GLOBAL",0)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)
GlobalGT("D0Maevar","GLOBAL",0)
!Dead("d0nightk")
Dead("Maevar")~ THEN BEGIN AR_3
  SAY @249
      =
      @252
  IF ~~ THEN REPLY @233 DO ~SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
SetGlobal("d0WarnedAran","GLOBAL",1)
SetGlobal("D0Interact","LOCALS",1)
AddJournalEntry(@364,QUEST)~ GOTO AR_20z
  IF ~~ THEN REPLY @251 GOTO AR_21
END

IF WEIGHT #-1 ~Global("D0Interact","LOCALS",0)
Global("d0WarnedAran","GLOBAL",0)
!Global("D0AranHostile","GLOBAL",1)
GlobalGT("D0LarellHostile","GLOBAL",0)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)
GlobalGT("D0Maevar","GLOBAL",0)
Dead("d0nightk")
!Dead("Maevar")~ THEN BEGIN AR_4
  SAY @249
      =
      @253
  IF ~~ THEN REPLY @233 DO ~SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
SetGlobal("d0WarnedAran","GLOBAL",1)
SetGlobal("D0Interact","LOCALS",1)
AddJournalEntry(@365,QUEST)~ GOTO AR_20z
  IF ~~ THEN REPLY @251 GOTO AR_21
END

IF WEIGHT #-1 ~Global("D0Interact","LOCALS",0)
Global("d0WarnedAran","GLOBAL",0)
!Global("D0AranHostile","GLOBAL",1)
GlobalGT("D0LarellHostile","GLOBAL",0)
GlobalGT("chapter","GLOBAL",%bg2_chapter_5%)
GlobalGT("D0Maevar","GLOBAL",0)
Dead("d0nightk")
Dead("Maevar")~ THEN BEGIN AR_5
  SAY @249
      =
      @254
  IF ~~ THEN REPLY @255 DO ~SetGlobal("D0Maevar","GLOBAL",8)~ GOTO AR_23
  IF ~~ THEN REPLY @256 DO ~SetGlobal("D0Maevar","GLOBAL",8)~ GOTO AR_24
  IF ~~ THEN REPLY @257 DO ~SetGlobal("D0Maevar","GLOBAL",8)~ GOTO AR_24
END

IF WEIGHT #-1 ~GlobalGT("D0AranHostile","GLOBAL",0)
Global("D0Interact","LOCALS",0)~ THEN BEGIN AR_1
  SAY @258
  IF ~~ THEN DO ~SetGlobal("D0Interact","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN AR_20
  SAY @259
     =
      @260
  IF ~~ THEN REPLY @233 DO ~SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
SetGlobal("d0WarnedAran","GLOBAL",1)
SetGlobal("D0Interact","LOCALS",1)
AddJournalEntry(@365,QUEST)~ GOTO AR_20z
  IF ~~ THEN REPLY @251 GOTO AR_21
END

IF ~~ THEN BEGIN AR_20z
  SAY @261
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AR_21
  SAY @262
  IF ~Global("D0LarellHostile","GLOBAL",0)~ THEN DO ~SetGlobal("D0AranHostile","GLOBAL",1)
SetGlobal("D0Interact","LOCALS",1)
Enemy()~ EXIT
  IF ~GlobalGT("D0LarellHostile","GLOBAL",0)~ THEN DO ~SetGlobal("D0AranHostile","GLOBAL",1)
SetGlobal("D0Interact","LOCALS",1)
EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@367)
EraseJournalEntry(@369)
EraseJournalEntry(@370)
EraseJournalEntry(@371)
EraseJournalEntry(@372)
EraseJournalEntry(@373)
EraseJournalEntry(@374)
AddJournalEntry(@375,QUEST_DONE)
Enemy()~ EXIT
END

IF WEIGHT #-1 ~Global("d0WarnedAran","GLOBAL",1)
!Global("D0AranHostile","GLOBAL",1)
OR(2)
!Dead("d0nightk")
!Dead("MaeVar")~ THEN BEGIN AR_20a
SAY @263
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AR_20b
SAY @264
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AR_20c
SAY @265
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AR_20d
SAY @266
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AR_20e
SAY @267
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~!Global("D0Maevar","GLOBAL",8)
Global("d0WarnedAran","GLOBAL",1)
!Global("D0AranHostile","GLOBAL",1)
Dead("d0nightk")
Dead("MaeVar")~ THEN BEGIN AR_22
SAY @268
  IF ~~ THEN REPLY @255 DO ~SetGlobal("D0Maevar","GLOBAL",8)~ GOTO AR_23
  IF ~~ THEN REPLY @256 DO ~SetGlobal("D0Maevar","GLOBAL",8)~ GOTO AR_24
  IF ~~ THEN REPLY @257 DO ~SetGlobal("D0Maevar","GLOBAL",8)~ GOTO AR_24
END

IF ~~ THEN BEGIN AR_23
  SAY @269
  IF ~~ THEN DO ~EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@367)
EraseJournalEntry(@369)
EraseJournalEntry(@370)
EraseJournalEntry(@371)
EraseJournalEntry(@372)
EraseJournalEntry(@373)
EraseJournalEntry(@374)
AddJournalEntry(@368,QUEST_DONE)
SetGlobal("D0Interact","LOCALS",1)
SetGlobal("D0AranHostile","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN AR_24
  SAY @270
      =
      @271
  IF ~True()~ THEN GOTO AR_25
  IF ~!Dead("c6bodhi")
Global("ShadowFightBodhi","GLOBAL",1)~ THEN DO ~GiveItem("d0rewar2",LastTalkedToBy(Myself))
SetGlobal("D0AranGivePlayerRing","GLOBAL",1)~ GOTO AR_24a
  IF ~!Dead("c6bodhi")
Global("ShadowFightBodhi","GLOBAL",0)
Global("NotYetToldBodhi","LOCALS",1)~ THEN DO ~GiveItem("d0rewar2",LastTalkedToBy(Myself))
SetGlobal("D0AranGivePlayerRing","GLOBAL",1)~ GOTO AR_24c
  IF ~!Dead("c6bodhi")
Global("ShadowFightBodhi","GLOBAL",0)
Global("NotYetToldBodhi","LOCALS",0)~ THEN DO ~GiveItem("d0rewar2",LastTalkedToBy(Myself))
SetGlobal("D0AranGivePlayerRing","GLOBAL",1)~ GOTO AR_24d
  IF ~Dead("c6bodhi")
Global("D0SpokenBodhiDeath","LOCALS",0)~ THEN DO ~GiveItem("d0rewar2",LastTalkedToBy(Myself))
SetGlobal("D0AranGivePlayerRing","GLOBAL",1)~ GOTO AR_24b
  IF ~Global("ShadowFightBodhi","GLOBAL",2)~ THEN DO ~GiveItem("d0rewar2",LastTalkedToBy(Myself))
SetGlobal("D0AranGivePlayerRing","GLOBAL",1)~ GOTO AR_24_before_a
END

IF ~~ THEN BEGIN AR_24_before_a
SAY @272
IF ~~ THEN GOTO AR_25
END

IF ~~ THEN BEGIN AR_24a
SAY @273
IF ~~ THEN GOTO AR_25
END

IF ~~ THEN BEGIN AR_24b
SAY @274
IF ~~ THEN GOTO AR_25
END

IF ~~ THEN BEGIN AR_24c
SAY @275
IF ~~ THEN GOTO 84
END

IF ~~ THEN BEGIN AR_24d
SAY @276
IF ~~ THEN GOTO 86
END

IF ~~ THEN BEGIN AR_25
SAY @277
  IF ~~ THEN DO ~EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@368)
EraseJournalEntry(@369)
EraseJournalEntry(@370)
EraseJournalEntry(@371)
EraseJournalEntry(@372)
EraseJournalEntry(@373)
EraseJournalEntry(@374)
AddJournalEntry(@367,QUEST_DONE)
GiveGoldForce(10000)
AddXPObject(Player1,21500)
AddXPObject(Player2,21500)
AddXPObject(Player3,21500)
AddXPObject(Player4,21500)
AddXPObject(Player5,21500)
AddXPObject(Player6,21500)~ EXIT
END

IF WEIGHT #-1 ~Global("Chapter","GLOBAL",%bg2_chapter_6%)
!Global("D0AranHostile","GLOBAL",1)
Dead("c6bodhi")
Global("D0Maevar","GLOBAL",8)~ THEN BEGIN AR_26
  SAY @278
  IF ~~ THEN EXIT
END

IF WEIGHT #17 ~Global("Chapter","GLOBAL",%bg2_chapter_6%)
Dead("d0nightk")
Dead("Maevar")
Global("ShadowFightBodhi","GLOBAL",2)
!Global("D0AranHostile","GLOBAL",1)
!Dead("c6bodhi")~ THEN BEGIN Additional_107 // from:
  SAY @279
  IF ~OR(2)
!GlobalGT("D0Maevar","GLOBAL",4)
!Global("D0WarnedAran","GLOBAL",0)~ THEN EXIT
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @280 GOTO AR_20c
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @281 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)~ GOTO AR_20
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @282 GOTO AR_20d
END
END

REPLACE ARAN
IF WEIGHT #17 ~Global("Chapter","GLOBAL",%bg2_chapter_6%)
Global("ShadowFightBodhi","GLOBAL",1)
!Global("D0AranHostile","GLOBAL",1)
!Dead("c6bodhi")~ THEN BEGIN 106 // from:
  SAY @283
  IF ~OR(2)
!GlobalGT("D0Maevar","GLOBAL",4)
!Global("D0WarnedAran","GLOBAL",0)~ THEN EXIT
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @284 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)~ GOTO AR_20
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @285 GOTO AR_20e
END

IF ~Global("Chapter","GLOBAL",%bg2_chapter_6%)
OR(2)
!Dead("d0nightk")
!Dead("Maevar")
Global("ShadowFightBodhi","GLOBAL",2)
!Global("D0AranHostile","GLOBAL",1)
!Dead("c6bodhi")~ THEN BEGIN 107 // from:
  SAY #53237 /* ~I have told you my decision, <CHARNAME>.  Kill Bodhi, but do it without my help... and we shall be even.  Now leave this place at once.~ */
  IF ~OR(2)
!GlobalGT("D0Maevar","GLOBAL",4)
!Global("D0WarnedAran","GLOBAL",0)~ THEN EXIT
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @280 GOTO AR_20c
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @281 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)~ GOTO AR_20
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @282 GOTO AR_20d
END

IF ~Global("Chapter","GLOBAL",%bg2_chapter_6%)
!Global("D0AranHostile","GLOBAL",1)
Dead("c6bodhi")~ THEN BEGIN 108 // from:
  SAY #53238 /* ~So... finally, Bodhi is dead, is she?  I am very pleased.  The Shadow Thieves at large can breathe a sigh of relief, now.  A job well done, <CHARNAME>.~ */
  IF ~OR(2)
!GlobalGT("D0Maevar","GLOBAL",4)
!Global("D0WarnedAran","GLOBAL",0)~ THEN DO ~SetGlobal("D0SpokenBodhiDeath","LOCALS",1)~ EXIT
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @286 DO ~SetGlobal("D0WarnedAran","GLOBAL",1)
SetGlobal("D0SpokenBodhiDeath","LOCALS",1)~ GOTO AR_20
  IF ~Global("D0WarnedAran","GLOBAL",0)
GlobalGT("D0Maevar","GLOBAL",4)~ THEN REPLY @287 DO ~SetGlobal("D0SpokenBodhiDeath","LOCALS",1)~ GOTO AR_20b
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

BEGIN D0MAGCLE

IF ~True()~ THEN BEGIN MC_1
SAY @288
IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND_EARLY D0NIGHTK

IF ~Global("D0Maevar","GLOBAL",5)
Global("D0WarnedAran","GLOBAL",0)
AreaCheck("ar0306")~ THEN BEGIN LL_7
  SAY @289
  IF ~~ THEN REPLY @290 GOTO LL_8
  IF ~~ THEN REPLY @291 GOTO LL_9
  IF ~~ THEN REPLY @292 GOTO LL_10
END

IF ~~ THEN BEGIN LL_8
  SAY @293
  IF ~~ THEN REPLY @233 GOTO LL_11
  IF ~~ THEN REPLY @292 GOTO LL_10
END

IF ~~ THEN BEGIN LL_9
  SAY @294
      =
      @295
  IF ~~ THEN REPLY @233 GOTO LL_11
  IF ~~ THEN REPLY @292 GOTO LL_10
END

IF ~~ THEN BEGIN LL_10
  SAY @296
  IF ~~ THEN DO ~SetGlobal("D0LarellHostile","GLOBAL",1)
SetGlobal("D0MaevarHostile","GLOBAL",1)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN LL_11
  SAY @297
  IF ~~ THEN DO ~// GiveItemCreate("misc4s",LastTalkedToBy(Myself),1,0,0)
SetGlobal("D0AranHostile","GLOBAL",1)
SetGlobal("D0LarellAssault","GLOBAL",1)
SetCutSceneLite(TRUE)
DisplayStringHead(Myself,@582)
Wait(5)
SetCutSceneLite(FALSE)~ EXIT
END

IF WEIGHT #-1 ~Global("D0LarellAssault","GLOBAL",1)
AreaCheck("ar0305")
!See([ENEMY])
!See(NearestEnemyOf(Myself))
Global("D0WarnedAran","GLOBAL",0)~ THEN BEGIN LL_12
  SAY @298
  IF ~~ THEN EXIT
END

IF ~Global("D0LarellAssault","GLOBAL",1)
Dead("Aran")
!Global("D0WarnedAran","GLOBAL",1)
Global("D0FinalTask","LOCALS",0)~ THEN BEGIN LL_13
  SAY @299
  IF ~~ THEN REPLY @300 GOTO LL_14
  IF ~~ THEN REPLY @301 GOTO LL_15
  IF ~~ THEN REPLY @302 GOTO LL_20
END

IF ~~ THEN BEGIN LL_14
  SAY @303
  IF ~~ THEN REPLY @301 GOTO LL_15
  IF ~~ THEN REPLY @302 GOTO LL_20
END

IF ~~ THEN BEGIN LL_15
  SAY @304
      =
      @305
  IF ~~ THEN REPLY @306 GOTO LL_16
  IF ~~ THEN REPLY @307 GOTO LL_17
END

IF ~~ THEN BEGIN LL_16
  SAY @308
  IF ~~ THEN GOTO LL_16a
END

IF ~~ THEN BEGIN LL_16a
  SAY @309
  IF ~~ THEN REPLY @310 GOTO LL_18
  IF ~~ THEN REPLY @311 GOTO LL_19
END

IF ~~ THEN BEGIN LL_17
  SAY @312
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",6)
SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@367)
EraseJournalEntry(@368)
EraseJournalEntry(@370)
EraseJournalEntry(@371)
EraseJournalEntry(@372)
EraseJournalEntry(@373)
EraseJournalEntry(@374)
AddJournalEntry(@369,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN LL_18
  SAY @313
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",6)
SetGlobal("D0MaevarHostile","GLOBAL",1)
SetGlobal("D0LarellHostile","GLOBAL",1)
EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@367)
EraseJournalEntry(@368)
EraseJournalEntry(@369)
EraseJournalEntry(@371)
EraseJournalEntry(@372)
EraseJournalEntry(@373)
EraseJournalEntry(@374)
AddJournalEntry(@370,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN LL_19
  SAY @314
  IF ~~ THEN DO ~AddJournalEntry(@371,QUEST)
SetGlobal("D0Maevar","GLOBAL",6)
SetGlobal("D0FinalTask","LOCALS",1)
MoveToPoint([4603.2052])~ EXIT
END

IF ~~ THEN BEGIN LL_20
  SAY @315
  IF ~~ THEN GOTO LL_15
END

IF ~Global("D0WarnedAran","GLOBAL",1)
!Dead("Aran")
Global("D0FinalTask","LOCALS",0)~ THEN BEGIN LL_21
  SAY @316
  IF ~~ THEN DO ~SetGlobal("D0AranHostile","GLOBAL",1)
SetGlobal("D0WarnedAran","GLOBAL",2)
SetGlobal("D0LarellAssault","GLOBAL",1)
SetCutSceneLite(TRUE)
DisplayStringHead(Myself,@582)
Wait(5)
SetCutSceneLite(FALSE)~ EXIT
END

IF ~Global("D0LarellAssault","GLOBAL",0)
Dead("Aran")
Global("D0FinalTask","LOCALS",0)~ THEN BEGIN LL_22
  SAY @317
     =
      @318
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",6)~ REPLY @301 GOTO LL_15
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",6)~ REPLY @302 GOTO LL_20
END

IF ~Global("D0FinalTask","LOCALS",1)
!Dead("Maevar")~ THEN BEGIN LL_23
  SAY @319
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND MAEVAR

IF WEIGHT #-1 ~GlobalGT("D0Maevar","GLOBAL",4)
Global("D0KillLarell","LOCALS",0)
GlobalGT("D0AranHostile","GLOBAL",0)~ THEN BEGIN MV_23
  SAY @320
  IF ~Dead("Aran")~ THEN REPLY @321 GOTO MV_24
  IF ~Dead("Aran")~ THEN REPLY @322 GOTO MV_25
  IF ~!Dead("Aran")~ THEN REPLY @323 GOTO MV_22
END

IF ~~ THEN BEGIN MV_24
  SAY @324
  IF ~~ THEN DO ~SetGlobal("D0MaevarHostile","GLOBAL",1)
Shout(89)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN MV_25
  SAY @325
  IF ~~ THEN REPLY @326 GOTO MV_24
  IF ~!Dead("d0nightk")~ THEN REPLY @327 GOTO MV_26
  IF ~Dead("d0nightk")~ THEN REPLY @328 GOTO MV_29
END

IF ~~ THEN BEGIN MV_26
  SAY @329
  IF ~InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN DO ~SetGlobal("D0KillLarell","LOCALS",1)~ EXTERN EDWINJ E_MV_26
  IF ~OR(4)
!InParty("Edwin")
!Detect("Edwin")
StateCheck("Edwin",1064941)
StateCheck("Edwin",STATE_CONFUSED)~ THEN DO ~AddJournalEntry(@373,QUEST)
SetGlobal("D0KillLarell","LOCALS",1)~ EXIT
END

IF WEIGHT #-1 ~Global("D0KillLarell","LOCALS",1)~ THEN BEGIN MV_27
  SAY @330
  IF ~!Dead("d0nightk")~ THEN REPLY @331 GOTO MV_24
  IF ~Dead("d0nightk")~ THEN REPLY @332 GOTO MV_24
  IF ~!Dead("d0nightk")~ THEN REPLY @333 GOTO MV_28
  IF ~Dead("d0nightk")~ THEN REPLY @334 GOTO MV_29
END

IF ~~ THEN BEGIN MV_28
  SAY @335
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MV_29
  SAY @336
      =
      @337
      =
      @338
  IF ~~ THEN DO ~EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@367)
EraseJournalEntry(@368)
EraseJournalEntry(@369)
EraseJournalEntry(@370)
EraseJournalEntry(@371)
EraseJournalEntry(@372)
EraseJournalEntry(@373)
AddJournalEntry(@374,QUEST_DONE)
SetGlobal("D0Maevar","GLOBAL",7)
SetGlobal("D0KillLarell","LOCALS",2)
GiveItemCreate("d0reward",LastTalkedToBy(Myself),1,0,0)
GiveGoldForce(7500)
AddXPObject(Player1,31500)
AddXPObject(Player2,31500)
AddXPObject(Player3,31500)
AddXPObject(Player4,31500)
AddXPObject(Player5,31500)
AddXPObject(Player6,31500)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",7)
RandomNum(3,1)~ THEN BEGIN MV_30
  SAY @339
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",7)
RandomNum(3,2)~ THEN BEGIN MV_31
  SAY @340
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0Maevar","GLOBAL",7)
RandomNum(3,3)~ THEN BEGIN MV_32
  SAY @341
  IF ~~ THEN EXIT
END

END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

APPEND_EARLY D0NIGHTK

IF ~Global("D0FinalTask","LOCALS",1)
Dead("Maevar")~ THEN BEGIN LL_24
  SAY @342
     =
      @343
     =
      @344
  IF ~~ THEN DO ~SetGlobal("D0Maevar","GLOBAL",7)
SetGlobal("D0FinalTask","LOCALS",2)
EraseJournalEntry(@224)
EraseJournalEntry(@357)
EraseJournalEntry(@358)
EraseJournalEntry(@359)
EraseJournalEntry(@360)
EraseJournalEntry(@361)
EraseJournalEntry(@362)
EraseJournalEntry(@363)
EraseJournalEntry(@364)
EraseJournalEntry(@365)
EraseJournalEntry(@365)
EraseJournalEntry(@367)
EraseJournalEntry(@368)
EraseJournalEntry(@369)
EraseJournalEntry(@370)
EraseJournalEntry(@371)
EraseJournalEntry(@373)
EraseJournalEntry(@374)
AddJournalEntry(@372,QUEST_DONE)
GiveItem("d0reward",LastTalkedToBy(Myself))
GiveGoldForce(3500)
AddXPObject(Player1,31500)
AddXPObject(Player2,31500)
AddXPObject(Player3,31500)
AddXPObject(Player4,31500)
AddXPObject(Player5,31500)
AddXPObject(Player6,31500)
MoveToPoint([4603.2052])~ EXIT
END

IF ~Global("D0FinalTask","LOCALS",2)
RandomNum(3,1)~ THEN BEGIN LL_25
  SAY @345
  IF ~~ THEN EXIT
END

IF ~Global("D0FinalTask","LOCALS",2)
RandomNum(3,2)~ THEN BEGIN LL_25
  SAY @346
  IF ~~ THEN EXIT
END

IF ~Global("D0FinalTask","LOCALS",2)
RandomNum(3,3)~ THEN BEGIN LL_25
  SAY @347
  IF ~~ THEN EXIT
END

END

BEGIN D0NIGHT2
IF ~True()~ THEN BEGIN NKA_1
SAY @348
IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// INTERJECTS

APPEND NALIAJ
IF ~~ THEN BEGIN N_MV_18
SAY @349
IF ~~ THEN EXTERN MAEVAR MV_18b
END
END

APPEND EDWINJ
IF ~~ THEN BEGIN E_MV_26
SAY @350
IF ~~ THEN DO ~AddJournalEntry(@373,QUEST)~ EXIT
END
END

//////////////////////////////////////////////////////////////////////

// HORRIBLE, HORRIBLE INTERJECT BLOCKS!

INTERJECT_COPY_TRANS D0NIGHTK LL_16a D0FinalTInterjects
/* == KORGANJ IF ~InParty("Korgan")
Detect("Korgan")
!StateCheck("Korgan",1064941)
!StateCheck("Korgan",STATE_CONFUSED)~ THEN @356 */
== MINSCJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)~ THEN @351
== VALYGARJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)
InParty("Valygar")
Detect("Valygar")
!StateCheck("Valygar",1064941)
!StateCheck("Valygar",STATE_CONFUSED)~ THEN @352
== EDWINJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)
OR(4)
!InParty("Valygar")
!Detect("Valygar")
StateCheck("Valygar",1064941)
StateCheck("Valygar",STATE_CONFUSED)
InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @353
== EDWINJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)
OR(4)
!InParty("Valygar")
!Detect("Valygar")
StateCheck("Valygar",1064941)
StateCheck("Valygar",STATE_CONFUSED)
InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @354
== D0NIGHTK IF ~~ THEN @355
END

INTERJECT_COPY_TRANS D0NIGHTK LL_16a D0FinalTInterjects2
== KORGANJ IF ~InParty("Korgan")
Detect("Korgan")
!StateCheck("Korgan",1064941)
!StateCheck("Korgan",STATE_CONFUSED)~ THEN @356
== MINSCJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)~ THEN @351
== VALYGARJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)
InParty("Valygar")
Detect("Valygar")
!StateCheck("Valygar",1064941)
!StateCheck("Valygar",STATE_CONFUSED)~ THEN @352
== EDWINJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)
OR(4)
!InParty("Valygar")
!Detect("Valygar")
StateCheck("Valygar",1064941)
StateCheck("Valygar",STATE_CONFUSED)
InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @353
== EDWINJ IF ~InParty("Minsc")
Detect("Minsc")
!StateCheck("Minsc",1064941)
!StateCheck("Minsc",STATE_CONFUSED)
OR(4)
!InParty("Valygar")
!Detect("Valygar")
StateCheck("Valygar",1064941)
StateCheck("Valygar",STATE_CONFUSED)
InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @354
== D0NIGHTK IF ~~ THEN @355
END
