//%attributes = {"invisible":true}
  // AJUI_Tip_fadeInHandler ( $tip_instance_UUID )
  //
  // $tip_instance_UUID : (text) UUID of the tip instance
  //
  // This method calculate and execute the fade in effect

#DECLARE($param1 : Text)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 14.02.19, 16:31:39
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_fadeInHandler
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_UUID : Text
var $tip_instance_obj; $delay_result : Object
var $higherOpacity_l : Integer

$tip_instance_UUID:=$param1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]

  //clear flag
Use (Storage.AJUI_Tip_Storage)
	Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=False
	Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:=""
End use 

  //fade in
If ($tip_instance_obj.animation.fade.in) & ($tip_instance_obj.pu.isPictureTip)
	
	$delay_result:=AJUI_Tip_calcDelayFade ($tip_instance_obj.animation.fade.timer.in;$tip_instance_obj.animation.refresh)
	$higherOpacity_l:=AJUI_Tip_higherOpacity ($tip_instance_obj.text.opacity;$tip_instance_obj.container.backgroundOpacity;$tip_instance_obj.container.borderOpacity)
	
	Repeat 
		$tip_instance_obj.animation.fade.currentOpacity:=$tip_instance_obj.animation.fade.currentOpacity+($higherOpacity_l/$delay_result.totalSteps)
		CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_draw";$tip_instance_obj.global.UUID)
		DELAY PROCESS(Current process;$delay_result.delay)
	Until ($tip_instance_obj.animation.fade.currentOpacity>=$higherOpacity_l) | (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True)
	
	If (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True)
		  // Cancel the animation is done by a show or a hide
		If (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]="show")
			  //$tip_instance_obj.pu.toRebuild:=True  // Force rebuild if we have cancel the fade from the show
			$tip_instance_obj.animation.fade.currentOpacity:=$higherOpacity_l
			CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_draw";$tip_instance_obj.global.UUID)
		End if 
	End if 
	$tip_instance_obj.animation.fade.fadeInTerminated:=True
End if 