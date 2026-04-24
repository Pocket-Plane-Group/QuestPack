REPLACE PIRMUR01
IF ~~ THEN BEGIN 1 // from:
  SAY #54620 /* ~Silence! The punishment is severe and immediate. An example shall be made of you as was made of your... 'husband' Sanik.  I should think that...~ */
  IF ~Dead("ppsanik")~ THEN EXTERN ~PIRMUR07~ 0
  IF ~!Dead("ppsanik")~ THEN REPLY @0 GOTO GalvNew
  IF ~!Dead("ppsanik")~ THEN REPLY @1 GOTO GalvNew
END
END

APPEND PIRMUR01
IF ~~ THEN BEGIN GalvNew
SAY @2
COPY_TRANS PIRMUR01 2
END
END

REPLACE PIRMUR02
IF ~~ THEN BEGIN 2 // from:
  SAY #53492 /* ~Hah! A romantic? Perhaps your death will serve some bard well. ~ */
  IF ~~ THEN DO ~DisplayStringHead(Myself,46150) // quaffs a potion
GiveItemCreate("potn14",Myself,1,0,0)
UseItem("potn14",Myself)
ActionOverride("ppsanik",FaceObject("pirmur02"))
ActionOverride("ppsanik",SetGlobalTimer("Cast","LOCALS",6))
ActionOverride("ppsanik",Spell("pirmur02",WIZARD_MAGIC_MISSILE))~ EXIT
END

IF ~Dead("ppsanik")~ THEN BEGIN 3 // from:
  SAY #56588 /* ~As for you, being friends of Galvena's enemy makes you her enemy too. Die fools!~ */
  IF ~~ THEN DO ~SetGlobal("AssasinAttacks","GLOBAL",1)
SetGlobal("SpawnAssasin","ar1602",2)
Enemy()~ UNSOLVED_JOURNAL #10933 /* ~Getting Inside the Asylum

I spoke to Sanik, a merchant who used to supply the asylum with components and provisions.  He mentioned that he would not be doing that anymore, as he was leaving town quickly.  Before he could tell me of a way inside, a man claiming to be sent by one Lady Galvena killed him.~ */ EXIT
END
END

REPLACE PPSIME
IF ~GlobalGT("AsylumPlot","GLOBAL",5)~ THEN BEGIN 11 // from:
  SAY #43948 /* ~How goes your search, <CHARNAME>? Have you found means to enter the building yet?~ */
  IF ~~ THEN REPLY #43949 /* ~The search has not gone well. I do not know how to get inside. ~ */ GOTO 12
  IF ~GlobalGT("D0Sanik","GLOBAL",0)
Global("PoorThief","GLOBAL",0)~ THEN REPLY @3 DO ~SetGlobal("PoorThief","GLOBAL",1)~ GOTO 14
  IF ~Global("SavedClaire","GLOBAL",2)~ THEN REPLY #43951 /* ~I believe so.  A man named Golin gave me a couple of options.~ */ GOTO 17
  IF ~PartyHasItem("misc8v")~ THEN REPLY #43952 /* ~I have a ward token that will unlock the gates. ~ */ GOTO 18
  IF ~GlobalGT("D0Sanik","GLOBAL",0)
Global("PoorThief","GLOBAL",1)~ THEN REPLY @3 GOTO 15
  IF ~Dead("ppsanik")
!Global("SavedClaire","GLOBAL",2)~ THEN REPLY #55361 /* ~Sanik was killed before he could tell me how to get inside!~ */ GOTO 19
  IF ~Global("D0Sanik","GLOBAL",2)
!Global("SavedClaire","GLOBAL",2)~ THEN REPLY @4 GOTO 19
END
END

REPLACE PPSANIK
IF ~~ THEN BEGIN 9 // from: 8.0
  SAY #53581 /* ~Perhaps so, if the need is true. There is little to worry about for I must vacate the town very soon.~ */
  IF ~~ THEN REPLY #53583 /* ~From what do you flee?~ */ DO ~SetGlobal("KnowIntent","LOCALS",1)~ GOTO 6
