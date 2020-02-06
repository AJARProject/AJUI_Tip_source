//%attributes = {"invisible":true}
  // AJUI_Tip_subformContext ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
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

C_TEXT:C284($1;$TargetName_t)
C_BOOLEAN:C305($0)

If (Count parameters:C259>0)
	$TargetName_t:=$1
Else 
	$TargetName_t:=""
End if 

OBJECT GET COORDINATES:C663(*;$TargetName_t;$leftTarget_l;$topTarget_l;$rightTarget_l;$bottomTarget_l)

$leftTarget0_l:=$leftTarget_l
$topTarget0_l:=$topTarget_l
$rightTarget0_l:=$rightTarget_l
$bottomTarget0_l:=$bottomTarget_l

CONVERT COORDINATES:C1365($leftTarget_l;$topTarget_l;XY Current form:K27:5;XY Current window:K27:6)
CONVERT COORDINATES:C1365($rightTarget_l;$bottomTarget_l;XY Current form:K27:5;XY Current window:K27:6)

$isSubform:=False:C215

If ($leftTarget0_l#$leftTarget_l)
	$isSubform:=True:C214
Else 
	If ($topTarget0_l#$topTarget_l)
		$isSubform:=True:C214
	Else 
		If ($rightTarget0_l#$rightTarget_l)
			$isSubform:=True:C214
		Else 
			If ($bottomTarget0_l#$bottomTarget_l)
				$isSubform:=True:C214
			End if 
		End if 
	End if 
End if 

  // This will not work if the subform is EXACTLY the size of the Main Form

$0:=$isSubform
