REPLACE_TRIGGER_TEXT DOGHMA ~Global("RevealUmar","GLOBAL",1)~ ~False()~

EXTEND_BOTTOM DOGHMA 0
  IF ~OR(3)
PartyHasItem("book94")
PartyHasItem("book95")
PartyHasItem("book96")
OR(5)
PartyHasItem("miscbm")
PartyHasItem("miscbn")
PartyHasItem("miscbo")
PartyHasItem("j#kelbdy")
PartyHasItem("pgnalbdy")~ THEN REPLY #57922 /* ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ */ GOTO 10
END

EXTEND_BOTTOM DOGHMA 3
  IF ~OR(3)
PartyHasItem("book94")
PartyHasItem("book95")
PartyHasItem("book96")
OR(5)
PartyHasItem("miscbm")
PartyHasItem("miscbn")
PartyHasItem("miscbo")
PartyHasItem("j#kelbdy")
PartyHasItem("pgnalbdy")~ THEN REPLY #57922 /* ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ */ GOTO 10
END

EXTEND_BOTTOM DOGHMA 7
  IF ~OR(3)
PartyHasItem("book94")
PartyHasItem("book95")
PartyHasItem("book96")
OR(5)
PartyHasItem("miscbm")
PartyHasItem("miscbn")
PartyHasItem("miscbo")
PartyHasItem("j#kelbdy")
PartyHasItem("pgnalbdy")~ THEN REPLY #57922 /* ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ */ GOTO 10
END

EXTEND_BOTTOM DOGHMA 9
  IF ~OR(3)
PartyHasItem("book94")
PartyHasItem("book95")
PartyHasItem("book96")
OR(5)
PartyHasItem("miscbm")
PartyHasItem("miscbn")
PartyHasItem("miscbo")
PartyHasItem("j#kelbdy")
PartyHasItem("pgnalbdy")~ THEN REPLY #57922 /* ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ */ GOTO 10
END

REPLACE DOGHMA
IF ~~ THEN BEGIN 12 // from: 11.0
  SAY #59366 /* ~The... Dea Vampir Becomos, Conjur Ota Servanta, and Vampiricus Omnibus.  Yes, those were the ones.  I cannot tell you much about their contents though.
~ */
  IF ~~ THEN DO ~SetGlobal("KnowStolenBooks","MYAREA",1)~ GOTO 13
END
END

BEGIN D0QPLIBR

IF ~GlobalLT("D0BookQuest","GLOBAL",2)~ THEN BEGIN OG_1
SAY ~Good friend, if you seek service within the hall of the Binder, you had best speak with the Lorekeeper.~
  IF ~OR(3)
PartyHasItem("book94")
PartyHasItem("book95")
PartyHasItem("book96")
OR(5)
PartyHasItem("miscbm")
PartyHasItem("miscbn")
PartyHasItem("miscbo")
PartyHasItem("j#kelbdy")
PartyHasItem("pgnalbdy")~ THEN REPLY #57922 /* ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ */ GOTO OG_3
IF ~~ THEN REPLY ~I'll be on my way then, thanks.~ GOTO OG_2
END

IF ~~ THEN BEGIN OG_2
SAY ~I trust you will find wisdom, friend.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OG_3
SAY ~I could likely find something on the subject, although I fear much of our collection on vampirism was stolen some time ago. The Lorekeeper, I believe, has studied the texts, though. You might speak with him.~
= ~Perhaps, if you are willing, I might make a copy of the
