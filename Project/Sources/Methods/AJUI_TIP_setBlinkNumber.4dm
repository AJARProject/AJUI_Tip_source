//%attributes = {"invisible":true}
  // AJUI_TIP_setBlinkNumber ( $number_l ) 
  //
  // $number_l : (longint) number
  //
  // Setter/Getter to enter the number of time the tip must blink

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 10:49:42
	  // ----------------------------------------------------
	  // Method: AJUI_TIP_setBlinkNumber
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_LONGINT:C283($0;$1;$number_l)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.blink.number
Else 
	$number_l:=$1
	If ($number_l>=0)
		This:C1470.animation.blink.number:=$number_l
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 