var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		If (Form.tip.debug.showSvgArea)
			Form.tip.debug.showSvgArea:=False
		Else 
			Form.tip.debug.showSvgArea:=True
		End if 
		Form.tip.Show()
End case 
