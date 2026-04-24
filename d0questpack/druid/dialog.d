APPEND CERNDJ
IF WEIGHT #-1 ~Global("D0KillFaldornWrong","GLOBAL",2)~ THEN BEGIN CE_1
SAY ~<CHARNAME>, great harm has been done here today. Faldorn no longer threatens the grove with her forbidden link, but at what cost? It was not wise to attack her outside of the correct rituals.~
= ~Every blow struck against her was a blow against mother nature. The consequences may be irreversible.~
= ~I must stay, and work to repair the damage that has occured to the grove. Farewell.~
IF ~InParty("Jaheira")
!StateCheck("Jaheira",STATE_STUNNED)
!StateCheck("Jaheira",STATE_HELPLESS)
!StateCheck("Jaheira",STATE_SLEEPING)
!StateCheck("Jaheira",STATE_SILENCED)
!StateCheck("Jaheira",STATE_CHARMED)
!StateCheck("Jaheira",STATE_CONFUSED)
!StateCheck("Jaheira",STATE_FEEBLEMINDED)~ DO ~LeaveParty()
EscapeArea()~ EXTERN JAHEIRAJ JA_1
IF ~OR(8)
!InParty("Jaheira")
StateCheck("Jaheira",STATE_STUNNED)
StateCheck("Jaheira",STATE_HELPLESS)
StateCheck("Jaheira",STATE_SLEEPING)
StateCheck("Jaheira",STATE_SILENCED)
StateCheck("Jaheira",STATE_CHARMED)
StateCheck("Jaheira",STATE_CONFUSED)
StateCheck("Jaheira",STATE_FEEBLEMINDED)~ DO ~SetGlobal("D0KillFaldornWrong","GLOBAL",3)
LeaveParty()
EscapeArea()~ EXIT
END
END

APPEND JAHEIRAJ
IF WEIGHT #-1 ~Global("D0KillFaldornWrong","GLOBAL",2)~ THEN BEGIN JA_1
SAY ~
IF ~~ THEN DO ~SetGlobal("D0KillFaldornWrong","GLOBAL",3)~ EXIT
END
END

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM CEFALDOR 6
IF ~~ THEN REPLY ~Faldorn?! I thought you were dead!~ GOTO FA_1
IF ~~ THEN REPLY ~Don't you remember me, Faldorn? It's <CHARNAME>.~ GOTO FA_2
END

EXTEND_BOTTOM CEFALDOR 6
IF ~~ THEN REPLY ~You seem like a powerful kind of girl. Perhaps we can work together?~ GOTO FA_3
IF ~OR(2)
CheckStatGT(Player1,13,WIS)
Class(Player1,DRUID_ALL)~ THEN REPLY ~Stop the righteous force of nature? By no means! I come to offer assistance in the destruction the Shadow Druids leave in their wake.~ GOTO FA_4
END

EXTEND_BOTTOM CEFALDOR 2
IF ~~ THEN REPLY ~Don't you remember me, Faldorn? It's <CHARNAME>.~ GOTO FA_2a
END

EXTEND_BOTTOM CEFALDOR 2
IF ~~ THEN REPLY ~You seem like a powerful kind of girl. Perhaps we can work together?~ GOTO FA_3
IF ~OR(2)
CheckStatGT(Player1,13,WIS)
Class(Player1,DRUID_ALL)~ THEN REPLY ~And I would fight alongside you, in the mother's name! I come to offer assistance in the destruction the Shadow Druids leave in their wake.~ GOTO FA_4
END


APPEND CEFALDOR
IF ~~ THEN BEGIN FA_1
  SAY #9615 /* ~You are not the only one with access to resurrection magic. Best you watch your back; there is no telling whom you might meet that you may have fought before.~ */
  IF ~Class(Player1,DRUID_ALL)~ THEN REPLY #9865 /* ~Why are druids attacking all who enter the wood? This is not our role! Where is the balance in this? ~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 0
  IF ~!Class(Player1,DRUID_ALL)~ THEN REPLY #9866 /* ~Why are druids attacking all who enter the wood? This is not the role of the druid! ~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 7
  IF ~Global("TalkedToCernd","GLOBAL",1)
OR(4)
!InParty("Cernd")
Dead("Cernd")
StateCheck("Cernd",STATE_SLEEPING)
!See("Cernd")~ THEN REPLY #9867 /* ~Cernd would know what has changed here, and why you rule as you do.~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 8
  IF ~InParty("Cernd")
!Dead("Cernd")
!StateCheck("Cernd",STATE_SLEEPING)
See("Cernd")~ THEN REPLY #9868 /* ~Cernd would know what has changed here, and why you rule as you do. ~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 9
  IF ~InParty("Jaheira")
!Dead("Jaheira")
!StateCheck("Jaheira",STATE_SLEEPING)
See("Jaheira")~ THEN REPLY #10096 /* ~We have questions about the druids. This is close to the heart of Jaheira, and she demands an answer.~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 10
  IF ~~ THEN REPLY ~You've seen how I work before, Faldorn. I can help you, and the Shadow Druids.~ GOTO FA_4
END

IF ~~ THEN BEGIN FA_2
  SAY ~I know who you are, maggot. We may have crossed paths before, but that matters not one thread. I am different now.~
  IF ~Class(Player1,DRUID_ALL)~ THEN REPLY #9865 /* ~Why are druids attacking all who enter the wood? This is not our role! Where is the balance in this? ~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 0
  IF ~!Class(Player1,DRUID_ALL)~ THEN REPLY #9866 /* ~Why are druids attacking all who enter the wood? This is not the role of the druid! ~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 7
  IF ~Global("TalkedToCernd","GLOBAL",1)
