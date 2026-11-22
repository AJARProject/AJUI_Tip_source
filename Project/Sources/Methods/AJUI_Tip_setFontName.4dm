//%attributes = {"invisible":true}
  // AJUI_Tip_setFontName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) font name
  // $0 : (text) (return) current font name
  //
  // Setter/Getter of the font name for the text, you can ask one or more font e.g. "Arial,MS Sans Sherif,..." No space allowed between each font

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 16:04:46
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setFontName
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $name_t : Text

If (Count parameters=0)
	$result:=This.text.fontName
Else 
	$name_t:=$param1
	This.text.fontName:=$name_t
	This.CheckRebuild()
End if 