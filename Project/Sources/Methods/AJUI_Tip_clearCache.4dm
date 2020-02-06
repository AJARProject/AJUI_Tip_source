//%attributes = {"invisible":true,"shared":true}
  // AJUI_Tip_clearCache 
  //
  // This method will clear all references to the current process tip instance in the global <>AJUI_Tip_Storage variable

If (False:C215)
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

C_TEXT:C284($uuid)

If (AJUI_Tip_instances_uuid#Null:C1517) & (<>AJUI_Tip_Storage#Null:C1517)
	For each ($uuid;AJUI_Tip_instances_uuid)
		OB REMOVE:C1226(<>AJUI_Tip_Storage;$uuid)
	End for each 
End if 