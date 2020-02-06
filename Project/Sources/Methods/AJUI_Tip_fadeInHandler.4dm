//%attributes = {"invisible":true}
  // AJUI_Tip_fadeInHandler ( $tip_instance_UUID )
  //
  // $tip_instance_UUID : (text) UUID of the tip instance
  //
  // This method calculate and execute the fade in effect

If (False:C215)
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

  //fade in
If ($tip_instance_obj.animation.fade.in) & ($tip_instance_obj.pu.isPictureTip)
	
	$delay_result:=AJUI_Tip_calcDelayFade ($tip_instance_obj.animation.fade.timer.in;$tip_instance_obj.animation.refresh)
	$higherOpacity_l:=AJUI_Tip_higherOpacity ($tip_instance_obj.text.opacity;$tip_instance_obj.container.backgroundOpacity;$tip_instance_obj.container.borderOpacity)
	
	Repeat 
		$tip_instance_obj.animation.fade.currentOpacity:=$tip_instance_obj.animation.fade.currentOpacity+($higherOpacity_l/$delay_result.totalSteps)
		CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_draw";$tip_instance_obj.global.UUID)
		DELAY PROCESS:C323(Current process:C322;$delay_result.delay)
	Until ($tip_instance_obj.animation.fade.currentOpacity>=$higherOpacity_l) | (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True:C214)
	
	If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True:C214)
		  // Cancel the animation is done by a show or a hide
		If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]="show")
			  //$tip_instance_obj.pu.toRebuild:=True  // Force rebuild if we have cancel the fade from the show
			$tip_instance_obj.animation.fade.currentOpacity:=$higherOpacity_l
			CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_draw";$tip_instance_obj.global.UUID)
		End if 
	End if 
	$tip_instance_obj.animation.fade.fadeInTerminated:=True:C214
End if 