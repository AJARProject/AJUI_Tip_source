$evt:=Form event code:C388

Case of 
	: ($evt=On Getting Focus:K2:7)
		Form:C1466.tip.ActivateFadeIn(False:C215)
		Form:C1466.tip.ActivateFadeOut(False:C215)
		Form:C1466.tip.TargetName("var4")
		Form:C1466.tip.TextLabel("Mon premier tip sur Var 3")
		Form:C1466.tip.Show()
End case 
