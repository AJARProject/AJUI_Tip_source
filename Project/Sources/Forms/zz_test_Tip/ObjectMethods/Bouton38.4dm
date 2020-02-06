$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		
		Form:C1466.tip.animation.jump.number:=0
		
		Form:C1466.tip.BlinkNumber(5)
		Form:C1466.tip.BlinkDuration(1000)
		Form:C1466.tip.BlinkOn(50)
		
		Form:C1466.tip.Show()
		
End case 
