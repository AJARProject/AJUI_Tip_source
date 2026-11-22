//%attributes = {"invisible":true}
  // AJUI_Tip_objectToShared ( $object_to_convert_obj ; $shared_obj ) 
  //
  // $object_to_convert_obj : (object) object to convert
  // $shared_obj : (shared object) result conversion
  //
  // This method converts an object into a shared object

#DECLARE($param1 : Object; $param2 : Object)

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 05.02.19, 13:04:04
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_objectToShared
	  // Description
	  //
	  // ----------------------------------------------------
End if 


var $object_to_convert_obj; $shared_obj : Object
var $Type_l; $counter_l : Integer

$object_to_convert_obj:=$param1
$shared_obj:=$param2

ARRAY TEXT($_property_t;0)

OB GET PROPERTY NAMES($object_to_convert_obj;$_property_t)
For ($counter_l;1;Size of array($_property_t))
	$Type_l:=OB Get type($object_to_convert_obj;$_property_t{$counter_l})
	Case of 
		: ($Type_l=Is object)
			$shared_obj[$_property_t{$counter_l}]:=New shared object
			Use ($shared_obj[$_property_t{$counter_l}])
				AJUI_Tip_objectToShared ($object_to_convert_obj[$_property_t{$counter_l}];$shared_obj[$_property_t{$counter_l}])
			End use 
		: ($Type_l=Is collection)
			$shared_obj[$_property_t{$counter_l}]:=New shared collection
			Use ($shared_obj[$_property_t{$counter_l}])
				AJUI_Tip_collectionToShared ($object_to_convert_obj[$_property_t{$counter_l}];$shared_obj[$_property_t{$counter_l}])
			End use 
		Else 
			$shared_obj[$_property_t{$counter_l}]:=$object_to_convert_obj[$_property_t{$counter_l}]
	End case 
End for 