END
END

APPEND PPSANIK
IF WEIGHT #-1 ~Dead("pirmur02")
GlobalLT("D0Sanik","GLOBAL",2)~ THEN BEGIN SA_1
SAY @5
= @6
IF ~!Dead("ppinn01")~ THEN DO ~SetGlobal("SanikPlot","GLOBAL",1)~ EXTERN PPINN01 Outrage
IF ~Dead("ppinn01")
Global("KnowIntent","LOCALS",1)~ THEN DO ~SetGlobal("SanikPlot","GLOBAL",1)~ GOTO SA_2
IF ~Dead("ppinn01")
!Global("KnowIntent","LOCALS",1)~ THEN DO ~SetGlobal("SanikPlot","GLOBAL",1)~ GOTO SA_2a
END

IF ~~ THEN BEGIN SA_2
SAY @7
IF ~~ THEN REPLY @8 GOTO SA_3
IF ~~ THEN REPLY @9 GOTO SA_4
END

IF ~~ THEN BEGIN SA_2a
SAY @10
IF ~~ THEN REPLY @11 GOTO SA_5
END

IF ~~ THEN BEGIN SA_3
SAY @12
= @13
= @14
IF ~~ THEN REPLY @15 DO ~SetGlobal("D0SanikProposition","GLOBAL",1)~ GOTO SA_6
IF ~~ THEN REPLY @9 DO ~SetGlobal("D0SanikProposition","GLOBAL",1)~ GOTO SA_4
END

IF ~~ THEN BEGIN SA_4
SAY @16
IF ~~ THEN DO ~AddJournalEntry(@41,QUEST)
SetGlobal("D0Sanik","GLOBAL",2)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN SA_5
SAY @17
IF ~~ THEN GOTO SA_3
END

IF ~~ THEN BEGIN SA_6
SAY @18
IF ~~ THEN DO ~AddJournalEntry(@42,QUEST)
SetGlobal("D0Sanik","GLOBAL",3)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Sanik","GLOBAL",3)
Global("SavedClaire","GLOBAL",0)~ THEN BEGIN SA_7
SAY @19
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0Sanik","GLOBAL",3)
GlobalGT("SavedClaire","GLOBAL",0)~ THEN BEGIN CLAIRE2
SAY @20
= @21
IF ~~ THEN EXTERN PIRMUR09 CLAIRE3
END

IF ~~ THEN BEGIN CLAIRE4
SAY @22
IF ~~ THEN EXTERN PIRMUR10 CLAIRE5
END
END

APPEND PIRMUR09
IF WEIGHT #-1 ~AreaCheck("ar1602")
Global("D0Sanik","GLOBAL",3)
GlobalGT("SavedClaire","GLOBAL",0)~ THEN BEGIN CLAIRE3
SAY @23
= @24
IF ~~ THEN REPLY #54095 /* ~Tell me about the Cowled Wizards.~ */ GOTO SA_2_3
IF ~~ THEN REPLY #54096 /* ~How do the magical 'deviants' get admitted?~ */ GOTO SA_2_6
END

IF ~~ THEN BEGIN SA_2_3 // from: 10.0 2.0
  SAY #54097 /* ~There's really only one representative of the Cowled Wizards here, and he's long since given up their rigid discipline. This place doesn't suit it.~ */
= #54098 /* ~His name is Perth the Adept, and he is seemingly free to come and go from Spellhold all he wants. Uses a ward stone to pass the gates, I think.~ */
= #54099 /* ~You might... ah... 'convince' him to give it up. He might take a bribe, but likely your meeting with him will have to be violent. ~ */
  IF ~~ THEN REPLY #54100 /* ~How about those judged to be 'deviant?' How are they admitted?~ */ DO ~AddJournalEntry(11884,QUEST)~ GOTO SA_2_6
  IF ~~ THEN REPLY #54101 /* ~Thank you for your help. That's all I needed to know.~ */ DO ~AddJournalEntry(11884,QUEST)~ GOTO SA_2_11
