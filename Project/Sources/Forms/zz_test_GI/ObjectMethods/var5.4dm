var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Getting Focus)
		Form.tip.Hide()
		Form.tip2.TargetName("var5")
		Form.tip2.TextLabel("VAR 5 Var 5")
		Form.tip2.Show()
	: ($evt=On Losing Focus)
		Form.tip2.Hide()
End case 
