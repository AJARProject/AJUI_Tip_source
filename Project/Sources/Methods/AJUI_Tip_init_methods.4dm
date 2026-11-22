//%attributes = {"invisible":true}
  // AJUI_Tip_init_methods ( $tip_instance ) -> return
  //
  // $tip_instance : (object) tip instance object to initialize the attributes
  //
  // return : (Boolean) (return) return true if no error and if the form exists
  //
  // short_description

#DECLARE($param1 : Object)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 14.03.19, 10:02:25
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_init_methods
	  // Description
	  // This method is checking if the methods AJUI_Tip_getSubformSize
	  // exists. If it doesn't exist it will create it.
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_obj : Object
var $method_t; $path_t; $getSubFormSizeMethodPath_t; $methodContent_t : Text
var $pos_l : Real
$tip_instance_obj:=$param1

  // check if the host method "AJUI_Tip_getSubFormSize" already exists 
ARRAY TEXT($_methodNames_t;0)
METHOD GET NAMES($_methodNames_t;*)
$method_t:="AJUI_Tip_getSubFormSize"
$pos_l:=Find in array($_methodNames_t;$method_t)

If ($pos_l>0)
	$tip_instance_obj.subForm.methodGetFormSize:=1  // "AJUI_Tip_getSubFormSize" already exists 
Else 
	If ($tip_instance_obj.subForm.methodGetFormSize=0)
		CONFIRM("AJUI_Tip component needs to create the utility method \"AJUI_Tip_getSubFormSize\" for managing Subform.\r\rDo you authorize the creation of this method?")
		If (OK=0)
			$tip_instance_obj.subForm.methodGetFormSize:=0  // no method "AJUI_Tip_getSubFormSize" exists 
		Else 
			$path_t:=Get 4D folder(Current resources folder)
			$getSubFormSizeMethodPath_t:=$path_t+$method_t+".txt"
			  //SHOW ON DISK($getSubFormSizeMethodPath_t)
			If (Test path name($getSubFormSizeMethodPath_t)=Is a document)
				$methodContent_t:=Document to text($getSubFormSizeMethodPath_t)
				METHOD SET CODE($method_t;$methodContent_t;*)
				METHOD SET ATTRIBUTE($method_t;Attribute shared;True;*)
				$tip_instance_obj.subForm.methodGetFormSize:=1  // "AJUI_Tip_getSubFormSize" exists 
			Else 
				ALERT("Error to load the method \"AJUI_Tip_getSubFormSize\" from the resources folder")
				$tip_instance_obj.subForm.methodGetFormSize:=0  // no method "AJUI_Tip_getSubFormSize" exists 
			End if 
		End if 
	End if 
End if 