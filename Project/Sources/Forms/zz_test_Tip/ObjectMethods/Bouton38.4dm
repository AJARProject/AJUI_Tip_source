var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		
		Form.tip.animation.jump.number:=0
		
		Form.tip.BlinkNumber(5)
		Form.tip.BlinkDuration(1000)
		Form.tip.BlinkOn(50)
		
		Form.tip.Show()
		
End case 
