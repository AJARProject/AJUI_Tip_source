//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowPosition ( {$arrowPosition_t} ) -> position
  //
  // $1 : (text) (optional) position
  // $0 : (text) (return) current arrow position
  //
  // Setter/Getter of the position of the arrow

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:24:23
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setArrowPosition
	  // Description
	  // Positions available : left, center, right, top, middle and bottom
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$arrowPosition_t)



If (Count parameters:C259=0)
	$0:=This:C1470.arrow.position
Else 
	$arrowPosition_t:=$1
	
	Case of 
		: ($arrowPosition_t="left")
			This:C1470.arrow.position:="left"
			This:C1470.CheckRebuild()
			
		: ($arrowPosition_t="center")
			This:C1470.arrow.position:="center"
			This:C1470.CheckRebuild()
			
		: ($arrowPosition_t="right")
			This:C1470.arrow.position:="right"
			This:C1470.CheckRebuild()
			
		: ($arrowPosition_t="top")
			This:C1470.arrow.position:="top"
			This:C1470.CheckRebuild()
			
		: ($arrowPosition_t="middle")
			This:C1470.arrow.position:="middle"
			This:C1470.CheckRebuild()
			
		: ($arrowPosition_t="bottom")
			This:C1470.arrow.position:="bottom"
			This:C1470.CheckRebuild()
			
			
	End case 
	
End if 