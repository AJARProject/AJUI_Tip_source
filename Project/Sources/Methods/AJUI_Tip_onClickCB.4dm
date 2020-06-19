//%attributes = {"invisible":true}
  // AJUI_Tip_onClickCB ( {$onClick_b} ) -> on click activated ? 
  //
  // $1 : (boolean) (optional) Activate/inactivate on click callback
  // $0 : (boolean) (return) on callback activate ?
  //
  // Setter/Getter closeBox on click available

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.02.19, 14:22:05
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_onClickCB
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_BOOLEAN:C305($0;$1;$onClick_b)

If (Count parameters:C259=0)
	$0:=This:C1470.closeBox.onClick
Else 
	$onClick_b:=$1
	This:C1470.closeBox.onClick:=$onClick_b
	This:C1470.CheckRebuild()
End if 