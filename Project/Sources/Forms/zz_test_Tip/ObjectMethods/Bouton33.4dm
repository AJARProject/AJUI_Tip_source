$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		If (Form:C1466.tip.debug.showSvgArea)
			Form:C1466.tip.debug.showSvgArea:=False:C215
		Else 
			Form:C1466.tip.debug.showSvgArea:=True:C214
		End if 
		Form:C1466.tip.Show()
End case 
