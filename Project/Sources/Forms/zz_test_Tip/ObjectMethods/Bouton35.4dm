var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.ArrowPosition("left")
		Form.tip.CheckRebuild()
End case 
