//%attributes = {"invisible":true}
  // AJUI_Tip_setCurrentLvl ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // Setter/Getter

#DECLARE($param1 : Integer) -> $result : Integer

If (False)
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


var $level_l : Integer

If (Count parameters=0)
	$result:=This.currentLvl
Else 
	$level_l:=$param1
	If ($level_l>=0)
		This.currentLvl:=$level_l
		This.pu.toRebuild:=True
	Else 
		ASSERT(False;"The value must be 0 or over")
	End if 
End if 