END

IF ~~ THEN BEGIN SA_2_6 // from: 5.0 2.1
  SAY #54102 /* ~Well, on the mainland you would have to cause one heck of a magical disturbance, and if you survive the Cowled Wizard reprisal you might get sent there.~ */
= #54103 /* ~Here on the isle itself we don't work like that. Don't care about magic. Desharik uses Spellhold for other reasons. Dumps his enemies there, sometimes friends too.~ */
= #54104 /* ~Other than troublemakers, the asylum also holds mages and others with actual mental instabilities. They can prove quite dangerous, and are better locked away.~ */
= #54105 /* ~A little too much saltwater can taint the mind, and it's not uncommon for someone to lose their grip. Desharik is the one that can order them confined. ~ */
= #54106 /* ~Prove to be unstable and Desharik might send you there. The trip would not be gentle though. His chambers are a good ways west of here, a large building tucked against the hills.  Tell the doorman I sent you.~ */
  IF ~~ THEN REPLY #54107 /* ~And what about the Cowled Wizards on the isle? How do they get in?~ */ DO ~AddJournalEntry(15760,QUEST)~ GOTO SA_2_3
  IF ~~ THEN REPLY #54108 /* ~Thanks, that's all I needed to know.~ */ DO ~AddJournalEntry(15760,QUEST)~ GOTO SA_2_11
END

IF ~~ THEN BEGIN SA_2_11 // from: 10.1 5.1
  SAY @25
= @26
  IF ~~ THEN EXTERN PPSANIK CLAIRE4
END
END

APPEND PIRMUR10
IF WEIGHT #-1 ~AreaCheck("ar1602")
Global("D0Sanik","GLOBAL",3)
GlobalGT("SavedClaire","GLOBAL",0)~ THEN BEGIN CLAIRE1
SAY @27
IF ~~ THEN EXTERN PPSANIK CLAIRE2
END

IF ~~ THEN BEGIN CLAIRE5
SAY #54667 /* ~Good travels!~ */
IF ~~ THEN DO ~EraseJournalEntry(@43)
EraseJournalEntry(@42)
EraseJournalEntry(@41)
EraseJournalEntry(5059)
EraseJournalEntry(6934)
EraseJournalEntry(7235)
EraseJournalEntry(10106)
EraseJournalEntry(10107)
EraseJournalEntry(10670)
EraseJournalEntry(10671)
EraseJournalEntry(10933)
EraseJournalEntry(11689)
EraseJournalEntry(11755)
EraseJournalEntry(11904)
EraseJournalEntry(15698)
EraseJournalEntry(15703)
EraseJournalEntry(15801)
EraseJournalEntry(16558)
EraseJournalEntry(20367)
EraseJournalEntry(23504)
EraseJournalEntry(23530)
AddJournalEntry(@44,QUEST_DONE)
ReputationInc(1)
IncrementGlobal("D0Change","GLOBAL",1)
SetGlobal("D0Sanik","GLOBAL",5)
ActionOverride("ppsanik",EscapeArea())
ActionOverride("pirmur09",EscapeArea())
EscapeArea()~ EXIT
END
END

APPEND PPINN01
IF ~~ THEN BEGIN Outrage
SAY @28
IF ~Global("KnowIntent","LOCALS",1)~ DO ~SetGlobal("D0InnSanik","GLOBAL",1)~ EXTERN PPSANIK SA_2
IF ~!Global("KnowIntent","LOCALS",1)~ DO ~SetGlobal("D0InnSanik","GLOBAL",1)~ EXTERN PPSANIK SA_2a
END

IF ~~ THEN BEGIN INN_6 // from: 5.0
  SAY #53597 /* ~Huh? What do you care? You've only just met him. ~ */
  IF ~~ THEN REPLY @29 GOTO INN_7
  IF ~!Global("D0Sanik","GLOBAL",3)~ THEN REPLY @30 GOTO INN_7
  IF ~Global("D0Sanik","GLOBAL",3)~ THEN REPLY @31 GOTO INN_7
