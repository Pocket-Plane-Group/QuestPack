BEGIN D0SUCVIC

IF ~Global("D0Succubus","GLOBAL",1)~ THEN BEGIN Victim1
SAY ~You there! Help me!~
IF ~~ THEN REPLY ~Why do you lie in the street like this? Who has done this to you?!~ GOTO Victim2
IF ~~ THEN REPLY ~What is it? What has happened to you? Speak!~ GOTO Victim2
IF ~~ THEN REPLY ~Keep quiet or you'll get a kick in the gut.~ GOTO Victim2a
IF ~~ THEN REPLY ~Another beggar? Give me one good reason why I shouldn't clean your taint from the city!~ GOTO Victim2a
END

IF ~~ THEN BEGIN Victim2
SAY ~I... I was in the back rooms of the Coronet, with a hired companion. But she... she did something to me.~
= ~I could... barely move afterwards. I felt exhausted, as never I have before. She... uhhhhh... she must've used some unholy magic!~
= ~I stumbled out and spoke to Madam Nin afterwards, but she... wouldn't listen. She had me escorted out... into the street. Ahhhhh.~
= ~Are you still there? I can't see! I can't feel anything! Ahhhhh! Ahhhhhhhh! Uhh...~
IF ~~ THEN DO ~SetGlobal("D0Succubus","GLOBAL",2)
Kill(Myself)~ EXIT
END

IF ~~ THEN BEGIN Victim2a
SAY ~Ahhh, no, please! I was in the back rooms of the Coronet, with a hired companion. But she... she did something to me.~
= ~I could... barely move afterwards. I felt exhausted, as never I have before. She... uhhhhh... she must've used some unholy magic!~
= ~I stumbled out and spoke to Madam Nin afterwards, but she... wouldn't listen. She had me escorted out... into the street. Ahhhhh.~
= ~Are you still there? I can't see! I can't feel anything! Ahhhhh! Ahhhhhhhh! Uhh...~
IF ~~ THEN DO ~SetGlobal("D0Succubus","GLOBAL",2)
Kill(Myself)~ EXIT
END

EXTEND_BOTTOM MADAM 12 7 3 0
IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Actually, I was looking into the fate of one of your customers, who died shortly after an experience with a companion.~ GOTO WhatTheFuck
END

REPLACE MADAM
IF ~~ THEN BEGIN 9 // from:
  SAY #16647 /* ~Silence!  You are not to speak!  And as for you, my <LADYLORD>, if you wish to deal with my escorts, you must speak to me first.  Is that clear?~ */
  IF ~!Global("D0Succubus","GLOBAL",2)~ THEN EXIT
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Actually, I was looking into the fate of one of your customers, who died shortly after an experience with a companion.~ GOTO WhatTheFuck
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Very well.~ GOTO DontComeBack
END

IF ~~ THEN BEGIN 10 // from:
  SAY #16705 /* ~Silence!  You are not to speak!  And as for you, my <LADYLORD>, if you wish to deal with my escorts, you must speak to me first.  Is that clear?~ */
  IF ~!Global("D0Succubus","GLOBAL",2)~ THEN EXIT
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Actually, I was looking into the fate of one of your customers, who died shortly after an experience with a companion.~ GOTO WhatTheFuck
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Very well.~ GOTO DontComeBack
END

IF ~~ THEN BEGIN 11 // from:
  SAY #16745 /* ~Silence!  You are not to speak!  And as for you, my <LADYLORD>, if you wish to deal with my escorts, you must speak to me first.  Is that clear?~ */
  IF ~!Global("D0Succubus","GLOBAL",2)~ THEN EXIT
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Actually, I was looking into the fate of one of your customers, who died shortly after an experience with a companion.~ GOTO WhatTheFuck
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Very well.~ GOTO DontComeBack
END

