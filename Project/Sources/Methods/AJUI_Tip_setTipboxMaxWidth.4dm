//%attributes = {"invisible":true}
  // AJUI_Tip_setTipboxMaxWidth ( {$maxWidth_l} ) -> max width
  //
  // $1 : (longint) (optional) max width
  // $0 : (longint) (return) current max width
  //
  // Setter/Getter of the max width of the tipbox (text container)

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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

var $maxWidth_l : Integer

If (Count parameters=0)
	$result:=This.container.maxWidth
Else 
	$maxWidth_l:=$param1
	If ($maxWidth_l>=0)
		This.container.maxWidth:=$maxWidth_l
		This.CheckRebuild()
		
	End if 
End if 
