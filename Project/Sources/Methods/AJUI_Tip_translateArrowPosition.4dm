//%attributes = {"invisible":true}
  // AJUI_Tip_translateArrowPosition ( $tip_instance_obj ) 
  //
  // $tip_instance_obj : (object) Tip instance
  //
  // Translate the arrow postion to keep a coherence with the tip
#DECLARE($param1 : Object)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.02.19, 11:01:28
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_translateArrowPosition
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
var $tip_instance_obj : Object
var $arrowPostion_t; $tip_position_t : Text

$tip_instance_obj:=$param1
$tip_position_t:=$tip_instance_obj.target.tipPosition
$arrowPostion_t:=$tip_instance_obj.arrow.position

Case of 
		
		
	: (Position("top";$tip_position_t)=1) | (Position("bottom";$tip_position_t)=1)
		
		If ($arrowPostion_t="top")
			$arrowPostion_t:="left"
		End if 
		
		If ($arrowPostion_t="middle")
			$arrowPostion_t:="center"
		End if 
		
		If ($arrowPostion_t="bottom")
			$arrowPostion_t:="right"
		End if 
		
		
	: (Position("left";$tip_position_t)=1) | (Position("right";$tip_position_t)=1)
		
		If ($arrowPostion_t="left")
			$arrowPostion_t:="top"
		End if 
		
		If ($arrowPostion_t="center")
			$arrowPostion_t:="middle"
		End if 
		
		If ($arrowPostion_t="right")
			$arrowPostion_t:="bottom"
		End if 
		
End case 

$tip_instance_obj.arrow.position:=$arrowPostion_t