//%attributes = {"invisible":true}
  // AJUI_Tip_sharedToCollection ( $sharedCollectionToConvert_col ; $converted_col ) 
  //
  // $sharedCollectionToConvert_col : (shared collection) shared collection to convert
  // $converted_col : (colletion) result conversion
  //
  // This method converts a shared collection into a collection

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 06.02.19, 09:19:41
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_sharedToCollection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $sharedCollectionToConvert_col; $converted_col : Collection
var $Size_l; $Count_l; $Element_l; $Type_l : Integer

$Size_l:=$sharedCollectionToConvert_col.length

For ($Count_l;1;$Size_l)
	$Element_l:=$Count_l-1
	$Type_l:=Value type($sharedCollectionToConvert_col[$Element_l])
	Case of 
		: ($Type_l=Is object)
			$converted_col[$Element_l]:=New object
			AJUI_Tip_sharedToObject ($sharedCollectionToConvert_col[$Element_l];$converted_col[$Element_l])
		: ($Type_l=Is collection)
			$converted_col[$Element_l]:=New collection
			AJUI_Tip_sharedToCollection ($sharedCollectionToConvert_col[$Element_l];$converted_col[$Element_l])
		Else 
			$converted_col[$Element_l]:=$sharedCollectionToConvert_col[$Element_l]
	End case 
End for 