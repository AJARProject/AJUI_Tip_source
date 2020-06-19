//%attributes = {"invisible":true}
  // AJUI_Tip_setBorderColor ( {$color_t} ) -> color
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current border color
  //
  // Setter/Getter of the border color

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:49:37
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBorderColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$color_t)

If (Count parameters:C259#1)
	$0:=This:C1470.container.borderColor
Else 
	$color_t:=$1
	This:C1470.container.borderColor:=$color_t
	This:C1470.CheckRebuild()
End if 
