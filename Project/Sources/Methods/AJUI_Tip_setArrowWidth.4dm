//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowWidth ( $size_l ) -> width
  //
  // $1 : (longint) (optional) width
  // $0 : (longint) (return) current arrow width
  //
  // Setter/Getter of the width size of the arrow

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:17:40
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowWidth
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $size_l : Integer

If (Count parameters=0)
	$result:=This.arrow.width
Else 
	$size_l:=$param1
	If ($size_l>=0)
		This.arrow.width:=$size_l
		This.CheckRebuild()
		
	End if 
End if 