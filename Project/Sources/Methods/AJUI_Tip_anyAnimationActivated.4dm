//%attributes = {"invisible":true}
  // AJUI_Tip_anyAnimationActivated -> True/False
  // return : (text) (return) return value
  //
  // Return true if one animation is activated

If (False:C215)
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

C_BOOLEAN:C305($0)
C_OBJECT:C1216($1;$tip_instance_obj)

$tip_instance_obj:=$1

$0:=($tip_instance_obj.animation.jump.number>0) | ($tip_instance_obj.animation.blink.number>0)