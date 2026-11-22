var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Getting Focus)
		Form.tip.TargetName("var2")
		Form.tip.TextLabel("Mon premier tip sur Var 2")
		Form.tip.Show()
End case 
