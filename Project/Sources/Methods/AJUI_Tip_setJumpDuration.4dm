//%attributes = {"invisible":true}
  // AJUI_Tip_setJumpDuration ( {$duration_r} ) -> duration
  //
  // $1 : (longint) (optional) duration
  // $0 : (longint) (return) curr
  //
  // Setter/Getter to enter the duration between each jump

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:16:47
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setJumpDuration
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $duration_r : Integer

If (Count parameters=0)
	$result:=This.animation.jump.duration
Else 
	$duration_r:=$param1
	If ($duration_r>=0)
		This.animation.jump.duration:=$duration_r
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value can't be negative")
	End if 
End if 
