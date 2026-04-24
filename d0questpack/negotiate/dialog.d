EXTEND_BOTTOM UDSILVER 20
IF ~~ THEN REPLY ~Your hoard must be vast indeed. Perhaps you would be interested in trading for anything of interest I might have?~ GOTO AdalonTrade
END

APPEND UDSILVER
IF ~~ THEN BEGIN AdalonTrade
SAY ~Do not change the subject. I have no interest in feeding your petty greed. I offer you a reward from my hoard, but nothing more.~
  IF ~~ THEN REPLY #51427 /* ~I would offer to help you even if there were no reward. ~ */ GOTO 22
  IF ~~ THEN REPLY #51428 /* ~You ask me to oppose a force that you will not? This is a suicide mission!~ */ GOTO 23
  IF ~~ THEN REPLY #51429 /* ~I wonder what it is that you think I can do? You ask me to face an entire Drow city.~ */ GOTO 23
  IF ~~ THEN REPLY ~Then perhaps I should just take what I wish from your hoard.~ GOTO 21
END
END

EXTEND_BOTTOM FIRKRA02 8 26
IF ~Global("D0FirkraagTrade","LOCALS",0)~ THEN REPLY ~Wait! Surely such a mighty creature as yourself has an impressive hoard. Perhaps we could perform an exchange; I may have items of interest to you.~ GOTO FirkraagTrade
END

APPEND FIRKRA02
IF ~~ THEN BEGIN FirkraagTrade
SAY ~ */

// If you go on to get the Windspear Hills deed for him, he gives back the item you gave him instead of giving the cloak.
