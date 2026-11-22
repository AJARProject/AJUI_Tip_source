//%attributes = {"invisible":true}
  // AJUI_Tip_GetSetCornerCurveEnd (  { $curve } ) -> end curve
  //
  // $1 : (real) (optional) end curve
  // $0 : (real) (return) current end curve
  //
  // Setter/Getter of the end curve

#DECLARE($param1 : Real) -> $result : Real

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 02.09.19, 09:32:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_GetSetCornerCurveEnd
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $curve : Real

If (Count parameters=0)
	$result:=This.arrow.cornerCurveEnd
Else 
	$curve:=$param1
	If ($curve>=0)
		This.arrow.cornerCurveEnd:=$curve
		This.CheckRebuild()
	End if 
End if 
