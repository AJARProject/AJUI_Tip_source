var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Load)
		
		If (Form.name=Null)
			Form.name:="SF"
		End if 
		
		Form.tip:=New AJUI_Tip 
		Form.tip.TipName(Form.name+"_mainTip")
		Form.tip.TipPosition("bottom-left")
		Form.tip.TextFontSize(20)
		Form.tip.TextFontName("Verdana")
		Form.tip.TextFontColor("#FFFFFF")
		Form.tip.TargetMargin(10)
		  //Form.tip.TextOpacity(50)
		
		Form.tip.CornerRadius(0)
		Form.tip.Padding(10)
		
		Form.tip.BorderSize(3)
		Form.tip.BorderColor("red")
		  //Form.tip.BorderOpacity(25)
		Form.tip.ActivateShadow(True)
		Form.tip.ShadowOffset(6)
		Form.tip.BackgroundColor("#191970")
		Form.tip.BackgroundOpacity(100)
		
		
		
		Form.tip.CloseBoxDisplay(True)
		  //Form.tip.CloseBoxSize(20)
		Form.tip.TimerFadeIn(1000)
		Form.tip.TimerFadeOut(1000)
		  //Form.tip.AutoRebuild(True)
		
		Form.tip2:=New AJUI_Tip (Form.tip)
		Form.tip2.TipName("tip2")
		Form.tip2.ActivateFadeIn(True)
		Form.tip2.ActivateFadeOut(True)
	: ($evt=On Unload)
		AJUI_Tip_clearCache 
		
End case 
