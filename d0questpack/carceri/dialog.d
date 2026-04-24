REPLACE LAVOK
IF WEIGHT #7 /* Triggers after states #: 57 even though they appear after this state */
~Global("ToldDemonsHeart","GLOBAL",1)
!PartyHasItem("MISC6M")~ THEN BEGIN 55 // from:
  SAY #37285 /* ~You must find the heart of a demon, you must!!  It...it must be strong enough to power the sphere!  Go, <RACE>!~ [LAVOK12] */
  IF ~!PartyHasItem("D0MISC6M")~ THEN EXIT
  IF ~PartyHasItem("D0MISC6M")~ THEN REPLY ~I have a devil's heart.  Will that do instead?~ DO ~SetGlobal("D0DevilHeart","LOCALS",1)~ GOTO 56
END

IF WEIGHT #8 /* Triggers after states #: 57 even though they appear after this state */
~Global("ToldDemonsHeart","GLOBAL",1)
OR(2)
PartyHasItem("MISC6M")
PartyHasItem("D0MISC6M")
OR(2)
PartyHasItem("MISC6M")
Global("D0DevilHeart","LOCALS",1)~ THEN BEGIN 56 // from:
  SAY #37286 /* ~Yes...yes!  That heart will do!  Go to the engine room...and place it within the golem!  Go, quickly!~ [LAVOK13] */
  IF ~~ THEN EXIT
END
END

BEGIN D0YUGOLE
IF ~NumTimesTalkedTo(0)~ THEN BEGIN YU_1
SAY ~I sense power withing you, mortal. Stay your weapons, for I have a proposal, if you will.~
IF ~~ THEN REPLY ~I will hear you, but be quick with what you have to say.~
IF ~~ THEN REPLY ~
IF ~!Alignment(Player1,MASK_EVIL)~ THEN REPLY ~In the name of all that is right, I shall strike you down, fiend!~
IF ~~ THEN REPLY ~No thanks. I'd sooner rip your heart out.~
END

IF ~~ THEN BEGIN YU_2
SAY ~Do you know of the Blood War, mortal? The eternal struggle between the Baatezu and Tanar'ri? Near here, a battle rages, and will continue to do so until one group-- or both-- falls.~
= ~They fight over a rare treasure, of which there are few scattered across the planes: a power crystal for a most deadly weapon.~
= ~Time is of the utmost importance, for even now the Godsmen in Sigil near completion of the weapon commissioned by the Baatezu to end the Blood War once and for all.~
IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO YU_2a
IF ~Alignment(Player1,MASK_GENEUTRAL)
!Alignment(Player1,CHAOTIC_NEUTRAL)~ THEN GOTO YU_2b
IF ~Alignment(Player1,CHAOTIC_NEUTRAL)~ THEN GOTO YU_2c
IF ~Alignment(Player1,MASK_EVIL)
!Alignment(Player1,CHAOTIC_EVIL)~ THEN GOTO YU_2d
IF ~Alignment(Player1,CHAOTIC_EVIL)~ THEN GOTO YU_2e
END

IF ~~ THEN BEGIN YU_2a
SAY ~You have the opportunity to prevent the deaths of many creatures, for if the weapon would kill every last Tanar'ri in existance. YOU, mortal, may prevent this. Is that not the path of righteousness?~
= ~The crystal lies on the battlefield between the armies. Retrieve it, and bring it here.~
IF ~~ THEN REPLY ~Prevent the deaths of fiends? That doesn't sound terribly righteous to me.
IF ~~ THEN REPLY ~But if the war continues, just as many creatures, if not more, will die.

IF ~~ THEN BEGIN YU_2a_2
SAY ~And if the Blood War ends now, the armies of Baatezu will march the planes, destroying all that lies before them. Even Mount Celestia would not hold against such a mighty infernal host. Do you not find that a more compelling reason?~


