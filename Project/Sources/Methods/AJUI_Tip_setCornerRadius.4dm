//%attributes = {"invisible":true}
  // AJUI_Tip_setCornerRadius ( $radius_l ) -> corner radius
  //
  // $1 : (longint) (optional) corner radius
  // $0 : (longint) (return) current corner radius
  //
  // Setter/Getter of the radius for the rouding of the tip's corners

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $radius_l : Integer


If (Count parameters=0)
	$result:=This.container.cornerRadius
Else 
	$radius_l:=$param1
	If ($radius_l>=0)
		This.container.cornerRadius:=$radius_l
		This.CheckRebuild()
		
	End if 
End if 
