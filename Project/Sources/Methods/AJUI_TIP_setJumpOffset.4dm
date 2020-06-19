//%attributes = {"invisible":true}
  // AJUI_TIP_setJumpOffset ( {$offset_l} ) -> offset
  //
  // $1 : (longint) (optional) offset
  // $0 : (longint) (return) current offset
  //
  // Setter/Getter to enter the offset of the jump

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:19:42
	  // ----------------------------------------------------
	  // Method: AJUI_TIP_setJumpOffset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$offset_l)

If (Count parameters:C259=0)
	$0:=This:C1470.animation.jump.offset
Else 
	$offset_l:=$1
	If ($offset_l>=0)
		This:C1470.animation.jump.offset:=$offset_l
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value can't be negative")
	End if 
End if 