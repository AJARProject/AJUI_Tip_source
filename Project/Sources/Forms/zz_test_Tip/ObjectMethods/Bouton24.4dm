var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.arrow.position:="top"
		Form.tip.CheckRebuild()
End case 
