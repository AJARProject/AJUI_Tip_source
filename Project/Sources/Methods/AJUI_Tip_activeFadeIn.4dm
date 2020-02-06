//%attributes = {"invisible":true}
  // AJUI_Tip_activeFadeIn ( $isActive_b )
  //
  // $isActive_b : (boolean) activate
  //
  // Setter/Getter to activate fade in animation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 09:03:37
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_activeFadeIn
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_BOOLEAN:C305($0;$1;$isActive_b)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.fade.in
Else 
	$isActive_b:=$1
	This:C1470.animation.fade.in:=$isActive_b
	This:C1470.pu.toRebuild:=True:C214
End if 
