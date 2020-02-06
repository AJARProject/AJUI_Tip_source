//%attributes = {"invisible":true}
  // AJUI_Tip_tipBoxDefined ( ) -> return
  //
  // $isDefined_b : (boolean) (return) return tipbox defined
  //
  // This method check if the subform object (tipbox) exist in the current form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.01.19, 09:53:32
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_tipBoxDefined
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_BOOLEAN:C305($0;$isDefined_b;$tipExists)
C_LONGINT:C283($page_l)
C_TEXT:C284($tipbox_name_t)

$page_l:=FORM Get current page:C276

$tipbox_name_t:="AJUI_Tip_sf"
If ($page_l>1)
	$tipbox_name_t:=$tipbox_name_t+"_page"+String:C10($page_l)
End if 
$isDefined_b:=False:C215


ARRAY TEXT:C222($_objectNames_t;0)
FORM GET OBJECTS:C898($_objectNames_t;Form current page:K67:6)
$tipExists:=Find in array:C230($_objectNames_t;$tipbox_name_t)>0
If ($tipExists)  //tipbox suform exists
	$isDefined_b:=True:C214
Else 
	ALERT:C41("You must create a subform object named AJUI_Tip_sf in the current form to use AJUI Tip")
End if 


$0:=$isDefined_b