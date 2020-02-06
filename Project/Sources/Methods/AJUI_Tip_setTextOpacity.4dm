//%attributes = {"invisible":true}
  // AJUI_Tip_setTextOpacity ( $opacity_l } ) 
  //
  // $opacity_l : (longint) value opacity
  //
  // Setter/Getter to fix the opacity of the text

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.02.19, 14:20:05
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTextOpacity
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_LONGINT:C283($0;$1;$opacity_l)

If (Count parameters:C259=0)
	$0:=This:C1470.text.opacity
Else 
	$opacity_l:=$1
	
	If ($opacity_l>=0) & ($opacity_l<=100)
		This:C1470.text.opacity:=$opacity_l
		This:C1470.CheckRebuild()
		
	End if 
End if 
