//%attributes = {"invisible":true}
  // AJUI_Tip_setBorderSize ( {$size_l} ) -> size
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current Border size
  //
  // Setter/Getter of the border size. No border if you pass zero

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 16:42:54
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setBorderSize
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$size_l)

If (Count parameters:C259#1)
	$0:=This:C1470.container.borderSize
Else 
	$size_l:=$1
	If ($size_l>=0)
		This:C1470.container.borderSize:=$size_l
		This:C1470.CheckRebuild()
		
	End if 
End if 