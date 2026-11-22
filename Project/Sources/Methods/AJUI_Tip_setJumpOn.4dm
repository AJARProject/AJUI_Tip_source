//%attributes = {"invisible":true}
  // AJUI_Tip_setJumpOn ( {$percentage_r} ) -> percentage
  //
  // $1 : (longint) (optional) percentage
  // $0 : (longint) (return) current percentage
  //
  // Setter/Getter of the percentage related to the duration for the time the arrow reaches its highest point

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:11:16
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setJumpOn
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $percentage_r : Integer

If (Count parameters=0)
	$result:=This.animation.jump.on
Else 
	$percentage_r:=$param1
	If ($percentage_r>=0) | ($percentage_r<=100)
		This.animation.jump.on:=$percentage_r
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value must between 0 and 100")
	End if 
End if 