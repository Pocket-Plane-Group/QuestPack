INTERJECT D0LENDER LE_8 D0KetoCommentsLenderMethods
== FWKETOJ IF ~IsValidForPartyDialog("Keto")~ THEN @453
END D0LENDER LE_8a_2

INTERJECT_COPY_TRANS D0LENDER LE_45 D0KetoCommentLenderExit
== FWKETOJ IF ~IsValidForPartyDialog("Keto")~ THEN @454
END

INTERJECT_COPY_TRANS D0POOR PO_10 D0KetoCommentPoor
== FWKETOJ IF ~IsValidForPartyDialog("Keto")
!IsValidForPartyDialog("Viconia")~ THEN @455
== FWKETOJ IF ~IsValidForPartyDialog("Keto")
!IsValidForPartyDialog("Viconia")~ THEN @456
END

INTERJECT_COPY_TRANS VICONIJ PO_10a D0KetoCommentPoor2
== FWKETOJ IF ~IsValidForPartyDialog("Keto")~ THEN @455
== VICONIJ IF ~IsValidForPartyDialog("Keto")
IsValidForPartyDialog("Viconia")~ THEN @457
== FWKETOJ IF ~IsValidForPartyDialog("Keto")
IsValidForPartyDialog("Viconia")~ THEN @458
== FWKETOJ IF ~IsValidForPartyDialog("Keto")~ THEN @456
== VICONIJ IF ~IsValidForPartyDialog("Keto")
IsValidForPartyDialog("Viconia")~ THEN @459
END
