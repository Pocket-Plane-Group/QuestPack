BEGIN j#im5hob

IF ~NumTimesTalkedTo(0)~ talkbrett
SAY ~Hey!  Say quicklike; you slaver, or you deadman?~
++ ~Hold!  I have no quarrel with you, and I have a deal for you.~ GOTO holdtalk
END

IF ~~ holdtalk
SAY ~Deal?  Speak quick.  I get angry if talk too long.~
++ ~I can offer you 500 gold for this job.  All you need to do is befriend an old man.  Don't ask why.~ GOTO ht1
++ ~I offer you the opportunity to redeem your evil ways.  There is an old man nearby in need of a friend, and I am seeking one for him.  If he accepts you, your sins will be forgiven!~ GOTO combat
++ ~You'll do as I say!  There is a man close by seeking a 'friend'.  You will act the part, or suffer my wrath!~ GOTO combat
END

IF ~~ combat
  SAY ~Har!  Not likely!~
  IF ~~ THEN DO ~Enemy()
SG("J#im5hobhostile",1)~ EXIT
END

IF ~~ ht1
  SAY ~Gold?  This better be no tricks, <PRO_RACE>!  We go.~
  IF ~~ THEN DO ~SG("j#im5hobleave",1)
StartCutSceneMode()
ActionOverride(Player1,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player2,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player3,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player4,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player5,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player6,LeaveAreaLUA("AR0404","",[2193.2677],0))
LeaveAreaLUA("AR0404","",[2193.2677],0)
EndCutSceneMode()~ EXIT
END

IF ~~ feedhobme
  SAY ~Hurr, would I feed you?!  You fool, I would--~
  ++ ~Remember our deal, beast!~ GOTO hobrep1
  ++ ~(Remain silent.)~ GOTO hobrep2
  ++ ~Of course he would, as would any good friend, Quallo.~ GOTO hobrep1
END

IF ~~ hobrep1
  SAY ~I... bah!  I would spit kobold from sewer and roast on fire for you... friend.~
  IF ~~ THEN EXTERN sewerm1 spitem
END

IF ~~ hobrep2
  SAY ~I would... I would spit you on sword and roast you over fire for ME to eat!  This bargain not worth 500 gold!~
  IF ~~ THEN DO ~SG("J#im5spawnfriend",3)
EscapeArea()~ EXIT
END

IF ~~ anger
SAY ~Grah?!  Hold you?  I not whore!  This not worth five THOUSAND gold.  Waste of time, it is!~
IF ~~ THEN DO ~SG("J#im5spawnfriend",3)
EscapeArea()~ EXIT
END






BEGIN j#im5kob

IF ~NumTimesTalkedTo(0)~ talkkob
  SAY ~Snrf!  You finds me!  No hurt!  No hurt!~
  ++ ~Silence, dog creature.  I am here to ask a question of you.~ GOTO question
  ++ ~Calm yourself.  I am not going to hurt you, but I have a question to ask.~ GOTO question
END

IF ~~ question
  SAY ~You...?  You not kill?  Man things always hunts me, and now that cast out of clan, so hard to hide and run and flee.~
  ++ ~That is a sad state of affairs, but I can offer you freedom from such worries, if you are merely willing to befriend an old man.~ GOTO trust
  ++ ~I didn't come here to listen to your whining!  If you had half a brain, you would come with me.  An old man seeks a 'friend', and if he chooses you, you will be free from all your problems.~ GOTO trust
END

IF ~~ trust
  SAY ~I not knows if can trust man things, but will come with.  No hurts, please.  Yarf!~
  IF ~~ THEN DO ~SG("j#im5kobleave",1)
StartCutSceneMode()
ActionOverride(Player1,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player2,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player3,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player4,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player5,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player6,LeaveAreaLUA("AR0404","",[2193.2677],0))
LeaveAreaLUA("AR0404","",[2193.2677],0)
EndCutSceneMode()~ EXIT
END

IF ~~ nofriendkob
  SAY ~Yurf!  Then I go!  I goes back to pack and find Eyegnash.  Maybe...  arf!~
  IF ~~ THEN DO ~SG("J#im5spawnfriend",5)
EscapeArea()~ EXIT
END





BEGIN j#im5wom

IF ~NumTimesTalkedTo(0)~ thanksforsaving
  SAY ~Oh!  I thank you!  They were taking me... they said I was to be in a brothel somewhere in the docks.~
