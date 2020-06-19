//%attributes = {"invisible":true}
  // AJUI_Tip_setCloseBoxSize ( {$size_l} ) -> size
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current size
  //
  // Setter/Getter of the size of the closeBox

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 17:04:22
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setCloseBoxSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$size_l)

If (Count parameters:C259=0)
	$0:=This:C1470.closeBox.size
Else 
	$size_l:=$1
	If ($size_l>=2) | ($size_l<=20)
		This:C1470.closeBox.size:=$size_l
		This:C1470.CheckRebuild()
		
	End if 
End if 

