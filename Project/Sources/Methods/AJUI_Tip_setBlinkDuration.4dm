//%attributes = {"invisible":true}
  // AJUI_Tip_setBlinkDuration ( {$duration_r} ) -> duration
  //
  // $1 : (longint) (optional) duration
  // $0 : (longint) (return) current duration
  //
  // Setter/Getter to enter the duration between each blink


If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 10:52:50
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBlinkDuration
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_LONGINT:C283($0;$1;$duration_r)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.blink.duration
Else 
	$duration_r:=$1
	If ($duration_r>=0)
		This:C1470.animation.blink.duration:=$duration_r
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 