=
~I... I'm sorry, but I can't repay you.  I have nothing.~
  ++ ~You are a slave, and simply chattel.  That you no longer belong to them means you belong to me, and you will do my bidding.  An old man is in need of a friend, and you will be that friend!~ GOTO wom1
  ++ ~I seek no repayment.  You may go if you wish, but I ask a favour of you nevertheless.  Refuse as you will.  An old man nearby is in need of a companion.  Your future will be secure and you will be safe if you become his friend.~ GOTO wom2
END

IF ~~ wom1
  SAY ~No!  NO!  You can't make me!  Not again!  Never again!~
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ wom2
  SAY ~He won't... I mean, you don't want me to be his... *his*, do you?  I couldn't bear being a slave again, now that you offer me freedom!~
  ++ ~He will not accept a slave, I am certain.  You shall be his friend only be if you are both willing.~ GOTO wom3
  ++ ~You are so selfish that you would spit in my face, after making you such an offer?  You will be safe for the rest of your days!~ GOTO wom1
END

IF ~~ wom3
  SAY ~Then I will come with you.  Perhaps it will be a happy ending for me, of a sort.~
  IF ~~ THEN DO ~SG("j#im5womleave",1)
StartCutSceneMode()
ActionOverride(Player1,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player2,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player3,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player4,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player5,LeaveAreaLUA("AR0404","",[2193.2677],0))
ActionOverride(Player6,LeaveAreaLUA("AR0404","",[2193.2677],0))
LeaveAreaLUA("AR0404","",[2193.2677],0)
EndCutSceneMode()~ EXIT
END



// Quallo
APPEND sewerm1
IF ~~ pcreply
  SAY ~Are you willing to do this for a poor old man?~
  IF ~~ THEN REPLY ~If it means getting the blade, then yes, I will do it.~ GOTO thanksdood
  IF ~~ THEN REPLY ~I had no idea you were so miserable.  I will certainly find a new friend for you.~ GOTO thanksdood
  IF ~~ THEN REPLY ~Ha!  Not likely.~ GOTO thenbye
END

IF ~~ thanksdood
  SAY ~You have no idea how thankful I am.  If you find someone you think may be a friend for me, return here and I will ask my questions.~
=
~Yes, the questions.  The questions are important, for they bring answers.~
IF ~~ THEN DO ~SG("J#im5spawnfriend",1)
SG("J#im5friendhunt",2)~ EXIT
END

IF ~~ thenbye
  SAY ~Then I have nothing to say but farewell.~
  IF ~~ THEN EXIT
END

IF WEIGHT #-2 ~G("J#im5friendhunt",2)~ talkhobdood
  SAY ~So, you're back?  I suppose I can't hope for much.~
+ ~G("j#im5hobleave",1)
G("J#im5spawnfriend",2)~ + ~I have with me a hobgoblin who is willing to be your friend, Quallo.~ GOTO nasty
+ ~G("j#im5kobleave",1)
G("J#im5spawnfriend",4)~ + ~I have with me a kobold who offers his friendship.~ GOTO kobasdf
+ ~G("j#im5womleave",1)
G("J#im5spawnfriend",6)~ + ~I have with me a human woman who may be willing to be your friend, Quallo.~ GOTO womchain
+ ~OR(3)
G("J#im5spawnfriend",2)
G("J#im5spawnfriend",4)
G("J#im5spawnfriend",6)~ + ~I haven't yet found another friend for you, but I'll keep looking.~ EXIT
END

IF ~~ nasty
  SAY ~Nasty fellows, those hobgoblins.  But I judge on character, not heredity.~
=
~So, you would be my friend, I have three questions for you.  The first is this: I cannot feed myself.  Will you feed me?~
  IF ~~ THEN EXTERN j#im5hob feedhobme
END

IF ~~ womgone
  SAY ~It... it looks as if I shall never find a true friend.~
  ++ ~I shall keep looking, Quallo!~ GOTO youmeanthat
  ++ ~Perhaps you're right.  Just give me the key to the blade, and we shall part ways.  No one can help you.~ GOTO youmeanthat
  ++ ~This is a fool's errand!  Just give me the blade, or I may decide to end your misery permanently.~ GOTO youmeanthat
END

IF ~~ youmeanthat
  SAY ~You mean that?  You really do, don't you?  I may be mad, but I know the qualities of a true friend.~
