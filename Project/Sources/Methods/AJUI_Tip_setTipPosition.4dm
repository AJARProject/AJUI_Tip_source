//%attributes = {"invisible":true}
  // AJUI_Tip_setTipPosition ( $tipPosition_t )
  //
  // $tipPosition_t : (text) Position tipbox
  //
  // Setter/Getter of the position of the tipbox, will also set the arrow position accordind to the tip position

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:04:09
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTipPosition
	  // Description
	  // Positions available : top, top-left, top-center, top-right, left, left-top, 
	  // left-middle, left-bottom, bottom, bottom-left, bottom-center, bottom-right,
	  // right, right-top, right-middle and right-bottom
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$tipPosition_t)
C_BOOLEAN:C305($2;$defaut_arrow_b)



If (Count parameters:C259=2)
	$defaut_arrow_b:=$2
Else 
	$defaut_arrow_b:=True:C214
End if 

If (Count parameters:C259=0)
	$0:=This:C1470.target.tipPosition
Else 
	$tipPosition_t:=$1
	Case of 
		: ($tipPosition_t="top")
			This:C1470.target.tipPosition:="top-center"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="center"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="top-left")
			This:C1470.target.tipPosition:="top-left"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="left"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="top-center")
			This:C1470.target.tipPosition:="top-center"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="center"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="top-right")
			This:C1470.target.tipPosition:="top-right"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="right"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="left")
			This:C1470.target.tipPosition:="left-middle"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="middle"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="left-top")
			This:C1470.target.tipPosition:="left-top"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="top"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="left-middle")
			This:C1470.target.tipPosition:="left-middle"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="middle"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="left-bottom")
			This:C1470.target.tipPosition:="left-bottom"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="bottom"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="bottom")
			This:C1470.target.tipPosition:="bottom-center"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="center"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="bottom-left")
			This:C1470.target.tipPosition:="bottom-left"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="left"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="bottom-center")
			This:C1470.target.tipPosition:="bottom-center"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="center"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="bottom-right")
			This:C1470.target.tipPosition:="bottom-right"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="right"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="right")
			This:C1470.target.tipPosition:="right-middle"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="middle"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="right-top")
			This:C1470.target.tipPosition:="right-top"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="top"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="right-middle")
			This:C1470.target.tipPosition:="right-middle"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="middle"
			End if 
			This:C1470.CheckRebuild()
			
		: ($tipPosition_t="right-bottom")
			This:C1470.target.tipPosition:="right-bottom"
			If ($defaut_arrow_b)
				This:C1470.arrow.position:="bottom"
			End if 
			This:C1470.CheckRebuild()
			
	End case 
End if 
