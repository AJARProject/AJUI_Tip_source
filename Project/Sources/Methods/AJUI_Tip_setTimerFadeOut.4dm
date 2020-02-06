//%attributes = {"invisible":true}
  // AJUI_Tip_setTimerFadeOut ( $milliseconds_l ) 
  //
  // $milliseconds_l : (longint) duration
  //
  // setter/Getter for the fade out timer

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 09:04:45
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTimerFadeOut
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$milliseconds_l)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.fade.timer.out
Else 
	$milliseconds_l:=$1
	If ($milliseconds_l>=0)
		This:C1470.animation.fade.timer.out:=$milliseconds_l
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 