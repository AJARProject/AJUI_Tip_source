//%attributes = {"invisible":true}
  // AJUI_Tip_collectionToShared ( $collectionToConvert_col ; $shared_col ) 
  //
  // $collectionToConvert_col : (collection) collection to convert
  // $shared_col : (shared colletion) result conversion
  //
  // This method converts a collection into a shared collection

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 05.02.19, 13:04:00
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_collectionToShared
	  // Description
	  // TODO : Export in AJ_Tools
	  //
	  // ----------------------------------------------------
End if 

var $collectionToConvert_col; $shared_col : Collection
var $Size_l; $Count_l; $Element_l; $Type_l : Integer

$Size_l:=$collectionToConvert_col.length

For ($Count_l;1;$Size_l)
	$Element_l:=$Count_l-1
	$Type_l:=Value type($collectionToConvert_col[$Element_l])
	Case of 
		: ($Type_l=Is object)
			$shared_col[$Element_l]:=New shared object
			Use ($shared_col[$Element_l])
				AJUI_Tip_objectToShared ($collectionToConvert_col[$Element_l];$shared_col[$Element_l])
			End use 
		: ($Type_l=Is collection)
			$shared_col[$Element_l]:=New shared collection
			Use ($shared_col[$Element_l])
				AJUI_Tip_collectionToShared ($collectionToConvert_col[$Element_l];$shared_col[$Element_l])
			End use 
		Else 
			$shared_col[$Element_l]:=$collectionToConvert_col[$Element_l]
	End case 
End for 
