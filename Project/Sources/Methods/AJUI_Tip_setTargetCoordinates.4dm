//%attributes = {"invisible":true}
  // AJUI_Tip_setTargetCoordinates ( $left_l { ; $top_l {; $right_l ; $bottom_l}} ) -> coordinates
  //
  // $1 : (longint) left or all coordinates
  // $2 : (longint) (optional) top coordinate
  // $3 : (longint) (optional) right coordinate
  // $4 : (longint) (optional) bottom coordinate
  // $0 : (object) (return) current target coordinates
  //
  // Setter/Getter to defined the coordinates of the target

#DECLARE($param1 : Integer; $param2 : Integer; $param3 : Integer; $param4 : Integer) -> $result : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 25.01.19, 15:04:00
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setTargetCoordinates
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $left_l; $top_l; $right_l; $bottom_l : Integer


Case of 
	: (Count parameters=0)
		$result:=OB Copy(This.target.coordinate)
	: (Count parameters=1)
		$left_l:=$param1
		If ($left_l>0)
			This.target.coordinate.left:=$left_l
			This.target.coordinate.top:=$left_l
			This.target.coordinate.right:=$left_l
			This.target.coordinate.bottom:=$left_l
			This.CheckRebuild()
			
		End if 
		
	: (Count parameters=2)
		$left_l:=$param1
		$top_l:=$param2
		If (($left_l>=0) & ($top_l>=0))
			This.target.coordinate.left:=$left_l
			This.target.coordinate.top:=$top_l
			This.target.coordinate.right:=$left_l
			This.target.coordinate.bottom:=$top_l
			This.CheckRebuild()
			
		End if 
		
	: (Count parameters=4)
		$left_l:=$param1
		$top_l:=$param2
		$right_l:=$param3
		$bottom_l:=$param4
		If (($left_l>=0) & ($top_l>=0) & ($right_l>=0) & ($bottom_l>=0))
			This.target.coordinate.left:=$left_l
			This.target.coordinate.top:=$top_l
			This.target.coordinate.right:=$right_l
			This.target.coordinate.bottom:=$bottom_l
			This.CheckRebuild()
			
		End if 
	Else 
		
End case 
