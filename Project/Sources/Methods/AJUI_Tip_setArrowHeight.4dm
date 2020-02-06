//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowHeight ( $size_l ) 
  //
  // $size_l : (longint) Arrow height
  //
  // Setter/Getter of the height size of the arrow

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:20:16
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowHeight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$size_l)

If (Count parameters:C259=0)
	$0:=This:C1470.arrow.height
Else 
	$size_l:=$1
	If ($size_l>=0)
		This:C1470.arrow.height:=$size_l
		This:C1470.CheckRebuild()
	End if 
End if 
