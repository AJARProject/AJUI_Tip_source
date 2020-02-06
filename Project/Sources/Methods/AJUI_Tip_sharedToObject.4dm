//%attributes = {"invisible":true}
  // AJUI_Tip_sharedToObject ( $sharedObject_to_convert_obj ; $converted_obj ) 
  //
  // $sharedObject_to_convert_obj : (shared object) shared object to convert
  // $converted_obj : (object) result conversion
  //
  // This method converts a shared object into an object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.02.19, 09:19:37
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_sharedToObject
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$sharedObject_to_convert_obj)
C_OBJECT:C1216($2;$converted_obj)
C_LONGINT:C283($Type_l;$counter_l)

$sharedObject_to_convert_obj:=$1
$converted_obj:=$2

ARRAY TEXT:C222($_property_t;0)

OB GET PROPERTY NAMES:C1232($sharedObject_to_convert_obj;$_property_t)
For ($counter_l;1;Size of array:C274($_property_t))
	$Type_l:=OB Get type:C1230($sharedObject_to_convert_obj;$_property_t{$counter_l})
	Case of 
		: ($Type_l=Is object:K8:27)
			$converted_obj[$_property_t{$counter_l}]:=New object:C1471
			AJUI_Tip_sharedToObject ($sharedObject_to_convert_obj[$_property_t{$counter_l}];$converted_obj[$_property_t{$counter_l}])
		: ($Type_l=Is collection:K8:32)
			$converted_obj[$_property_t{$counter_l}]:=New collection:C1472
			AJUI_Tip_sharedToCollection ($sharedObject_to_convert_obj[$_property_t{$counter_l}];$converted_obj[$_property_t{$counter_l}])
		Else 
			$converted_obj[$_property_t{$counter_l}]:=$sharedObject_to_convert_obj[$_property_t{$counter_l}]
	End case 
End for 

