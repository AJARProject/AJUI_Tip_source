//%attributes = {"invisible":true}
  // AJUI_Tip_sharedToObject ( $sharedObject_to_convert_obj ; $converted_obj ) 
  //
  // $sharedObject_to_convert_obj : (shared object) shared object to convert
  // $converted_obj : (object) result conversion
  //
  // This method converts a shared object into an object

#DECLARE($param1 : Object; $param2 : Object)

If (False)
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

var $sharedObject_to_convert_obj; $converted_obj : Object
var $Type_l; $counter_l : Integer

$sharedObject_to_convert_obj:=$param1
$converted_obj:=$param2

ARRAY TEXT($_property_t;0)

OB GET PROPERTY NAMES($sharedObject_to_convert_obj;$_property_t)
For ($counter_l;1;Size of array($_property_t))
	$Type_l:=OB Get type($sharedObject_to_convert_obj;$_property_t{$counter_l})
	Case of 
		: ($Type_l=Is object)
			$converted_obj[$_property_t{$counter_l}]:=New object
			AJUI_Tip_sharedToObject ($sharedObject_to_convert_obj[$_property_t{$counter_l}];$converted_obj[$_property_t{$counter_l}])
		: ($Type_l=Is collection)
			$converted_obj[$_property_t{$counter_l}]:=New collection
			AJUI_Tip_sharedToCollection ($sharedObject_to_convert_obj[$_property_t{$counter_l}];$converted_obj[$_property_t{$counter_l}])
		Else 
			$converted_obj[$_property_t{$counter_l}]:=$sharedObject_to_convert_obj[$_property_t{$counter_l}]
	End case 
End for 

