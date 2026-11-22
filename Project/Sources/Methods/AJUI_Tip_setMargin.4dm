//%attributes = {"invisible":true}
  // AJUI_Tip_setMargin ( $left_l { ; $top_l {; $right_l ; $bottom_l}} ) -> margins
  //
  // $1 : (longint) left or all margin size
  // $2 : (longint) (optional) top margin size
  // $3 : (longint) (optional) right margin size
  // $4 : (longint) (optional) bottom margin size
  // $0 : (object) (return) current margins
  //
  // Setter/Getter to defined the size of the margin of the space between the external tipbox area and the target.

#DECLARE($param1 : Integer; $param2 : Integer; $param3 : Integer; $param4 : Integer) -> $result : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 14:14:23
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setMargin
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $left_l; $top_l; $right_l; $bottom_l : Integer


Case of 
	: (Count parameters=0)
		$result:=OB Copy(This.target.margin)
	: (Count parameters=1)
		$left_l:=$param1
		
		If ($left_l>=0)  // MI 09-Feb-2019 10:18:20 (GMT+1)
			This.target.margin.left:=$left_l
			This.target.margin.top:=$left_l
			This.target.margin.right:=$left_l
			This.target.margin.bottom:=$left_l
			This.CheckRebuild()
			
		End if 
		
	: (Count parameters=2)
		$left_l:=$param1
		$top_l:=$param2
		
		If (($left_l>=0) & ($top_l>=0))
			This.target.margin.left:=$left_l
			This.target.margin.top:=$left_l
			This.target.margin.right:=$left_l
			This.target.margin.bottom:=$left_l
			This.CheckRebuild()
			
		End if 
		
	: (Count parameters=4)
		$left_l:=$param1
		$top_l:=$param2
		$right_l:=$param3
		$bottom_l:=$param4
		
		If (($left_l>=0) & ($top_l>=0) & ($right_l>=0) & ($bottom_l>=0))
			This.target.margin.left:=$left_l
			This.target.margin.top:=$top_l
			This.target.margin.right:=$right_l
			This.target.margin.bottom:=$bottom_l
			This.CheckRebuild()
			
		End if 
	Else 
End case 