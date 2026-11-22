//%attributes = {"invisible":true}
  // AJUI_Tip_setAutoRebuild ( {$autoRebuild_b} ) -> auto rebuild ?
  //
  // $1 : (boolean) (optional) activate/inactivate
  // $0 : (boolean) (return) auto rebuild ?
  //
  // Setter/Getter to activate or desactivate the auto rebuild of the tip when displayed

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 14:35:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setAutoRebuild
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $autoRebuild_b : Boolean

If (Count parameters=0)
	$result:=This.global.autoRebuild
Else 
	$autoRebuild_b:=$param1
	This.global.autoRebuild:=$autoRebuild_b
End if 