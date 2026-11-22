//%attributes = {"invisible":true}
  // AJUI_Tip_setTipDuration ( {$duration_r} ) -> duration
  //
  // $1 : (real) (optional) duration
  // $0 : (real) (return) current duration
  //
  // Setter/Getter of the tip duration

#DECLARE($param1 : Real) -> $result : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 10:29:43
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTipDuration
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $duration_r : Real

If (Count parameters=0)
	$result:=This.global.tipDuration
Else 
	$duration_r:=$param1
	If ($duration_r>=0)
		This.global.tipDuration:=$duration_r
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value can't be negative")
	End if 
End if 