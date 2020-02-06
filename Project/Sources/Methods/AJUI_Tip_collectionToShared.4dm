//%attributes = {"invisible":true}
  // AJUI_Tip_collectionToShared ( $collectionToConvert_col ; $shared_col ) 
  //
  // $collectionToConvert_col : (collection) collection to convert
  // $shared_col : (shared colletion) result conversion
  //
  // This method converts a collection into a shared collection

If (False:C215)
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

C_COLLECTION:C1488($1;$collectionToConvert_col)
C_COLLECTION:C1488($2;$shared_col)
C_LONGINT:C283($Size_l;$Count_l;$Element_l;$Type_l)

$Size_l:=$collectionToConvert_col.length

For ($Count_l;1;$Size_l)
	$Element_l:=$Count_l-1
	$Type_l:=Value type:C1509($collectionToConvert_col[$Element_l])
	Case of 
		: ($Type_l=Is object:K8:27)
			$shared_col[$Element_l]:=New shared object:C1526
			Use ($shared_col[$Element_l])
				AJUI_Tip_objectToShared ($collectionToConvert_col[$Element_l];$shared_col[$Element_l])
			End use 
		: ($Type_l=Is collection:K8:32)
			$shared_col[$Element_l]:=New shared collection:C1527
			Use ($shared_col[$Element_l])
				AJUI_Tip_collectionToShared ($collectionToConvert_col[$Element_l];$shared_col[$Element_l])
			End use 
		Else 
			$shared_col[$Element_l]:=$collectionToConvert_col[$Element_l]
	End case 
End for 
