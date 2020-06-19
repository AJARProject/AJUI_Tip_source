//%attributes = {"invisible":true}
  // AJUI_Tip_setFontName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) font name
  // $0 : (text) (return) current font name
  //
  // Setter/Getter of the font name for the text, you can ask one or more font e.g. "Arial,MS Sans Sherif,..." No space allowed between each font

If (False:C215)
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

C_TEXT:C284($0;$1;$name_t)

If (Count parameters:C259=0)
	$0:=This:C1470.text.fontName
Else 
	$name_t:=$1
	This:C1470.text.fontName:=$name_t
	This:C1470.CheckRebuild()
End if 