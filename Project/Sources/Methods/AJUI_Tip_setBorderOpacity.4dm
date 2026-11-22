//%attributes = {"invisible":true}
  // AJUI_Tip_SetBorderOpacity ( {$opacity_l } ) -> opacity
  //
  // $1 : (longint) (optional) opacity
  // $0 : (longint) (return) current Border opacity
  //
  // Setter/Getter to fix the opacity of the container border

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.02.19, 14:54:10
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_SetBorderOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $opacity_l : Integer

If (Count parameters=0)
	$result:=This.container.borderOpacity
Else 
	$opacity_l:=$param1
	
	If ($opacity_l>=0) & ($opacity_l<=100)
		This.container.borderOpacity:=$opacity_l
		This.CheckRebuild()
		
	End if 
	
End if 