END

IF ~~ THEN BEGIN INN_7 // from: 6.1 6.0
  SAY #53600 /* ~Aye, if only to teach the woman to keep her affairs out of my tavern, I will tell you what I know.~ */
  IF ~~ THEN GOTO INN_8
END

IF ~~ THEN BEGIN INN_8 // from: 7.0
  SAY #53603 /* ~The assassin was sent by Lady Galvena, the mistress of the local Courtesan's Guild. You can see how, in a port full of sailors, such an undertaking would bring the woman power and wealth.~ */
  IF ~Global("D0SanikProposition","GLOBAL",1)~ THEN REPLY @32 GOTO 14
  IF ~Global("D0SanikProposition","GLOBAL",0)~ THEN REPLY @33 DO ~AddJournalEntry(@43,QUEST)~ GOTO 11
  IF ~Global("D0SanikProposition","GLOBAL",0)~ THEN REPLY #53610 /* ~You have told all that I wish to know.~ */ DO ~AddJournalEntry(@43,QUEST)~ GOTO 9
END
END

EXTEND_BOTTOM PPINN01 0 3
IF ~OR(2)
Global("D0Sanik","GLOBAL",2)
Global("D0Sanik","GLOBAL",3)
Global("D0InnSanik","GLOBAL",1)
Global("SavedClaire","GLOBAL",0)~ THEN REPLY @34 GOTO INN_6
END

REPLACE PIRMUR01
IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #54626 /* ~The girl is soon to be dead and, regardless, is my property. You have no claim on her.~ */
  IF ~~ THEN REPLY @35 GOTO 4
  IF ~!Global("D0Sanik","GLOBAL",3)~ THEN REPLY #54627 /* ~I need some information from her. Take her back when I have learned if she knows anything of use.~ */ GOTO 4
  IF ~~ THEN REPLY #54631 /* ~People are not property. Free her or face my wrath!~ */ GOTO 4
END
END

REPLACE_ACTION_TEXT_PROCESS PPCOWLED ~EraseJournalEntry(11884)~ ~EraseJournalEntry(@43)
EraseJournalEntry(@42)
EraseJournalEntry(@41)
EraseJournalEntry(11884)~

REPLACE_ACTION_TEXT_PROCESS PPDESH ~EraseJournalEntry(11884)~ ~EraseJournalEntry(@43)
EraseJournalEntry(@42)
EraseJournalEntry(@41)
EraseJournalEntry(11884)~

REPLACE_ACTION_TEXT_PROCESS PPIRENI1 ~EraseJournalEntry(11884)~ ~EraseJournalEntry(@43)
EraseJournalEntry(@42)
EraseJournalEntry(@41)
EraseJournalEntry(11884)~

APPEND PIRMUR10
IF WEIGHT #-1 ~Dead("pirmur01")
Dead("pirmur07")
Global("SavedClaire","GLOBAL",0)
!Dead("ppsanik")~ THEN BEGIN CL_1
  SAY #54634 /* ~Oh, thank you! She was going to kill me! Did Sanik send you? I must go and find him!~ */
  IF ~Global("D0Sanik","GLOBAL",3)~ THEN REPLY @36 GOTO CL_2
  IF ~Global("D0Sanik","GLOBAL",2)~ THEN REPLY @37 GOTO CL_3
  IF ~~ THEN REPLY @38 GOTO CL_3
END

IF ~~ THEN BEGIN CL_2
SAY @39
IF ~~ THEN DO ~AddexperienceParty(10000)
SetGlobal("SavedClaire","GLOBAL",2)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN CL_3
SAY @40
IF ~~ THEN DO ~AddexperienceParty(10000)
SetGlobal("SavedClaire","GLOBAL",2)
EscapeArea()~ EXIT
END
END
