//%attributes = {"invisible":true}
  // AJUI_Tip_getsetCurved ( { $curved_b } ) -> curved arrow ?
  //
  // $1 : (boolean) (optional) Activate/inactivate curve
  // $0 : (boolean) (return) curved arrow ?
  //
  // Setter/Getter to activate/inactivate the curved arrow

#DECLARE($param1 : Boolean) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 28.08.19, 13:43:53
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_getsetCurved
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $curved_b : Boolean

If (Count parameters#1)
	$result:=This.arrow.curved
Else 
	$curved_b:=$param1
	This.arrow.curved:=$curved_b
	This.CheckRebuild()
End if 