OR(4)
!InParty("Cernd")
Dead("Cernd")
StateCheck("Cernd",STATE_SLEEPING)
!See("Cernd")~ THEN REPLY #9867 /* ~Cernd would know what has changed here, and why you rule as you do.~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 8
  IF ~InParty("Cernd")
!Dead("Cernd")
!StateCheck("Cernd",STATE_SLEEPING)
See("Cernd")~ THEN REPLY #9868 /* ~Cernd would know what has changed here, and why you rule as you do. ~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 9
  IF ~InParty("Jaheira")
!Dead("Jaheira")
!StateCheck("Jaheira",STATE_SLEEPING)
See("Jaheira")~ THEN REPLY #10096 /* ~We have questions about the druids. This is close to the heart of Jaheira, and she demands an answer.~ */ DO ~SetGlobal("TalkedFaldor1","GLOBAL",1)~ GOTO 10
  IF ~~ THEN REPLY ~You've seen how I work before, Faldorn. I can help you, and the Shadow Druids.~ GOTO FA_4
END

IF ~~ THEN BEGIN FA_2a
  SAY ~I know who you are, maggot. We may have crossed paths before, but that matters not one thread. I am different now, linked to the grove.~
  IF ~!Class(Player1,DRUID_ALL)
InParty("Cernd")
!Dead("Cernd")
!StateCheck("Cernd",STATE_SLEEPING)
//See("Cernd")
~ THEN REPLY #9619 /* ~The rituals of ascension still rule here. Cernd will challenge you for leadership. ~ */ EXTERN ~CERNDJ~ 69
  IF ~!Class(Player1,DRUID_ALL)
InParty("Jaheira")
!Dead("Jaheira")
!StateCheck("Jaheira",STATE_SLEEPING)
//See("Jaheira")
~ THEN REPLY #9620 /* ~The rituals still govern this place! As a druid it is Jaheira's right to challenge you!~ */ EXTERN ~JAHEIRAJ~ 94
  IF ~Class(Player1,DRUID_ALL)
See(PLAYER1)
!StateCheck(PLAYER1,STATE_SLEEPING)~ THEN REPLY #9621 /* ~The rituals of ascension still stand! I challenge you for leadership! Such is my right!~ */ GOTO 13
  IF ~!Class(Player1,DRUID_ALL)
See(PLAYER1)
!StateCheck(PLAYER1,STATE_SLEEPING)~ THEN REPLY #9622 /* ~I will fight you, I will fight all of you!~ */ GOTO 3
  IF ~Global("CerndFightObserve","GLOBAL",0)~ THEN REPLY #9623 /* ~Perhaps we could make a deal? A bargain for the lives of those in Trademeet?~ */ GOTO 5
  IF ~Class(Player2,DRUID_ALL)
!Name("Jaheira",Player2)
!Name("Cernd",Player2)
//!Dead(PLAYER2)
See(PLAYER2)
!StateCheck(PLAYER2,STATE_SLEEPING)~ THEN REPLY #9948 /* ~There is another with us that could challenge you according to the old rituals. A druid called <PLAYER2>.~ */ GOTO 22
  IF ~Class(Player3,DRUID_ALL)
!Name("Jaheira",Player3)
!Name("Cernd",Player3)
//!Dead(PLAYER3)
See(PLAYER3)
!StateCheck(PLAYER3,STATE_SLEEPING)~ THEN REPLY #9952 /* ~There is another with us that could challenge you according to the old rituals. A druid called <PLAYER3>.~ */ GOTO 23
  IF ~Class(Player4,DRUID_ALL)
!Name("Jaheira",Player4)
!Name("Cernd",Player4)
//!Dead(PLAYER4)
See(PLAYER4)
!StateCheck(PLAYER4,STATE_SLEEPING)~ THEN REPLY #9953 /* ~There is another with us that could challenge you according to the old rituals. A druid called <PLAYER4>.~ */ GOTO 24
  IF ~Class(Player5,DRUID_ALL)
!Name("Jaheira",Player5)
!Name("Cernd",Player5)
//!Dead(PLAYER5)
See(PLAYER5)
!StateCheck(PLAYER5,STATE_SLEEPING)~ THEN REPLY #9954 /* ~There is another with us that could challenge you according to the old rituals. A druid called <PLAYER5>.~ */ GOTO 25
  IF ~Class(Player6,DRUID_ALL)
!Name("Jaheira",Player6)
!Name("Cernd",Player6)
//!Dead(PLAYER6)
See(PLAYER6)
!StateCheck(PLAYER6,STATE_SLEEPING)~ THEN REPLY #9955 /* ~There is another with us that could challenge you according to the old rituals. A druid called <PLAYER6>.~ */ GOTO 26
  IF ~!Class(Player1,DRUID_ALL)
!InParty("Cernd")
!Dead("Cernd")
!StateCheck("Cernd",STATE_SLEEPING)
See("Cernd")~ THEN REPLY #38457 /* ~The rituals of ascension still rule here. Cernd will challenge you for leadership.~ */ EXTERN ~CERND~ 60
  IF ~~ THEN REPLY ~You've seen how I work before, Faldorn. I can help you, and the Shadow Druids.~ GOTO FA_4
END

IF ~~ THEN BEGIN FA_3
SAY ~You mock me with such words? Go! Flee back to your town, and await your impending doom. You are unworthy to work with the true servants of nature.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN FA_4
SAY ~ Accepting offer goes here!

END
END
