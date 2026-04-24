BEGIN D0QPORE0

IF ~Global("D0Ormand","GLOBAL",1)~ THEN BEGIN X1
SAY ~Hold. You carry something which you are not worthy to wield. I know not where you found it, but it must be reclaimed.~
++ ~What are you talking about? What am I not worthy of?~ GOTO X2
++ ~I don't think you'll be reclaiming anything from me.~ GOTO X2
+ ~!Race(LastTalkedToBy(Myself),ELF)~ + ~What can I do to help you, my good elf?~ GOTO X2
END

IF ~~ THEN BEGIN X2
SAY ~I come for the Elven Court Bow. We thought it lost--typically, it disappeared after being entrusted to a human--and I had managed only to trace it to this region of Amn, until reports of you carrying it reached my ears.~
  = ~It is an item of great significance, and I come from the Elven city of Suldanessellar with the blessing of of Queen Ellesime herself to retrieve it.~
++ ~If you knew some of the deeds I'd done, you'd know that I'm worthy of it.~ GOTO X3
++ ~Then of course I will return it to its rightful ownership. My most humble apologies!~ GOTO X4
++ ~Well, what can you offer me in return for it?~ GOTO X4
++ ~Bad luck, then. I've taken a liking to this bow, and I don't intend to part with it.~ GOTO X4
END

IF ~~ THEN BEGIN X3
SAY ~Not in my eyes. I care little for your exploits in the world of man.~
IF ~~ THEN GOTO X4
END

IF ~~ THEN BEGIN X4
SAY ~Out of fairness, I will offer a reasonable price for the bow: 2500 gold pieces.~
+ ~CheckStatGT(LastTalkedToBy(Myself),10,CHR)~ + ~Is that it? I won't part with it for any less than 3000.~ GOTO X5
+ ~!CheckStatGT(LastTalkedToBy(Myself),10,CHR)~ + ~Is that it? I won't part with it for any less than 3000.~ GOTO X5a
++ ~That is most generous. You have yourself a deal.~ GOTO X6
++ ~No, I don't think it would be worth my while to part with it.~ GOTO X7
++ ~If the bow is significant to you, I would not want to withold it. Take it, and keep your gold.~ GOTO X8
++ ~Gold does not interest me. Perhaps you can offer another bow as a replacement?~ GOTO X9
++ ~Why don't I just kill you, take the gold, and keep the bow?~ GOTO X11
END

IF ~~ THEN BEGIN X5
SAY ~Such human greed. So be it. The gold is yours, and I will take my leave. Farewell.~
IF ~~ THEN DO ~TakePartyItem("bow12")
GiveGoldForce(3000)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN X5a
SAY ~Such human greed. But I am not here to haggle. 2500 gold is the offer, and the choice lies with you.~
++ ~It was worth a try, but 2500 gold will do. You have yourself a deal.~ GOTO X6
++ ~No, I don't think it would be worth my while to part with it.~ GOTO X7
++ ~Actually, I was joking. If the bow is significant to you, I would not want to withold it. Take it, and keep your gold.~ GOTO X8
++ ~If you will not match my demands, perhaps you can offer another bow as a replacement?~ GOTO X9
++ ~Why don't I just kill you, take the gold, and keep the bow?~ GOTO X11
END

IF ~~ THEN BEGIN X6
SAY ~So be it. I am glad you have chosen to co-operate. The gold is yours, and I will take my leave. Farewell.~
IF ~~ THEN DO ~TakePartyItem("bow12")
GiveGoldForce(2500)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN X7
SAY ~Then I will not waste time arguing and trying to convince you. But be warned, this is a grave mistake. I *will* reacquire the bow.~
IF ~~ THEN DO ~SetGlobal("D0Ormand","GLOBAL",2)
SetGlobalTimer("D0OrmandReturn","GLOBAL",TEN_DAYS)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN X8
SAY ~Most generous of you. Your consideration is appreciated, if unexpected. I will take my leave, and your gesture will not go unremembered. Farewell.~
IF ~~ THEN DO ~TakePartyItem("bow12")
IncrementGlobal("D0Virtue","GLOBAL",1)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN X9
SAY ~I suppose I could part with my own bow as an exchange. It is less ornate than the one you hold, but no less effective in experienced hands.~
++ ~Sounds unappealing. I guess I'll take the gold.~ GOTO X6
++ ~Well, why didn't you say so?! Let's get this trade over with and be on our ways.~ GOTO X10
++ ~That's quite a sacrifice. You really seem determined. If the bow is really that significant to you, I would not want to withold it. Take it, and keep your gold.~ GOTO X8
++ ~You don't seem to have anything worth my time. I'm not parting with this.~ GOTO X7
++ ~Why don't I just kill you, take the gold, and keep the bow?~ GOTO X11
END

IF ~~ THEN BEGIN X10
SAY ~So bet it. I trust this weapon will serve you as well as it has I. It is yours, and I will take my leave. Farewell.~
IF ~~ THEN DO ~TakePartyItem("bow12")
GiveItem("bow09",LastTalkedToBy(Myself))
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN X11
SAY ~You would do well to beware who you threaten, brash one. I leave you for now, but this is a grave mistake. I *will* reacquire the bow.~
IF ~~ THEN DO ~SetGlobal("D0Ormand","GLOBAL",2)
SetGlobalTimer("D0OrmandReturn","GLOBAL",SIX_DAYS)
UseItem("potn10",Myself)
EscapeArea()~ EXIT
END




IF ~Global("D0Ormand","GLOBAL",3)~ THEN BEGIN A1
SAY ~Stay your weapons. I offer you another chance for settlement. For the Elven Court Bow, you will be reimbursed 2000 gold.~
++ ~2000 gold? That's even less than last time. Make a better offer.~ GOTO A2
++ ~You seem to have the upper hand this time. The bow is yours.~ GOTO A3
++ ~The only way I will part with this bow is in death.~ GOTO A4
END

IF ~~ THEN BEGIN A2
SAY ~This is the final offer. If you do not agree, we will have no alternative but to seize it from you. Look around you. Given our tactical advantage, you would do well to accept our goodwill and be on your way.~
++ ~You seem to have the upper hand this time. The bow is yours.~ GOTO A3
++ ~It looks like I will have to put your tactical superiority to the test.~ GOTO A4
END

IF ~~ THEN BEGIN A3
SAY ~You have judged this situation well, and I am glad that we must not settle this by the sword. Here is your gold, and now, we are gone.~
IF ~~ THEN DO ~TakePartyItem("bow12")
GiveGoldForce(2000)
SetGlobal("D0Ormand","GLOBAL",5)
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN A4
SAY ~Then so be it. I shall harbour no regret in spilling your blood, for you spit upon the will of the Seldarine!~
IF ~~ THEN DO ~SetGlobal("D0Ormand","GLOBAL",4)
Enemy()~ EXIT
END


REPLACE SUELLE2
IF ~~ THEN BEGIN 7 // from: 6.0
  SAY ~I have planned a ceremony to reward you and to show our gratitude for your actions.  But before that, I have something for you.  You are a hero to the elves... perhaps even a legend in the making.~
  IF ~~ THEN GOTO New1
END
END

APPEND SUELLE2
IF ~~ THEN BEGIN New1
  SAY ~I think you will recognize this: you have proven yourself more than worthy to wield the bow of the Elven Court.  I give it to you now, for there are still those who would sooner not see it in the hands of an outsider.  I fear that for some of my people even now, heritage speaks louder than deeds.~
  IF ~~ THEN DO ~GiveItemCreate("bow12",Player1,0,0,0)~ GOTO 8
END
END
