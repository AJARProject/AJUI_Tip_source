//%attributes = {"invisible":true}
  // AJUI_Tip_activeAutoPosition ( $autoPosition_b )
  //
  // $autoPosition_b : (boolean) Tipbox auto Positioned/resized
  //
  // Setter to define if the tipbox is dynamically auto positioned/resized according to the space available

#DECLARE($param1 : Boolean)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.01.19, 10:56:57
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_activeAutoPosition
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
var $autoPosition_b : Boolean

If (Count parameters#1)
	ASSERT(False;"You must enter true or false ")
Else 
	$autoPosition_b:=$param1
	This.container.autoPosition:=$autoPosition_b
	This.CheckRebuild()
End if 

