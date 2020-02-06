//%attributes = {"invisible":true,"shared":true}
  // New AJUI_Tip ( { $tip_description } ) -> return $tip_instance
  //
  // $tip_description : (object) (optional) description
  // $tip_instance : (object) (return) tip instance
  //
  // Constructor of an AJUI_Tip type object. Return a new instance of AJUI_Tip object.

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 22.01.19, 13:29:32
	  // ----------------------------------------------------
	  // Method: New AJUI_Tip
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$1;$template_obj)

If (Count parameters:C259=1)
	$template_obj:=$1
	If ($template_obj.templatePath=Null:C1517)
		$instance_obj:=AJUI_Tip_templateImport ($template_obj.templateName)
	Else 
		$instance_obj:=AJUI_Tip_templateImport ($template_obj.templateName;$template_obj.templatePath)
	End if 
	
	If ($instance_obj.failImport)
		
		$instance_obj:=New object:C1471
	End if 
Else 
	$instance_obj:=New object:C1471
End if 

AJUI_Tip_init_attributes ($instance_obj)
AJUI_Tip_init_animation ($instance_obj)
AJUI_Tip_init_formulas ($instance_obj)
AJUI_Tip_init_methods ($instance_obj)


$0:=$instance_obj