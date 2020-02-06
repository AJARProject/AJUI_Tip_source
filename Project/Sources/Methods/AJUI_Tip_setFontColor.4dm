//%attributes = {"invisible":true}
  // AJUI_Tip_setFontColor ( $color_t )
  //
  // $color_t : (text) Font color
  //
  // Setter/Getter of the font color for the text

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 16:12:29
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setFontColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$color_t)

If (Count parameters:C259#1)
	$0:=This:C1470.text.fontColor
Else 
	$color_t:=$1
	This:C1470.text.fontColor:=$color_t
	This:C1470.CheckRebuild()
End if 