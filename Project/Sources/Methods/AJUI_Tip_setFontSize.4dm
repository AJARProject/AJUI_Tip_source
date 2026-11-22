//%attributes = {"invisible":true}
  // AJUI_Tip_setFontSize ( {$size_l} ) -> size
  //
  // $1 : (longint) (optional) font size
  // $0 : (longint) (return) current font size
  //
  // Setter/Getter of the font size for the text

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 15:50:47
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setFontSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



var $size_l : Integer

If (Count parameters=0)
	$result:=This.text.fontSize
Else 
	$size_l:=$param1
	If ($size_l>0)
		This.text.fontSize:=$size_l
		This.CheckRebuild()
		
	End if 
End if 