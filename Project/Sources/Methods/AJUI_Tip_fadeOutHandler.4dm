//%attributes = {"invisible":true}
  // AJUI_Tip_fadeOutHandler ( $tip_instance_UUID )
  //
  // $tip_instance_UUID : (text) UUID of the tip instance
  //
  // This method calculate and execute the fade out effect

If (False:C215)
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

C_TEXT:C284($1;$tip_instance_UUID)
C_OBJECT:C1216($tip_instance_obj)
C_LONGINT:C283($higherOpacity_l)

$tip_instance_UUID:=$1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]

  //clear flag
Use (Storage:C1525.AJUI_Tip_Storage)
	Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=False:C215
	Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:=""
End use 

  //fade out
If ($tip_instance_obj.animation.fade.out) & ($tip_instance_obj.pu.isPictureTip)
	
	$delay_result:=AJUI_Tip_calcDelayFade ($tip_instance_obj.animation.fade.timer.out;$tip_instance_obj.animation.refresh)
	$higherOpacity_l:=AJUI_Tip_higherOpacity ($tip_instance_obj.text.opacity;$tip_instance_obj.container.backgroundOpacity;$tip_instance_obj.container.borderOpacity)
	
	Repeat 
		$tip_instance_obj.animation.fade.currentOpacity:=$tip_instance_obj.animation.fade.currentOpacity-($higherOpacity_l/$delay_result.totalSteps)
		CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_draw";$tip_instance_obj.global.UUID)
		DELAY PROCESS:C323(Current process:C322;$delay_result.delay)
	Until ($tip_instance_obj.animation.fade.currentOpacity<=0) | (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True:C214)
	
	$tip_instance_obj.animation.fade.fadeOutTerminated:=True:C214
	If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True:C214)
		  // Cancel the animation is done by a show or a hide
		If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]="hide")
			$tip_instance_obj.animation.fade.currentOpacity:=0
		End if 
	Else 
		  // Only call the hide if we didnt' cancel the animation
		CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_hide";$tip_instance_obj)
	End if 
End if 