//%attributes = {"invisible":true}
  // AJUI_Tip_init_methods ( $tip_instance ) -> return
  //
  // $tip_instance : (object) tip instance object to initialize the attributes
  //
  // return : (Boolean) (return) return true if no error and if the form exists
  //
  // short_description

If (False:C215)
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

C_OBJECT:C1216($1;$tip_instance_obj)
$tip_instance_obj:=$1

  // check if the host method "AJUI_Tip_getSubFormSize" already exists 
ARRAY TEXT:C222($_methodNames_t;0)
METHOD GET NAMES:C1166($_methodNames_t;*)
$method_t:="AJUI_Tip_getSubFormSize"
$pos_l:=Find in array:C230($_methodNames_t;$method_t)

If ($pos_l>0)
	$tip_instance_obj.subForm.methodGetFormSize:=1  // "AJUI_Tip_getSubFormSize" already exists 
Else 
	If ($tip_instance_obj.subForm.methodGetFormSize=0)
		CONFIRM:C162("AJUI_Tip component needs to create the utility method \"AJUI_Tip_getSubFormSize\" for managing Subform.\r\rDo you authorize the creation of this method?")
		If (OK=0)
			$tip_instance_obj.subForm.methodGetFormSize:=0  // no method "AJUI_Tip_getSubFormSize" exists 
		Else 
			$path_t:=Get 4D folder:C485(Current resources folder:K5:16)
			$getSubFormSizeMethodPath_t:=$path_t+$method_t+".txt"
			  //SHOW ON DISK($getSubFormSizeMethodPath_t)
			If (Test path name:C476($getSubFormSizeMethodPath_t)=Is a document:K24:1)
				$methodContent_t:=Document to text:C1236($getSubFormSizeMethodPath_t)
				METHOD SET CODE:C1194($method_t;$methodContent_t;*)
				METHOD SET ATTRIBUTE:C1192($method_t;Attribute shared:K72:10;True:C214;*)
				$tip_instance_obj.subForm.methodGetFormSize:=1  // "AJUI_Tip_getSubFormSize" exists 
			Else 
				ALERT:C41("Error to load the method \"AJUI_Tip_getSubFormSize\" from the resources folder")
				$tip_instance_obj.subForm.methodGetFormSize:=0  // no method "AJUI_Tip_getSubFormSize" exists 
			End if 
		End if 
	End if 
End if 