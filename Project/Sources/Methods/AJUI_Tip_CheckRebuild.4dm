//%attributes = {"invisible":true}
  // AJUI_Tip_CheckRebuild (  ) 
  //
  //
  // Put toRebuild to true and launch the show method if the tip is actually displayed

If (False)
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

This.pu.toRebuild:=True
If ((This.pu.displayed) & (This.global.autoRebuild))
	This.Show()
End if 