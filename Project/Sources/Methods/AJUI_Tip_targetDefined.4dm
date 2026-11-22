//%attributes = {"invisible":true}
  // AJUI_Tip_targetDefined ( $target_name_t ) -> return
  //
  // $target_name_t : (text) Name of the target object
  // $isDefined_b : (boolean) (return) return target defined
  //
  // This method check if the target object exist in the current form

#DECLARE($param1 : Text) -> $result : Boolean

If (False)
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

var $target_name_t : Text
var $isDefined_b; $tipExists : Boolean

$target_name_t:=$param1
$isDefined_b:=False


If ($target_name_t#"")
	ARRAY TEXT($_objectNames_t;0)
	FORM GET OBJECTS($_objectNames_t;Form current page)
	$tipExists:=Find in array($_objectNames_t;$target_name_t)>0
	If ($tipExists)  //target object exists
		$isDefined_b:=True
	End if 
End if 

$result:=$isDefined_b