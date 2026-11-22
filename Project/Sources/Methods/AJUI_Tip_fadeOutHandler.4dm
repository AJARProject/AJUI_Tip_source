//%attributes = {"invisible":true}
  // AJUI_Tip_fadeOutHandler ( $tip_instance_UUID )
  //
  // $tip_instance_UUID : (text) UUID of the tip instance
  //
  // This method calculate and execute the fade out effect

#DECLARE($param1 : Text)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 15.02.19, 09:05:07
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_fadeOutHandler
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

  //fade out
If ($tip_instance_obj.animation.fade.out) & ($tip_instance_obj.pu.isPictureTip)
	
	$delay_result:=AJUI_Tip_calcDelayFade ($tip_instance_obj.animation.fade.timer.out;$tip_instance_obj.animation.refresh)
	$higherOpacity_l:=AJUI_Tip_higherOpacity ($tip_instance_obj.text.opacity;$tip_instance_obj.container.backgroundOpacity;$tip_instance_obj.container.borderOpacity)
	
	Repeat 
		$tip_instance_obj.animation.fade.currentOpacity:=$tip_instance_obj.animation.fade.currentOpacity-($higherOpacity_l/$delay_result.totalSteps)
		CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_draw";$tip_instance_obj.global.UUID)
		DELAY PROCESS(Current process;$delay_result.delay)
	Until ($tip_instance_obj.animation.fade.currentOpacity<=0) | (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True)
	
	$tip_instance_obj.animation.fade.fadeOutTerminated:=True
	If (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True)
		  // Cancel the animation is done by a show or a hide
		If (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]="hide")
			$tip_instance_obj.animation.fade.currentOpacity:=0
		End if 
	Else 
		  // Only call the hide if we didnt' cancel the animation
		CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_hide";$tip_instance_obj)
	End if 
End if 