//%attributes = {"invisible":true}
  // AJUI_Tip_show ( ) 
  //
  //
  // Show the tip and rebuild the tip if necessary

#DECLARE($param1 : Object)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 10:59:17
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_show
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_obj; $sharedTip_instance_obj; $delay_result : Object
var $TargetName_t : Text
var $leftTarget_l; $topTarget_l; $rightTarget_l; $bottomTarget_l : Real

If (Count parameters=1)
	$tip_instance_obj:=$param1
	$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_obj.global.UUID]
Else 
	If (This=Null)
		$tip_instance_obj:=New AJUI_Tip 
	Else 
		$tip_instance_obj:=This
		$tip_instance_obj.pu.subformContext:=False
	End if 
End if 

  // Store the window reference during the show
$tip_instance_obj.pu.refWindow:=Current form window

If (AJUI_Tip_subformContext )
	  //subform case
	
	$TargetName_t:=$tip_instance_obj.target.name
	
	If (AJUI_Tip_targetDefined ($TargetName_t))
		
		OBJECT GET COORDINATES(*;$TargetName_t;$leftTarget_l;$topTarget_l;$rightTarget_l;$bottomTarget_l)
		
		  // Translate the coordinate from the subform to the main form window
		CONVERT COORDINATES($leftTarget_l;$topTarget_l;XY Current form;XY Current window)
		CONVERT COORDINATES($rightTarget_l;$bottomTarget_l;XY Current form;XY Current window)
		
		  // Store them to be able to use them afterwards
		$tip_instance_obj.target.coordinate.top:=$topTarget_l
		$tip_instance_obj.target.coordinate.left:=$leftTarget_l
		$tip_instance_obj.target.coordinate.bottom:=$bottomTarget_l
		$tip_instance_obj.target.coordinate.right:=$rightTarget_l
		$tip_instance_obj.pu.subformContext:=True
		
		CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_show";$tip_instance_obj)
		
	End if 
	
Else 
	
	
	  // Do not handle the show if an animation is in process
	If ($tip_instance_obj.animation.isTerminated=True) | ($tip_instance_obj.pu.toRebuild=True)
		
		Use (Storage.AJUI_Tip_Storage)
			Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=True
			Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:="show"
		End use 
		RESUME PROCESS(Process number($tip_instance_obj.pu.worker))
		
		If ($tip_instance_obj.global.tipDuration>0) | (AJUI_Tip_anyAnimationActivated ($tip_instance_obj))
			  // Give 1.1 tick to let the duration or animation worker finish before to to a build
			DELAY PROCESS(Current process;1.1)
		End if 
		
		If ($tip_instance_obj.pu.toRebuild=True)
			  // See if we still need the kill worker
			  // The kill worker is usefull if we trigger many time a rebuild by modifying any property before a show and
			  // if we have animations it will stack the animations 
			KILL WORKER($tip_instance_obj.pu.worker)  // Kill the worker queue if we rebuild
			$tip_instance_obj.global.tipDurationHandlerActive:=False  // Make sure we reset the flag if we kill the worker queue
		End if 
		
		If ($tip_instance_obj.animation.fade.fadeInActive)
			  // To force the rebuild if we do a show during the fadein
			  // We use the delay+1 to let the worker finish before we will call the AJUI_Tip_buildTip method
			$delay_result:=AJUI_Tip_calcDelayFade ($tip_instance_obj.animation.fade.timer.out;$tip_instance_obj.animation.refresh)
			DELAY PROCESS(Current process;$delay_result.delay+1)
			  // We use call form to stack the build after the last call of the fadein
			$tip_instance_obj.animation.fade.fadeInActive:=False
			CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_buildTip";$tip_instance_obj)
		Else 
			AJUI_Tip_buildTip ($tip_instance_obj)
		End if 
	End if 
	
End if 
