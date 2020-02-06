$evt:=Form event code:C388

Case of 
	: ($evt=On Getting Focus:K2:7)
		Form:C1466.tip.TargetName("var1")
		Form:C1466.tip.TextLabel("Mon premier tip sur Var 1")
		Form:C1466.tip.Show()
End case 
