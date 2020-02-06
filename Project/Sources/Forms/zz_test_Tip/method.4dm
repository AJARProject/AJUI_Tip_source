$evt:=Form event code:C388
Case of 
	: ($evt=On Load:K2:1)
		
		Form:C1466.tip:=New AJUI_Tip 
		Form:C1466.tip.TargetName("Test_tip")
		Form:C1466.tip.TipName("Test1")
		Form:C1466.tip.AutoRebuild(True:C214)
		
		Form:C1466.tip.TextLabel("<SPAN STYLE=\"font-size:18pt\">Hello </SPAN>"+"<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">World</SPAN>"+"<SPAN STYLE=\"font-size:36pt\">!</SPAN><BR/>"+"<SPAN STYLE=\"font-size:19pt;font-style:italic\">It's </SPAN>"+"<SPAN STYLE=\"font-size:24pt\">Monday</SPAN>")
		
End case 

