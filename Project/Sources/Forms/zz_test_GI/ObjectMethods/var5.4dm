$evt:=Form event code:C388

Case of 
	: ($evt=On Getting Focus:K2:7)
		Form:C1466.tip.Hide()
		Form:C1466.tip2.TargetName("var5")
		Form:C1466.tip2.TextLabel("VAR 5 Var 5")
		Form:C1466.tip2.Show()
	: ($evt=On Losing Focus:K2:8)
		Form:C1466.tip2.Hide()
End case 
