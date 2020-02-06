//%attributes = {"invisible":true}
  // AJUI_Tip_objectToShared ( $object_to_convert_obj ; $shared_obj ) 
  //
  // $object_to_convert_obj : (object) object to convert
  // $shared_obj : (shared object) result conversion
  //
  // This method converts an object into a shared object

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 05.02.19, 13:04:04
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_objectToShared
	  // Description
	  // TODO : Mode to AJ_Tools
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($1;$object_to_convert_obj)
C_OBJECT:C1216($2;$shared_obj)
C_LONGINT:C283($Type_l;$counter_l)

$object_to_convert_obj:=$1
$shared_obj:=$2

ARRAY TEXT:C222($_property_t;0)

OB GET PROPERTY NAMES:C1232($object_to_convert_obj;$_property_t)
For ($counter_l;1;Size of array:C274($_property_t))
	$Type_l:=OB Get type:C1230($object_to_convert_obj;$_property_t{$counter_l})
	Case of 
		: ($Type_l=Is object:K8:27)
			$shared_obj[$_property_t{$counter_l}]:=New shared object:C1526
			Use ($shared_obj[$_property_t{$counter_l}])
				AJUI_Tip_objectToShared ($object_to_convert_obj[$_property_t{$counter_l}];$shared_obj[$_property_t{$counter_l}])
			End use 
		: ($Type_l=Is collection:K8:32)
			$shared_obj[$_property_t{$counter_l}]:=New shared collection:C1527
			Use ($shared_obj[$_property_t{$counter_l}])
				AJUI_Tip_collectionToShared ($object_to_convert_obj[$_property_t{$counter_l}];$shared_obj[$_property_t{$counter_l}])
			End use 
		Else 
			$shared_obj[$_property_t{$counter_l}]:=$object_to_convert_obj[$_property_t{$counter_l}]
	End case 
End for 