IF ~~ THEN BEGIN 17 // from:
  SAY #39396 /* ~I see.  Perhaps you should reconsider where you are then...and remember not to bother other customers with your puerile attitude.~ */
  IF ~!Global("D0Succubus","GLOBAL",2)~ THEN EXIT
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Actually, I was looking into the fate of one of your customers, who died shortly after an experience with a companion.~ GOTO WhatTheFuck
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Very well.~ GOTO DontComeBack
END

IF WEIGHT #0 ~Global("EscortBusy","AR0406",1)
~ THEN BEGIN 18 // from:
  SAY #60561 /* ~I am sorry, we are busy right now.  You will have to come back later.~ */
  IF ~!Global("D0Succubus","GLOBAL",2)~ THEN EXIT
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Actually, I was looking into the fate of one of your customers, who died shortly after an experience with a companion.~ GOTO WhatTheFuck
  IF ~Global("D0Succubus","GLOBAL",2)~ THEN REPLY ~Very well.~ GOTO ComeBack
END
END

APPEND MADAM
IF ~~ THEN BEGIN ComeBack
SAY ~Do return.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN DontComeBack
SAY ~Thank you.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN WhatTheFuck
SAY ~Don't tell me, it was that fool who came stumbling to me claiming one of the girls had "done something to him"?~
= ~You must understand, my <LADYLORD>, there are many users of the Lotus here. It is not unusual for one to feel disorientated or exhausted when leaving the Coronet.~
IF ~~ THEN REPLY ~All the same, I'd like to meet the girl in question.~ GOTO FineFine
IF ~~ THEN REPLY ~I imagine it wouldn't reflect well if the authorities heard about this man's fate. Now, perhaps I could meet the girl?~ GOTO FineFine
END

IF ~~ THEN BEGIN FineFine
SAY ~Fine, as you wish. The girl's name is Ibraxxi. First room on the right. Don't be long-- I'm not wasting paying customers' time.~
IF ~~ THEN DO ~SetGlobal("D0Succubus","GLOBAL",3)~ EXIT
END

IF WEIGHT #-1 ~Global("D0Succubus","GLOBAL",3)~ THEN BEGIN Hurry
SAY ~Be quick speaking with Ibraxxi. I'm not wasting paying customers' time.~
IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("D0Succubus","GLOBAL",4)~ THEN BEGIN Over
SAY ~I heard the commotion from Ibraxxi's room. It seems I must thank you. She would not have been good for business.~
= ~Perhaps I can interest you in a companion as an expression of goodwill? Are you interested?~
END
END

BEGIN D0SUCSUC
IF ~NumTimesTalkedTo(0)~ THEN BEGIN Suc1
SAY ~You?! *hiss* How did you track me down, mortal?~
IF ~~ THEN REPLY ~You know me? How?!~ GOTO Suc2
IF ~OR(2)
CheckStatGT(LastTalkedToBy(Myself),14,WIS)
CheckStatGT(LastTalkedToBy(Myself),12,INT)
!CheckStatGT(LastTalkedToBy(Myself),16,WIS)~ THEN REPLY ~Mortal? You're not from this plane? What are you, woman?~ GOTO Suc3
IF ~CheckStat(LastTalkedToBy(Myself),17,WIS~ THEN REPLY ~Mortal? Draining the life from male victims? You're a succubus, aren't you?~ GOTO Suc4
IF ~CheckStatGT(LastTalkedToBy(Myself),17,WIS~ THEN REPLY ~Mortal? Draining the life from male victims? You're a succubus, aren't you! But how did you get here?~ GOTO Suc4
IF ~~ THEN REPLY ~What did you do to that poor client of yours? He died in the street outside the Coronet.~ GOTO Suc5
IF ~~ THEN REPLY ~Die, murderer!~ GOTO Suc6
END

IF ~~ THEN BEGIN Suc2
SAY ~Yesssssss. I snuck aboard your sphere while you were on Carceri. You brought me to this plane, where I may feasssssst upon males.~
= ~But you made a missssstake following me here, and you will suffer for your error.~
IF ~~ THEN DO ~Polymorph(SIRINE)
SetName(68125)
Enemy()~ EXIT
END
