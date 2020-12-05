//%attributes = {"invisible":true}
// AJUI_Tip_eventHandlerCB (  )
//
//
// This method handle the events related to the closebox

If (False:C215)
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

C_OBJECT:C1216($tip_instance_obj)
C_LONGINT:C283($MouseX;$MouseY;$currentFormWindow_l)
C_BOOLEAN:C305($tipclosebox_b)
C_TEXT:C284($closeBox_id_t)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		//we use the stored properties
		$tip_instance_obj:=OBJECT Get pointer:C1124(Object named:K67:5;"AJUI_Tip_definition")->
		
		//check display closebox
		If ($tip_instance_obj.closeBox.display)
			
			$MouseX:=MouseX  // X mouse position
			$MouseY:=MouseY  // Y mouse position
			
			// get the object ID where the click was done
			$closeBox_id_t:=SVG Find element ID by coordinates:C1054(*;OBJECT Get name:C1087(Object current:K67:2);$MouseX;$MouseY)
			
			$currentFormWindow_l:=$tip_instance_obj.pu.refWindow
			
			//closebox operations on events
			If ($closeBox_id_t="closebox")
				CALL FORM:C1391($currentFormWindow_l;"AJUI_Tip_hide";$tip_instance_obj)
			End if 
		End if 
End case 