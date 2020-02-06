//%attributes = {"invisible":true}
  // AJUI_Tip_draw ( $tip_instance_obj )
  //
  // $tip_instance_obj : (object) Tip instance
  //
  // This method will manage the subform object content

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 28.01.19, 10:04:07
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_draw
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$tip_instance_UUID)
C_OBJECT:C1216($tip_instance_obj)

C_BOOLEAN:C305($2)  // For pseudo recursive call
C_LONGINT:C283($sfContainerWidth_l;$sfContainerHeight_l;$pictContainerHeigh_l;$pictContainerWidth)
C_TEXT:C284($formToInclude_name_t;$sfContainerName_t;$pictContainerName_t;$tip_position_t)
C_PICTURE:C286($pictContent_pict)

$tip_instance_UUID:=$1
$tip_instance_obj:=<>AJUI_Tip_Storage[$tip_instance_UUID]

If (Count parameters:C259=1)
	  // We use pseudo recursive call to execute this method inside the tip subform
	$tip_instance_name_sf_t:=$tip_instance_obj.instanceName_subform
	EXECUTE METHOD IN SUBFORM:C1085($tip_instance_name_sf_t;"AJUI_Tip_draw";*;$tip_instance_UUID;True:C214)
	
Else 
	
	$sfContainerName_t:="AJUI_Tip_container_sf"
	$pictContainerName_t:="AJUI_Tip_container_pict"
	
	
	
	  //check if we need to use the sf container
	If ($tip_instance_obj.pu.isPictureTip=False:C215)
		$formToInclude_name_t:=$tip_instance_obj.subForm.name
		
		  //join form to sf container
		OBJECT SET SUBFORM:C1138(*;$sfContainerName_t;$formToInclude_name_t)
		OBJECT SET VISIBLE:C603(*;$sfContainerName_t;True:C214)
		
		  //get form size
		  //FORM GET PROPERTIES($formToInclude_name_t;$sfContainerWidth_l;$sfContainerHeight_l)  // we can't get the form properties in the context of the component
		EXECUTE METHOD:C1007("AJUI_Tip_getSubFormSize";*;$formToInclude_name_t;->$sfContainerWidth_l;->$sfContainerHeight_l)
		$tip_instance_obj.subForm.width:=$sfContainerWidth_l
		$tip_instance_obj.subForm.height:=$sfContainerHeight_l
		
	Else 
		OBJECT SET VISIBLE:C603(*;$sfContainerName_t;False:C215)
	End if 
	
	  //draw content
	$pictContent_pict:=AJUI_Tip_drawTipbox ($tip_instance_obj)
	
	
	OBJECT Get pointer:C1124(Object named:K67:5;$pictContainerName_t)->:=$pictContent_pict
	
	  //resize picture container
	$pictContainerHeigh_l:=$tip_instance_obj.container.height
	$pictContainerWidth:=$tip_instance_obj.container.width
	OBJECT SET COORDINATES:C1248(*;$pictContainerName_t;0;0;$pictContainerWidth;$pictContainerHeigh_l)
	OBJECT SET VISIBLE:C603(*;$pictContainerName_t;True:C214)
	
	  //store object properties
	OBJECT Get pointer:C1124(Object named:K67:5;"AJUI_Tip_definition")->:=OB Copy:C1225($tip_instance_obj)
	
End if 

