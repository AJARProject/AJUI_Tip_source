//%attributes = {"invisible":true}
  // AJUI_Tip_targetDefined ( $target_name_t ) -> return
  //
  // $target_name_t : (text) Name of the target object
  // $isDefined_b : (boolean) (return) return target defined
  //
  // This method check if the target object exist in the current form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.01.19, 09:20:56
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_targetDefined
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$target_name_t)
C_BOOLEAN:C305($0;$isDefined_b;$tipExists)

$target_name_t:=$1
$isDefined_b:=False:C215


If ($target_name_t#"")
	ARRAY TEXT:C222($_objectNames_t;0)
	FORM GET OBJECTS:C898($_objectNames_t;Form current page:K67:6)
	$tipExists:=Find in array:C230($_objectNames_t;$target_name_t)>0
	If ($tipExists)  //target object exists
		$isDefined_b:=True:C214
	End if 
End if 

$0:=$isDefined_b