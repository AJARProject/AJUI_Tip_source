//%attributes = {"invisible":true}
  // AJUI_Tip_activeAutoPosition ( $autoPosition_b )
  //
  // $autoPosition_b : (boolean) Tipbox auto Positioned/resized
  //
  // Setter to define if the tipbox is dynamically auto positioned/resized according to the space available

If (False:C215)
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
C_BOOLEAN:C305($1;$autoPosition_b)

If (Count parameters:C259#1)
	ASSERT:C1129(False:C215;"You must enter true or false ")
Else 
	$autoPosition_b:=$1
	This:C1470.container.autoPosition:=$autoPosition_b
	This:C1470.CheckRebuild()
End if 

