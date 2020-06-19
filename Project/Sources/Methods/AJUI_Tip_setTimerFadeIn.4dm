//%attributes = {"invisible":true}
  // AJUI_Tip_setTimerFadeIn ( {$milliseconds_l} ) -> timer
  //
  // $1 : (longint) (optional) timer
  // $0 : (longint) (return) current timer
  //
  // setter/Getter for the fade in timer

If (False:C215)
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


C_LONGINT:C283($0;$1;$milliseconds_l)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.fade.timer.in
Else 
	$milliseconds_l:=$1
	If ($milliseconds_l>=0)
		This:C1470.animation.fade.timer.in:=$milliseconds_l
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 