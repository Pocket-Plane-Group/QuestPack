INTERJECT_COPY_TRANS D0LENDER LE_6a D0KelseyCommentsCelile
== J#KLSYJ IF ~IsValidForPartyDialog("J#Kelsey")~ THEN @446
END

INTERJECT_COPY_TRANS D0POOR PO_2_LetKelseyTalk D0KelseyCommentsPoor
== J#KLSYJ IF ~IsValidForPartyDialog("J#Kelsey")~ THEN @447
END

INTERJECT_COPY_TRANS D0POOR PO_7 D0KelseyCommentsPoor2
== J#KLSYJ IF ~IsValidForPartyDialog("J#Kelsey")~ THEN @448
END

EXTEND_BOTTOM SURLY SU_7
IF ~IsValidForPartyDialog("J#Kelsey")
Global("D0KelseyCommentsSurly","GLOBAL",0)~ THEN DO ~SetGlobal("D0KelseyCommentsSurly","GLOBAL",1)~ EXTERN J#KLSYJ KelseySurly
END

APPEND J#KLSYJ
IF ~~ THEN BEGIN KelseySurly
SAY @449
IF ~~ THEN REPLY @450 EXTERN SURLY SU_6
IF ~~ THEN REPLY @451 DO ~SetGlobal("Third","LOCALS",1)~ EXTERN SURLY SU_8
IF ~~ THEN REPLY @452 EXTERN SURLY SU_4
END
END
