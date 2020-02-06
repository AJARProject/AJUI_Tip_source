//%attributes = {"invisible":true}
  // AJUI_Tip_formToUseExist ( $name_form_to_use_t ) -> return
  //
  // $name_form_to_use_t : (text) subform content
  // $exist_b : (boolean) (return) return form exist
  //
  // Check if the form to use in the subform exist

If (False:C215)
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

C_TEXT:C284($1;$name_form_to_use_t)
C_LONGINT:C283($pos_l)
C_BOOLEAN:C305($exist_b)

$name_form_to_use_t:=$1
If ($name_form_to_use_t="")
	$exist_b:=False:C215
Else 
	ARRAY TEXT:C222($_form_names_t;0)
	
	FORM GET NAMES:C1167($_form_names_t;*)
	
	$pos_l:=Find in array:C230($_form_names_t;$name_form_to_use_t)
	
	If ($pos_l>0)
		$exist_b:=True:C214
	Else 
		$exist_b:=False:C215
	End if 
End if 

$0:=$exist_b