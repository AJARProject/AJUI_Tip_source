//%attributes = {"invisible":true}
  // AJUI_Tip_setTargetName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) name
  // $0 : (text) (return) current target name
  //
  // Setter/Getter of the name of the target

If (False:C215)
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

C_TEXT:C284($0;$1;$name_t)

If (Count parameters:C259=0)
	$0:=This:C1470.target.name
Else 
	$name_t:=$1
	This:C1470.target.name:=$name_t
	This:C1470.CheckRebuild()
End if 
