//%attributes = {"invisible":true}
  // AJUI_Tip_animationHandler ( $tip_instance_obj  )
  //
  // $tip_instance_obj : (object) description
  //
  // This method calculates the animations depending on the tip instance properties

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 08.02.19, 09:20:17
	  // Modified by: Gary Criblez (08.02.19)
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_animationHandler
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_TEXT:C284($1;$tip_instance_UUID)
C_OBJECT:C1216($tip_instance_obj)
C_REAL:C285($delay_r;$top_r;$left_r;$bottom_r;$right_r)
C_REAL:C285($tip_duration_r;$total_duration_blink_r;$total_duration_jump_r;$startAnimTimer_r;$endAnimTimer_r;$timeRemaining_r)
C_REAL:C285($jumpDurationMax_r;$tipJump_rj;$tipJumpOn_r;$jumpIncrement_r)
C_LONGINT:C283($refresh_l;$maxcounter_l;$counter_l;$count_l;$loop_l;$frequency_l)
C_TEXT:C284($direction_t)

$tip_instance_UUID:=$1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]

$tip_duration_r:=$tip_instance_obj.global.tipDuration
$total_duration_blink_r:=$tip_instance_obj.animation.blink.number*$tip_instance_obj.animation.blink.duration
$total_duration_jump_r:=$tip_instance_obj.animation.jump.duration

$durationEnded:=False:C215
$fixBugFirstDelayProcess:=True:C214  // THis bug happend only for the first delay process for an existing worker

