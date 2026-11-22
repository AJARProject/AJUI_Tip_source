//%attributes = {"invisible":true,"shared":true}
  // AJUI_Tip_clearCache 
  //
  // This method will clear all references to the current process tip instance in the global <>AJUI_Tip_Storage variable

If (False)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 10.07.19, 14:44:28
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_clearCache
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $uuid : Text

If (AJUI_Tip_instances_uuid#Null) & (<>AJUI_Tip_Storage#Null)
	For each ($uuid;AJUI_Tip_instances_uuid)
		OB REMOVE(<>AJUI_Tip_Storage;$uuid)
	End for each 
End if 