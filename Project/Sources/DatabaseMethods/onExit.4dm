  // delete the method AJUI_Tip_getSubFormSize

var $method_t : Text
var $pos_l : Real
ARRAY TEXT($_methodNames_t;0)
METHOD GET NAMES($_methodNames_t)
$method_t:="AJUI_Tip_getSubFormSize"

$pos_l:=Find in array($_methodNames_t;$method_t)

If ($pos_l>0)
	
	ALERT("Please remove the method \"AJUI_Tip_getSubFormSize\" before to quit")
	
	
End if 