//%attributes = {"invisible":true}
  // AJUI_Tip_setBackgroundColor ( {$color_t} ) -> color
  //
  // $1 : (text) (optional) color
  // $0 : (text) (return) current BG color
  //
  // Setter/Getter of the background color

#DECLARE($param1 : Text) -> $result : Text

If (False)
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

var $color_t : Text

If (Count parameters=0)
	$result:=This.container.backgroundColor
Else 
	$color_t:=$param1
	This.container.backgroundColor:=$color_t
	This.CheckRebuild()
End if 
