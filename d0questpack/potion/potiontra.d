BEGIN D0QPPOTN


IF ~Global("PotionJob","GLOBAL",0)~ THEN BEGIN PQ_0
        SAY @0
        IF ~~ THEN GOTO PQ_0a
        IF ~OR(5)
InParty(Player2)
InParty(Player3)
InParty(Player4)
InParty(Player5)
InParty(Player6)~ THEN GOTO PQ_0b
        IF ~InParty(Player2)
OR(4)
InParty(Player3)
InParty(Player4)
InParty(Player5)
InParty(Player6)~ THEN GOTO PQ_0c
        IF ~InParty(Player3)
OR(4)
InParty(Player2)
InParty(Player4)
InParty(Player5)
InParty(Player6)~ THEN GOTO PQ_0c
        IF ~InParty(Player4)
OR(4)
InParty(Player2)
InParty(Player3)
InParty(Player5)
InParty(Player6)~ THEN GOTO PQ_0c
        IF ~InParty(Player5)
OR(4)
InParty(Player2)
InParty(Player2)
InParty(Player4)
InParty(Player6)~ THEN GOTO PQ_0c
        IF ~InParty(Player6)
OR(4)
InParty(Player2)
InParty(Player3)
InParty(Player4)
InParty(Player5)~ THEN GOTO PQ_0c
END


IF ~~ THEN BEGIN PQ_0a
        SAY @1
        IF ~~ THEN REPLY @2 GOTO PQ_1
        IF ~~ THEN REPLY @3 GOTO PQ_2
        IF ~~ THEN REPLY @4 GOTO PQ_3
        IF ~~ THEN REPLY @5 GOTO PQ_4
        IF ~~ THEN REPLY @6 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_5
        IF ~~ THEN REPLY @7 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_6
		IF ~NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @8 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
		IF ~!NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @10 GOTO PQ_7
END

IF ~~ THEN BEGIN PQ_Troll
SAY @11
		IF ~~ THEN REPLY @12 GOTO PQ_Troll2
        IF ~~ THEN REPLY @13 GOTO PQ_1
        IF ~~ THEN REPLY @14 GOTO PQ_2
        IF ~~ THEN REPLY @15 GOTO PQ_3
        IF ~~ THEN REPLY @16 GOTO PQ_7
END

IF ~~ THEN BEGIN PQ_Troll2
SAY @17
        IF ~~ THEN REPLY @13 GOTO PQ_1
        IF ~~ THEN REPLY @14 GOTO PQ_2
        IF ~~ THEN REPLY @18 GOTO PQ_3
        IF ~~ THEN REPLY @19 GOTO PQ_7
END

IF ~~ THEN BEGIN PQ_0b
        SAY @20
        COPY_TRANS SAFE D0QPPOTN PQ_0a
END


IF ~~ THEN BEGIN PQ_0c
        SAY @21
        COPY_TRANS SAFE D0QPPOTN PQ_0a
END


IF ~~ THEN BEGIN PQ_1 // From 0.0
        SAY @22
        IF ~~ THEN REPLY @23 GOTO PQ_2
        IF ~~ THEN REPLY @15 GOTO PQ_3
        IF ~~ THEN REPLY @5 GOTO PQ_4
        IF ~~ THEN REPLY @6 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_5
        IF ~~ THEN REPLY @7 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_6
		IF ~NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @8 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
		IF ~!NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @24 GOTO PQ_7
END


IF ~~ THEN BEGIN PQ_2 // From 0.1, 1.0
        SAY @25
= @26
= @27
        IF ~~ THEN REPLY @2 GOTO PQ_1
        IF ~~ THEN REPLY @28 GOTO PQ_3
        IF ~~ THEN REPLY @5 GOTO PQ_4
        IF ~~ THEN REPLY @6 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_5
        IF ~~ THEN REPLY @7 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_6
		IF ~NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @8 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
		IF ~!NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @29 GOTO PQ_7
END


