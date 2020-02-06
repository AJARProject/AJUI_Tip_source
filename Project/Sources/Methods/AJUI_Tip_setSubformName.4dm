//%attributes = {"invisible":true}
  // AJUI_Tip_setSubformName ( $name_t ) 
  //
  // $name_t : (text) Subform name
  //
  // Setter/Getter of name of the subform object

If (False:C215)
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

C_TEXT:C284($0;$1;$name_t)

If (Count parameters:C259=0)
	$0:=This:C1470.subForm.name
Else 
	$name_t:=$1
	This:C1470.subForm.name:=$name_t
	This:C1470.CheckRebuild()
End if 