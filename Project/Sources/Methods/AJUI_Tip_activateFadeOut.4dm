//%attributes = {"invisible":true}
  // AJUI_Tip_activateFadeOut ( {$isActive_b} ) -> activated ?
  //
  // $1 : (boolean) (optional) activate/inactivate
  // $0 : (boolean) (return) Fade Out activated ?
  //
  // Setter/Getter to activate fade out animation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 09:03:58
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_activateFadeOut
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($0;$1;$isActive_b)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.fade.out
Else 
	$isActive_b:=$1
	This:C1470.animation.fade.out:=$isActive_b
	This:C1470.pu.toRebuild:=True:C214
End if 

