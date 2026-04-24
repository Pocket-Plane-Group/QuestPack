// Drow Shortcut
REPLACE UDDROW10
IF ~~ THEN BEGIN 20 // from: 19.0
  SAY #52753 /* ~Or so the story goes.  I hold little truck with it, myself... but, then, I would never venture into those old passages just in case the tales of her presence are true.~ */
  IF ~IsValidForPartyDialog("Viconia")~ THEN REPLY #52755 /* ~Is there any news more recent?  Perhaps you've heard of her eggs?~ */ DO ~SetGlobal("D0SpokenMatronEggs","LOCALS",1)~ EXTERN VICONIAJ TavernInterject1
  IF ~!IsValidForPartyDialog("Viconia")~ THEN REPLY #52755 /* ~Is there any news more recent?  Perhaps you've heard of her eggs?~ */ DO ~SetGlobal("D0SpokenMatronEggs","LOCALS",1)~ GOTO 21
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY #52756 /* ~Well... I have heard the passages to the surface are open once more.  At least the Matron Mothers certainly believe so, gathering their armies as they are.  Perhaps Adalon is dead, I know not.~ */
  IF ~~ THEN REPLY ~I have reason to believe that the Matron Mothers are holding Adalon's eggs. Where could they be hiding them?~ GOTO ShortcutGuy1
  IF ~~ THEN REPLY ~I see. I have other questions.~ GOTO 3
END
END

APPEND VICONIAJ
IF ~~ THEN BEGIN TavernInterject1
SAY ~Be wary of pressuring this one for too much information, <CHARNAME>. Suspicions will be raised, and as harmless as he might seem, nobody here can be trusted.~
IF ~~ THEN EXTERN UDDROW10 21
END
END

EXTEND_BOTTOM UDDROW10 3
IF ~Global("D0SpokenMatronEggs","LOCALS",1)~ THEN REPLY ~I have reason to believe that the Matron Mothers are holding Adalon's eggs. Where could they be hiding them?~ GOTO ShortcutGuy1
END

APPEND UDDROW10
IF ~~ THEN BEGIN ShortcutGuy1
SAY ~How would you know such a thing? Hmm... hmm. House Despana leads the massing of forces against the surface. If any Matron Mother knows something of the situation, Ardulace would.~
= ~If they do hold the eggs as you say, they would likely have secured them in the compound in the east of the city.~
= ~I suggest you not mention my name as the source of this information, or I will dedicate my final living moments to planting a blade in your back. Now, <MALEFEMALE>, I must depart. On your way.~
IF ~~ THEN DO ~SetGlobal("D0ShortcutPlot","GLOBAL",1)
AddJournalEntry(@99906,QUEST)
EscapeArea()~ EXIT
END

APPEND UDARDUL
IF WEIGHT #-1 ~Global("D0ShortcutPlot","GLOBAL",1)~ THEN BEGIN Ambush1
SAY ~Foolish, insolent <MALEFEMALE>! Come to claim the prize, have you?~
= ~No drow would ask such conspicuous questions-- especially one new to the city. Nor would anyone who had not proven themself loyal to House Despana know of the eggs; the other male you told has paid for his open ears. So, who are you?~
IF ~~ THEN DO ~SetGlobal("D0ShortcutPlot","GLOBAL",2)
SetCutSceneLite(TRUE)
ForceSpell(FORCE_DISPEL_MAGIC,LastTalkedToBy(Myself))
ActionOverride(Player1,ApplySpell(Myself,UNDER_NORM))
ActionOverride(Player2,ApplySpell(Myself,UNDER_NORM))
ActionOverride(Player3,ApplySpell(Myself,UNDER_NORM))
ActionOverride(Player4,ApplySpell(Myself,UNDER_NORM))
ActionOverride(Player5,ApplySpell(Myself,UNDER_NORM))
ActionOverride(Player6,ApplySpell(Myself,UNDER_NORM))
Wait(1)
StartDialogNoSet(Player1)~ EXIT
END

IF WEIGHT #-1 ~Global("D0ShortcutPlot","GLOBAL",2)~ THEN BEGIN Ambush2
SAY ~WHAT?!  Surface creatures?!  Here!!  Hidden amongst us!!  YOU SHALL DIE HORRIBLY FOR THIS IGNOMNITY!!  GUARDS!!  KILL THEM ALL!!~
IF ~~ THEN DO ~SetGlobal("D0ShortcutPlot","GLOBAL",3)
SetGlobal("DrowCityHostile","GLOBAL",1)
Enemy()~ EXIT
END
END

AR2201
2076.349 - ardulace
1978.484 - priestess
2159.480 - mage
2018.614 - guard
2140.620 - guard

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

