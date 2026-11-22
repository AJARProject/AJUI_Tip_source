var $evt : Real
$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Unload)
		AJUI_Tip_clearCache 
End case 
