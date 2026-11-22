//%attributes = {"invisible":true}
  // AJUI_Tip_calcSizeTextArea ( $tip_instance_obj ) 
  //
  // $tip_instance_obj : (object) description
  // $textArea_pict : (picture) (return) picture of the text area
  //
  // This method will create the picture of the text area, so we can receive the content size
#DECLARE($param1 : Object) -> $result : Picture

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 31.01.19, 10:55:46
	  // @private
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_calcSizeTextArea
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_obj : Object
var $textArea_pict : Picture
var $maxWidht_l; $maxHeight_l; $fontSize_l : Integer
var $fontName_t; $Dom_svg_t; $Dom_text_t; $Txt_buffer_t : Text

$tip_instance_obj:=$param1

$textArea_pict:=$textArea_pict*0  //init


$Txt_buffer_t:=$tip_instance_obj.text.value

$maxWidht_l:=$tip_instance_obj.container.maxWidth
$maxHeight_l:=$tip_instance_obj.container.maxHeight

$fontName_t:=AJUI_Tip_getFirstFontAvailable ($tip_instance_obj.text.fontName)
$fontSize_l:=$tip_instance_obj.text.fontSize

$Dom_svg_t:=SVG_New 

  //maxWidth have the priority to resize the text
If ($maxWidht_l>0)
	$maxHeight_l:=0
End if 

  //create text area
$Dom_text_t:=SVG_New_textArea ($Dom_svg_t;$Txt_buffer_t;0;0;$maxWidht_l;$maxHeight_l;AJUI_Tip_getStyleForTextArea ($tip_instance_obj))  //priority depending of the tipbox position

$textArea_pict:=SVG_Export_to_picture ($Dom_svg_t;Copy XML data source)

$result:=$textArea_pict

SVG_CLEAR ($Dom_svg_t)