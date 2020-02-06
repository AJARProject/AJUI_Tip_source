//%attributes = {"invisible":true}
  // AJUI_Tip_setTipboxMaxHeight ( $maxHeight_l )
  //
  // $maxHeight_l : (longint) max height of the text container
  //
  // Setter/Getter of the max height of the tipbox (text container)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:48:10
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTipboxMaxHeight
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$maxHeight_l)

If (Count parameters:C259=0)
	$0:=This:C1470.container.maxHeight
Else 
	$maxHeight_l:=$1
	If ($maxHeight_l>=0)
		This:C1470.container.maxHeight:=$maxHeight_l
		This:C1470.CheckRebuild()
		
	End if 
End if 
