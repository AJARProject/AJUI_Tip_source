//%attributes = {"invisible":true}
  // AJUI_Tip_activateShadow ( $isActive_b ) 
  //
  // $isActive_b : (boolean) activate
  //
  // Setter/Getter to activate the shadow effect with the tipbox

If (False:C215)
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

C_BOOLEAN:C305($0;$1;$isActive_b)

If (Count parameters:C259#1)
	$0:=This:C1470.container.shadowOn
Else 
	$isActive_b:=$1
	This:C1470.container.shadowOn:=$isActive_b
	This:C1470.CheckRebuild()
End if 