//%attributes = {"invisible":true}
  // AJUI_Tip_show ( ) 
  //
  //
  // Show the tip and rebuild the tip if necessary

If (False:C215)
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

C_OBJECT:C1216($1;$tip_instance_obj)
C_OBJECT:C1216($sharedTip_instance_obj)

If (Count parameters:C259=1)
	$tip_instance_obj:=$1
	$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_obj.global.UUID]
Else 
	If (This:C1470=Null:C1517)
		$tip_instance_obj:=New AJUI_Tip 
	Else 
		$tip_instance_obj:=This:C1470
		$tip_instance_obj.pu.subformContext:=False:C215
	End if 
End if 

  // Store the window reference during the show
$tip_instance_obj.pu.refWindow:=Current form window:C827

If (AJUI_Tip_subformContext )
	  //subform case
	
	$TargetName_t:=$tip_instance_obj.target.name
	
	If (AJUI_Tip_targetDefined ($TargetName_t))
		
		OBJECT GET COORDINATES:C663(*;$TargetName_t;$leftTarget_l;$topTarget_l;$rightTarget_l;$bottomTarget_l)
		
		  // Translate the coordinate from the subform to the main form window
		CONVERT COORDINATES:C1365($leftTarget_l;$topTarget_l;XY Current form:K27:5;XY Current window:K27:6)
		CONVERT COORDINATES:C1365($rightTarget_l;$bottomTarget_l;XY Current form:K27:5;XY Current window:K27:6)
		
		  // Store them to be able to use them afterwards
		$tip_instance_obj.target.coordinate.top:=$topTarget_l
		$tip_instance_obj.target.coordinate.left:=$leftTarget_l
		$tip_instance_obj.target.coordinate.bottom:=$bottomTarget_l
		$tip_instance_obj.target.coordinate.right:=$rightTarget_l
		$tip_instance_obj.pu.subformContext:=True:C214
		
		CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_show";$tip_instance_obj)
		
	End if 
	
Else 
	
	
	  // Do not handle the show if an animation is in process
	If ($tip_instance_obj.animation.isTerminated=True:C214) | ($tip_instance_obj.pu.toRebuild=True:C214)
		
		Use (Storage:C1525.AJUI_Tip_Storage)
			Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=True:C214
			Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:="show"
		End use 
		RESUME PROCESS:C320(Process number:C372($tip_instance_obj.pu.worker))
		
		If ($tip_instance_obj.global.tipDuration>0) | (AJUI_Tip_anyAnimationActivated ($tip_instance_obj))
			  // Give 1.1 tick to let the duration or animation worker finish before to to a build
			DELAY PROCESS:C323(Current process:C322;1.1)
		End if 
		
		If ($tip_instance_obj.pu.toRebuild=True:C214)
			  // See if we still need the kill worker
			  // The kill worker is usefull if we trigger many time a rebuild by modifying any property before a show and
			  // if we have animations it will stack the animations 
			KILL WORKER:C1390($tip_instance_obj.pu.worker)  // Kill the worker queue if we rebuild
			$tip_instance_obj.global.tipDurationHandlerActive:=False:C215  // Make sure we reset the flag if we kill the worker queue
		End if 
		
		If ($tip_instance_obj.animation.fade.fadeInActive)
			  // To force the rebuild if we do a show during the fadein
			  // We use the delay+1 to let the worker finish before we will call the AJUI_Tip_buildTip method
			$delay_result:=AJUI_Tip_calcDelayFade ($tip_instance_obj.animation.fade.timer.out;$tip_instance_obj.animation.refresh)
			DELAY PROCESS:C323(Current process:C322;$delay_result.delay+1)
			  // We use call form to stack the build after the last call of the fadein
			$tip_instance_obj.animation.fade.fadeInActive:=False:C215
			CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_buildTip";$tip_instance_obj)
		Else 
			AJUI_Tip_buildTip ($tip_instance_obj)
		End if 
	End if 
	
End if 
