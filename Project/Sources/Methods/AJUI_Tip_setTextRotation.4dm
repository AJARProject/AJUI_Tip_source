//%attributes = {"invisible":true}
  // AJUI_Tip_setTextRotation ( {$rotation_t} ) -> rotation
  //
  // $1 : (text) (optional) rotation
  // $0 : (text) (return) current rotation
  //
  // Setter/Getter of the rotation of the text in the tip, the value available are right, left and ""

#DECLARE($param1 : Text) -> $result : Text

If (False)
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

var $rotation_t : Text

If (Count parameters=0)
	$result:=This.text.rotation
Else 
	$rotation_t:=$param1
	
	Case of 
		: ($rotation_t="")
			This.text.rotation:=""
			This.CheckRebuild()
		: ($rotation_t="left")
			This.text.rotation:="left"
			This.CheckRebuild()
		: ($rotation_t="right")
			This.text.rotation:="right"
			This.CheckRebuild()
		Else 
			This.text.rotation:=""
			This.CheckRebuild()
	End case 
End if 

