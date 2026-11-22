//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current arrow offset
  //
  // Setter/Getter to the offset between the arrow and the border of the tipbox

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:31:29
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $offset_l : Integer

If (Count parameters=0)
	$result:=This.arrow.offset
Else 
	$offset_l:=$param1
	If ($offset_l>=0)
		This.arrow.offset:=$offset_l
		This.CheckRebuild()
	End if 
End if 
