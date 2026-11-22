//%attributes = {"invisible":true}
  // AJUI_Tip_setText ( {$label_t} ) -> label
  //
  // $1 : (text) (optional) label
  // $0 : (text) (return) current label  
  //
  // Setter/Getter of the label in the tip

#DECLARE($param1 : Text) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 15:33:46
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setText
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $label_t : Text

If (Count parameters=0)
	$result:=This.text.value
Else 
	$label_t:=$param1
	This.text.value:=$label_t
	This.CheckRebuild()
End if 