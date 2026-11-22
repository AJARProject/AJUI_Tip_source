//%attributes = {"invisible":true}
  // AJUI_Tip_formToUseExist ( $name_form_to_use_t ) -> return
  //
  // $name_form_to_use_t : (text) subform content
  // $exist_b : (boolean) (return) return form exist
  //
  // Check if the form to use in the subform exist

#DECLARE($param1 : Text) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 28.01.19, 10:22:30
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_formToUseExist
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $name_form_to_use_t : Text
var $pos_l : Integer
var $exist_b : Boolean

$name_form_to_use_t:=$param1
If ($name_form_to_use_t="")
	$exist_b:=False
Else 
	ARRAY TEXT($_form_names_t;0)
	
	FORM GET NAMES($_form_names_t;*)
	
	$pos_l:=Find in array($_form_names_t;$name_form_to_use_t)
	
	If ($pos_l>0)
		$exist_b:=True
	Else 
		$exist_b:=False
	End if 
End if 

$result:=$exist_b