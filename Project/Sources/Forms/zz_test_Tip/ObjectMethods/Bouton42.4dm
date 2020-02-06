$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		If (Form:C1466.tip.container.shadowOn)
			Form:C1466.tip.container.shadowOn:=False:C215
		Else 
			Form:C1466.tip.container.shadowOn:=True:C214
		End if 
		Form:C1466.tip.Show()
End case 
