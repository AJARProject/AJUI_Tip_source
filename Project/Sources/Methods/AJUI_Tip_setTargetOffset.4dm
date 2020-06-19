//%attributes = {"invisible":true}
  // AJUI_Tip_setTargetOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current offset
  //
  // Setter/Getter to the offset between the target and the border of the tipbox

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:20:16
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTargetOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$offset_l)

If (Count parameters:C259=0)
	$0:=This:C1470.target.offset
Else 
	$offset_l:=$1
	This:C1470.target.offset:=$offset_l
	This:C1470.CheckRebuild()
End if 