IF ~~ THEN BEGIN YU_2b
SAY ~Such a weapon would disrupt the balance across the planes, for such neutrality is maintained only by the eternal conflict.~
= ~The crystal lies on the battlefield between the armies. Retrieve it, and bring it here.~
IF ~~ THEN REPLY ~All fiends are an affront to the natural balance.
IF ~~ THEN REPLY ~I have no interest in maintaining balance or neutrality. I'd rather see every last fiend die.~ GOTO YU_2b_2

IF ~~ THEN BEGIN YU_2b_2
SAY ~And that would be the ultimate outcome, if the war continues, for with either side equally matched, the only possible outcome is mutual annihilation. But if the Baatezu gain supremacy, they will survive to wreak havoc across the multiverse.~
~If the Blood War ends now, the armies of Baatezu will march the planes, destroying all the lies before them. Nature, balance, and all that is right and true would be trampled beneath the might of such an infernal host.~

IF ~~ THEN BEGIN YU_2b_3
SAY ~And if the Blood War ends now, the armies of Baatezu will march the planes, destroying all that lies before them. Nature, balance, and all that is right and true would be trampled beneath the might of such an infernal host.~


IF ~~ THEN BEGIN YU_2c
SAY ~The Blood War is a pinnacle of sheer chaos-- revel in it mortal. I can feel its pull on you. But if the Baatezu triumph, the chaos will end, and a malignant order will descend across the planes as armies of Baatezu overcome all opposition.~


IF ~~ THEN BEGIN YU_2d
SAY ~As long as the Blood War continues, the Tanar'ri and Baatezu are occupied, and others may reap the benefits. I know you can associate with this, mortal. I feel the thirst for power that flows in your blood.~
= ~But if the Baaetzu emerge supreme, their armies will march the planes, and we will be naught but servants. Do not let it end, for your own sake!~


IF ~~ THEN BEGIN YU_2e
SAY ~The Blood War represents the ultimate manifestation of chaos and destruction-- revel in it mortal. I can feel its pull on you; I can sense your attraction to the endless slaughter of the war. Do not let it end!~



If player refuses to give component to anybody but takes it into the Planar Sphere and transports it away for safekeeping:
~You truly think you will evade them, mortal? The Baatezu will seek you out, across the planes, and take it from you. There is no hiding from them-- ultimately, you will suffer.~
= ~For the one component you withold, I will track down a thousand more to mock your efforts. Harbour no doubt: if our paths cross again, I will rip your flesh from the feeble bone upon with it sits.~

If player expresses pride at having done a good deed after giving him the crytal:
~You truly think you have made a difference this day, mortal? There are billions more crystals throughout the planes, and the Baatzeu will simply seek out another-- the fate of a single minor component is near insignificant.~
= ~Your part here is done, and you served the Yugoleth well, but know that your efforts furthered no greater good. For the one component you salvaged, I will track down a thousand more to mock your efforts.~
= ~I spit upon your heroic endeavours, and harbour no doubt: if our paths cross again, I will rip your flesh from the feeble bone upon with it sits.~

If the player gives the component to the baatezu or tanar'ri:
~You truly think you have made a difference this day, mortal? There are billions more crystals throughout the planes, and one alone is near insignificant in the construction of the weapon.~
= ~For the one component you salvaged, I will track down a thousand more to mock your efforts-- did you really think you could make any difference to the schemes of the Yugoleth and the course of the Blood War?~
= ~Harbour no doubt: if our paths cross again, I will rip your flesh from the feeble bone upon with it sits.~

Somewhere needs to be noted that it's in the interests of the Yugoleth (plural) to continue the Blood War.

Allow option for player to refuse to hand crystal over to any of the demons, in which case they attack him/her.

Somebody should note that demons can't be trusted. "Don't believe their lies."


On refusal by paladin: ~But can you do that, noble knight, knowing that millions more will die if not for your intervention?~
Player can argue that millions die either way, and so on.



Persuasion to a good priest: Winning fiends wage war on upper planes, mighty battle at gates of Mount Celestia, celestial beings outnumbered by fiends.


NOTE: Ensure it starts dialogue with Player1!