If (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False:C215)
	Case of 
		: ($tip_instance_obj.animation.blink.number>0)
			  // *************
			  // Blink animation
			
			$blink_number:=($tip_instance_obj.animation.blink.number*2)
			
			$displayed:=True:C214
			Repeat 
				$delay_r:=($tip_instance_obj.animation.blink.duration*60)/1000
				$blink_number:=$blink_number-1
				If ($displayed)
					If ($fixBugFirstDelayProcess)
						$fixBugFirstDelayProcess:=False:C215
						DELAY PROCESS:C323(Current process:C322;($delay_r*$tip_instance_obj.animation.blink.on)/100)  //display ON duration
					End if 
					DELAY PROCESS:C323(Current process:C322;($delay_r*$tip_instance_obj.animation.blink.on)/100)  //display ON duration
					$displayed:=False:C215
				Else 
					DELAY PROCESS:C323(Current process:C322;($delay_r*(100-$tip_instance_obj.animation.blink.on))/100)  //display OFF duration
					$displayed:=True:C214
				End if 
				CALL FORM:C1391($tip_instance_obj.pu.refWindow;"ajui_tip_animation";$tip_instance_obj;$displayed)  // launch update display
				
				If ($tip_duration_r>0)
					$durationEnded:=$durationEnded | (Milliseconds:C459>Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_endDuration"])
				End if 
			Until ($blink_number<1) | (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True:C214) | ($durationEnded)
			
			If ($blink_number>=1) & ($tip_instance_obj.animation.fade.out) & ($tip_instance_obj.pu.isPictureTip)
				CALL FORM:C1391($tip_instance_obj.pu.refWindow;"ajui_tip_animation";$tip_instance_obj;True:C214)  // Force The display if we went out before the end
			End if 
			
		: ($tip_instance_obj.animation.jump.number>0)
			  // *************
			  // Jump animation
			
			$jumpIncrement_r:=0
			$direction_t:=$tip_instance_obj.target.tipPosition
			$jumpNumber:=$tip_instance_obj.animation.jump.number
			$tip_instance_obj_temp:=OB Copy:C1225($tip_instance_obj)
			
			Repeat 
				
				$jumpDurationMax_r:=$tip_instance_obj.animation.jump.duration
				$tipJump_r:=$jumpDurationMax_r/1000  //jump rate (jump/sec)
				$tipJumpOn_r:=$tip_instance_obj.animation.jump.on/100
				$refresh_l:=$tip_instance_obj.animation.refresh
				$delay_r:=60/$refresh_l
				$maxcounter_l:=Round:C94($tipJump_r/2*$tip_instance_obj.animation.refresh;0)
				$jumpIncrement_r:=$tip_instance_obj.animation.jump.offset/$maxcounter_l
				$counter_l:=0
				
				$top_r:=$tip_instance_obj.animation.coordinate.top
				$bottom_r:=$tip_instance_obj.animation.coordinate.bottom
				$right_r:=$tip_instance_obj.animation.coordinate.right
				$left_r:=$tip_instance_obj.animation.coordinate.left
				
				  // jump Up
				  //Repeat 
				$durationEnded:=False:C215
				
				While ($counter_l<$maxcounter_l) & (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False:C215) & ($durationEnded=False:C215)
					Case of 
						: ($direction_t="left@")
							$left_r:=$left_r-$jumpIncrement_r
							$right_r:=$right_r-$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.left:=Round:C94($left_r;0)
							$tip_instance_obj_temp.animation.coordinate.right:=Round:C94($right_r;0)
						: ($direction_t="top@")
							$top_r:=$top_r-$jumpIncrement_r
							$bottom_r:=$bottom_r-$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.top:=Round:C94($top_r;0)
							$tip_instance_obj_temp.animation.coordinate.bottom:=Round:C94($bottom_r;0)
						: ($direction_t="right@")
							$right_r:=$right_r+$jumpIncrement_r
							$left_r:=$left_r+$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.left:=Round:C94($left_r;0)
							$tip_instance_obj_temp.animation.coordinate.right:=Round:C94($right_r;0)
						: ($direction_t="bottom@")
							$top_r:=$top_r+$jumpIncrement_r
							$bottom_r:=$bottom_r+$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.top:=Round:C94($top_r;0)
							$tip_instance_obj_temp.animation.coordinate.bottom:=Round:C94($bottom_r;0)
					End case 
					DELAY PROCESS:C323(Current process:C322;$delay_r*$tipJumpOn_r)
					CALL FORM:C1391($tip_instance_obj.pu.refWindow;"ajui_tip_animation";$tip_instance_obj_temp)
					$counter_l:=$counter_l+1
					
					If ($tip_duration_r>0)
						$durationEnded:=$durationEnded | (Milliseconds:C459>Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_endDuration"])
					End if 
					  //Until ($counter_l>=$maxcounter_l) | (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True) | ($durationEnded)
				End while 
				
				$counter_l:=0
				  // jump Down
				
				While ($counter_l<$maxcounter_l) & (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=False:C215) & ($durationEnded=False:C215)
					  //Repeat 
					Case of 
						: ($direction_t="left@")
							$left_r:=$left_r+$jumpIncrement_r
							$right_r:=$right_r+$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.left:=Round:C94($left_r;0)
							$tip_instance_obj_temp.animation.coordinate.right:=Round:C94($right_r;0)
						: ($direction_t="top@")
							$top_r:=$top_r+$jumpIncrement_r
							$bottom_r:=$bottom_r+$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.top:=Round:C94($top_r;0)
							$tip_instance_obj_temp.animation.coordinate.bottom:=Round:C94($bottom_r;0)
						: ($direction_t="right@")
							$right_r:=$right_r-$jumpIncrement_r
							$left_r:=$left_r-$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.left:=Round:C94($left_r;0)
							$tip_instance_obj_temp.animation.coordinate.right:=Round:C94($right_r;0)
						: ($direction_t="bottom@")
							$top_r:=$top_r-$jumpIncrement_r
							$bottom_r:=$bottom_r-$jumpIncrement_r
							$tip_instance_obj_temp.animation.coordinate.top:=Round:C94($top_r;0)
							$tip_instance_obj_temp.animation.coordinate.bottom:=Round:C94($bottom_r;0)
					End case 
					DELAY PROCESS:C323(Current process:C322;$delay_r*(1-$tipJumpOn_r))
					CALL FORM:C1391($tip_instance_obj.pu.refWindow;"ajui_tip_animation";$tip_instance_obj_temp)
					$counter_l:=$counter_l+1
					
					If ($tip_duration_r>0)
						$durationEnded:=$durationEnded | (Milliseconds:C459>Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_endDuration"])
					End if 
				End while 
				  //Until ($counter_l>=$maxcounter_l) | (Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True) | ($durationEnded)
				
				$jumpNumber:=$jumpNumber-1
				
			Until ($jumpNumber<=0) | (Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]=True:C214) | ($durationEnded)
			
		Else 
			
			  // Animation type doesn't exist
			
	End case 
	
End if 


$tip_instance_obj.animation.isTerminated:=True:C214