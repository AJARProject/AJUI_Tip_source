//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowOffset ( $offset_l )
  //
  // $offset_l : (longint) arrow offset
  //
  // Setter/Getter to the offset between the arrow and the border of the tipbox

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:31:29
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_LONGINT:C283($0;$1;$offset_l)

If (Count parameters:C259=0)
	$0:=This:C1470.arrow.offset
Else 
	$offset_l:=$1
	If ($offset_l>=0)
		This:C1470.arrow.offset:=$offset_l
		This:C1470.CheckRebuild()
	End if 
End if 
