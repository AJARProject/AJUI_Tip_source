//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowWidth ( $size_l ) -> width
  //
  // $1 : (longint) (optional) width
  // $0 : (longint) (return) current arrow width
  //
  // Setter/Getter of the width size of the arrow

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:17:40
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowWidth
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$size_l)

If (Count parameters:C259=0)
	$0:=This:C1470.arrow.width
Else 
	$size_l:=$1
	If ($size_l>=0)
		This:C1470.arrow.width:=$size_l
		This:C1470.CheckRebuild()
		
	End if 
End if 