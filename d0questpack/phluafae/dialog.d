BEGIN ~SUDRYAD~


IF ~GlobalTimerExpired("SUPissedDryad", "GLOBAL")
PartyHasItem("misc4n")~ THEN SURevengeBaby1
SAY @0
=
@1
IF ~~ THEN DO ~SetGlobal("SUDryadHostile","GLOBAL",1)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
Enemy()
EndCutSceneMode()~ EXIT

END

IF ~GlobalTimerExpired("SUPissedDryad", "GLOBAL")
!PartyHasItem("misc4n")~ THEN SURevengeBaby2
SAY @2
=
@1
IF ~~ THEN DO ~SetGlobal("SUDryadHostile","GLOBAL",1)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
Enemy()
EndCutSceneMode()~ EXIT

END

IF ~NumTimesTalkedTo(0)
Global("SUAcornPlot","GLOBAL",0)~ THEN SUDryad
SAY @3
++ @4 GOTO SURush
++ @5 GOTO SUClever
+ ~Global("PCKeepOwner","GLOBAL",1)~ + @6 GOTO SUMyland
+ ~AreaCheck("ar1300")~ + @7 GOTO SUReally
END

IF ~Global("SUAcornPlot","GLOBAL",1)
Global("SUVaelasaWormFood","GLOBAL",0)
!Dead("Vaelasa")~ THEN SUDryad1
SAY @8
=
@9
=
@10
IF ~~ THEN DO ~DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~Global("SUAcornPlot","GLOBAL",1)
OR(2)
Global("SUVaelasaWormFood","GLOBAL",1)
Dead("Vaelasa")~ THEN SUDryad2
SAY @8
=
@11
=
@12
=
@13
IF ~~ THEN DO ~SetGlobal("SUAcornPlot","GLOBAL",2)
GiveGoldForce(800)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
AddJournalEntry(@140,QUEST_DONE)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SURush
SAY @14
++ @15 GOTO SUMeaning
++ @16 GOTO SUSteamy
++ @17 GOTO SUMoi
++ @18 GOTO SUStubborn
END

IF ~~ THEN SUClever
SAY @19
++ @20 GOTO SUAskAcorns
++ @21 GOTO SUWhatever
++ @22 GOTO SUMaybeNot
++ @23 GOTO SUMyShampoo
END

IF ~~ THEN SUMyland
SAY @24
++ @25 GOTO SUMoreWays
++ @26 GOTO SUDiffer
++ @27 GOTO SUWhyYes
END

IF ~~ THEN SUReally
SAY @28
++ @25 GOTO SUMoreWays
++ @29 GOTO SUTough
++ @30 GOTO SUDiffer
++ @31 GOTO SUWhyYes
END

IF ~~ THEN SUMeaning
SAY @32
++ @33 GOTO SUMoi
++ @34 GOTO SUYouMisunderstand
++ @35 GOTO SUSteamy
++ @15 GOTO SUMeaning2
END

IF ~~ THEN SUSteamy
SAY @36
++ @37 GOTO SUAskAcorns
++ @38 GOTO SUAskAcorns
++ @39 GOTO SUAskAcorns
++ @40 GOTO SUAskAcorns
END

IF ~~ THEN SUMoi
SAY @41
++ @37 GOTO SUAskAcorns
++ @42 GOTO SUAskAcorns
++ @39 GOTO SUAskAcorns
++ @43 GOTO SUAskAcorns
END

IF ~~ THEN SUStubborn
SAY @44
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUAskAcorns
SAY @45
=
@46
IF ~~ THEN GOTO SUAskAcornsKelseyTalk
END

IF ~~ THEN SUAskAcornsKelseyTalk
SAY @47
++ @48 GOTO SUArgue1
++ @49 GOTO SUArgue1
++ @50 GOTO SUPunchline
++ @51 GOTO SUMoney
++ @52 GOTO SUArgue2
++ @53 GOTO SUPunchline2
++ @54 GOTO SUCurses2
END

