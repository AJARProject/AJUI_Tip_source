var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		
		Form.tip.animation.blink.number:=0
		
		Form.tip.animation.jump.number:=3
		Form.tip.animation.jump.duration:=1000  // millisecond(s) /jump
		
		Form.tip.JumpNumber(3)
		Form.tip.JumpDuration(1000)
		Form.tip.JumpOn(50)
		Form.tip.JumpOffset(20)
		
		Form.tip.Show()
		
End case 
