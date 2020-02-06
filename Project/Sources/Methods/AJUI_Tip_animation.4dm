//%attributes = {"invisible":true}
  // AJUI_Tip_animation ( $tip_instance_obj ) 
  //
  // $tip_instance_obj : (object) tip instance
  //
  // This method runs the animations

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 08.02.19, 09:27:16
	  // Modified by: Gary Criblez (08.02.19)
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_animation
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($1;$tip_instance_obj)
C_BOOLEAN:C305($2;$displayed)
C_LONGINT:C283($left_l;$top_l;$right_l;$bottom_l)
C_TEXT:C284($tip_name_t)
$tip_instance_obj:=$1

If (Count parameters:C259=2)
	$displayed:=$2
End if 

$tip_name_t:=$tip_instance_obj.instanceName_subform

If ($tip_instance_obj.pu.displayed)
	Case of 
		: ($tip_instance_obj.animation.blink.number>0)  //blink
			OBJECT SET VISIBLE:C603(*;$tip_name_t;$displayed)
			
		: ($tip_instance_obj.animation.jump.number>0)  //jump
			
			$left_l:=$tip_instance_obj.animation.coordinate.left
			$top_l:=$tip_instance_obj.animation.coordinate.top
			$right_l:=$tip_instance_obj.animation.coordinate.right
			$bottom_l:=$tip_instance_obj.animation.coordinate.bottom
			OBJECT SET COORDINATES:C1248(*;$tip_name_t;$left_l;$top_l;$right_l;$bottom_l)
			
	End case 
End if 
