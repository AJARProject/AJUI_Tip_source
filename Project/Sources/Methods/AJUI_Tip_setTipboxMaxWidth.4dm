//%attributes = {"invisible":true}
  // AJUI_Tip_setTipboxMaxWidth ( $maxWidth_l )
  //
  // $maxWidth_l : (longint) Max width ot the text container
  //
  // Setter/Getter of the max width of the tipbox (text container)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:41:49
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTipboxMaxWidth
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$maxWidth_l)

If (Count parameters:C259=0)
	$0:=This:C1470.container.maxWidth
Else 
	$maxWidth_l:=$1
	If ($maxWidth_l>=0)
		This:C1470.container.maxWidth:=$maxWidth_l
		This:C1470.CheckRebuild()
		
	End if 
End if 
