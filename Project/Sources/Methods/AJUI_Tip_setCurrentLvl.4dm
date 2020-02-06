//%attributes = {"invisible":true}
  // AJUI_Tip_setCurrentLvl ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // Setter/Getter

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 15.03.19, 12:05:15
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setCurrentLvl
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_LONGINT:C283($0;$1;$level_l)

If (Count parameters:C259=0)
	$0:=This:C1470.currentLvl
Else 
	$level_l:=$1
	If ($level_l>=0)
		This:C1470.currentLvl:=$level_l
		This:C1470.pu.toRebuild:=True:C214
	Else 
		ASSERT:C1129(False:C215;"The value must be 0 or over")
	End if 
End if 