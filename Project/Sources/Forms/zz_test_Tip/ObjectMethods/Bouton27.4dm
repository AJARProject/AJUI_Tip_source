var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		If (Form.tip.subForm.name="")
			Form.tip.SubformName("zz_fakeCalendar")
		Else 
			Form.tip.SubformName("")
		End if 
End case 
