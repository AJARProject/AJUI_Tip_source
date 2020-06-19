//%attributes = {"invisible":true}
  // AJUI_Tip_GetSetCornerCurveEnd (  { $curve } ) -> end curve
  //
  // $1 : (real) (optional) end curve
  // $0 : (real) (return) current end curve
  //
  // Setter/Getter of the end curve

If (False:C215)
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


C_REAL:C285($0;$1;$curve)

If (Count parameters:C259=0)
	$0:=This:C1470.arrow.cornerCurveEnd
Else 
	$curve:=$1
	If ($curve>=0)
		This:C1470.arrow.cornerCurveEnd:=$curve
		This:C1470.CheckRebuild()
	End if 
End if 
