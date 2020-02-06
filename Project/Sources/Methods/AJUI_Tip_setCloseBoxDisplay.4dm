//%attributes = {"invisible":true}
  // AJUI_Tip_setCloseBoxDisplay ( $display_b )
  //
  // $display_b : (boolean) CloseBox displayed
  //
  // Setter/Getter to define is the closeBox will be displayed

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:53:33
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setCloseBoxDisplay
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($0;$1;$display_b)

If (Count parameters:C259=0)
	$0:=This:C1470.closeBox.display
Else 
	$display_b:=$1
	This:C1470.closeBox.display:=$display_b
	  //auto activate on click
	If ($display_b)
		This:C1470.closeBox.onClick:=True:C214
	End if 
	This:C1470.CheckRebuild()
End if 