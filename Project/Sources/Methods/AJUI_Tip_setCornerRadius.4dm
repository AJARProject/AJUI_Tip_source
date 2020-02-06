//%attributes = {"invisible":true}
  // AJUI_Tip_setCornerRadius ( $radius_l )
  //
  // $radius_l : (longint) Corner radius
  //
  // Setter/Getter of the radius for the rouding of the tip's corners

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:29:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setCornerRadius
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$radius_l)


If (Count parameters:C259=0)
	$0:=This:C1470.container.cornerRadius
Else 
	$radius_l:=$1
	If ($radius_l>=0)
		This:C1470.container.cornerRadius:=$radius_l
		This:C1470.CheckRebuild()
		
	End if 
End if 
