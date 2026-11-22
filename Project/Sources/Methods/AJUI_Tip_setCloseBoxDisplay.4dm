//%attributes = {"invisible":true}
// AJUI_Tip_setCloseBoxDisplay ( {$display_b} ) -> displayed ?
//
// $1 : (boolean) (optional) show/hide closebox
// $0 : (boolean) (return) closebox displayed ?
//
// Setter/Getter to define is the closeBox will be displayed

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	// ----------------------------------------------------
	// User name (OS): Gary Criblez
	// Date and time: 23.01.19, 16:53:33
	// ----------------------------------------------------
	// Method: AJUI_Tip_setCloseBoxDisplay
	// Description
	// 
	//
	// ----------------------------------------------------
End if 

var $display_b : Boolean

If (Count parameters=0)
	$result:=This.closeBox.display
Else 
	$display_b:=$param1
	This.closeBox.display:=$display_b
	This.CheckRebuild()
End if 