REPLACE UDDROW06
IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #52513 /* ~We drow gather to tell tales of our conquests on the surface.  Or dark stories of our past.  It is tradition in Ust Natha, this place that was the first.~ */
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52524 /* ~Can I ask you some questions?~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52524 /* ~Can I ask you some questions?~ */ GOTO New2
  IF ~~ THEN REPLY #52525 /* ~What do you mean 'the first'?~ */ GOTO 3
  IF ~~ THEN REPLY #52526 /* ~Do you have any tales to tell?~ */ GOTO 12
  IF ~~ THEN REPLY #52527 /* ~I'll be on my way.~ */ GOTO 17
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY #52539 /* ~Bhaerynden and Telantiwar both are gone now, but Ust Natha remains.  A reminder of the debt of blood we owe to our hated surface brethern. ~ */
  IF ~~ THEN REPLY #52541 /* ~So Ust Natha is close to the surface, then?~ */ GOTO 9
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52542 /* ~Can I ask you some questions, perhaps?~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52542 /* ~Can I ask you some questions, perhaps?~ */ GOTO New2
  IF ~~ THEN REPLY #52543 /* ~Do you have any other tales to tell?~ */ GOTO 12
  IF ~~ THEN REPLY #52544 /* ~I'll be on my way.~ */ GOTO 17
END

IF ~~ THEN BEGIN 11 // from: 10.0
  SAY #52548 /* ~If it were no longer guarding the passage, I have little doubt we would overcome the other wards and pay our hated kindred a long-overdue visit.  ~ */
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52549 /* ~Can I ask you some questions, perhaps?~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52549 /* ~Can I ask you some questions, perhaps?~ */ GOTO New2
  IF ~~ THEN REPLY #52550 /* ~Do you have any other tales to tell?~ */ GOTO 12
  IF ~~ THEN REPLY #52551 /* ~I'll be on my way.~ */ GOTO 17
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY #52555 /* ~It was considered a fine trophy for a Blooding.  My matron was pleased, and has sponsored my entry into the Male Fighter Society next year.~ */
  IF ~~ THEN REPLY #52556 /* ~Any other tales you could tell me?~ */ GOTO 16
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52557 /* ~Can I ask you some questions, perhaps?~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52557 /* ~Can I ask you some questions, perhaps?~ */ GOTO New2
  IF ~~ THEN REPLY #52558 /* ~You mentioned 'the first' earlier.  What did you mean by that?~ */ GOTO 3
  IF ~~ THEN REPLY #52559 /* ~I'll be going, then.~ */ GOTO 17
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN 18 // from:
  SAY #52563 /* ~Ah.  Is there something that I can help you with, <MALEFEMALE>?~ */
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52564 /* ~Could I ask you a question or two?~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52564 /* ~Could I ask you a question or two?~ */ GOTO New2
  IF ~~ THEN REPLY #52565 /* ~You mentioned 'the first' before... what did you mean by that?~ */ GOTO 3
  IF ~~ THEN REPLY #52566 /* ~Do you any tales of your own to tell?~ */ GOTO 12
  IF ~~ THEN REPLY #52567 /* ~No, I'll be going.~ */ GOTO 17
END
END

APPEND UDDROW06
IF ~~ THEN BEGIN New2
SAY ~If you wish an honest answer, <MALEFEMALE>, your best course would be to approach Nym Khalazza.  He is prone to talk, and can usually be found here.  I do not know where he has gone now.~
  IF ~~ THEN REPLY #52528 /* ~You mentioned 'the first'.  What did you mean by that?~ */ GOTO 3
  IF ~~ THEN REPLY #52532 /* ~Do you have any tales to tell, then?~ */ GOTO 12
  IF ~~ THEN REPLY ~Never mind, then.~ GOTO 17
END
END

REPLACE UDDROW07
IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #52580 /* ~I have a tale for you, if you're interested.  Something my house-mother once told me, in fact.  If you're of a mind, that is...~ */
  IF ~~ THEN REPLY #52585 /* ~Sure, I'd like to hear it.~ */ GOTO 4
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52586 /* ~I've actually some questions...~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52586 /* ~I've actually some questions...~ */ GOTO New2_2
  IF ~~ THEN REPLY #52587 /* ~Maybe some other time.~ */ GOTO 3
END

IF ~!Dead("uddrow09")
CombatCounter(0)~ THEN BEGIN 14 // from:
  SAY #52612 /* ~Hm.  You wander back to me?  Perhaps you have come to hear my tale, after all?~ */
  IF ~~ THEN REPLY #52613 /* ~Fine, let's hear it.~ */ GOTO 4
  IF ~Global("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52614 /* ~Actually, I wonder if I could ask you about something else?~ */ GOTO 2
  IF ~GlobalGT("D0ShortcutPlot","GLOBAL",0)~ THEN REPLY #52614 /* ~Actually, I wonder if I could ask you about something else?~ */ GOTO New2_2
  IF ~~ THEN REPLY #52615 /* ~No, not really.~ */ GOTO 3
END
END

APPEND UDDROW07
IF ~~ THEN BEGIN New2_2
SAY ~I'm not in the mood to be barraged by questions by a newcomer to the city.  You are lucky you aren't in the slave pens, if you ask me.  Go search for Nym, if you must anyone.~
  IF ~~ THEN REPLY #52591 /* ~Fine, tell me your story then.~ */ GOTO 4
  IF ~~ THEN REPLY ~Never mind, then.~ GOTO 3
END
END
