//%attributes = {"invisible":true}
  // AJUI_Tip_getStyleForTextArea ( $tip_instance_obj ) -> return
  //
  // $tip_instance_obj : (object) tip instance
  // $textStyle_t : (text) (return) return style parameter
  //
  // Define style parameter for the svg text area

#DECLARE($param1 : Object) -> $result : Text

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 30.01.19, 09:54:51
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_getStyleForTextArea
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_obj : Object
var $textStyle_t; $TextFontName_t; $textFontColor_t : Text
var $textFontSize_l : Integer

$tip_instance_obj:=$param1

$TextFontName_t:=AJUI_Tip_getFirstFontAvailable ($tip_instance_obj.text.fontName)
$textFontColor_t:=$tip_instance_obj.text.fontColor
$textFontSize_l:=$tip_instance_obj.text.fontSize

$textStyle_t:="{font-size:"+String($textFontSize_l)+";fill:"+$textFontColor_t+";font-family:"+$TextFontName_t+";text-anchor:start}"

$result:=$textStyle_t