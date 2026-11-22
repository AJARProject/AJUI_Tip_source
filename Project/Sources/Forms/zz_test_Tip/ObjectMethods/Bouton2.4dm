var $evt : Real
$evt:=Form event code
Case of 
	: ($evt=On Clicked)
		Form.tip.CornerRadius(Form.tip.container.cornerRadius+1)
End case 
