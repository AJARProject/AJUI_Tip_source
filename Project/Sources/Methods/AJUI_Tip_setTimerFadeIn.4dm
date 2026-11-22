//%attributes = {"invisible":true}
  // AJUI_Tip_setTimerFadeIn ( {$milliseconds_l} ) -> timer
  //
  // $1 : (longint) (optional) timer
  // $0 : (longint) (return) current timer
  //
  // setter/Getter for the fade in timer

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 09:04:27
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTimerFadeIn
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $milliseconds_l : Integer

If (Count parameters=0)
	$result:=This.animation.fade.timer.in
Else 
	$milliseconds_l:=$param1
	If ($milliseconds_l>=0)
		This.animation.fade.timer.in:=$milliseconds_l
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value can't be negative")
	End if 
End if 