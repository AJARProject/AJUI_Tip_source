//%attributes = {"invisible":true}
  // AJUI_Tip_setTipDuration ( $duration_r ) -> return
  //
  // $duration_r : (real) duration
  //
  // Setter/Getter of the tip duration

If (False:C215)
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


C_REAL:C285($0;$1;$duration_r)

If (Count parameters:C259=0)
	$0:=This:C1470.global.tipDuration
Else 
	$duration_r:=$1
	If ($duration_r>=0)
		This:C1470.global.tipDuration:=$duration_r
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 