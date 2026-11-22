//%attributes = {"invisible":true}
  // AJUI_TIP_setJumpOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current offset
  //
  // Setter/Getter to enter the offset of the jump

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:19:42
	  // ----------------------------------------------------
	  // Method: AJUI_TIP_setJumpOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $offset_l : Integer

If (Count parameters=0)
	$result:=This.animation.jump.offset
Else 
	$offset_l:=$param1
	If ($offset_l>=0)
		This.animation.jump.offset:=$offset_l
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value can't be negative")
	End if 
End if 