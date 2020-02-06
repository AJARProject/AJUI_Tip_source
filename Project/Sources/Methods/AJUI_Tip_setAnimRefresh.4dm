//%attributes = {"invisible":true}
  // AJUI_Tip_setAnimRefresh ( $number_l ) 
  //
  // $number_l : (longint) number
  //
  // Setter/Getter of the number of display by seconde for a jump

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.02.19, 11:23:07
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setAnimRefresh
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$number_l)

If (Count parameters:C259#1)
	$0:=This:C1470.animation.refresh
Else 
	$number_l:=$1
	If ($number_l>=0)
		This:C1470.animation.refresh:=$number_l
		This:C1470.pu.toRebuild:=True:C214
	End if 
End if 
