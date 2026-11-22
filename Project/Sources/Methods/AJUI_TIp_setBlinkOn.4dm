//%attributes = {"invisible":true}
  // AJUI_TIp_setBlinkOn ( {$percentage_r} ) -> percentage
  //
  // $1 : (longint) (optional) percentage
  // $0 : (longint) (return) current percentage
  //
  // Setter/Getter of the percentage of visible time compared to invisible time during each blink

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $percentage_r : Integer

If (Count parameters=0)
	$result:=This.animation.blink.on
Else 
	$percentage_r:=$param1
	If ($percentage_r>=0) | ($percentage_r<=100)
		This.animation.blink.on:=$percentage_r
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value must between 0 and 100")
	End if 
End if 