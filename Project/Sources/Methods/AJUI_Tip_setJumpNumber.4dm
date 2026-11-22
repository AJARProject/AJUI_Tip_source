//%attributes = {"invisible":true}
  // AJUI_Tip_setJumpNumber ( {$number_l} ) -> jump
  //
  // $1 : (longint) (optional) number
  // $0 : (longint) (return) current number of jump
  //
  // Setter/Getter to enter the number of time the tip must jump

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:01:14
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setJumpNumber
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $number_l : Integer

If (Count parameters=0)
	$result:=This.animation.jump.number
Else 
	$number_l:=$param1
	If ($number_l>=0)
		This.animation.jump.number:=$number_l
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value can't be negative")
	End if 
End if 