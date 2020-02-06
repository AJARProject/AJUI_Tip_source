$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		If (Form:C1466.tip.subForm.name="")
			Form:C1466.tip.SubformName("zz_fakeCalendar")
		Else 
			Form:C1466.tip.SubformName("")
		End if 
End case 