IF ~~ THEN SUWhatever
SAY @55
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUMaybeNot
SAY @56
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUMyShampoo
SAY @57
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUMoreWays
SAY @58
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUTough
SAY @59
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUDiffer
SAY @60
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUWhyYes
SAY @61
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUYouMisunderstand
SAY @62
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUMeaning2
SAY @63
IF ~~ THEN GOTO SUAskAcorns
END

IF ~~ THEN SUArgue1
SAY @64
++ @65 GOTO SUPunchline
++ @66 GOTO SUMoney
++ @67 GOTO SUArgue2
++ @54 GOTO SUCurses2
END

IF ~~ THEN SUPunchline
SAY @68
IF ~~ THEN GOTO SUPunchline1a
END

IF ~~ THEN SUPunchline1a
SAY @69
IF ~~ THEN DO ~TakePartyItem("MISC4N")
AddexperienceParty(7500)
IncrementGlobal("D0Change","GLOBAL",-1)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
AddJournalEntry(@141,QUEST_DONE)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUMoney
SAY @70
++ @71 GOTO SUPunchline3
++ @72 GOTO SUArgue2
++ @73 GOTO SUCurses2
END

IF ~~ THEN SUPunchline2
SAY @74
IF ~~ THEN GOTO SUPunchline2a
END

IF ~~ THEN SUPunchline2a
SAY @75
IF ~~ THEN DO ~TakePartyItem("MISC4N")
AddexperienceParty(7500)
IncrementGlobal("D0Change","GLOBAL",-1)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
AddJournalEntry(@142,QUEST_DONE)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUPunchline3
SAY @76
=
@77
IF ~~ THEN GOTO SUPunchline3a
END

IF ~~ THEN SUPunchline3a
SAY @78
IF ~~ THEN DO ~GiveGoldForce(700)
TakePartyItem("MISC4N")
AddexperienceParty(7500)
IncrementGlobal("D0Change","GLOBAL",-1)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
AddJournalEntry(@141,QUEST_DONE)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUArgue2
SAY @79
=
@80
++ @81 GOTO SUPunchline
++ @82 GOTO SUMoney
++ @83 GOTO SUCurses
++ @54 GOTO SUCurses2
END

IF ~~ THEN SUCurses
SAY @84
++ @85 GOTO SUOhdear
++ @86 GOTO SUJuicy
++ @87 GOTO SUPunchline4
END

IF ~~ THEN SUOhdear
SAY @88
IF ~~ THEN DO ~DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUPunchline4
SAY @76
=
@89
IF ~~ THEN GOTO SUPunchline4a
END

IF ~~ THEN SUPunchline4a
SAY @69
IF ~~ THEN DO ~GiveGoldForce(700)
TakePartyItem("MISC4N")
AddexperienceParty(7500)
IncrementGlobal("D0Change","GLOBAL",-1)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
AddJournalEntry(@141,QUEST_DONE)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUJuicy
SAY @90
=
@91
=
@92
++ @93 GOTO SUFaker
++ @94 GOTO SUMoney2
++ @95 GOTO SUCurses
++ @96 GOTO SUCurses2
END

IF ~~ THEN SUCurses2
SAY @97
=
@98
=
@99
IF ~~ THEN DO ~SetGlobalTimer("SUPissedDryad","GLOBAL",ONE_DAY)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUMoney2
SAY @100
=
@101
=
@69
IF ~~ THEN DO ~GiveGoldForce(700)
TakePartyItem("MISC4N")
AddexperienceParty(7500)
IncrementGlobal("D0Change","GLOBAL",-1)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
EraseJournalEntry(@137)
EraseJournalEntry(@138)
EraseJournalEntry(@139)
AddJournalEntry(@141,QUEST_DONE)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUFaker
SAY @102
=
@103
=
@104
++ @105 GOTO SUAgreed
++ @106 GOTO SUAgreed2
++ @107 GOTO SUMoney2
++ @95 GOTO SUCurses
++ @108 GOTO SUCurses2
END

