//%attributes = {"invisible":true}
  // AJUI_Tip_setTipPosition ( {$tipPosition_t ; {$defaut_arrow_b}} ) -> position
  //
  // $1 : (text) (optional) position
  // $2 : (boolean) (optional) default arrow position ?
  // $0 : (text) (return) current target current position
  //
  // Setter/Getter of the position of the tipbox, will also set the arrow position accordind to the tip position

#DECLARE($param1 : Text; $param2 : Boolean) -> $result : Text

If (False)
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

var $tipPosition_t : Text
var $defaut_arrow_b : Boolean



If (Count parameters=2)
	$defaut_arrow_b:=$param2
Else 
	$defaut_arrow_b:=True
End if 

If (Count parameters=0)
	$result:=This.target.tipPosition
Else 
	$tipPosition_t:=$param1
	Case of 
		: ($tipPosition_t="top")
			This.target.tipPosition:="top-center"
			If ($defaut_arrow_b)
				This.arrow.position:="center"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="top-left")
			This.target.tipPosition:="top-left"
			If ($defaut_arrow_b)
				This.arrow.position:="left"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="top-center")
			This.target.tipPosition:="top-center"
			If ($defaut_arrow_b)
				This.arrow.position:="center"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="top-right")
			This.target.tipPosition:="top-right"
			If ($defaut_arrow_b)
				This.arrow.position:="right"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="left")
			This.target.tipPosition:="left-middle"
			If ($defaut_arrow_b)
				This.arrow.position:="middle"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="left-top")
			This.target.tipPosition:="left-top"
			If ($defaut_arrow_b)
				This.arrow.position:="top"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="left-middle")
			This.target.tipPosition:="left-middle"
			If ($defaut_arrow_b)
				This.arrow.position:="middle"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="left-bottom")
			This.target.tipPosition:="left-bottom"
			If ($defaut_arrow_b)
				This.arrow.position:="bottom"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="bottom")
			This.target.tipPosition:="bottom-center"
			If ($defaut_arrow_b)
				This.arrow.position:="center"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="bottom-left")
			This.target.tipPosition:="bottom-left"
			If ($defaut_arrow_b)
				This.arrow.position:="left"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="bottom-center")
			This.target.tipPosition:="bottom-center"
			If ($defaut_arrow_b)
				This.arrow.position:="center"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="bottom-right")
			This.target.tipPosition:="bottom-right"
			If ($defaut_arrow_b)
				This.arrow.position:="right"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="right")
			This.target.tipPosition:="right-middle"
			If ($defaut_arrow_b)
				This.arrow.position:="middle"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="right-top")
			This.target.tipPosition:="right-top"
			If ($defaut_arrow_b)
				This.arrow.position:="top"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="right-middle")
			This.target.tipPosition:="right-middle"
			If ($defaut_arrow_b)
				This.arrow.position:="middle"
			End if 
			This.CheckRebuild()
			
		: ($tipPosition_t="right-bottom")
			This.target.tipPosition:="right-bottom"
			If ($defaut_arrow_b)
				This.arrow.position:="bottom"
			End if 
			This.CheckRebuild()
			
	End case 
End if 
