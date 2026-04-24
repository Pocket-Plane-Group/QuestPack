// NAZARIEL THE LICH

BEGIN ~D0LICH01~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN LI_1
  SAY @0
= @1
= @2
IF ~~ THEN REPLY @3 GOTO LI_1a
IF ~Global("PlayerLooksLikeDrow","GLOBAL",1)~ THEN REPLY @4 GOTO LI_1a
IF ~CheckStatLT(LastTalkedToBy(Myself),10,INT)~ THEN REPLY @5 GOTO LI_2
IF ~CheckStatGT(LastTalkedToBy(Myself),9,INT)~ THEN REPLY @6 GOTO LI_2
IF ~!Alignment(LastTalkedToBy(Myself),MASK_EVIL)~ THEN REPLY @7 GOTO LI_1a
IF ~Alignment(LastTalkedToBy(Myself),MASK_EVIL)~ THEN REPLY @8 GOTO LI_1a
IF ~Kit(LastTalkedToBy(Myself),GODLATHANDER)~ THEN REPLY @9 GOTO LI_1a
IF ~Kit(LastTalkedToBy(Myself),GODHELM)~ THEN REPLY @10 GOTO LI_1a
END

IF ~~ THEN BEGIN LI_1a
SAY @11
IF ~~ THEN GOTO LI_2
END

IF ~~ THEN BEGIN LI_2
SAY @12
= @13
= @14
  IF ~~ THEN DO ~SetGlobal("Begin","LOCALS",1)~ EXIT
END

IF ~HPLT(Myself,10)
Global("Begin","LOCALS",5)~ THEN BEGIN LI_3
SAY @15
IF ~XPLT(Player1,1000000)~ THEN DO ~Kill(Myself)
AddJournalEntry(@16,QUEST)
AddexperienceParty(30000)
Wait(1)
CreateVisualEffectObject("SPFIREPI",Myself)
DestroySelf()~ EXIT
IF ~XPGT(Player1,999999)
XPLT(Player1,2000000)~ THEN DO ~Kill(Myself)
AddexperienceParty(25000)
AddJournalEntry(@16,QUEST)
Wait(1)
CreateVisualEffectObject("SPFIREPI",Myself)
DestroySelf()~ EXIT
IF ~XPGT(Player1,1999999)~ THEN DO ~Kill(Myself)
AddexperienceParty(20000)
AddJournalEntry(@16,QUEST)
Wait(1)
CreateVisualEffectObject("SPFIREPI",Myself)
DestroySelf()~ EXIT
END
