//%attributes = {"invisible":true}
  // AJUI_Tip_durationHandler ( $tip_instance_UUID )
  //
  // $tip_instance_UUID : (text) UUID of the tip instance
  //
  // This method will hide the tip after the duration defined

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 10.07.19, 16:05:40
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_durationHandler
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$tip_instance_UUID)
C_OBJECT:C1216($tip_instance_obj)
C_LONGINT:C283($higherOpacity_l)

$tip_instance_UUID:=$1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]


If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False:C215)
	While (Milliseconds:C459<Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_endDuration"]) & (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False:C215)
		DELAY PROCESS:C323(Current process:C322;1)
	End while 
	If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False:C215)
		CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_hide";$tip_instance_obj)
	End if 
End if 
$tip_instance_obj.global.tipDurationHandlerActive:=False:C215