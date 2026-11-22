//%attributes = {"invisible":true}
  // AJUI_Tip_activeFadeIn ( {$isActive_b} ) -> activated ?
  //
  // $1 : (boolean) (optional) activate/inactivate
  // $0 : (boolean) (return) Fade In activated ?
  //
  // Setter/Getter to activate fade in animation

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
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


var $isActive_b : Boolean

If (Count parameters=0)
	$result:=This.animation.fade.in
Else 
	$isActive_b:=$param1
	This.animation.fade.in:=$isActive_b
	This.pu.toRebuild:=True
End if 
