//%attributes = {"invisible":true}
  // AJUI_Tip_CheckRebuild (  ) 
  //
  //
  // Put toRebuild to true and launch the show method if the tip is actually displayed

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 14:18:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_CheckRebuild
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

This:C1470.pu.toRebuild:=True:C214
If ((This:C1470.pu.displayed) & (This:C1470.global.autoRebuild))
	This:C1470.Show()
End if 