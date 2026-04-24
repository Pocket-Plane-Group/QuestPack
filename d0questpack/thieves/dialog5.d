/* Priest of Cyric:
- Should respond to Short Sword of Mask. (Ask you to hand it over to be destroyed/converted by Cyric?)

IF ~OR(12)
HasItemEquiped("sw1h58",Player1)
HasItemEquiped("sw1h58",Player2)
HasItemEquiped("sw1h58",Player3)
HasItemEquiped("sw1h58",Player4)
HasItemEquiped("sw1h58",Player5)
HasItemEquiped("sw1h58",Player6)
HasItemEquiped("sw1h59",Player1)
HasItemEquiped("sw1h59",Player2)
HasItemEquiped("sw1h59",Player3)
HasItemEquiped("sw1h59",Player4)
HasItemEquiped("sw1h59",Player5)
HasItemEquiped("sw1h59",Player6)~ THEN BEGIN Sword
SAY ~You carry a weapon of the Shadowlord, Mask. In Cyric's name, it must be destroyed.

~Worthless follower of Mask! Begone, and rest assured that you will not carry that blade for long!~ // Quest unavailable */
