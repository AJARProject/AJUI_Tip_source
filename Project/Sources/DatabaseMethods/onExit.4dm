  // delete the method AJUI_Tip_getSubFormSize

ARRAY TEXT:C222($_methodNames_t;0)
METHOD GET NAMES:C1166($_methodNames_t)
$method_t:="AJUI_Tip_getSubFormSize"

$pos_l:=Find in array:C230($_methodNames_t;$method_t)

If ($pos_l>0)
	
	ALERT:C41("Please remove the method \"AJUI_Tip_getSubFormSize\" before to quit")
	
	
End if 