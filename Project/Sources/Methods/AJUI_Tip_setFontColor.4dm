//%attributes = {"invisible":true}
  // AJUI_Tip_setFontColor ( {$color_t} ) -> color
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current font color
  //
  // Setter/Getter of the font color for the text

#DECLARE($param1 : Text) -> $result : Text

If (False)
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

var $color_t : Text

If (Count parameters#1)
	$result:=This.text.fontColor
Else 
	$color_t:=$param1
	This.text.fontColor:=$color_t
	This.CheckRebuild()
End if 