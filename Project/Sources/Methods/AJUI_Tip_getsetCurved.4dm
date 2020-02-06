//%attributes = {"invisible":true}
  // AJUI_Tip_getsetCurved ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
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


C_BOOLEAN:C305($0;$1;$curved_b)

If (Count parameters:C259#1)
	$0:=This:C1470.arrow.curved
Else 
	$curved_b:=$1
	This:C1470.arrow.curved:=$curved_b
	This:C1470.CheckRebuild()
End if 