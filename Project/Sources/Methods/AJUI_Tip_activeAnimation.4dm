//%attributes = {"invisible":true}
  // AJUI_Tip_activeAnimation ( $isActive_b ) $isActive_b
  //
  // $isActive_b : (boolean) activate
  //
  // Setter/Getter to activate animations

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 10:44:39
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_activeAnimation
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($0;$1;$isActive_b)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.isActive
Else 
	$isActive_b:=$1
	This:C1470.animation.isActive:=$isActive_b
	This:C1470.pu.toRebuild:=True:C214
End if 
