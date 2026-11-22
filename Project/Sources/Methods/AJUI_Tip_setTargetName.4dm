//%attributes = {"invisible":true}
  // AJUI_Tip_setTargetName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) name
  // $0 : (text) (return) current target name
  //
  // Setter/Getter of the name of the target

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 17:00:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTargetName
	  // Description
	  // The form object targetted will be linked to the tip
	  //
	  // ----------------------------------------------------
End if 

var $name_t : Text

If (Count parameters=0)
	$result:=This.target.name
Else 
	$name_t:=$param1
	This.target.name:=$name_t
	This.CheckRebuild()
End if 
