var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Getting Focus)
		Form.tip.TargetName("var1")
		Form.tip.TextLabel("Mon premier tip sur Var 1")
		Form.tip.Show()
End case 
