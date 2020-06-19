//%attributes = {"invisible":true}
  // AJUI_Tip_setGlobalOpacity ( $opacity_l) 
  //
  // $1 : (longint) % of opacity
  //
  // Global setter to fix all opacity properties in the same value

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 08:56:44
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setGlobalOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$opacity_l)

If (Count parameters:C259=0)
	  //do nothing
Else 
	$opacity_l:=$1
	
	If ($opacity_l>=0) & ($opacity_l<=100)
		This:C1470.container.backgroundOpacity:=$opacity_l
		This:C1470.container.borderOpacity:=$opacity_l
		This:C1470.text.opacity:=$opacity_l
		This:C1470.CheckRebuild()
		
	End if 
	
End if 