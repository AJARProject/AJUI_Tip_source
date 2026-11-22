//%attributes = {"invisible":true}
  // AJUI_Tip_setSubformName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) name
  // $0 : (text) (return) current subform name
  //
  // Setter/Getter of name of the subform object

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:59:21
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setSubformName
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $name_t : Text

If (Count parameters=0)
	$result:=This.subForm.name
Else 
	$name_t:=$param1
	This.subForm.name:=$name_t
	This.CheckRebuild()
End if 