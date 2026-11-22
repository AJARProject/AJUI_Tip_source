//%attributes = {"invisible":true}
  // AJUI_Tip_anyAnimationActivated -> True/False
  // return : (text) (return) return value
  //
  // Return true if one animation is activated

#DECLARE($param1 : Object) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 11.07.19, 15:32:02
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_anyAnimationActivated
	  // Description
	  // 
	  // We can add here the condition if we add animations in the futur
	  // ----------------------------------------------------
End if 

var $tip_instance_obj : Object

$tip_instance_obj:=$param1

$result:=($tip_instance_obj.animation.jump.number>0) | ($tip_instance_obj.animation.blink.number>0)