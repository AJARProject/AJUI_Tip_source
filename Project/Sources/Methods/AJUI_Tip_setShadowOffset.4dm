//%attributes = {"invisible":true}
  // AJUI_Tip_setShadowOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current offset
  //
  // Setter/Getter for the offset of the shadow

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 26.02.19, 11:57:50
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setShadowOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$offset_l)

If (Count parameters:C259=0)
	$0:=This:C1470.container.shadowOffset
Else 
	$offset_l:=$1
	If ($offset_l>=0)
		This:C1470.container.shadowOffset:=$offset_l
		This:C1470.CheckRebuild()
		
	End if 
End if 