IF ~~ THEN SUAgreed
SAY @109
IF ~~ THEN DO ~SetGlobal("SUAcornPlot","GLOBAL",1)
TakePartyItem("MISC4N")
GiveItemCreate("SUFAKE",[PC],1,0,0)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
AddJournalEntry(@137,QUEST)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN SUAgreed2
SAY @110
=
@111
IF ~~ THEN DO ~SetGlobal("SUAcornPlot","GLOBAL",1)
GiveGoldForce(300)
TakePartyItem("MISC4N")
GiveItemCreate("SUFAKE",[PC],1,0,0)
EraseJournalEntry(34092)
EraseJournalEntry(34093)
AddJournalEntry(@137,QUEST)
DialogInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

APPEND ~VAELASA~

IF WEIGHT #-1 ~PartyHasItem("sufake")
!Dead("Ulene")
!Dead("Cania")
!Dead("Elyme")~ THEN BEGIN SUTrickyTalk
  SAY @112
  ++ @113  GOTO SUWashout1
  IF ~CheckStatGT(Player1,15,CHR)~ THEN REPLY @114 GOTO SUBuysit
  IF ~CheckStatLT(Player1,16,CHR)
CheckStatGT([PC],12,CHR)~ THEN REPLY @115 GOTO SUQuestions
  IF ~CheckStatLT(Player1,13,CHR)~ THEN REPLY @116 GOTO SUVPissed
END

IF ~~ THEN BEGIN SUWashout1
SAY @117
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SUBuysit
  SAY @118
  IF ~~ THEN DO ~AddexperienceParty(15000)
AddJournalEntry(@138,QUEST)
IncrementGlobal("D0Change","GLOBAL",-3)
ReputationInc(-2)
TakePartyItem("sufake")
SetGlobal("SummonDryads","AR1200",4)
StartCutSceneMode()
StartCutScene("sufakea")~ EXIT
END

IF ~~ THEN BEGIN SUBuysIt2
  SAY @119
  IF ~~ THEN GOTO SUBuysit
END

IF ~~ THEN BEGIN SUQuestions
SAY @120
=
@121
=
@122
=
@123
IF ~CheckStatLT(Player1,13,INT)~ THEN REPLY @124 GOTO SUVPissed
IF ~CheckStatGT(Player1,12,INT)~ THEN REPLY @125 GOTO SUBuysIt2
++ @126 GOTO SUVPissed2
END

IF ~~ THEN BEGIN SUVPissed
  SAY @127
  =
  @128
=
@129
IF ~~ THEN DO ~SetGlobal("VaelasaHostile","GLOBAL",1)
AddJournalEntry(@139,QUEST)
Enemy()~ EXIT
END

IF ~~ THEN BEGIN SUVPissed2
  SAY @130
  =
  @131
=
@132
IF ~~ THEN DO ~SetGlobal("VaelasaHostile","GLOBAL",1)
AddJournalEntry(@139,QUEST)
Enemy()~ EXIT
END

END

I_C_T2 SUDRYAD SUPunchline3a SUDryadInterjects
== VALYGARJ IF ~InParty("Valygar")
Detect("Valygar")
!StateCheck("Valygar",1064941)
!StateCheck("Valygar",STATE_CONFUSED)~ THEN @133
== EDWINJ IF ~InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @134
END

I_C_T2 SUDRYAD SUPunchline2a SUDryadInterjects2
== VALYGARJ IF ~InParty("Valygar")
Detect("Valygar")
!StateCheck("Valygar",1064941)
!StateCheck("Valygar",STATE_CONFUSED)~ THEN @135
== EDWINJ IF ~InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @136
END

I_C_T2 SUDRYAD SUPunchline1a SUDryadInterjects3
== VALYGARJ IF ~InParty("Valygar")
Detect("Valygar")
!StateCheck("Valygar",1064941)
!StateCheck("Valygar",STATE_CONFUSED)~ THEN @133
== EDWINJ IF ~InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @134
END

I_C_T2 SUDRYAD SUPunchline4a SUDryadInterjects4
== VALYGARJ IF ~InParty("Valygar")
Detect("Valygar")
!StateCheck("Valygar",1064941)
!StateCheck("Valygar",STATE_CONFUSED)~ THEN @133
== EDWINJ IF ~InParty("Edwin")
Detect("Edwin")
!StateCheck("Edwin",1064941)
!StateCheck("Edwin",STATE_CONFUSED)~ THEN @134
END
