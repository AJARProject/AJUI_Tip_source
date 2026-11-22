var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.JumpOffset(Form.tip.animation.jump.offset-1)
End case 