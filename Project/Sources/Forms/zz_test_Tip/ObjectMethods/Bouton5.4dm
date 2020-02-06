$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		Form:C1466.tip.BorderSize(Form:C1466.tip.container.borderSize-1)
		Form:C1466.tip.Show()
End case 