//%attributes = {"invisible":true}
  // AJUI_Tip_GetSetCornerCurveStart ( { $curve } ) -> start curve
  //
  // $1 : (real) (optional) start curve
  // $0 : (real) (return) current start curve
  //
  // Setter/Getter of the start curve

If (False:C215)
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


C_REAL:C285($0;$1;$curve)

If (Count parameters:C259=0)
	$0:=This:C1470.arrow.cornerCurveStart
Else 
	$curve:=$1
	If ($curve>=0)
		This:C1470.arrow.cornerCurveStart:=$curve
		This:C1470.CheckRebuild()
	End if 
End if 

