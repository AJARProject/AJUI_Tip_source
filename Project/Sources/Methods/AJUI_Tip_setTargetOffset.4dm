//%attributes = {"invisible":true}
  // AJUI_Tip_setTargetOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current offset
  //
  // Setter/Getter to the offset between the target and the border of the tipbox

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:20:16
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTargetOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $offset_l : Integer

If (Count parameters=0)
	$result:=This.target.offset
Else 
	$offset_l:=$param1
	This.target.offset:=$offset_l
	This.CheckRebuild()
End if 
