//%attributes = {"invisible":true}
  // AJUI_Tip_activeAnimation ( {$isActive_b} ) -> activated ?
  //
  // $1 : (boolean) (optional) activate/inactive
  // $0 : (boolean) (return) animation activated ?
  //
  // Setter/Getter to activate animations

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
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

var $isActive_b : Boolean

If (Count parameters=0)
	$result:=This.animation.isActive
Else 
	$isActive_b:=$param1
	This.animation.isActive:=$isActive_b
	This.pu.toRebuild:=True
End if 
