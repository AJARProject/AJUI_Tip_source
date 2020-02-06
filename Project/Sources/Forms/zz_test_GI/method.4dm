$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		If (Form:C1466.name=Null:C1517)
			Form:C1466.name:="SF"
		End if 
		
		Form:C1466.tip:=New AJUI_Tip 
		Form:C1466.tip.TipName(Form:C1466.name+"_mainTip")
		Form:C1466.tip.TipPosition("bottom-left")
		Form:C1466.tip.TextFontSize(20)
		Form:C1466.tip.TextFontName("Verdana")
		Form:C1466.tip.TextFontColor("#FFFFFF")
		Form:C1466.tip.TargetMargin(10)
		  //Form.tip.TextOpacity(50)
		
		Form:C1466.tip.CornerRadius(0)
		Form:C1466.tip.Padding(10)
		
		Form:C1466.tip.BorderSize(3)
		Form:C1466.tip.BorderColor("red")
		  //Form.tip.BorderOpacity(25)
		Form:C1466.tip.ActivateShadow(True:C214)
		Form:C1466.tip.ShadowOffset(6)
		Form:C1466.tip.BackgroundColor("#191970")
		Form:C1466.tip.BackgroundOpacity(100)
		
		
		
		Form:C1466.tip.CloseBoxDisplay(True:C214)
		  //Form.tip.CloseBoxSize(20)
		Form:C1466.tip.TimerFadeIn(1000)
		Form:C1466.tip.TimerFadeOut(1000)
		  //Form.tip.AutoRebuild(True)
		
		Form:C1466.tip2:=New AJUI_Tip (Form:C1466.tip)
		Form:C1466.tip2.TipName("tip2")
		Form:C1466.tip2.ActivateFadeIn(True:C214)
		Form:C1466.tip2.ActivateFadeOut(True:C214)
	: ($evt=On Unload:K2:2)
		AJUI_Tip_clearCache 
		
End case 
