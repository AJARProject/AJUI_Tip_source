//%attributes = {"invisible":true}
  // AJUI_Tip_setTextRotation ( {$rotation_t} ) -> rotation
  //
  // $1 : (text) (optional) rotation
  // $0 : (text) (return) current rotation
  //
  // Setter/Getter of the rotation of the text in the tip, the value available are right, left and ""

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 15:40:45
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTextRotation
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$rotation_t)

If (Count parameters:C259=0)
	$0:=This:C1470.text.rotation
Else 
	$rotation_t:=$1
	
	Case of 
		: ($rotation_t="")
			This:C1470.text.rotation:=""
			This:C1470.CheckRebuild()
		: ($rotation_t="left")
			This:C1470.text.rotation:="left"
			This:C1470.CheckRebuild()
		: ($rotation_t="right")
			This:C1470.text.rotation:="right"
			This:C1470.CheckRebuild()
		Else 
			This:C1470.text.rotation:=""
			This:C1470.CheckRebuild()
	End case 
End if 

