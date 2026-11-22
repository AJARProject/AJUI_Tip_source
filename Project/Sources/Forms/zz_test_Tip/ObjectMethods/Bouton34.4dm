var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		If (Form.tip.closeBox.display)
			Form.tip.CloseBoxDisplay(False)
		Else 
			Form.tip.CloseBoxSize(8)
			Form.tip.CloseBoxDisplay(True)
		End if 
		Form.tip.Show()
End case 
