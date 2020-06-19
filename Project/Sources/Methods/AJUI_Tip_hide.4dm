//%attributes = {"invisible":true}
  // AJUI_Tip_hide ( {$tip_instance_obj}  )   
  //
  // $1 : (object) (optional) tip instance
  //
  //  Hide the tip form object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 10:59:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_hide
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_OBJECT:C1216($1;$tip_instance_obj)
C_TEXT:C284($tip_instance_name_sf_t)

If (Count parameters:C259=1)
	$tip_instance_obj:=$1
	$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_obj.global.UUID]
Else 
	$tip_instance_obj:=This:C1470
End if 


$page_l:=FORM Get current page:C276
If ($page_l>1)
	$tip_instance_name_sf_t:="AJUI_Tip_sf_"+"page"+String:C10($page_l)+"_"+$tip_instance_obj.global.name
Else 
	$tip_instance_name_sf_t:="AJUI_Tip_sf_"+$tip_instance_obj.global.name
End if 


If ($tip_instance_obj.pu.displayed=True:C214)
	
	If (AJUI_Tip_subformContext )
		CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_hide";$tip_instance_obj)
	Else 
		
		  // *************
		  // Set stop animatio flag to true
		  // This is to stop any animation of this tip when we rebuild it
		Use (Storage:C1525.AJUI_Tip_Storage)
			Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=True:C214
			Storage:C1525.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:="hide"
		End use 
		RESUME PROCESS:C320(Process number:C372($tip_instance_obj.pu.worker))
		
		  // *************
		  // Fade out handler
		If ($tip_instance_obj.animation.fade.out) & ($tip_instance_obj.pu.isPictureTip) & \
			($tip_instance_obj.animation.fade.fadeOutActive=False:C215)
			$tip_instance_obj.animation.fade.fadeOutActive:=True:C214
			$tip_instance_obj.animation.fade.fadeOutTerminated:=False:C215
			CALL WORKER:C1389($tip_instance_obj.pu.worker;"AJUI_Tip_fadeOutHandler";$tip_instance_obj.global.UUID)
		Else 
			
			  // *************
			  // Hide the tip
			OBJECT SET VISIBLE:C603(*;$tip_instance_name_sf_t;False:C215)
			$tip_instance_obj.animation.fade.currentOpacity:=0
			$tip_instance_obj.pu.displayed:=False:C215
			$tip_instance_obj.animation.fade.fadeOutActive:=False:C215
			
		End if 
		$tip_instance_obj.animation.fade.fadeInActive:=False:C215  // Fadein is inactive when we do a hide
	End if 
End if 