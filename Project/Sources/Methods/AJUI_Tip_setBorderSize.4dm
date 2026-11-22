//%attributes = {"invisible":true}
  // AJUI_Tip_setBorderSize ( {$size_l} ) -> size
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current Border size
  //
  // Setter/Getter of the border size. No border if you pass zero

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:42:54
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBorderSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $size_l : Integer

If (Count parameters#1)
	$result:=This.container.borderSize
Else 
	$size_l:=$param1
	If ($size_l>=0)
		This.container.borderSize:=$size_l
		This.CheckRebuild()
		
	End if 
End if 