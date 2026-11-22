//%attributes = {"invisible":true}
  // AJUI_Tip_GetSetArrowCurve (  {  $curve } ) -> curve
  //
  // $1 : (real) (optional) curve
  // $0 : (real) (return) current curve
  //
  // Setter/Getter of the arrow curve

#DECLARE($param1 : Real) -> $result : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 02.09.19, 09:33:15
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_GetSetArrowCurve
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $curve : Real

If (Count parameters=0)
	$result:=This.arrow.arrowCurve
Else 
	$curve:=$param1
	If ($curve>=0)
		This.arrow.arrowCurve:=$curve
		This.CheckRebuild()
	End if 
End if 
