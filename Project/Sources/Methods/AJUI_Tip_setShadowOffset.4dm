//%attributes = {"invisible":true}
  // AJUI_Tip_setShadowOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current offset
  //
  // Setter/Getter for the offset of the shadow

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 26.02.19, 11:57:50
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setShadowOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $offset_l : Integer

If (Count parameters=0)
	$result:=This.container.shadowOffset
Else 
	$offset_l:=$param1
	If ($offset_l>=0)
		This.container.shadowOffset:=$offset_l
		This.CheckRebuild()
		
	End if 
End if 