// ADD_STATE_TRIGGER booter 4 ~NumTimesTalkedToGT(4)~ 5 6 7 8

APPEND booter
 IF WEIGHT #-1 ~NumTimesTalkedTo(1)~ firststory
  SAY @518
=
@519
=
@520
  IF ~~ THEN EXIT
 END

 IF WEIGHT #-1 ~NumTimesTalkedTo(2)~ 2ndstory
  SAY @521
=
@522
=
@523
=
@524
  IF ~~ THEN EXIT
 END

 IF WEIGHT #-1 ~NumTimesTalkedTo(3)~ 3rdstory
  SAY @525
=
@526
=
@527
=
@528
=
@529
  IF ~~ THEN EXIT
 END

 IF WEIGHT #-1 ~NumTimesTalkedTo(4)
GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)~ 4thstory
  SAY @530
=
@531
=
@532
=
@533
  IF ~~ THEN DO ~SetGlobal("J#im8guardchat","GLOBAL",1)~ EXIT
 END

 IF WEIGHT #-1 ~G("J#im8booterrack",2)~ tortured
  SAY @534
  IF ~~ THEN EXIT
 END
END

BEGIN J#im8tor // torturer
IF ~True()~ bootertalked
  SAY @535
=
@536
=
@537
  IF ~~ THEN EXIT
END


BEGIN J#im8grd // Guard whose family's gonna get squished
IF ~Global("J#im8guardchat","GLOBAL",0)~ introtalkingtypethin
  SAY @538
  IF ~~ THEN EXIT
END

IF ~Global("J#im8guardchat","GLOBAL",1)~ pain
 SAY @539
  ++ @540 + tellstory
  ++ @541 + tellstory
  ++ @542 + tellstory
  ++ @543 GOTO introtalkingtypethin
  ++ @544 GOTO introtalkingtypethin
END

IF ~~ tellstory
  SAY @545
=
@546
=
@547
=
@548
  ++ @549 DO ~SG("J#im8guardchat",3)~ GOTO freedum
  ++ @550 DO ~SG("J#im8guardchat",3)~ GOTO freedum
  ++ @551 DO ~SG("J#im8guardchat",2)~ GOTO ding0YEAH
  ++ @552 DO ~SG("J#im8guardchat",2)~ GOTO ding0YEAH
END

IF ~~ freedum
  SAY @553
=
@554
  IF ~~ THEN DO ~AddexperienceParty(5000)
AddJournalEntry(@574,QUEST)~ EXIT
END

IF ~G("J#im8guardchat",2)~ pleasefree
  SAY @555
=
@556
  ++ @549 DO ~SG("J#im8guardchat",3)~ GOTO freedum
  ++ @550 DO ~SG("J#im8guardchat",3)~ GOTO freedum
  ++ @551 DO ~SG("J#im8guardchat",2)~ GOTO ding0YEAH
  ++ @552 DO ~SG("J#im8guardchat",2)~ GOTO ding0YEAH
END

IF ~~ ding0YEAH
SAY @557
IF ~~ THEN EXIT
END

// G=3 causes him to EscapeArea() from the torture chamber, and spawn in the Bridge District.

IF ~G("J#im8guardchat",4)~ letsgohurry
  SAY @558
=
@559
  IF ~~ THEN DO ~SG("J#im8guardchat",5) MoveToPointNoInterrupt([3350.900])~ EXIT
END

IF ~OR(3) G("J#im8guardchat",5) G("J#im8guardchat",6) G("J#im8guardchat",7) GlobalLT("SPRITE_IS_DEADJ#im8thg","GLOBAL",6)~ fightem
  SAY @560
  IF ~~ THEN EXIT
END

IF ~G("J#im8guardchat",7) GlobalGT("SPRITE_IS_DEADJ#im8thg","GLOBAL",5)~ fightemdone
  SAY @561
=
@562
++ @563 + revenge
++ @564 + bilioushatred
++ @565 + revenge
END

IF ~~ bilioushatred
  SAY @566
=
@567
  IF ~~ THEN DO ~SG("J#im8booterrack",1)
SG("J#im8guardcorpse",1)
EraseJournalEntry(@574)
AddJournalEntry(@575,QUEST_DONE)
AddexperienceParty(10000)
EscapeArea()~ EXIT
END

IF ~~ revenge
  SAY @567
=
@568
  ++ @569 + goodadvice
  ++ @570 + badadvice
END

IF ~~ goodadvice
  SAY @571
=
@572
  IF ~~ THEN DO ~SG("J#im8booterrack",1)
AddexperienceParty(10000)
EraseJournalEntry(@574)
AddJournalEntry(@575,QUEST_DONE)
EscapeArea()~ EXIT
END

IF ~~ badadvice
  SAY @573
  IF ~~ THEN DO ~SG("J#im8guardcorpse",1)
SG("J#im8booterrack",1)
AddexperienceParty(10000)
EraseJournalEntry(@574)
AddJournalEntry(@575,QUEST_DONE)
EscapeArea()~ EXIT
END
