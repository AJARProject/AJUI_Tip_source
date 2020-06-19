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

If (False:C215)
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

C_LONGINT:C283($1;$left_l)
C_LONGINT:C283($2;$top_l)
C_LONGINT:C283($3;$right_l)
C_LONGINT:C283($4;$bottom_l)
C_OBJECT:C1216($0)


Case of 
	: (Count parameters:C259=0)
		$0:=OB Copy:C1225(This:C1470.target.margin)
	: (Count parameters:C259=1)
		$left_l:=$1
		
		If ($left_l>=0)  // MI 09-Feb-2019 10:18:20 (GMT+1)
			This:C1470.target.margin.left:=$left_l
			This:C1470.target.margin.top:=$left_l
			This:C1470.target.margin.right:=$left_l
			This:C1470.target.margin.bottom:=$left_l
			This:C1470.CheckRebuild()
			
		End if 
		
	: (Count parameters:C259=2)
		$left_l:=$1
		$top_l:=$2
		
		If (($left_l>=0) & ($top_l>=0))
			This:C1470.target.margin.left:=$left_l
			This:C1470.target.margin.top:=$left_l
			This:C1470.target.margin.right:=$left_l
			This:C1470.target.margin.bottom:=$left_l
			This:C1470.CheckRebuild()
			
		End if 
		
	: (Count parameters:C259=4)
		$left_l:=$1
		$top_l:=$2
		$right_l:=$3
		$bottom_l:=$4
		
		If (($left_l>=0) & ($top_l>=0) & ($right_l>=0) & ($bottom_l>=0))
			This:C1470.target.margin.left:=$left_l
			This:C1470.target.margin.top:=$top_l
			This:C1470.target.margin.right:=$right_l
			This:C1470.target.margin.bottom:=$bottom_l
			This:C1470.CheckRebuild()
			
		End if 
	Else 
End case 