//%attributes = {"invisible":true}
  // AJUI_Tip_higherOpacity ( $textOpa_l  ; $backgroundOpa_l ; $borderOpa_l) -> return
  //
  // $textOpa_l : (longint) text opacity
  // $backgroundOpa_l : (longint) background opacity
  // $borderOpa_l : (longint) border opacity
  // $higherOpa_l : (longint) (return) return value
  //
  // Return the higher between each opacity properties

If (False:C215)
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
C_LONGINT:C283($1;$textOpa_l)
C_LONGINT:C283($2;$backgroundOpa_l)
C_LONGINT:C283($3;$borderOpa_l)
C_LONGINT:C283($0;$higherOpa_l)

$textOpa_l:=$1
$backgroundOpa_l:=$2
$textOpa_l:=$3

If ($textOpa_l>$backgroundOpa_l)
	$higherOpa_l:=$textOpa_l
Else 
	$higherOpa_l:=$backgroundOpa_l
End if 

If ($borderOpa_l>$higherOpa_l)
	$higherOpa_l:=$borderOpa_l
End if 

$0:=$higherOpa_l