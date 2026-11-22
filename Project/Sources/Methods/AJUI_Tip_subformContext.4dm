//%attributes = {"invisible":true}
  // AJUI_Tip_subformContext ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

#DECLARE($param1 : Text) -> $result : Boolean

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 28.02.19, 10:39:26
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_subformContext
	  // Description
	  // Return true if we are in the subform context
	  //
	  // ----------------------------------------------------
End if 

var $TargetName_t : Text
var $leftTarget_l; $topTarget_l; $rightTarget_l; $bottomTarget_l; $leftTarget0_l; $topTarget0_l; $rightTarget0_l; $bottomTarget0_l : Real
var $isSubform : Boolean

If (Count parameters>0)
	$TargetName_t:=$param1
Else 
	$TargetName_t:=""
End if 

OBJECT GET COORDINATES(*;$TargetName_t;$leftTarget_l;$topTarget_l;$rightTarget_l;$bottomTarget_l)

$leftTarget0_l:=$leftTarget_l
$topTarget0_l:=$topTarget_l
$rightTarget0_l:=$rightTarget_l
$bottomTarget0_l:=$bottomTarget_l

CONVERT COORDINATES($leftTarget_l;$topTarget_l;XY Current form;XY Current window)
CONVERT COORDINATES($rightTarget_l;$bottomTarget_l;XY Current form;XY Current window)

$isSubform:=False

If ($leftTarget0_l#$leftTarget_l)
	$isSubform:=True
Else 
	If ($topTarget0_l#$topTarget_l)
		$isSubform:=True
	Else 
		If ($rightTarget0_l#$rightTarget_l)
			$isSubform:=True
		Else 
			If ($bottomTarget0_l#$bottomTarget_l)
				$isSubform:=True
			End if 
		End if 
	End if 
End if 

  // This will not work if the subform is EXACTLY the size of the Main Form

$result:=$isSubform
