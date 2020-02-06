//%attributes = {"invisible":true}
  // AJUI_Tip_setTargetCoordinates ( $left_l { ; $top_l {; $right_l ; $bottom_l}} )
  //
  // $left_l : (longint) left or all margin size
  // $top_l : (longint) (optional) top margin size
  // $right_l : (longint) (optional) right margin size
  // $bottom_l : (longint) (optional) bottom margin size
  //
  // Setter/Getter to defined the coordinates of the target

If (False:C215)
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

C_LONGINT:C283($1;$left_l)
C_LONGINT:C283($2;$top_l)
C_LONGINT:C283($3;$right_l)
C_LONGINT:C283($4;$bottom_l)
C_OBJECT:C1216($0)


Case of 
	: (Count parameters:C259=0)
		$0:=OB Copy:C1225(This:C1470.target.coordinate)
	: (Count parameters:C259=1)
		$left_l:=$1
		If ($left_l>0)
			This:C1470.target.coordinate.left:=$left_l
			This:C1470.target.coordinate.top:=$left_l
			This:C1470.target.coordinate.right:=$left_l
			This:C1470.target.coordinate.bottom:=$left_l
			This:C1470.CheckRebuild()
			
		End if 
		
	: (Count parameters:C259=2)
		$left_l:=$1
		$top_l:=$2
		If (($left_l>=0) & ($top_l>=0))
			This:C1470.target.coordinate.left:=$left_l
			This:C1470.target.coordinate.top:=$top_l
			This:C1470.target.coordinate.right:=$left_l
			This:C1470.target.coordinate.bottom:=$top_l
			This:C1470.CheckRebuild()
			
		End if 
		
	: (Count parameters:C259=4)
		$left_l:=$1
		$top_l:=$2
		$right_l:=$3
		$bottom_l:=$4
		If (($left_l>=0) & ($top_l>=0) & ($right_l>=0) & ($bottom_l>=0))
			This:C1470.target.coordinate.left:=$left_l
			This:C1470.target.coordinate.top:=$top_l
			This:C1470.target.coordinate.right:=$right_l
			This:C1470.target.coordinate.bottom:=$bottom_l
			This:C1470.CheckRebuild()
			
		End if 
	Else 
		
End case 
