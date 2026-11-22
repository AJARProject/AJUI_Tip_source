//%attributes = {"invisible":true}
  // AJUI_Tip_setBackgroundOpacity ( {$opacity_l } ) -> opacity
  //
  // $1 : (longint) (optional) opacity
  // $0 : (longint) (return) current BG opacity
  //
  // Setter/Getter to fix the opacity of the container background

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.02.19, 14:54:05
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBackgroundOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $opacity_l : Integer

If (Count parameters=0)
	$result:=This.container.backgroundOpacity
Else 
	$opacity_l:=$param1
	
	If ($opacity_l>=0) & ($opacity_l<=100)
		This.container.backgroundOpacity:=$opacity_l
		This.CheckRebuild()
	End if 
	
End if 