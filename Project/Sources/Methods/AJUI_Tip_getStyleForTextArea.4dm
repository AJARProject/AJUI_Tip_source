//%attributes = {"invisible":true}
  // AJUI_Tip_getStyleForTextArea ( $tip_instance_obj ) -> return
  //
  // $tip_instance_obj : (object) tip instance
  // $textStyle_t : (text) (return) return style parameter
  //
  // Define style parameter for the svg text area

If (False:C215)
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

C_OBJECT:C1216($1;$tip_instance_obj)
C_TEXT:C284($0;$textStyle_t)
C_TEXT:C284($TextFontName_t;$textFontColor_t)
C_LONGINT:C283($textFontSize_l)

$tip_instance_obj:=$1

$TextFontName_t:=AJUI_Tip_getFirstFontAvailable ($tip_instance_obj.text.fontName)
$textFontColor_t:=$tip_instance_obj.text.fontColor
$textFontSize_l:=$tip_instance_obj.text.fontSize

$textStyle_t:="{font-size:"+String:C10($textFontSize_l)+";fill:"+$textFontColor_t+";font-family:"+$TextFontName_t+";text-anchor:start}"

$0:=$textStyle_t