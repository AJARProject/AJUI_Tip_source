var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.BorderSize(Form.tip.container.borderSize+1)
		Form.tip.Show()
End case 