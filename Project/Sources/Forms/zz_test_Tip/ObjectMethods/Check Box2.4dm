var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Clicked)
		Form.tip.CheckRebuild()
		Form.tip.Show()
		
End case 
