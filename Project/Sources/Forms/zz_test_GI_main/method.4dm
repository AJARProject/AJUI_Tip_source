$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Unload:K2:2)
		AJUI_Tip_clearCache 
End case 
