//%attributes = {"invisible":true}
  // AJUI_Tip_durationHandler ( $tip_instance_UUID )
  //
  // $tip_instance_UUID : (text) UUID of the tip instance
  //
  // This method will hide the tip after the duration defined

#DECLARE($param1 : Text)

If (False)
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

var $tip_instance_UUID : Text
var $tip_instance_obj : Object
var $higherOpacity_l : Integer

$tip_instance_UUID:=$param1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]


If (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False)
	While (Milliseconds<Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_endDuration"]) & (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False)
		DELAY PROCESS(Current process;1)
	End while 
	If (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False)
		CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_hide";$tip_instance_obj)
	End if 
End if 
$tip_instance_obj.global.tipDurationHandlerActive:=False