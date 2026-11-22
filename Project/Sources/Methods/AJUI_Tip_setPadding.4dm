//%attributes = {"invisible":true}
  // AJUI_Tip_setPadding ( {$size_l} ) -> padding
  //
  // $1 : (longint) (optional) padding
  // $0 : (longint) (return) current padding
  //
  // Setter/Getter to defined the size of the padding, it will be applied to each side

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $size_l : Integer


If (Count parameters=0)
	$result:=This.container.padding.left
Else 
	$size_l:=$param1
	If ($size_l>=0)
		This.container.padding.left:=$size_l
		This.container.padding.top:=$size_l
		This.container.padding.right:=$size_l
		This.container.padding.bottom:=$size_l
		This.CheckRebuild()
		
	End if 
End if 


