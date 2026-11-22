//%attributes = {"invisible":true}
  // AJUI_Tip_tipBoxDefined ( ) -> return
  //
  // $isDefined_b : (boolean) (return) return tipbox defined
  //
  // This method check if the subform object (tipbox) exist in the current form

#DECLARE() -> $result : Boolean

If (False)
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


var $isDefined_b; $tipExists : Boolean
var $page_l : Integer
var $tipbox_name_t : Text

$page_l:=FORM Get current page

$tipbox_name_t:="AJUI_Tip_sf"
If ($page_l>1)
	$tipbox_name_t:=$tipbox_name_t+"_page"+String($page_l)
End if 
$isDefined_b:=False


ARRAY TEXT($_objectNames_t;0)
FORM GET OBJECTS($_objectNames_t;Form current page)
$tipExists:=Find in array($_objectNames_t;$tipbox_name_t)>0
If ($tipExists)  //tipbox suform exists
	$isDefined_b:=True
Else 
	ALERT("You must create a subform object named AJUI_Tip_sf in the current form to use AJUI Tip")
End if 


$result:=$isDefined_b