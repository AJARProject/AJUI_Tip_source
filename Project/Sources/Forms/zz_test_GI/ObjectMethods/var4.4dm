var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Getting Focus)
		Form.tip.ActivateFadeIn(False)
		Form.tip.ActivateFadeOut(False)
		Form.tip.TargetName("var4")
		Form.tip.TextLabel("Mon premier tip sur Var 3")
		Form.tip.Show()
End case 
