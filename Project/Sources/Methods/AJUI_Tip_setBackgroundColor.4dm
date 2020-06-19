//%attributes = {"invisible":true}
  // AJUI_Tip_setBackgroundColor ( {$color_t} ) -> color
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current BG color
  //
  // Setter/Getter of the background color

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 16:23:46
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBackgroundColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$color_t)

If (Count parameters:C259=0)
	$0:=This:C1470.container.backgroundColor
Else 
	$color_t:=$1
	This:C1470.container.backgroundColor:=$color_t
	This:C1470.CheckRebuild()
End if 