=
~A true friend will never fail <PRO_HISHER> friend.  A friend will speak the truth to <PRO_HISHER> friend, no matter how hurtful.  A real friend will even bring anguish upon <PRO_HIMHER>self that <PRO_HESHE> might aid <PRO_HISHER> friend.~
=
~<CHARNAME>, my friend...  I thank you.  It has been hidden from me all this time, but you have not failed me once in all this time.  You are my friend, and forever shall it be so.~
  ++ ~This is madness!  I will never be your friend, and I am leaving.~ GOTO 1slash2
  ++ ~I accept your friendship, Quallo, but I have other things to do.  I can't stay with you.~ GOTO 1slash2
  ++ ~Then tell me how to solve this riddle.  Tell me... *friend*.~ GOTO 3slash4
  ++ ~But how do I solve the riddle?  Please friend, won't you tell me?~ GOTO 3slash4
END

IF ~~ 3slash4
  SAY ~Answer?  Why, there IS no answer.  But a true friend will keep seeking something that doesn't exist, if his friend bids him.~
  IF ~~ THEN REPLY ~You're mad!  I will never be your friend, and I am leaving!~ GOTO 1slash2
END

IF ~~ 1slash2
  SAY ~No.  No, you will not leave.  Forever shall we be friends.  Sacrifices must be made, you see.  This is the price of frienship.~
  IF ~~ THEN DO ~StartCutSceneMode()
StartCutScene("J#im5fin")~ EXIT
END

IF ~~ THEN spitem
SAY ~That is an honourable thing to do, one any true friend would do.  My second question: I am so alone, I weep.  When I weep, will you hold me?~
IF ~~ THEN EXTERN j#im5hob anger
END

END

CHAIN IF ~~ THEN sewerm1 womchain
~Then I shall begin my questions.~
=
~I see you were once a slave, as I am.  I cannot be freed, but you are free to go.  For a true friend, would you stay, even though he could never leave this dank, sunless pit?~
== j#im5wom
~I think that... I have known nothing but suffering above, since my husband died.  What good has the sun ever done for me?  I would stay.~
== sewerm1
~You see with your heart, not with your eyes.  That is good.  My next question: Food is scarce, and we have only enough food to sate the hunger of one of us.  Who gets it?~
== j#im5wom
~I... no.  If I were still a slave, then the food would all go to you, my master.  But if we are to be equals, we would each get half.  Both would be hungry, but neither would starve.~
== sewerm1
~Excellent.  If a friendship can survive hard times, then surely it will last.  My last question: Before my enslavement, I was a rich baron.~
=
~I was the one that taxed your husband.  I was the one that took his lands when he was ill.  I was responsible for his death, and the horrors that happened to you.~
=
~But I am now humbled.  I know of my sins, and ask that, as a friend, you forgive me.  Do you?~
== j#im5wom
~Your questions.  How do you know how my husband died?  You aren't... you couldn't be.  What was your name, then?~
== sewerm1
~I am now Quallo, but was once Baron Qadeel, though that name has no meaning now.~
== j#im5wom
~NO!  You... I will never forget what you did to my beloved Athis!  I pray that you die here, you horrible, wretched creature!  I spit on you, devil!~
DO ~EscapeArea()~
END sewerm1 womgone





CHAIN IF ~~ THEN sewerm1 kobasdf
~The smell of the sewers has been so long in my nose that the normal revulsion for such creatures is beyond me.  I will ask my questions.~
=
~You who would be my friend, answer me this: I am beset by a sickness.  It chills me.  How will you warm me?~
== j#im5kob
~I's... er, I has fur!  Like small litterlings we stay close, and fur gives warmth to all.~
=
~(The kobolds turns to you.) I does good, yes?~
== sewerm1
~You do, little one, you do good.  But now my second question: Your pack returns, with the leader who cast you out dead.  They want you to return.  What do you do?~
== j#im5kob
~Eyegnash dead?  They do's want back?  Yes!  Yessss, I goes!  Please can go?  Where are's they?~
== sewerm1
~They are not here, fickle little thing.  You can never be my friend.~
END j#im5kob nofriendkob



CHAIN IF WEIGHT #-1 ~G("J#im5friendhunt",1)~ THEN sewerm1 introtalk
~You think you've found it, have you?  The blood of a true friend?~
=
~I see you are determined to find this blade, and I will tell you the way to do so.  Long have I been here, and have had but a single friend.  You find him repulsive, but he is all I have.~
=
~Find me another friend, and you shall have my secrets.~
END sewerm1 pcreply


