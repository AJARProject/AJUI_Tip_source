//%attributes = {"invisible":true}
  // AJUI_Tip_setArrowPosition ( {$arrowPosition_t} ) -> position
  //
  // $1 : (text) (optional) position
  // $0 : (text) (return) current arrow position
  //
  // Setter/Getter of the position of the arrow

#DECLARE($param1 : Text) -> $result : Text

If (False)
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

var $arrowPosition_t : Text



If (Count parameters=0)
	$result:=This.arrow.position
Else 
	$arrowPosition_t:=$param1
	
	Case of 
		: ($arrowPosition_t="left")
			This.arrow.position:="left"
			This.CheckRebuild()
			
		: ($arrowPosition_t="center")
			This.arrow.position:="center"
			This.CheckRebuild()
			
		: ($arrowPosition_t="right")
			This.arrow.position:="right"
			This.CheckRebuild()
			
		: ($arrowPosition_t="top")
			This.arrow.position:="top"
			This.CheckRebuild()
			
		: ($arrowPosition_t="middle")
			This.arrow.position:="middle"
			This.CheckRebuild()
			
		: ($arrowPosition_t="bottom")
			This.arrow.position:="bottom"
			This.CheckRebuild()
			
			
	End case 
	
End if 