//%attributes = {"invisible":true}
  // AJUI_Tip_firstGeneration_proc ( $tip_instance_obj ) 
  //
  // $tip_instance_obj : (object) tip instance
  //
  // Call the buildTip method in the case of a first generation

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 20.02.19, 09:12:40
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_firstGeneration_proc
	  // Description
	  // We do that to let the form draw itself in the first generation of the tip.
	  // This is mandatory because we do a DUPLICATE OBJECT and before end of the execution cycle the object doesn't behave exactly the same as if it exist
	  // We need to create a temp process that will be delayed of 2 ticks to recall the buildTip method in a correct context where the tip is well created.
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$tip_instance_UUID)
C_OBJECT:C1216($tip_instance_obj)

$tip_instance_UUID:=$1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]

DELAY PROCESS:C323(Current process:C322;2)

CALL FORM:C1391($tip_instance_obj.pu.refWindow;"AJUI_Tip_show";$tip_instance_obj)
