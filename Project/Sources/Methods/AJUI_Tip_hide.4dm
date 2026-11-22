//%attributes = {"invisible":true}
  // AJUI_Tip_hide ( {$tip_instance_obj}  )   
  //
  // $1 : (object) (optional) tip instance
  //
  //  Hide the tip form object

#DECLARE($param1 : Object)

If (False)
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
var $tip_instance_obj : Object
var $tip_instance_name_sf_t : Text
var $page_l : Real

If (Count parameters=1)
	$tip_instance_obj:=$param1
	$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_obj.global.UUID]
Else 
	$tip_instance_obj:=This
End if 


$page_l:=FORM Get current page
If ($page_l>1)
	$tip_instance_name_sf_t:="AJUI_Tip_sf_"+"page"+String($page_l)+"_"+$tip_instance_obj.global.name
Else 
	$tip_instance_name_sf_t:="AJUI_Tip_sf_"+$tip_instance_obj.global.name
End if 


If ($tip_instance_obj.pu.displayed=True)
	
	If (AJUI_Tip_subformContext )
		CALL FORM($tip_instance_obj.pu.refWindow;"AJUI_Tip_hide";$tip_instance_obj)
	Else 
		
		  // *************
		  // Set stop animatio flag to true
		  // This is to stop any animation of this tip when we rebuild it
		Use (Storage.AJUI_Tip_Storage)
			Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimation"]:=True
			Storage.AJUI_Tip_Storage[$tip_instance_obj.global.name+"_stopAnimationFrom"]:="hide"
		End use 
		RESUME PROCESS(Process number($tip_instance_obj.pu.worker))
		
		  // *************
		  // Fade out handler
		If ($tip_instance_obj.animation.fade.out) & ($tip_instance_obj.pu.isPictureTip) & \
			($tip_instance_obj.animation.fade.fadeOutActive=False)
			$tip_instance_obj.animation.fade.fadeOutActive:=True
			$tip_instance_obj.animation.fade.fadeOutTerminated:=False
			CALL WORKER($tip_instance_obj.pu.worker;"AJUI_Tip_fadeOutHandler";$tip_instance_obj.global.UUID)
		Else 
			
			  // *************
			  // Hide the tip
			OBJECT SET VISIBLE(*;$tip_instance_name_sf_t;False)
			$tip_instance_obj.animation.fade.currentOpacity:=0
			$tip_instance_obj.pu.displayed:=False
			$tip_instance_obj.animation.fade.fadeOutActive:=False
			
		End if 
		$tip_instance_obj.animation.fade.fadeInActive:=False  // Fadein is inactive when we do a hide
	End if 
End if 