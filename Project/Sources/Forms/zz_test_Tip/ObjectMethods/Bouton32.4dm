$evt:=Form event code:C388
Case of 
	: ($evt=On Clicked:K2:4)
		If (Form:C1466.tip.debug.showSVGViewer)
			Form:C1466.tip.debug.showSVGViewer:=False:C215
		Else 
			Form:C1466.tip.debug.showSVGViewer:=True:C214
		End if 
End case 
