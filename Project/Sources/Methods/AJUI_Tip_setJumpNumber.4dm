//%attributes = {"invisible":true}
  // AJUI_Tip_setJumpNumber ( {$number_l} ) -> jump
  //
  // $1 : (longint) (optional) number
  // $0 : (longint) (return) current number of jump
  //
  // Setter/Getter to enter the number of time the tip must jump

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:01:14
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setJumpNumber
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$number_l)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.jump.number
Else 
	$number_l:=$1
	If ($number_l>=0)
		This:C1470.animation.jump.number:=$number_l
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 