var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		If (Form.tip.debug.showSVGViewer)
			Form.tip.debug.showSVGViewer:=False
		Else 
			Form.tip.debug.showSVGViewer:=True
		End if 
End case 
