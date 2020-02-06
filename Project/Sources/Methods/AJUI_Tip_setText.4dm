//%attributes = {"invisible":true}
  // AJUI_Tip_setText ( $label_t )
  //
  // $label_t : (text) Label in the tip
  //
  // Setter/Getter of the label in the tip

If (False:C215)
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

C_TEXT:C284($0;$1;$label_t)

If (Count parameters:C259=0)
	$0:=This:C1470.text.value
Else 
	$label_t:=$1
	This:C1470.text.value:=$label_t
	This:C1470.CheckRebuild()
End if 