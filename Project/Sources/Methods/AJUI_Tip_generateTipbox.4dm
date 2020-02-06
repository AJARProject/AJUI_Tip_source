//%attributes = {"invisible":true}
  // AJUI_Tip_generateTipbox ( $tip_instance_name_t )
  //
  // $tip_instance_name_t : (text) Tip name
  // $isFirstGeneration : (boolean) (return) say if we duplicate the tip
  //
  // Geneterate the tipbox (subform) related to the tip instance name if not exist

If (False:C215)
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

C_TEXT:C284($1;$tip_instance_name_t)
C_BOOLEAN:C305($0;$isFirstGeneration)
C_BOOLEAN:C305($tipExists)
C_LONGINT:C283($page_l)
C_TEXT:C284($tipbox_name_t)

$tip_instance_name_t:=$1

$page_l:=FORM Get current page:C276

$tipbox_name_t:="AJUI_Tip_sf"
If ($page_l>1)
	$tipbox_name_t:=$tipbox_name_t+"_page"+String:C10($page_l)
End if 

ARRAY TEXT:C222($_objectNames_t;0)
FORM GET OBJECTS:C898($_objectNames_t;Form all pages:K67:7)
$tipExists:=Find in array:C230($_objectNames_t;$tip_instance_name_t)>0
If ($tipExists)  //tipbox suform exists
	  //do nothing
	$isFirstGeneration:=False:C215
Else 
	C_OBJECT:C1216(Form_temp)
	Form_temp:=Form:C1466
	OBJECT DUPLICATE:C1111(*;$tipbox_name_t;$tip_instance_name_t;->Form_temp)
	OBJECT SET SUBFORM:C1138(*;$tip_instance_name_t;"AJUI_Tip_container")
	
	$isFirstGeneration:=True:C214
End if 

$0:=$isFirstGeneration