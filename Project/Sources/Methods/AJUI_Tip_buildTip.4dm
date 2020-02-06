//%attributes = {"invisible":true}
  // AJUI_Tip_buildTip ( $tip_obj )
  //
  // $tip_obj : (object) Tip instance 
  //
  // Build the tip object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 15:18:59
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_buildTip
	  // Description
	  // This method will 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$tip_instance_obj)
C_TEXT:C284($tipbox_t;$tip_instance_name_sf_t;$TargetName_t;$tip_position_t)
C_LONGINT:C283($topTarget_l;$leftTarget_l;$rightTarget_l;$bottomTarget_l)
C_LONGINT:C283($ContainerHeigh_l;$ContainerWidth)
C_LONGINT:C283($positionTip_left_l;$positionTip_top_l;$positionTip_bottom_l;$position_tip_right_l)
C_LONGINT:C283($Target_offset_l;$marginTop_l;$marginLeft_l;$marginBottom_l;$marginRight_l)

$tip_instance_obj:=$1


  //check original tipbox exist in the current form
If (AJUI_Tip_tipBoxDefined )
	
	  // *************
	  // Set the name of the current instance of the tip and the worker used for animations
	$page_l:=FORM Get current page:C276
	If ($page_l>1)
		$tip_instance_name_sf_t:="AJUI_Tip_sf_"+"page"+String:C10($page_l)+"_"+$tip_instance_obj.global.name
	Else 
		$tip_instance_name_sf_t:="AJUI_Tip_sf_"+$tip_instance_obj.global.name
	End if 
	$tip_instance_obj.instanceName_subform:=$tip_instance_name_sf_t
	
	  // *************
	  // Check if we have to generate the tip the first time and duplicate the initial tip subform
	If (AJUI_Tip_generateTipbox ($tip_instance_name_sf_t))
		$ref_process:=New process:C317("AJUI_Tip_firstGeneration_proc";0;"$AJUI_Tip_firstGeneration_proc";$tip_instance_obj.global.UUID)
	Else 
		  // Duration to add in case of a fadein
		$durationToAdd:=0
		
		  // Rebuild if the toRebuild is set to true OR
		  // If we have the fade in or fade out set and (that the tip is not displayed or fade out is currently active)
		If (($tip_instance_obj.pu.toRebuild=True:C214) | \
			((($tip_instance_obj.pu.displayed=False:C215) | ($tip_instance_obj.animation.fade.fadeOutActive=True:C214)) & \
			(($tip_instance_obj.animation.fade.in | $tip_instance_obj.animation.fade.out) & ($tip_instance_obj.pu.isPictureTip)))\
			)
			
			  // *************
			  // Get target coordinates
			$TargetName_t:=$tip_instance_obj.target.name
			If (AJUI_Tip_targetDefined ($TargetName_t)) & ($tip_instance_obj.pu.subformContext=False:C215)
				OBJECT GET COORDINATES:C663(*;$TargetName_t;$leftTarget_l;$topTarget_l;$rightTarget_l;$bottomTarget_l)
				$tip_instance_obj.target.coordinate.left:=$leftTarget_l
				$tip_instance_obj.target.coordinate.top:=$topTarget_l
				$tip_instance_obj.target.coordinate.right:=$rightTarget_l
				$tip_instance_obj.target.coordinate.bottom:=$bottomTarget_l
			Else 
				  //manually defined or target inside a subform and automatically defined in a previous step
				$leftTarget_l:=$tip_instance_obj.target.coordinate.left
				$topTarget_l:=$tip_instance_obj.target.coordinate.top
				$rightTarget_l:=$tip_instance_obj.target.coordinate.right
				$bottomTarget_l:=$tip_instance_obj.target.coordinate.bottom
			End if 
			
			  // *************
			  //translate the arrow position to keep a coherence with the tip if necessary
			AJUI_Tip_translateArrowPosition ($tip_instance_obj)
			
			  // *************
			  // Set the type of tip flag -> Picture or Subform
			If (($tip_instance_obj.subForm.name#"") & (AJUI_Tip_formToUseExist ($tip_instance_obj.subForm.name)))
				$tip_instance_obj.pu.isPictureTip:=False:C215
			Else 
				$tip_instance_obj.pu.isPictureTip:=True:C214
			End if 
			
			  // *************
			  // Fade in handler
			If ($tip_instance_obj.animation.fade.in) & ($tip_instance_obj.pu.isPictureTip) & ($tip_instance_obj.animation.fade.fadeInActive=False:C215) & \
				(($tip_instance_obj.pu.displayed=False:C215) | ($tip_instance_obj.animation.fade.fadeOutActive=True:C214))
				  // Only do fadein if it is not already active and it is not displayed and if we have the tip type as a picture and also if the fadeout is currently active
				$tip_instance_obj.animation.fade.fadeInActive:=True:C214
				$tip_instance_obj.animation.fade.fadeInTerminated:=False:C215
				CALL WORKER:C1389($tip_instance_obj.pu.worker;"AJUI_Tip_fadeInHandler";$tip_instance_obj.global.UUID)
				$durationToAdd:=$tip_instance_obj.animation.fade.timer.in
			Else 
				$tip_instance_obj.animation.fade.fadeInActive:=False:C215
				$tip_instance_obj.animation.fade.currentOpacity:=AJUI_Tip_higherOpacity ($tip_instance_obj.text.opacity;$tip_instance_obj.container.backgroundOpacity;$tip_instance_obj.container.borderOpacity)
			End if 
			$tip_instance_obj.animation.fade.fadeOutActive:=False:C215  // Fadeout is inactive when we do a show
			
			  // *************
			  // Draw Tip
			AJUI_Tip_draw ($tip_instance_obj.global.UUID)
			
			  // *************
			  // Position the tip
			
			  // position tip subform
			$tip_position_t:=$tip_instance_obj.target.tipPosition
			$ContainerHeigh_l:=$tip_instance_obj.container.height
			$ContainerWidth:=$tip_instance_obj.container.width
			
			  //margins and offset
			$Target_offset_l:=$tip_instance_obj.target.offset
			$marginTop_l:=$tip_instance_obj.target.margin.top
			$marginBottom_l:=$tip_instance_obj.target.margin.bottom
			$marginLeft_l:=$tip_instance_obj.target.margin.left
			$marginRight_l:=$tip_instance_obj.target.margin.right
			
			  //calc coordinates
			Case of 
				: ($tip_position_t="top-left")
					$positionTip_left_l:=$leftTarget_l+$Target_offset_l
					$positionTip_top_l:=$topTarget_l-$marginTop_l-$ContainerHeigh_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="top-center")
					$positionTip_left_l:=$leftTarget_l+(($rightTarget_l-$leftTarget_l)/2)-($ContainerWidth/2)
					$positionTip_top_l:=$topTarget_l-$marginTop_l-$ContainerHeigh_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="top-right")
					$position_tip_right_l:=$rightTarget_l+$Target_offset_l
					$positionTip_top_l:=$topTarget_l-$marginTop_l-$ContainerHeigh_l
					$positionTip_left_l:=$position_tip_right_l-$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="left-top")
					$positionTip_left_l:=$leftTarget_l-$ContainerWidth-$marginLeft_l
					$positionTip_top_l:=$topTarget_l+$Target_offset_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="left-middle")
					$positionTip_left_l:=$leftTarget_l-$ContainerWidth-$marginLeft_l
					$positionTip_top_l:=$topTarget_l+(($bottomTarget_l-$topTarget_l)/2)-($ContainerHeigh_l/2)
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="left-bottom")
					$positionTip_left_l:=$leftTarget_l-$ContainerWidth-$marginLeft_l
					$positionTip_bottom_l:=$bottomTarget_l+$Target_offset_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_top_l:=$positionTip_bottom_l-$ContainerHeigh_l
					
				: ($tip_position_t="bottom-left")
					$positionTip_left_l:=$leftTarget_l+$Target_offset_l
					$positionTip_top_l:=$bottomTarget_l+$marginBottom_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="bottom-center")
					$positionTip_left_l:=$leftTarget_l+(($rightTarget_l-$leftTarget_l)/2)-($ContainerWidth/2)
					$positionTip_top_l:=$bottomTarget_l+$marginBottom_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="bottom-right")
					$position_tip_right_l:=$rightTarget_l+$Target_offset_l
					$positionTip_top_l:=$bottomTarget_l+$marginBottom_l
					$positionTip_left_l:=$position_tip_right_l-$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="right-top")
					$positionTip_left_l:=$rightTarget_l+$marginRight_l
					$positionTip_top_l:=$topTarget_l+$Target_offset_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="right-middle")
					$positionTip_left_l:=$rightTarget_l+$marginRight_l
					$positionTip_top_l:=$topTarget_l+(($bottomTarget_l-$topTarget_l)/2)-($ContainerHeigh_l/2)
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_bottom_l:=$positionTip_top_l+$ContainerHeigh_l
					
				: ($tip_position_t="right-bottom")
					$positionTip_left_l:=$rightTarget_l+$marginRight_l
					$positionTip_bottom_l:=$bottomTarget_l+$Target_offset_l
					$position_tip_right_l:=$positionTip_left_l+$ContainerWidth
					$positionTip_top_l:=$positionTip_bottom_l-$ContainerHeigh_l
					
			End case 
			
			  //set tip coordinates
			OBJECT SET COORDINATES:C1248(*;$tip_instance_name_sf_t;$positionTip_left_l;$positionTip_top_l;$position_tip_right_l;$positionTip_bottom_l)
			$tip_instance_obj.container.coordinate.left:=$positionTip_left_l
			$tip_instance_obj.container.coordinate.top:=$positionTip_top_l
			$tip_instance_obj.container.coordinate.right:=$position_tip_right_l
			$tip_instance_obj.container.coordinate.bottom:=$positionTip_bottom_l
			
		End if 
		
		$anyAnimationActivated:=AJUI_Tip_anyAnimationActivated ($tip_instance_obj)
		
		If ($anyAnimationActivated) & ($tip_instance_obj.animation.isActive)
			AJUI_Tip_animationWrk ($tip_instance_obj)
		End if 
		
		  // *************
		  // Handle the tip duration 
		If ($tip_instance_obj.global.tipDuration>0)
			  // Reset the end duration each call to show
			Use (Storage:C1525.AJUI_Tip_Storage)
				Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_endDuration"]:=Milliseconds:C459+$tip_instance_obj.global.tipDuration+$durationToAdd
			End use 
			
			If ($tip_instance_obj.global.tipDurationHandlerActive=False:C215)
				  //clear flag
				Use (Storage:C1525.AJUI_Tip_Storage)
					Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=False:C215
					Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:=""
				End use 
				$tip_instance_obj.global.tipDurationHandlerActive:=True:C214
				CALL WORKER:C1389($tip_instance_obj.pu.worker;"AJUI_Tip_durationHandler";$tip_instance_obj.global.UUID)
			End if 
		End if 
		
		
		  // *************
		  // Display the tip
		OBJECT SET VISIBLE:C603(*;$tip_instance_name_sf_t;True:C214)
		$tip_instance_obj.pu.toRebuild:=False:C215
		$tip_instance_obj.pu.displayed:=True:C214
	End if 
End if 
