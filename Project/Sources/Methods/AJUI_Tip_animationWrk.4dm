//%attributes = {"invisible":true}
  // AJUI_Tip_animationWrk ( $tip_instance_obj ) 
  //
  // $tip_instance_obj : (object) tip instance
  //
  // Launch the animation with a worker

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 08.02.19, 09:23:06
	  // Modified by: Gary Criblez (08.02.19)
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_animationWrk
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$tip_instance_obj;$list_process_obj)
C_TEXT:C284($tip_name_t)

$tip_instance_obj:=$1

$tip_name_t:=$tip_instance_obj.instanceName_subform

$tip_instance_obj.animation.coordinate.left:=$tip_instance_obj.container.coordinate.left
$tip_instance_obj.animation.coordinate.top:=$tip_instance_obj.container.coordinate.top
$tip_instance_obj.animation.coordinate.right:=$tip_instance_obj.container.coordinate.right
$tip_instance_obj.animation.coordinate.bottom:=$tip_instance_obj.container.coordinate.bottom

$tip_instance_obj.animation.isTerminated:=False:C215

  //clear flag
Use (Storage:C1525.AJUI_Tip_Storage)
	Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=False:C215
	Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:=""
End use 

CALL WORKER:C1389($tip_instance_obj.pu.worker;"AJUI_Tip_animationHandler";$tip_instance_obj.global.UUID)
