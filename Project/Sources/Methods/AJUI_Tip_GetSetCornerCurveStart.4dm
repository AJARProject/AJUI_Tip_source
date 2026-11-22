//%attributes = {"invisible":true}
  // AJUI_Tip_GetSetCornerCurveStart ( { $curve } ) -> start curve
  //
  // $1 : (real) (optional) start curve
  // $0 : (real) (return) current start curve
  //
  // Setter/Getter of the start curve

#DECLARE($param1 : Real) -> $result : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 02.09.19, 09:32:39
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_GetSetCornerCurveStart
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $curve : Real

If (Count parameters=0)
	$result:=This.arrow.cornerCurveStart
Else 
	$curve:=$param1
	If ($curve>=0)
		This.arrow.cornerCurveStart:=$curve
		This.CheckRebuild()
	End if 
End if 

