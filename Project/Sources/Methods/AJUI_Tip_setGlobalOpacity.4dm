//%attributes = {"invisible":true}
  // AJUI_Tip_setGlobalOpacity ( $opacity_l) 
  //
  // $1 : (longint) % of opacity
  //
  // Global setter to fix all opacity properties in the same value

#DECLARE($param1 : Integer)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.02.19, 08:56:44
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setGlobalOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $opacity_l : Integer

If (Count parameters=0)
	  //do nothing
Else 
	$opacity_l:=$param1
	
	If ($opacity_l>=0) & ($opacity_l<=100)
		This.container.backgroundOpacity:=$opacity_l
		This.container.borderOpacity:=$opacity_l
		This.text.opacity:=$opacity_l
		This.CheckRebuild()
		
	End if 
	
End if 