//%attributes = {"invisible":true}
  // AJUI_Tip_setAutoRebuild ( {$autoRebuild_b} ) -> auto rebuild ?
  //
  // $1 : (boolean) (optional) activate/inactivate
  // $0 : (boolean) (return) auto rebuild ?
  //
  // Setter/Getter to activate or desactivate the auto rebuild of the tip when displayed

If (False:C215)
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

C_BOOLEAN:C305($0;$1;$autoRebuild_b)

If (Count parameters:C259=0)
	$0:=This:C1470.global.autoRebuild
Else 
	$autoRebuild_b:=$1
	This:C1470.global.autoRebuild:=$autoRebuild_b
End if 