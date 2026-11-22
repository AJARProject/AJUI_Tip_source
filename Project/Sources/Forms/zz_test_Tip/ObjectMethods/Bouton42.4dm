var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		If (Form.tip.container.shadowOn)
			Form.tip.container.shadowOn:=False
		Else 
			Form.tip.container.shadowOn:=True
		End if 
		Form.tip.Show()
End case 
