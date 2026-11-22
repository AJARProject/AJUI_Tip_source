//%attributes = {"invisible":true}
  // AJUI_TIP_setBlinkNumber ( {$number_l} ) -> number
  //
  // $1 : (longint) (optional) number
  // $0 : (longint) (return) current number of blink
  //
  // Setter/Getter to enter the number of time the tip must blink

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 10:49:42
	  // ----------------------------------------------------
	  // Method: AJUI_TIP_setBlinkNumber
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $number_l : Integer

If (Count parameters=0)
	$result:=This.animation.blink.number
Else 
	$number_l:=$param1
	If ($number_l>=0)
		This.animation.blink.number:=$number_l
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value can't be negative")
	End if 
End if 