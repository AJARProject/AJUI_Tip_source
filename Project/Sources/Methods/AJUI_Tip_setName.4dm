//%attributes = {"invisible":true}
  // AJUI_Tip_setName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) name
  // $0 : (text) (return) current name of the tip
  //
  // Setter/Getter of the name of the tip

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 22.01.19, 14:54:03
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_setName
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($0;$1;$name_t)

If (Count parameters:C259=0)
	$0:=This:C1470.global.name
Else 
	$name_t:=$1
	This:C1470.global.name:=$name_t
	This:C1470.pu.worker:="ajui_tip_"+$name_t+"_wrk"
	This:C1470.CheckRebuild()
End if 