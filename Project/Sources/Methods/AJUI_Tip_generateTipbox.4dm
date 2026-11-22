//%attributes = {"invisible":true}
  // AJUI_Tip_generateTipbox ( $tip_instance_name_t )
  //
  // $tip_instance_name_t : (text) Tip name
  // $isFirstGeneration : (boolean) (return) say if we duplicate the tip
  //
  // Geneterate the tipbox (subform) related to the tip instance name if not exist

#DECLARE($param1 : Text) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.01.19, 10:02:19
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_generateTipbox
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_name_t; $tipbox_name_t : Text
var $isFirstGeneration; $tipExists : Boolean
var $page_l : Integer

$tip_instance_name_t:=$param1

$page_l:=FORM Get current page

$tipbox_name_t:="AJUI_Tip_sf"
If ($page_l>1)
	$tipbox_name_t:=$tipbox_name_t+"_page"+String($page_l)
End if 

ARRAY TEXT($_objectNames_t;0)
FORM GET OBJECTS($_objectNames_t;Form all pages)
$tipExists:=Find in array($_objectNames_t;$tip_instance_name_t)>0
If ($tipExists)  //tipbox suform exists
	  //do nothing
	$isFirstGeneration:=False
Else 
	var Form_temp : Object
	Form_temp:=Form
	OBJECT DUPLICATE(*;$tipbox_name_t;$tip_instance_name_t;->Form_temp)
	OBJECT SET SUBFORM(*;$tip_instance_name_t;"AJUI_Tip_container")
	
	$isFirstGeneration:=True
End if 

$result:=$isFirstGeneration