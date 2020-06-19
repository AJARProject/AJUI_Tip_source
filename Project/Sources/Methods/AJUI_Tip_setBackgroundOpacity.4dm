//%attributes = {"invisible":true}
  // AJUI_Tip_setBackgroundOpacity ( {$opacity_l } ) -> opacity
  //
  // $1 : (longint) (optional) opacity
  // $0 : (longint) (return) current BG opacity
  //
  // Setter/Getter to fix the opacity of the container background

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.02.19, 14:54:05
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBackgroundOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$opacity_l)

If (Count parameters:C259=0)
	$0:=This:C1470.container.backgroundOpacity
Else 
	$opacity_l:=$1
	
	If ($opacity_l>=0) & ($opacity_l<=100)
		This:C1470.container.backgroundOpacity:=$opacity_l
		This:C1470.CheckRebuild()
	End if 
	
End if 