//%attributes = {"invisible":true}
  // AJUI_Tip_getFirstFontAvailable ( $fonts_to_check_t ) -> return
  //
  // $fonts_to_check_t : (text) String of one or more fonts
  // $first_font_available_t : (text) (return) return First font available
  //
  // It will check the string of fonts asked in the tip object and return the first available

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 11:01:02
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_getFirstFontAvailable
	  // Description
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$fonts_to_check_t)
C_TEXT:C284($0;$firstFont_available_t)
C_TEXT:C284($substring_to_check_t)
C_LONGINT:C283($length_string_l;$pos_in_string_l;$current_pos_in_string_l;$pos_in_list_l)
C_BOOLEAN:C305($checked_b)

ARRAY TEXT:C222($_fonts_list_t;0)

$fonts_to_check_t:=$1
FONT LIST:C460($_fonts_list_t)
$firstFont_available_t:=""

If ($fonts_to_check_t#"")
	$length_string_l:=Length:C16($fonts_to_check_t)
	$current_pos_in_string_l:=1
	$checked_b:=False:C215
	
	Repeat 
		$pos_in_string_l:=Position:C15(",";$fonts_to_check_t;$current_pos_in_string_l)
		If ($pos_in_string_l=0)
			$checked_b:=True:C214
			$pos_in_list_l:=Find in array:C230($_fonts_list_t;$fonts_to_check_t)
			If ($pos_in_list_l>0)
				$firstFont_available_t:=$_fonts_list_t{$pos_in_list_l}
			End if 
		Else 
			$substring_to_check_t:=Substring:C12($fonts_to_check_t;$current_pos_in_string_l;$pos_in_string_l-1)  //before ","
			$pos_in_list_l:=Find in array:C230($_fonts_list_t;$substring_to_check_t)
			If ($pos_in_list_l>0)
				$firstFont_available_t:=$_fonts_list_t{$pos_in_list_l}
				$checked_b:=True:C214
			Else 
				$fonts_to_check_t:=Substring:C12($fonts_to_check_t;$pos_in_string_l+1)  //remove the checked font and the ","
			End if 
		End if 
	Until ($checked_b)
End if 

If ($firstFont_available_t="")  //put default font if no font available
	$firstFont_available_t:="Arial"
End if 

$0:=$firstFont_available_t