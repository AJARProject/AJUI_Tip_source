$evt:=Form event code:C388

Case of 
	: ($evt=On Clicked:K2:4)
		Form:C1466.tip.TargetName("var2")
		Form:C1466.tip.TextLabel("Mon premier tip sur Var 2")
		Form:C1466.tip.Show()
End case 