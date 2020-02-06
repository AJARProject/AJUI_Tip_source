//%attributes = {"invisible":true}
  // AJUI_Tip_setJumpOn ( $percentage_r ) 
  //
  // $percentage_r : (real) duration
  //
  // Setter/Getter of the percentage related to the duration for the time the arrow reaches its highest point

If (False:C215)
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

C_REAL:C285($0;$1;$percentage_r)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.jump.on
Else 
	$percentage_r:=$1
	If ($percentage_r>=0) | ($percentage_r<=100)
		This:C1470.animation.jump.on:=$percentage_r
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value must between 0 and 100")
	End if 
End if 