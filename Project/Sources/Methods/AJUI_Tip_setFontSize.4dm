//%attributes = {"invisible":true}
  // AJUI_Tip_setFontSize ( $size_l)
  //
  // $size_l : (longint) Font size
  //
  // Setter/Getter of the font size for the text

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.01.19, 15:50:47
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setFontSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



C_LONGINT:C283($0;$1;$size_l)

If (Count parameters:C259=0)
	$0:=This:C1470.text.fontSize
Else 
	$size_l:=$1
	If ($size_l>0)
		This:C1470.text.fontSize:=$size_l
		This:C1470.CheckRebuild()
		
	End if 
End if 