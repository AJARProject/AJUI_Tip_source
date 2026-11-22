var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.TargetOffset(Form.tip.target.offset+1)
End case 