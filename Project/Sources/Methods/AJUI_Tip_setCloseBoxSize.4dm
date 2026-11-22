//%attributes = {"invisible":true}
  // AJUI_Tip_setCloseBoxSize ( {$size_l} ) -> size
  //
  // $1 : (longint) (optional) size
  // $0 : (longint) (return) current size
  //
  // Setter/Getter of the size of the closeBox

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $size_l : Integer

If (Count parameters=0)
	$result:=This.closeBox.size
Else 
	$size_l:=$param1
	If ($size_l>=2) | ($size_l<=20)
		This.closeBox.size:=$size_l
		This.CheckRebuild()
		
	End if 
End if 

