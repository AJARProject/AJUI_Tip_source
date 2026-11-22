//%attributes = {"invisible":true}
  // AJUI_Tip_activateFadeOut ( {$isActive_b} ) -> activated ?
  //
  // $1 : (boolean) (optional) activate/inactivate
  // $0 : (boolean) (return) Fade Out activated ?
  //
  // Setter/Getter to activate fade out animation

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
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

var $isActive_b : Boolean

If (Count parameters=0)
	$result:=This.animation.fade.out
Else 
	$isActive_b:=$param1
	This.animation.fade.out:=$isActive_b
	This.pu.toRebuild:=True
End if 

