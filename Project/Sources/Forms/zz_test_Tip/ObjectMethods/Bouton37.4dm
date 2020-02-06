$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		
		Form:C1466.tip.animation.blink.number:=0
		
		Form:C1466.tip.animation.jump.number:=3
		Form:C1466.tip.animation.jump.duration:=1000  // millisecond(s) /jump
		
		Form:C1466.tip.JumpNumber(3)
		Form:C1466.tip.JumpDuration(1000)
		Form:C1466.tip.JumpOn(50)
		Form:C1466.tip.JumpOffset(20)
		
		Form:C1466.tip.Show()
		
End case 
