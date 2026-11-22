//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowHeight ( {$size_l} ) -> height
  //
  // $1 : (longint) (optional) height
  // $0 : (longint) (return) current arrow height
  //
  // Setter/Getter of the height size of the arrow

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:20:16
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowHeight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $size_l : Integer

If (Count parameters=0)
	$result:=This.arrow.height
Else 
	$size_l:=$param1
	If ($size_l>=0)
		This.arrow.height:=$size_l
		This.CheckRebuild()
	End if 
End if 
