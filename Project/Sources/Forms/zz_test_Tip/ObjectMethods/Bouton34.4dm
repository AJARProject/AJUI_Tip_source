$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		If (Form:C1466.tip.closeBox.display)
			Form:C1466.tip.CloseBoxDisplay(False:C215)
		Else 
			Form:C1466.tip.CloseBoxSize(8)
			Form:C1466.tip.CloseBoxDisplay(True:C214)
		End if 
		Form:C1466.tip.Show()
End case 
