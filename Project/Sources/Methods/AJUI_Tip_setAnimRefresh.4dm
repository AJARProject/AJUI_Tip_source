//%attributes = {"invisible":true}
  // AJUI_Tip_setAnimRefresh ( {$number_l} ) -> number of refresh
  //
  // $1 : (longint) (optional) number of refresh
  // $0 : (longint) (return) current number of refresh
  //
  // Setter/Getter of the number of display by seconde for a jump

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $number_l : Integer

If (Count parameters#1)
	$result:=This.animation.refresh
Else 
	$number_l:=$param1
	If ($number_l>=0)
		This.animation.refresh:=$number_l
		This.pu.toRebuild:=True
	End if 
End if 
