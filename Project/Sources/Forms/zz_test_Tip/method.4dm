var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Load)
		
		Form.tip:=New AJUI_Tip 
		Form.tip.TargetName("Test_tip")
		Form.tip.TipName("Test1")
		Form.tip.AutoRebuild(True)
		
		Form.tip.TextLabel("<SPAN STYLE=\"font-size:18pt\">Hello </SPAN>"+"<SPAN STYLE=\"font-size:24pt;font-weight:bold;color:#D81E05\">World</SPAN>"+"<SPAN STYLE=\"font-size:36pt\">!</SPAN><BR/>"+"<SPAN STYLE=\"font-size:19pt;font-style:italic\">It's </SPAN>"+"<SPAN STYLE=\"font-size:24pt\">Monday</SPAN>")
		
End case 

