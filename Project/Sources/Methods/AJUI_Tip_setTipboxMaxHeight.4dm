//%attributes = {"invisible":true}
  // AJUI_Tip_setTipboxMaxHeight ( {$maxHeight_l} ) -> max height
  //
  // $1 : (longint) (optional) max height
  // $0 : (longint) (return) max current height
  //
  // Setter/Getter of the max height of the tipbox (text container)

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $maxHeight_l : Integer

If (Count parameters=0)
	$result:=This.container.maxHeight
Else 
	$maxHeight_l:=$param1
	If ($maxHeight_l>=0)
		This.container.maxHeight:=$maxHeight_l
		This.CheckRebuild()
		
	End if 
End if 
