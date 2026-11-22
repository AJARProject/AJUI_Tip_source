var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.arrow.position:="bottom"
		Form.tip.CheckRebuild()
End case 
