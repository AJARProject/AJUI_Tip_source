//%attributes = {"invisible":true}
  // AJUI_Tip_higherOpacity ( $textOpa_l  ; $backgroundOpa_l ; $borderOpa_l) -> return
  //
  // $textOpa_l : (longint) text opacity
  // $backgroundOpa_l : (longint) background opacity
  // $borderOpa_l : (longint) border opacity
  // $higherOpa_l : (longint) (return) return value
  //
  // Return the higher between each opacity properties

#DECLARE($param1 : Integer; $param2 : Integer; $param3 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 14.02.19, 11:34:55
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_higherOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
var $textOpa_l; $backgroundOpa_l; $borderOpa_l; $higherOpa_l : Integer

$textOpa_l:=$param1
$backgroundOpa_l:=$param2
$textOpa_l:=$param3

If ($textOpa_l>$backgroundOpa_l)
	$higherOpa_l:=$textOpa_l
Else 
	$higherOpa_l:=$backgroundOpa_l
End if 

If ($borderOpa_l>$higherOpa_l)
	$higherOpa_l:=$borderOpa_l
End if 

$result:=$higherOpa_l