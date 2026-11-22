//%attributes = {"invisible":true}
  // AJUI_Tip_setName ( {$name_t} ) -> name
  //
  // $1 : (text) (optional) name
  // $0 : (text) (return) current name of the tip
  //
  // Setter/Getter of the name of the tip

#DECLARE($param1 : Text) -> $result : Text

If (False)
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

var $name_t : Text

If (Count parameters=0)
	$result:=This.global.name
Else 
	$name_t:=$param1
	This.global.name:=$name_t
	This.pu.worker:="ajui_tip_"+$name_t+"_wrk"
	This.CheckRebuild()
End if 