IF ~~ THEN BEGIN PQ_3
        SAY @30
        IF ~~ THEN REPLY @13 GOTO PQ_1
        IF ~~ THEN REPLY @14 GOTO PQ_2
        IF ~~ THEN REPLY @31 GOTO PQ_4
        IF ~~ THEN REPLY @6 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_5
        IF ~~ THEN REPLY @7 DO ~SetGlobal("PotionRoger","GLOBAL",1)~GOTO PQ_6
		IF ~NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @8 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
		IF ~!NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @24 GOTO PQ_7
END


IF ~~ THEN BEGIN PQ_4 // From 0.3, 1.2, 2.2, 3.2
        SAY @32
= @33
        IF ~~ THEN REPLY @34 GOTO PQ_8
        IF ~~ THEN REPLY @35 GOTO PQ_9
        IF ~~ THEN REPLY @36 GOTO PQ_10
		IF ~~ THEN REPLY @37 GOTO PQ_4a
END

IF ~~ THEN BEGIN PQ_4a
		SAY @38
        IF ~~ THEN DO ~SetGlobal("PotionJob","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN PQ_5
        SAY @39
        IF ~~ THEN REPLY @40 GOTO PQ_8
        IF ~~ THEN REPLY @13 GOTO PQ_1
        IF ~~ THEN REPLY @14 GOTO PQ_2
        IF ~~ THEN REPLY @5 GOTO PQ_4
		IF ~NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @8 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
		IF ~!NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @24 GOTO PQ_7
END


IF ~~ THEN BEGIN PQ_6
        SAY @41
= @42
        IF ~~ THEN REPLY @43 GOTO PQ_1
        IF ~~ THEN REPLY @14 GOTO PQ_2
        IF ~~ THEN REPLY @15 GOTO PQ_3
        IF ~~ THEN REPLY @44 GOTO PQ_4
        IF ~~ THEN REPLY @5 GOTO PQ_4
		IF ~NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @8 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
		IF ~!NumTimesTalkedTo(0)
Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @24 GOTO PQ_7
END


IF ~~ THEN BEGIN PQ_7
        SAY @45
= @46
        IF ~~ THEN REPLY @34 GOTO PQ_8
        IF ~~ THEN REPLY @35 GOTO PQ_9
        IF ~~ THEN REPLY @36 GOTO PQ_10
		IF ~~ THEN REPLY @37 GOTO PQ_4a
END


IF ~~ THEN BEGIN PQ_8
        SAY @47
= @48
        IF ~~ THEN REPLY @49 GOTO PQ_11
        IF ~~ THEN REPLY @50 DO ~SetGlobal("PotionJob","GLOBAL",1)~ GOTO PQ_12
END


IF ~~ THEN BEGIN PQ_9
        SAY @51
= @52
= @53
        IF ~~ THEN REPLY @54 GOTO PQ_8
        IF ~~ THEN REPLY @55 GOTO PQ_13
        IF ~~ THEN REPLY @56 GOTO PQ_8
        IF ~~ THEN REPLY @57 GOTO PQ_10
		IF ~~ THEN REPLY @58 GOTO PQ_4a
END


IF ~~ THEN BEGIN PQ_10
        SAY @59
        IF ~~ THEN DO ~SetGlobal("PotionJob","GLOBAL",1)~ EXIT
END


IF ~~ THEN BEGIN PQ_11
        SAY @60
        IF ~~ THEN DO ~SetGlobal("PotionNumber","LOCALS",1) SetGlobal("PotionJob","GLOBAL",2) GiveItemCreate("D0QPPOT1",LastTalkedToBy,0,0,0) AddJournalEntry(@260,QUEST)~ EXIT
END


IF ~~ THEN BEGIN PQ_12
        SAY @61
= @62
        IF ~~ THEN DO ~SetGlobal("PotionJob","GLOBAL",1)~ EXIT
END


IF ~~ THEN BEGIN PQ_13
        SAY @63
        IF ~~ THEN REPLY @64 GOTO PQ_14
        IF ~~ THEN REPLY @65 GOTO PQ_8
        IF ~~ THEN REPLY @66 DO ~SetGlobal("PotionJob","GLOBAL",1)~ GOTO PQ_12
		IF ~~ THEN REPLY @58 GOTO PQ_4a
END


IF ~~ THEN BEGIN PQ_14
        SAY @67
        IF ~~ THEN DO ~EraseJournalEntry(@256)
EraseJournalEntry(@257)
EscapeArea()~ EXIT
END


IF ~Global("PotionJob","GLOBAL",1)~ THEN BEGIN PQ_15
        SAY @68
        IF ~~ THEN REPLY @69 GOTO PQ_11
        IF ~~ THEN REPLY @13 GOTO PQ_1
        IF ~~ THEN REPLY @14 GOTO PQ_2
        IF ~~ THEN REPLY @70 GOTO PQ_3
        IF ~~ THEN REPLY @31 GOTO PQ_4
        IF ~~ THEN REPLY @6 DO ~SetGlobal("PotionRoger","GLOBAL",1)~ GOTO PQ_5
        IF ~~ THEN REPLY @7 DO ~SetGlobal("PotionRoger","GLOBAL",1)~GOTO PQ_6
		IF ~Global("Troll","LOCALS",0)
OR(2)
Dead("rogtro02")
Dead("SeaTroll")~ THEN REPLY @9 DO ~SetGlobal("Troll","LOCALS",1)~ GOTO PQ_Troll
        IF ~~ THEN REPLY @71 GOTO PQ_7
END


IF ~Global("PotionJob","GLOBAL",2)
NumInParty(1)~ THEN BEGIN PQ_16
        SAY @72
        IF ~PartyHasItem("POTN10") Global("InvisPotion","LOCALS",0)~ THEN REPLY @73 DO ~TakePartyItemNum("POTN10",1) SetGlobal("InvisPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN14") Global("SpeedPotion","LOCALS",0)~ THEN REPLY @74 DO ~TakePartyItemNum("POTN14",1) SetGlobal("SpeedPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN22") Global("ColdPotion","LOCALS",0)~ THEN REPLY @75 DO ~TakePartyItemNum("POTN22",1) SetGlobal("ColdPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN26") Global("ExploPotion","LOCALS",0)~ THEN REPLY @76 DO ~TakePartyItemNum("POTN26",1) SetGlobal("ExploPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN31") Global("InsuPotion","LOCALS",0)~ THEN REPLY @77 DO ~TakePartyItemNum("POTN31",1) SetGlobal("InsuPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN28") Global("FortPotion","LOCALS",0)~ THEN REPLY @78 DO ~TakePartyItemNum("POTN28",1) SetGlobal("FortPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN33") Global("BlockPotion","LOCALS",0)~ THEN REPLY @79 DO ~TakePartyItemNum("POTN33",1) SetGlobal("BlockPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN38") Global("MirrorPotion","LOCALS",0)~ THEN REPLY @80 DO ~TakePartyItemNum("POTN38",1) SetGlobal("MirrorPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN41") Global("PowerPotion","LOCALS",0)~ THEN REPLY @81 DO ~TakePartyItemNum("POTN41",1) SetGlobal("PowerPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN43") Global("InsightPotion","LOCALS",0)~ THEN REPLY @82 DO ~TakePartyItemNum("POTN43",1) SetGlobal("InsightPotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN45") Global("FreePotion","LOCALS",0)~ THEN REPLY @83 DO ~TakePartyItemNum("POTN45",1) SetGlobal("FreePotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~PartyHasItem("POTN46") Global("StonePotion","LOCALS",0)~ THEN REPLY @84 DO ~TakePartyItemNum("POTN46",1) SetGlobal("StonePotion","LOCALS",1) IncrementGlobal("PotionNumber","LOCALS",1)~ GOTO PQ_17
        IF ~!Global("PotionNumber","LOCALS",1)~ THEN REPLY @85 GOTO PQ_39
        IF ~GlobalGT("PotionNumber","LOCALS",7)~ THEN REPLY @86 GOTO PQ_38
        IF ~OR(2) Global("D0MentionFam","LOCALS",1) Global("D0MentionFam","LOCALS",2) !GlobalGT("PotionFam","GLOBAL",0)~ THEN REPLY @87 GOTO PQ_37
        IF ~Global("D0MentionFam","LOCALS",2) Global("D0TalkedPotionFam","GLOBAL",1) !GlobalGT("PotionFam","GLOBAL",0)~ THEN REPLY @88 DO ~SetGlobal("PotionFam","GLOBAL",1)~ GOTO PQ_41
        IF ~Global("PotionFam","GLOBAL",1)~ THEN REPLY @89 GOTO PQ_41.1
        IF ~~ THEN REPLY @90 GOTO PQ_18
END


IF ~Global("PotionJob","GLOBAL",2)
NumInPartyGT(1)~ THEN BEGIN PQ_16a
        SAY @91
        COPY_TRANS SAFE D0QPPOTN PQ_16
END


IF ~~ THEN BEGIN PQ_16b
        SAY @92
        COPY_TRANS SAFE D0QPPOTN PQ_16
END

IF ~~ THEN BEGIN PQ_17
        SAY @93
        IF ~~ THEN EXIT
        IF ~Global("PotionNumber","LOCALS",1)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_19
        IF ~Global("PotionNumber","LOCALS",2)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_20
        IF ~Global("PotionNumber","LOCALS",3)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_21
        IF ~Global("PotionNumber","LOCALS",4)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_16b
        IF ~Global("PotionNumber","LOCALS",5)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_22
        IF ~Global("PotionNumber","LOCALS",6)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_16b
        IF ~Global("PotionNumber","LOCALS",7)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_23
        IF ~Global("PotionNumber","LOCALS",8)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_24
        IF ~Global("PotionNumber","LOCALS",9)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_16b
        IF ~Global("PotionNumber","LOCALS",10)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_25
        IF ~Global("PotionNumber","LOCALS",11)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_16b
        IF ~GlobalGT("PotionNumber","LOCALS",11)~ THEN DO ~GiveGoldForce(250) AddexperienceParty(1000)~ GOTO PQ_27
END


IF ~~ THEN BEGIN PQ_18
        SAY @94
        IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN PQ_19
        SAY @95
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_20
        SAY @96
= @97
= @98
= @99
= @100
= @101
        IF ~~ THEN DO ~SetGlobal("D0JadOrigin","GLOBAL",1)
SetGlobal("D0MentionFam","LOCALS",1)~ GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_21
        SAY @102
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_22
        SAY @103
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_23
        SAY @104
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_24
        SAY @105
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_25
        SAY @106
= @107
= @108
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_26
        SAY @109
= @110
= @111
        IF ~~ THEN GOTO PQ_16b
END


IF ~~ THEN BEGIN PQ_27
        SAY @112
        IF ~~ THEN DO ~DestroyItem("POTN10") DestroyItem("POTN14") DestroyItem("POTN22") DestroyItem("POTN26") DestroyItem("POTN31") DestroyItem("POTN28") DestroyItem("POTN33") DestroyItem("POTN38") DestroyItem("POTN41") DestroyItem("POTN43") DestroyItem("POTN45") DestroyItem("POTN46")~ GOTO PQ_28
END


IF ~~ THEN BEGIN PQ_28
        SAY @113
        IF ~~ THEN REPLY @114 GOTO PQ_29
    	IF ~~ THEN REPLY @115 GOTO PQ_29
		IF ~~ THEN REPLY @116 GOTO PQ_28a
END

IF ~~ THEN BEGIN PQ_28a
		SAY @117
        =
        @118
        IF ~~ THEN DO ~DialogInterrupt(FALSE) DisplayStringHead(Myself,16233) CreateItem("POTN35",1,0,0) CreateItem("POTN52",3,0,0) SmallWait(2) EraseJournalEntry(@256) EraseJournalEntry(@257) EraseJournalEntry(@260) EraseJournalEntry(@263) EraseJournalEntry(@265) SetGlobal("PotionJob","GLOBAL",4) ReallyForceSpell(Myself,WIZARD_ABI_DALZIMS_HORRID_WILTING) ReallyForceSpell(Myself,WIZARD_FIREBALL) ReallyForceSpell(LastTalkedToBy,WIZARD_LIGHTNING_BOLT) Kill(Myself) AddexperienceParty(25000) AddJournalEntry(@261,QUEST_DONE)~ EXIT
END

IF ~~ THEN BEGIN PQ_29
        SAY @119
    IF ~~ THEN GOTO PQ_30
END


IF ~~ THEN BEGIN PQ_30
        SAY @120
= @121
        IF ~~ THEN REPLY @122 GOTO PQ_31
        IF ~~ THEN REPLY @123 GOTO PQ_32
	    IF ~~ THEN REPLY @124 GOTO PQ_33
		IF ~~ THEN REPLY @116 GOTO PQ_28a
END


IF ~~ THEN BEGIN PQ_31
        SAY @125
= @126
        IF ~~ THEN REPLY @127 GOTO PQ_32
        IF ~~ THEN REPLY @128 GOTO PQ_33
	    IF ~~ THEN REPLY @124 GOTO PQ_33
		IF ~~ THEN REPLY @129 GOTO PQ_28a
END


IF ~~ THEN BEGIN PQ_32
        SAY @130
= @131
        IF ~~ THEN REPLY @132 GOTO PQ_31
    IF ~~ THEN REPLY @133 DO ~SetGlobal("PotionJob","GLOBAL",3)
SetCutSceneLite(TRUE)
DisplayStringHead(LastTalkedToBy(Myself),16233)
SmallWait(2)
ActionOverride(LastTalkedToBy(Myself),ReallyForceSpellRES("D0QPPOT1",Myself))
DisplayStringHead(LastTalkedToBy(Myself),@259)
Wait(1)
StartDialogueNoSet(LastTalkedToBy(Myself))~ EXIT
END


IF ~~ THEN BEGIN PQ_33
        SAY @134
        =
        @118
        IF ~~ THEN DO ~DialogInterrupt(FALSE) DisplayStringHead(Myself,16233) CreateItem("POTN35",1,0,0) CreateItem("POTN52",3,0,0) SmallWait(2) EraseJournalEntry(@256) EraseJournalEntry(@257) EraseJournalEntry(@260) EraseJournalEntry(@263) EraseJournalEntry(@265) SetGlobal("PotionJob","GLOBAL",4) ReallyForceSpell(Myself,WIZARD_ABI_DALZIMS_HORRID_WILTING) ReallyForceSpell(Myself,WIZARD_FIREBALL) ReallyForceSpell(LastTalkedToBy,WIZARD_LIGHTNING_BOLT) Kill(Myself) AddexperienceParty(25000) AddJournalEntry(@261,QUEST_DONE)~ EXIT
END


IF ~Global("PotionJob","GLOBAL",3)~ THEN BEGIN PQ_34
        SAY @135
        IF ~~ THEN REPLY @136 GOTO PQ_35
	    IF ~~ THEN REPLY @137 GOTO PQ_35
END

IF ~~ THEN BEGIN PQ_35
        SAY @138
= @139
= @140
= @141
        IF ~~ THEN DO ~SetGlobal("D0Interaction","LOCALS",1)
SetCutSceneLite(TRUE)
DisplayStringHead(Myself,16233)
SmallWait(2)
ReallyForceSpellRES("D0QPPOT2",Myself)
Wait(4)
StartDialogNoSet(LastTalkedToBy(Myself))~ EXIT
END


IF WEIGHT #-1 ~Global("D0Interaction","LOCALS",1)~ THEN BEGIN PQ_36
        SAY @142
= @143
= @144
= @145
        IF ~~ THEN DO ~SetGlobal("D0Interaction","LOCALS",2) EraseJournalEntry(@256) EraseJournalEntry(@257) EraseJournalEntry(@260) EraseJournalEntry(@263) EraseJournalEntry(@265) SetGlobal("PotionJob","GLOBAL",3) AddJournalEntry(@262,QUEST_DONE) AddexperienceParty(50000) GiveItemCreate("D0QPPOT2",LastTalkedToBy,1,0,0) ReallyForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END


IF ~~ THEN BEGIN PQ_37
        SAY @146
        IF ~~ THEN REPLY @147 GOTO PQ_37.1
        IF ~~ THEN REPLY @148 GOTO PQ_37.2
        IF ~~ THEN REPLY @149 GOTO PQ_37.3
        IF ~~ THEN REPLY @150 GOTO PQ_40
END


IF ~~ THEN BEGIN PQ_37.1
        SAY @151
        IF ~~ THEN REPLY @148 GOTO PQ_37.2
        IF ~~ THEN REPLY @149 GOTO PQ_37.3
        IF ~~ THEN REPLY @152 GOTO PQ_40
END


IF ~~ THEN BEGIN PQ_37.2
        SAY @153
        IF ~Global("D0TalkedPotionFam","GLOBAL",1)~ THEN REPLY @154 DO ~SetGlobal("PotionFam","GLOBAL",1) SetGlobal("D0KnowJanie","GLOBAL",1)~ GOTO PQ_41
        IF ~~ THEN REPLY @155 DO ~SetGlobal("D0MentionFam","LOCALS",2) SetGlobal("D0KnowJanie","GLOBAL",1) AddJournalEntry(@256,QUEST)~ GOTO PQ_37.3
        IF ~~ THEN REPLY @156 DO ~SetGlobal("D0MentionFam","LOCALS",2) SetGlobal("D0KnowJanie","GLOBAL",1) AddJournalEntry(@256,QUEST)~ GOTO PQ_40
END


IF ~~ THEN BEGIN PQ_37.3
        SAY @157
        IF ~~ THEN GOTO PQ_16
END


IF ~~ THEN BEGIN PQ_38
        SAY @158
        IF ~~ THEN REPLY @159 GOTO PQ_38.1
        IF ~~ THEN REPLY @160 GOTO PQ_39
        IF ~~ THEN REPLY @161 GOTO PQ_40
END


IF ~~ THEN BEGIN PQ_38.1
        SAY @162
= @163
= @164
        IF ~~ THEN REPLY @165 GOTO PQ_16b
        IF ~~ THEN REPLY @166 GOTO PQ_40
END


IF ~~ THEN BEGIN PQ_39
        SAY @167
= @168
        IF ~~ THEN REPLY @169 GOTO PQ_16
        IF ~~ THEN REPLY @152 GOTO PQ_40
END


IF ~~ THEN BEGIN PQ_40
        SAY @170
        IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN PQ_41
        SAY @171
= @172
        IF ~~ THEN REPLY @173 GOTO PQ_41.1
        IF ~~ THEN REPLY @174 GOTO PQ_41.2
        IF ~~ THEN REPLY @175 GOTO PQ_37.3
END

IF ~~ THEN BEGIN PQ_41.1
        SAY @176
= @177
        IF ~~ THEN REPLY @178 GOTO PQ_42
        IF ~~ THEN REPLY @179 GOTO PQ_37.3
END

IF ~~ THEN BEGIN PQ_41.2
        SAY @180
        IF ~~ THEN GOTO PQ_16
END

IF ~~ THEN BEGIN PQ_42
        SAY @181
        IF ~~ THEN REPLY @182 GOTO PQ_43
        IF ~~ THEN REPLY @183 GOTO PQ_37.3
END

IF ~~ THEN BEGIN PQ_43
        SAY @184
= @185
= @186
        IF ~~ THEN DO ~AddJournalEntry(@263,QUEST) SetGlobal("PotionJob","GLOBAL",5) EscapeAreaMove("ar0500",586,3809,8)~ EXIT
END

BEGIN D0QPMOM

IF ~Global("D0Pay","LOCALS",0)~ THEN BEGIN M_1
SAY @187
IF ~Global("D0KnowJanie","GLOBAL",1)~ THEN REPLY @188 DO ~SetGlobal("D0TalkedPotionFam","GLOBAL",1)~ GOTO M_1a
IF ~~ THEN REPLY @189 DO ~SetGlobal("D0TalkedPotionFam","GLOBAL",1)~ GOTO M_2
IF ~PartyGoldGT(4)~ THEN REPLY @190 DO ~SetGlobal("D0TalkedPotionFam","GLOBAL",1) TakePartyGold(5)~ GOTO M_3
IF ~~ THEN REPLY @191 DO ~SetGlobal("D0TalkedPotionFam","GLOBAL",1)~ GOTO M_4
IF ~~ THEN REPLY @192 DO ~SetGlobal("D0TalkedPotionFam","GLOBAL",1)~ GOTO M_4
END

IF ~~ THEN BEGIN M_1a
SAY @193
IF ~~ THEN DO ~AddJournalEntry(@257,QUEST)~ EXIT
END

IF ~~ THEN BEGIN M_1a_2
SAY @194
IF ~~ THEN DO ~AddJournalEntry(@257,QUEST)~ EXIT
END

IF ~~ THEN BEGIN M_2
SAY @195
IF ~PartyGoldGT(4)~ THEN REPLY @190 GOTO M_3
IF ~~ THEN REPLY @191 GOTO M_4
IF ~~ THEN REPLY @192 GOTO M_4
END

IF ~~ THEN BEGIN M_3
SAY @196
IF ~~ THEN DO ~SetGlobal("D0Pay","LOCALS",1)~ EXIT
END

IF ~Global("D0Pay","LOCALS",1)~ THEN BEGIN M_3a
SAY @197
IF ~!Global("D0KnowJanie","GLOBAL",1)~ THEN EXIT
IF ~Global("D0KnowJanie","GLOBAL",1)~ THEN REPLY @188 DO ~SetGlobal("D0TalkedPotionFam","GLOBAL",1)~ GOTO M_1a_2
IF ~Global("D0KnowJanie","GLOBAL",1)~ THEN REPLY @198 GOTO M_3a_2
IF ~Global("D0KnowJanie","GLOBAL",1)~ THEN REPLY @199 GOTO M_3a_3
END

IF ~~ THEN BEGIN M_3a_2
SAY @200
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN M_3a_3
SAY @201
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN M_4
SAY @202
IF ~~ THEN EXIT
END

BEGIN D0QPJAN

IF ~True()~ THEN BEGIN J_1
SAY @203
IF ~~ THEN EXIT
END


CHAIN
IF WEIGHT #-1 ~See("D0QPMOM")
GlobalLT("PotionFam","GLOBAL",2)~ THEN D0QPPOTN familychain
@204
= @205
== D0QPMOM @206
== D0QPPOTN @207
== D0QPMOM @208
== D0QPJAN @209
== D0QPMOM @210
== D0QPPOTN @211
== D0QPMOM @212
== D0QPPOTN @213
== D0QPMOM @214
== D0QPPOTN @215
= @216
== D0QPMOM @217
= @218
= @219
== D0QPPOTN @220
== D0QPMOM @221
== D0QPPOTN @222
== D0QPJAN @223
== D0QPPOTN @224
== D0QPJAN @225
== D0QPMOM @226
== D0QPPOTN @227
DO ~SetGlobal("PotionFam","GLOBAL",2)
ActionOverride("D0QPMOM",EscapeArea())
ActionOverride("D0QPJAN",EscapeArea())~
EXIT


APPEND ~D0QPPOTN~


IF WEIGHT #-1 ~Global("PotionFam","GLOBAL",2)~ THEN BEGIN PQ_50
        SAY @228
		IF ~~ THEN REPLY @229 GOTO PQ_50a
        IF ~~ THEN REPLY @230 GOTO PQ_51
		IF ~~ THEN REPLY @231 GOTO PQ_52a
        IF ~~ THEN REPLY @232 GOTO PQ_52
        IF ~~ THEN REPLY @233 GOTO PQ_54
END


IF ~~ THEN BEGIN PQ_50a
		SAY @234
        IF ~~ THEN DO ~EraseJournalEntry(@256) EraseJournalEntry(@257) EraseJournalEntry(@260) EraseJournalEntry(@263) EraseJournalEntry(@265) AddJournalEntry(@258,QUEST_DONE) AddExperienceParty(35000) SetGlobal("PotionFam","GLOBAL",3) EscapeArea()~ EXIT
END


IF ~~ THEN BEGIN PQ_51
        SAY @235
= @236
= @237
        IF ~~ THEN DO ~EraseJournalEntry(@256) EraseJournalEntry(@257) EraseJournalEntry(@260) EraseJournalEntry(@263) EraseJournalEntry(@265) AddJournalEntry(@264,QUEST_DONE) GiveItemCreate("POTN55",LastTalkedToBy(Myself),1,0,0) GiveItemCreate("POTN52",LastTalkedToBy(Myself),3,0,0) GiveItemCreate("POTN35",LastTalkedToBy(Myself),2,0,0) GiveItemCreate("POTN34",LastTalkedToBy(Myself),1,0,0) GiveGoldForce(2000) AddExperienceParty(50000) SetGlobal("PotionFam","GLOBAL",3) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PQ_52
        SAY @238
= @239
= @240
        IF ~~ THEN DO ~AddJournalEntry(@265,QUEST) SetGlobal("PotionJob","GLOBAL",2) SetGlobal("PotionFam","GLOBAL",4) AddExperienceParty(10000) EscapeAreaMove("ar0701",175,2567,4)~ EXIT
END


IF ~~ THEN BEGIN PQ_52a
        SAY @241
= @239
= @240
        IF ~~ THEN DO ~AddJournalEntry(@265,QUEST) SetGlobal("PotionJob","GLOBAL",2) SetGlobal("PotionFam","GLOBAL",4) AddExperienceParty(10000) EscapeAreaMove("ar0701",175,2567,4)~ EXIT
END


IF ~~ THEN BEGIN PQ_54
        SAY @242
        IF ~RandomNum(2,1)~ THEN GOTO PQ_51
        IF ~RandomNum(2,2)~ THEN GOTO PQ_52
END
END


EXTEND_BOTTOM ROGER 0
IF ~!Global("PotionRoger","GLOBAL",0)
!Dead("d0qppotn")
InMyArea("d0qppotn")~ THEN REPLY @243 EXTERN ROGER PQ_Potion
END

EXTEND_BOTTOM ROGER 21
IF ~!Global("PotionRoger","GLOBAL",0)
!Dead("d0qppotn")
InMyArea("d0qppotn")~ THEN REPLY @243 EXTERN ROGER PQ_Potion
END

EXTEND_BOTTOM ROGER 24
IF ~!Global("PotionRoger","GLOBAL",0)
!Dead("d0qppotn")
InMyArea("d0qppotn")~ THEN REPLY @243 EXTERN ROGER PQ_Potion
END

EXTEND_BOTTOM ROGER 27
IF ~!Global("PotionRoger","GLOBAL",0)
!Dead("d0qppotn")
InMyArea("d0qppotn")~ THEN REPLY @243 EXTERN ROGER PQ_Potion
END


APPEND ROGER
        IF ~~ THEN BEGIN PQ_Potion
        SAY @244
= @245
= @246
        IF ~~ THEN EXIT
END
END


APPEND D0QPPOTN
        IF ~AreaCheck("ar0500")~ THEN BEGIN PQ_100
        SAY @247
        IF ~~ THEN EXIT
END
END

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

EXTEND_BOTTOM UHINN01 2
IF ~Global("D0JadOrigin","GLOBAL",1)~ THEN REPLY @248 DO ~SetGlobal("D0JadOrigin","GLOBAL",2)~ GOTO IN_1
END

APPEND UHINN01
IF ~~ THEN BEGIN IN_1
SAY @249
IF ~~ THEN EXTERN UHINN02 IN_2
END

IF ~~ THEN BEGIN IN_3
SAY @250
IF ~~ THEN EXTERN UHINN02 IN_4
END

IF ~~ THEN BEGIN IN_5
SAY @251
COPY_TRANS UHINN01 2
END
END

APPEND UHINN02
IF ~~ THEN BEGIN IN_2
SAY @252
= @253
= @254
IF ~~ THEN EXTERN UHINN01 IN_3
END

IF ~~ THEN IN_4
SAY @255
IF ~~ THEN EXTERN UHINN01 IN_5
END
END
