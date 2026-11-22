//%attributes = {"invisible":true}
// AJUI_Tip_eventHandlerCB (  )
//
//
// This method handle the events related to the closebox

If (False)
	// ----------------------------------------------------
	// User name (OS): Gary Criblez
	// Date and time: 07.02.19, 10:08:16
	// @private
	// ----------------------------------------------------
	// Method: AJUI_Tip_eventHandlerCB
	// Description
	// 
	//
	// ----------------------------------------------------
End if 

var $tip_instance_obj : Object
var $MouseX; $MouseY; $currentFormWindow_l : Integer
var $tipclosebox_b : Boolean
var $closeBox_id_t : Text

Case of 
	: (Form event code=On Clicked)
		
		//we use the stored properties
		$tip_instance_obj:=OBJECT Get pointer(Object named;"AJUI_Tip_definition")->
		
		//check display closebox
		If ($tip_instance_obj.closeBox.display)
			
			$MouseX:=MouseX  // X mouse position
			$MouseY:=MouseY  // Y mouse position
			
			// get the object ID where the click was done
			$closeBox_id_t:=SVG Find element ID by coordinates(*;OBJECT Get name(Object current);$MouseX;$MouseY)
			
			$currentFormWindow_l:=$tip_instance_obj.pu.refWindow
			
			//closebox operations on events
			If ($closeBox_id_t="closebox")
				CALL FORM($currentFormWindow_l;"AJUI_Tip_hide";$tip_instance_obj)
			End if 
		End if 
End case 