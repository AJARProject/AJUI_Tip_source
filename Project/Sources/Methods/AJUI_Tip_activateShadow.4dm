//%attributes = {"invisible":true}
  // AJUI_Tip_activateShadow ( {$isActive_b} ) -> shadow ?
  //
  // $1 : (boolean) (optional) activate/inactivate
  // $0 : (boolean) (return) shadow ?
  //
  // Setter/Getter to activate the shadow effect with the tipbox

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 26.02.19, 11:57:17
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_activateShadow
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $isActive_b : Boolean

If (Count parameters#1)
	$result:=This.container.shadowOn
Else 
	$isActive_b:=$param1
	This.container.shadowOn:=$isActive_b
	This.CheckRebuild()
End if 