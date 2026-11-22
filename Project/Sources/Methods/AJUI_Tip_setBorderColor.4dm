//%attributes = {"invisible":true}
  // AJUI_Tip_setBorderColor ( {$color_t} ) -> color
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current border color
  //
  // Setter/Getter of the border color

#DECLARE($param1 : Text) -> $result : Text

If (False)
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

var $color_t : Text

If (Count parameters#1)
	$result:=This.container.borderColor
Else 
	$color_t:=$param1
	This.container.borderColor:=$color_t
	This.CheckRebuild()
End if 
