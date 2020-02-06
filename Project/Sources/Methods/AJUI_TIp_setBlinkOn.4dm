//%attributes = {"invisible":true}
  // AJUI_TIp_setBlinkOn ( $percentage_r ) 
  //
  // $percentage_r : (real) duration
  //
  // Setter/Getter of the percentage of visible time compared to invisible time during each blink

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 10:58:44
	  // ----------------------------------------------------
	  // Method: AJUI_TIp_setBlinkOn
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_REAL:C285($0;$1;$percentage_r)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.blink.on
Else 
	$percentage_r:=$1
	If ($percentage_r>=0) | ($percentage_r<=100)
		This:C1470.animation.blink.on:=$percentage_r
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value must between 0 and 100")
	End if 
End if 