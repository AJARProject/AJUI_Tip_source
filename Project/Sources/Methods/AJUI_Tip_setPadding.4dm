//%attributes = {"invisible":true}
  // AJUI_Tip_setPadding ( {$size_l} ) -> padding
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current padding
  //
  // Setter/Getter to defined the size of the padding, it will be applied to each side

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 11:08:53
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setPadding
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($0;$1;$size_l)


If (Count parameters:C259=0)
	$0:=This:C1470.container.padding.left
Else 
	$size_l:=$1
	If ($size_l>=0)
		This:C1470.container.padding.left:=$size_l
		This:C1470.container.padding.top:=$size_l
		This:C1470.container.padding.right:=$size_l
		This:C1470.container.padding.bottom:=$size_l
		This:C1470.CheckRebuild()
		
	End if 
End if 


