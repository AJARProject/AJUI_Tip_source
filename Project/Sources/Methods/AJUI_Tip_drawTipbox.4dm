//%attributes = {"invisible":true}
  // AJUI_Tip_drawTipbox ( $tip_instance_obj ) -> return
  //
  // $tip_instance_obj : (object) description
  // $result_pict : (picture) (return) return value
  //
  // This method will calc and draw the graphics and also the text area if needed.

#DECLARE($param1 : Object) -> $result : Picture

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 29.01.19, 11:59:58
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_drawTipbox
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $tip_instance_obj : Object
var $result_pict; $textArea_pict : Picture
var $svgRef_t; $svgTipGraphicRef_t; $svgTextRef_l; $svgCircleCBRef_t; $svgHorlineRef_t; $svgVertlineRef_t; $TextFontName_t; $textFontColor_t; $textValue_t; $sfContainerName_t; $border_color_t; $background_color_t; $tip_position_t; $arrowPostion_t; $pictContainerName_t; $textRotation_t; $Txt_groupReference_ID; $tipTextRectRef_ID; $svgFilterRef_t; $shadowBlurRef_t; $shadowOffRef_t; $shadowBlendRef_t; $svgTextAreaRef_t; $tipTextRect2Ref_ID; $foregroundColorCB_t; $backgroundColorCB_t; $CloseBox_groupRef_ID : Text
var $borderWidthCB_r; $translateX_r; $translateY_r; $corner_curve_Width_r; $corner_curve_Height_r; $corner_curveStart_r; $arrow_curve_Width_r; $arrow_curve_Height_r; $middle_line_Width_r; $middle_line_Height_r; $top_curve_Widtht_r; $top_curve_Height_r; $widthSizePlanned; $currentWidthSizeUsed; $sizeToComplete : Real
var $startX_l; $startY_l; $borderSize_l; $textFontSize_l; $textOpacity; $tip_cornerRadius_l; $arrowHeight_l; $arrowWidht_l; $closeBox_centerX_l; $closeBox_centerY_l; $closeBoxBorder_l; $closeBoxRadius_l; $x_closeBox_l; $y_closeBox_l; $left_line_l; $top_line_l; $right_line_l; $bottom_line_l; $contentHeight_l; $contentWidht_l; $containerHeight_l; $containerWidht_l; $svgAreaX_l; $svgAreaY_l; $pict_height_l; $pict_width_l; $fontSize_l; $arrowOffset_l; $marginContainerX_l; $marginContainerY_l; $svgBackgroundOpacity; $svgBorderOpacity; $currentOpacity_l; $ax_l; $bx_l; $cx_l; $dx_l; $ay_l; $by_l; $cy_l; $dy_l; $top_padding_l; $left_padding_l; $bottom_padding_l; $right_padding_l; $Deviation_l; $shadowOffset_l; $svgAreaShadowRightBottOffset_l; $svgAreaXWithShadow_l; $svgAreaYWithShadow_l; $angle_l; $moveH_l; $moveV_l : Integer
var $svgPrevRelativeCoordinate_b; $sf_used_b; $shadowOn_b : Boolean


$tip_instance_obj:=$param1

  //get graphics settings
$background_color_t:=$tip_instance_obj.container.backgroundColor
$border_color_t:=$tip_instance_obj.container.borderColor
$borderSize_l:=$tip_instance_obj.container.borderSize

$tip_cornerRadius_l:=$tip_instance_obj.container.cornerRadius
$tip_position_t:=$tip_instance_obj.target.tipPosition
$arrowPostion_t:=$tip_instance_obj.arrow.position

$arrowHeight_l:=$tip_instance_obj.arrow.height
$arrowWidht_l:=$tip_instance_obj.arrow.width
$arrowOffset_l:=$tip_instance_obj.arrow.offset

If ($tip_instance_obj.arrow.curved)
	$corner_curveStart_r:=Round($arrowHeight_l*$tip_instance_obj.arrow.cornerCurveStart;0)
	$corner_curve_Width_r:=Round(($arrowWidht_l/2)*$tip_instance_obj.arrow.cornerCurveEnd;0)
	$corner_curve_Height_r:=Round($arrowHeight_l*$tip_instance_obj.arrow.cornerCurveEnd;0)
	$arrow_curve_Width_r:=Round((($arrowWidht_l/2)-0.5)*$tip_instance_obj.arrow.arrowCurve;0)
	$arrow_curve_Height_r:=Round($arrowHeight_l*$tip_instance_obj.arrow.arrowCurve;0)
	$middle_line_Width_r:=$arrow_curve_Width_r-$corner_curve_Width_r
	$middle_line_Height_r:=$arrow_curve_Height_r-$corner_curve_Height_r
	$top_curve_Widtht_r:=Round(($arrowWidht_l/2)-$arrow_curve_Width_r;0)
	$top_curve_Height_r:=$arrowHeight_l-$arrow_curve_Height_r
End if 

$closeBoxRadius_l:=$tip_instance_obj.closeBox.size
$top_padding_l:=$tip_instance_obj.container.padding.top
$left_padding_l:=$tip_instance_obj.container.padding.left
$bottom_padding_l:=$tip_instance_obj.container.padding.bottom
$right_padding_l:=$tip_instance_obj.container.padding.right


  //calc start x/y
Case of 
	: (Position("top";$tip_position_t)=1) | (Position("left";$tip_position_t)=1)
		
		$startX_l:=0+($borderSize_l/2)+$tip_cornerRadius_l+0.5
		$startY_l:=($borderSize_l/2)+0.5
		
	: (Position("right";$tip_position_t)=1)
		
		$startX_l:=0+($borderSize_l)+$tip_cornerRadius_l+$arrowHeight_l+0.5
		$startY_l:=($borderSize_l/2)+0.5
		
	: (Position("bottom";$tip_position_t)=1)
		
		$startX_l:=0+($borderSize_l/2)+$tip_cornerRadius_l-0.5
		$startY_l:=0+($borderSize_l)+$arrowHeight_l-0.5
		
End case 

  //calc graphics container size
  //first we need the size of the content
If ($tip_instance_obj.pu.isPictureTip=False)
	  //subform height and width
	$sf_used_b:=True
	$contentHeight_l:=$tip_instance_obj.subForm.height
	$contentWidht_l:=$tip_instance_obj.subForm.width
Else 
	  //simulate text area to get the height and width
	$sf_used_b:=False
	$textArea_pict:=AJUI_Tip_calcSizeTextArea ($tip_instance_obj)
	
	$textRotation_t:=$tip_instance_obj.text.rotation
	
	
	
	PICTURE PROPERTIES($textArea_pict;$pict_width_l;$pict_height_l)
	
	  //apply rotation 
	If ($textRotation_t="left") | ($textRotation_t="right")
		$contentHeight_l:=$pict_width_l
		$contentWidht_l:=$pict_height_l
	Else 
		$contentHeight_l:=$pict_height_l
		$contentWidht_l:=$pict_width_l
	End if 
End if 

  //add closebox size
If ($tip_instance_obj.closeBox.display)
	If ($top_padding_l>=($closeBoxRadius_l*2))
		  //do nothing
	Else 
		$top_padding_l:=($closeBoxRadius_l*2)
		$left_padding_l:=($closeBoxRadius_l*2)
		$bottom_padding_l:=($closeBoxRadius_l*2)
		$right_padding_l:=($closeBoxRadius_l*2)
		
	End if 
End if 

  //add paddings
$containerHeight_l:=$contentHeight_l+$top_padding_l+$bottom_padding_l
$containerWidht_l:=$contentWidht_l+$left_padding_l+$right_padding_l

  //calc svg area
Case of 
	: (Position("top";$tip_position_t)=1) | (Position("bottom";$tip_position_t)=1)
		$svgAreaX_l:=($containerWidht_l+(2*$tip_cornerRadius_l)+$borderSize_l)
		$svgAreaY_l:=($containerHeight_l+(2*$tip_cornerRadius_l)+$borderSize_l+($arrowHeight_l+($borderSize_l/2)))
	: (Position("left";$tip_position_t)=1) | (Position("right";$tip_position_t)=1)
		$svgAreaX_l:=($containerWidht_l+(2*$tip_cornerRadius_l)+(2*$borderSize_l)+($arrowHeight_l+($borderSize_l/2)))
		$svgAreaY_l:=($containerHeight_l+(2*$tip_cornerRadius_l)+(2*$borderSize_l))
End case 

  //shadow
$shadowOn_b:=$tip_instance_obj.container.shadowOn
$shadowOffset_l:=$tip_instance_obj.container.shadowOffset
If ($shadowOn_b)
	$Deviation_l:=3  // Shadow effect parameter
	$svgAreaShadowRightBottOffset_l:=$shadowOffset_l+$Deviation_l
Else 
	$Deviation_l:=0
	$svgAreaShadowRightBottOffset_l:=0
End if 

$svgAreaXWithShadow_l:=$svgAreaX_l+$svgAreaShadowRightBottOffset_l
$svgAreaYWithShadow_l:=$svgAreaY_l+$svgAreaShadowRightBottOffset_l

  //store the size
$tip_instance_obj.container.height:=$svgAreaYWithShadow_l
$tip_instance_obj.container.width:=$svgAreaXWithShadow_l

  //calc arrow 
Case of 
	: (((Position("left";$tip_position_t)=1) | (Position("right";$tip_position_t)=1)) & ($arrowPostion_t="top"))
		$by_l:=($arrowWidht_l/2)
		$cy_l:=$arrowWidht_l/2
		$ay_l:=$arrowOffset_l
		$dy_l:=$svgAreaY_l-$ay_l-$cy_l-$by_l-($borderSize_l)-($tip_cornerRadius_l*2)
		
	: (((Position("left";$tip_position_t)=1) | (Position("right";$tip_position_t)=1)) & ($arrowPostion_t="middle"))
		$by_l:=$arrowWidht_l/2
		$cy_l:=$arrowWidht_l/2
		$ay_l:=($svgAreaY_l-($tip_cornerRadius_l*2)-$borderSize_l-$cy_l-$by_l)/2
		$dy_l:=$svgAreaY_l-$by_l-$cy_l-$ay_l-($tip_cornerRadius_l*2)-$borderSize_l
		
	: (((Position("left";$tip_position_t)=1) | (Position("right";$tip_position_t)=1)) & ($arrowPostion_t="bottom"))
		$by_l:=$arrowWidht_l/2
		$cy_l:=$arrowWidht_l/2
		$dy_l:=$arrowOffset_l
		$ay_l:=$svgAreaY_l-$dy_l-$cy_l-$by_l-($borderSize_l)-($tip_cornerRadius_l*2)
	: (((Position("top";$tip_position_t)=1) | (Position("bottom";$tip_position_t)=1)) & ($arrowPostion_t="left"))
		$bx_l:=$arrowWidht_l/2
		$cx_l:=$arrowWidht_l/2
		$ax_l:=$arrowOffset_l
		$dx_l:=$svgAreaX_l-$ax_l-$cx_l-$bx_l-($borderSize_l)-($tip_cornerRadius_l*2)
		
	: (((Position("top";$tip_position_t)=1) | (Position("bottom";$tip_position_t)=1)) & ($arrowPostion_t="center"))
		$bx_l:=$arrowWidht_l/2
		$cx_l:=$arrowWidht_l/2
		$ax_l:=($svgAreaX_l-($tip_cornerRadius_l*2)-$borderSize_l-$cx_l-$bx_l)/2
		$dx_l:=$svgAreaX_l-$ax_l-($tip_cornerRadius_l*2)-$borderSize_l-$cx_l-$bx_l
		
	: (((Position("top";$tip_position_t)=1) | (Position("bottom";$tip_position_t)=1)) & ($arrowPostion_t="right"))
		
		$bx_l:=$arrowWidht_l/2
		$cx_l:=$arrowWidht_l/2
		$dx_l:=$arrowOffset_l
		$ax_l:=$svgAreaX_l-$dx_l-$cx_l-$bx_l-($borderSize_l)-($tip_cornerRadius_l*2)
		
End case 



  //draw graphics
$svgRef_t:=DOM Create XML Ref("svg";"http://www.w3.org/2000/svg")
DOM SET XML ATTRIBUTE($svgRef_t;"width";$svgAreaXWithShadow_l;"height";$svgAreaYWithShadow_l)  // svg area

DOM SET XML ATTRIBUTE($svgRef_t;"viewBox";"-1 -1 "+String($svgAreaXWithShadow_l+1)+" "+String($svgAreaYWithShadow_l+1))  // viewBox +1 / svg area

If ($tip_instance_obj.debug.showSvgArea)
	$Txt_groupReference_ID:=DOM Create XML element($svgRef_t;"g";"id";"text1")
	
	$tipTextRectRef_ID:=SVG_New_rect ($Txt_groupReference_ID;0;0;$svgAreaXWithShadow_l;$svgAreaYWithShadow_l)  //;0;0"red";"gray";1)
	SVG_SET_STROKE_DASHARRAY ($tipTextRectRef_ID;2)
End if 

$svgTipGraphicRef_t:=SVG_New_path ($svgRef_t;$startX_l;$startY_l;$border_color_t;$background_color_t;$borderSize_l)

$svgPrevRelativeCoordinate_b:=(SVG_Get_options  ?? 4)  //Change to relative coordinates
SVG_SET_OPTIONS (SVG_Get_options  ?- 4)  //Change to relative coordinates

$svgBorderOpacity:=$tip_instance_obj.container.borderOpacity
$svgBackgroundOpacity:=$tip_instance_obj.container.backgroundOpacity

SVG_SET_OPACITY ($svgTipGraphicRef_t;$svgBackgroundOpacity;$svgBorderOpacity)

  // draw pict tip container
Case of 
	: (Position("left";$tip_position_t)=1)
		
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($svgAreaX_l-($tip_cornerRadius_l*2)-($borderSize_l*1.5)-$arrowHeight_l+1.5;0))  //half border size for the arrow
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l)
		
		If ($tip_instance_obj.arrow.curved)
			If ((Round($ay_l;0)-$corner_curveStart_r)>$tip_cornerRadius_l)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round($ay_l-$corner_curveStart_r;0))
			End if 
			SVG_PATH_CURVE ($svgTipGraphicRef_t;0;$corner_curveStart_r;$corner_curve_Height_r;$corner_curveStart_r+$corner_curve_Width_r)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$middle_line_Height_r;$middle_line_Width_r)
			SVG_PATH_CURVE ($svgTipGraphicRef_t;$top_curve_Height_r;$top_curve_Widtht_r;0;$top_curve_Widtht_r*2)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$middle_line_Height_r;$middle_line_Width_r)
			
			$widthSizePlanned:=Round($ay_l;0)+Round($by_l;0)+Round($cy_l;0)+Round($dy_l-1.5;0)
			$currentWidthSizeUsed:=Round($ay_l-$corner_curveStart_r;0)+$corner_curveStart_r+$corner_curve_Width_r+$middle_line_Width_r+($top_curve_Widtht_r*2)+$middle_line_Width_r+$corner_curve_Width_r
			$sizeToComplete:=$widthSizePlanned-$currentWidthSizeUsed
			If (($sizeToComplete-$corner_curveStart_r)>0)
				SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curve_Height_r;$corner_curve_Width_r;-$corner_curve_Height_r;$corner_curve_Width_r+$corner_curveStart_r)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;$sizeToComplete-$corner_curveStart_r)
			Else 
				If ($sizeToComplete>0)
					SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curve_Height_r;$corner_curve_Width_r;-$corner_curve_Height_r;$corner_curve_Width_r+$sizeToComplete)
				Else 
					SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curve_Height_r;$corner_curve_Width_r;-$corner_curve_Height_r;$corner_curve_Width_r)
				End if 
			End if 
			
		Else 
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round($ay_l;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$arrowHeight_l;Round($by_l;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$arrowHeight_l;Round($cy_l;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round($dy_l-1.5;0))
		End if 
		
		
		
		
		
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$svgAreaX_l+($tip_cornerRadius_l*2)+($borderSize_l*1.5)+$arrowHeight_l-1.5;0))  //half border size for the arrow
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;-$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round(-$svgAreaY_l+$borderSize_l+($tip_cornerRadius_l*2)+1.5;0))
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l)
		
	: (Position("top";$tip_position_t)=1)
		
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($svgAreaX_l-($tip_cornerRadius_l*2)-$borderSize_l-1;0))
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round($svgAreaY_l-($borderSize_l*1.5)-($tip_cornerRadius_l*2)-$arrowHeight_l;0))  //half border size for the arrow
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;$tip_cornerRadius_l)
		
		If ($tip_instance_obj.arrow.curved)
			If ((Round($dx_l;0)-1-$corner_curveStart_r)>$tip_cornerRadius_l)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$dx_l;0)+1+$corner_curveStart_r)
			End if 
			SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curveStart_r;0;-$corner_curveStart_r-$corner_curve_Width_r;$corner_curve_Height_r)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$middle_line_Width_r;$middle_line_Height_r)
			SVG_PATH_CURVE ($svgTipGraphicRef_t;-$top_curve_Widtht_r;$top_curve_Height_r;(-$top_curve_Widtht_r)*2;0)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$middle_line_Width_r;-$middle_line_Height_r)
			
			$widthSizePlanned:=Round($dx_l;0)-1+Round($cx_l;0)+Round($bx_l;0)+Round($ax_l;0)
			$currentWidthSizeUsed:=Round($dx_l;0)-1-$corner_curveStart_r+$corner_curveStart_r+$corner_curve_Width_r+$middle_line_Width_r+($top_curve_Widtht_r*2)+$middle_line_Width_r+$corner_curve_Width_r
			$sizeToComplete:=$widthSizePlanned-$currentWidthSizeUsed
			If (($sizeToComplete-$corner_curveStart_r)>0)
				SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curve_Width_r;-$corner_curve_Height_r;-$corner_curve_Width_r-$corner_curveStart_r;-$corner_curve_Height_r)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$sizeToComplete+$corner_curveStart_r;0)
			Else 
				If ($sizeToComplete>0)
					SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curve_Width_r;-$corner_curve_Height_r;-$corner_curve_Width_r-$sizeToComplete;-$corner_curve_Height_r)
				Else 
					SVG_PATH_CURVE ($svgTipGraphicRef_t;-$corner_curve_Width_r;-$corner_curve_Height_r;-$corner_curve_Width_r;-$corner_curve_Height_r)
				End if 
			End if 
		Else 
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$dx_l;0)+1)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$cx_l;0);$arrowHeight_l)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$bx_l;0);-$arrowHeight_l)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$ax_l;0))
		End if 
		
		
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;-$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;-$svgAreaY_l+($borderSize_l*1.5)+($tip_cornerRadius_l*2)+$arrowHeight_l)  //half border size for the arrow
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l)
		
	: (Position("right";$tip_position_t)=1)
		
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($svgAreaX_l-($tip_cornerRadius_l*2)-($borderSize_l*1.5)-$arrowHeight_l-1.5;0))  //half border size for the arrow
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round($svgAreaY_l-$borderSize_l-($tip_cornerRadius_l*2)-1.5;0))
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;$tip_cornerRadius_l)
		
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$svgAreaX_l+($tip_cornerRadius_l*2)+($borderSize_l*1.5)+$arrowHeight_l+1.5;0))  //half border size for the arrow
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;-$tip_cornerRadius_l)
		
		If ($tip_instance_obj.arrow.curved)
			If ((Round($dy_l-1.5;0)-$corner_curveStart_r)>$tip_cornerRadius_l)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round(-$dy_l+1.5;0)+$corner_curveStart_r)
			End if 
			SVG_PATH_CURVE ($svgTipGraphicRef_t;0;-$corner_curveStart_r;-$corner_curve_Height_r;-$corner_curveStart_r-$corner_curve_Width_r)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$middle_line_Height_r;-$middle_line_Width_r)
			SVG_PATH_CURVE ($svgTipGraphicRef_t;-$top_curve_Height_r;-$top_curve_Widtht_r;0;-$top_curve_Widtht_r*2)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$middle_line_Height_r;-$middle_line_Width_r)
			
			$widthSizePlanned:=Round($dy_l-1.5;0)+Round($cy_l;0)+Round($by_l;0)+Round($ay_l;0)
			$currentWidthSizeUsed:=Round($dy_l-1.5;0)-$corner_curveStart_r+$corner_curveStart_r+$corner_curve_Width_r+$middle_line_Width_r+($top_curve_Widtht_r*2)+$middle_line_Width_r+$corner_curve_Width_r
			$sizeToComplete:=$widthSizePlanned-$currentWidthSizeUsed
			If (($sizeToComplete-$corner_curveStart_r)>0)
				SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curve_Height_r;-$corner_curve_Width_r;$corner_curve_Height_r;-$corner_curve_Width_r-$corner_curveStart_r)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;-$sizeToComplete+$corner_curveStart_r)
			Else 
				If ($sizeToComplete>0)
					SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curve_Height_r;-$corner_curve_Width_r;$corner_curve_Height_r;-$corner_curve_Width_r-$sizeToComplete)
				Else 
					SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curve_Height_r;-$corner_curve_Width_r;$corner_curve_Height_r;-$corner_curve_Width_r)
				End if 
			End if 
		Else 
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round(-$dy_l+1.5;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;-$arrowHeight_l;Round(-$cy_l;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$arrowHeight_l;Round(-$by_l;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round(-$ay_l;0))
		End if 
		
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l)
		
	: (Position("bottom";$tip_position_t)=1)
		
		If ($tip_instance_obj.arrow.curved)
			If ((Round($ax_l-1;0)-$corner_curveStart_r)>$tip_cornerRadius_l)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($ax_l-1;0)-$corner_curveStart_r)
			End if 
			SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curveStart_r;0;$corner_curveStart_r+$corner_curve_Width_r;-$corner_curve_Height_r)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$middle_line_Width_r;-$middle_line_Height_r)
			SVG_PATH_CURVE ($svgTipGraphicRef_t;$top_curve_Widtht_r;-$top_curve_Height_r;$top_curve_Widtht_r*2;0)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$middle_line_Width_r;$middle_line_Height_r)
			
			$widthSizePlanned:=Round($ax_l-1;0)+Round($bx_l;0)+Round($cx_l;0)+Round($dx_l;0)
			$currentWidthSizeUsed:=Round($ax_l-1;0)-$corner_curveStart_r+$corner_curveStart_r+$corner_curve_Width_r+$middle_line_Width_r+($top_curve_Widtht_r*2)+$middle_line_Width_r+$corner_curve_Width_r
			$sizeToComplete:=$widthSizePlanned-$currentWidthSizeUsed
			If (($sizeToComplete-$corner_curveStart_r)>0)
				SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curve_Width_r;$corner_curve_Height_r;$corner_curve_Width_r+$corner_curveStart_r;$corner_curve_Height_r)
				SVG_PATH_LINE_TO ($svgTipGraphicRef_t;$sizeToComplete-$corner_curveStart_r;0)
			Else 
				If ($sizeToComplete>0)
					SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curve_Width_r;$corner_curve_Height_r;$corner_curve_Width_r+$sizeToComplete;$corner_curve_Height_r)
				Else 
					SVG_PATH_CURVE ($svgTipGraphicRef_t;$corner_curve_Width_r;$corner_curve_Height_r;$corner_curve_Width_r;$corner_curve_Height_r)
				End if 
			End if 
		Else 
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($ax_l-1;0))
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($bx_l;0);-$arrowHeight_l)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($cx_l;0);$arrowHeight_l)
			SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round($dx_l;0))
		End if 
		
		
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round($svgAreaY_l-($borderSize_l*1.5)-($tip_cornerRadius_l*2)-$arrowHeight_l;0))
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;$tip_cornerRadius_l)
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;Round(-$svgAreaX_l+(($tip_cornerRadius_l*2)+$borderSize_l)+1;0))
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l;-$tip_cornerRadius_l)
		
		SVG_PATH_LINE_TO ($svgTipGraphicRef_t;0;Round(-$svgAreaY_l+($borderSize_l*1.5)+($tip_cornerRadius_l*2)+$arrowHeight_l;0))
		SVG_PATH_ARC ($svgTipGraphicRef_t;$tip_cornerRadius_l;$tip_cornerRadius_l;$tip_cornerRadius_l;-$tip_cornerRadius_l)
		
End case 


SVG_PATH_CLOSE ($svgTipGraphicRef_t)
SVG_SET_ID ($svgTipGraphicRef_t;"border")


  //shadow graphics
If ($shadowOn_b)
	$svgFilterRef_t:=SVG_Define_filter ($svgRef_t;"MyShadow")
	
	$shadowBlurRef_t:=SVG_Filter_Blur ($svgFilterRef_t;$Deviation_l;"sourceGraphic";"blurResult")
	$shadowOffRef_t:=SVG_Filter_Offset ($svgFilterRef_t;$shadowOffset_l;$shadowOffset_l;"blurResult";"alphaBlurOffset")
	$shadowBlendRef_t:=SVG_Filter_Blend ($svgFilterRef_t;"sourceGraphic";"alphaBlurOffset";"normal";"finalFilter")
	
	SVG_SET_FILTER ($svgTipGraphicRef_t;"MyShadow")
End if 


  //calc margin container
Case of 
		
		
	: (Position("top";$tip_position_t)=1)
		
		$marginContainerX_l:=($borderSize_l/2)+$left_padding_l+$tip_cornerRadius_l
		$marginContainerY_l:=($borderSize_l/2)+$top_padding_l+$tip_cornerRadius_l
		
		
	: (Position("bottom";$tip_position_t)=1)
		
		$marginContainerX_l:=($borderSize_l/2)+$left_padding_l+$tip_cornerRadius_l
		$marginContainerY_l:=($borderSize_l)+$top_padding_l+$tip_cornerRadius_l+$arrowHeight_l
		
	: (Position("left";$tip_position_t)=1)
		
		$marginContainerX_l:=($borderSize_l)+$left_padding_l+$tip_cornerRadius_l
		$marginContainerY_l:=($borderSize_l)+$top_padding_l+$tip_cornerRadius_l
		
	: (Position("right";$tip_position_t)=1)
		$marginContainerX_l:=($borderSize_l*1.5)+$left_padding_l+$tip_cornerRadius_l+$arrowHeight_l
		$marginContainerY_l:=($borderSize_l)+$top_padding_l+$tip_cornerRadius_l
End case 


If ($sf_used_b)
	  //position subform container
	$sfContainerName_t:="AJUI_Tip_container_sf"
	
	OBJECT SET COORDINATES(*;$sfContainerName_t;$marginContainerX_l;$marginContainerY_l;$marginContainerX_l+$containerWidht_l;$marginContainerY_l+$contentHeight_l)
	
	
Else 
	
	
	  //draw textarea
	$fontSize_l:=$tip_instance_obj.text.fontSize
	$textValue_t:=$tip_instance_obj.text.value
	$textOpacity:=$tip_instance_obj.text.opacity
	
	
	  //rotate text area
	If ($textRotation_t="left") | ($textRotation_t="right")
		If ($textRotation_t="left")
			$angle_l:=-90
			
			$moveV_l:=($contentWidht_l/2)+$marginContainerX_l
			$moveH_l:=(-$contentHeight_l/2)-$marginContainerY_l
			
		Else 
			$angle_l:=90
			
			$moveV_l:=(-$contentWidht_l/2)-$marginContainerX_l
			$moveH_l:=($contentHeight_l/2)+$marginContainerY_l
		End if 
		
		$svgTextAreaRef_t:=SVG_New_textArea ($svgRef_t;$textValue_t;(-$contentHeight_l/2);(-$contentWidht_l/2);$contentHeight_l;$contentWidht_l;AJUI_Tip_getStyleForTextArea ($tip_instance_obj))  //heigt and width need to be inversed
		
		SVG_ROTATION_CENTERED ($svgTextAreaRef_t;$angle_l)
		SVG_SET_TRANSFORM_TRANSLATE ($svgTextAreaRef_t;$moveH_l;$moveV_l)
		
	Else 
		$svgTextAreaRef_t:=SVG_New_textArea ($svgRef_t;$textValue_t;$marginContainerX_l;$marginContainerY_l;$contentWidht_l;$contentHeight_l;AJUI_Tip_getStyleForTextArea ($tip_instance_obj))
	End if 
	
	SVG_SET_OPACITY ($svgTextAreaRef_t;$textOpacity;$textOpacity)
	
End if 

  //show the size of the text area in debug
If ($tip_instance_obj.debug.showSvgArea)
	$Txt_groupReference_ID:=DOM Create XML element($svgRef_t;"g";"id";"text2")
	
	$moveV_l:=$marginContainerY_l
	$moveH_l:=$marginContainerX_l
	
	$tipTextRect2Ref_ID:=SVG_New_rect ($Txt_groupReference_ID;$moveH_l;$moveV_l;$contentWidht_l;$contentHeight_l)
	SVG_SET_OPACITY ($tipTextRect2Ref_ID;20;20)
	SVG_SET_STROKE_DASHARRAY ($tipTextRect2Ref_ID;2)
End if 

  //close box
If ($tip_instance_obj.closeBox.display)
	$closeBoxBorder_l:=($closeBoxRadius_l/5)+1
	
	If ($tip_cornerRadius_l>$closeBoxRadius_l)
		
		$closeBox_centerX_l:=0
		$closeBox_centerY_l:=0
	Else 
		
		$closeBox_centerX_l:=0
		$closeBox_centerY_l:=0
	End if 
	
	
	
	  //presentation
	$foregroundColorCB_t:="lightgray"
	$backgroundColorCB_t:="lightgray"
	$borderWidthCB_r:=1
	
	  //lines
	$left_line_l:=$closeBox_centerX_l-$closeBoxRadius_l+$closeBoxBorder_l
	$right_line_l:=$closeBox_centerX_l+$closeBoxRadius_l-$closeBoxBorder_l
	$top_line_l:=$closeBox_centerY_l-$closeBoxRadius_l+$closeBoxBorder_l
	$bottom_line_l:=$closeBox_centerY_l+$closeBoxRadius_l-$closeBoxBorder_l
	
	
	$CloseBox_groupRef_ID:=DOM Create XML element($svgRef_t;"g";"id";"closebox")
	
	  //draw closebox
	$svgCircleCBRef_t:=SVG_New_circle ($CloseBox_groupRef_ID;$closeBox_centerX_l;$closeBox_centerY_l;$closeBoxRadius_l;$foregroundColorCB_t;$backgroundColorCB_t;$borderWidthCB_r)
	
	SVG_ROTATION_CENTERED ($svgCircleCBRef_t;45)
	
	$svgHorlineRef_t:=SVG_New_line ($CloseBox_groupRef_ID;$left_line_l;$closeBox_centerY_l;$right_line_l;$closeBox_centerY_l;"gray";$closeBoxBorder_l)
	SVG_ROTATION_CENTERED ($svgHorlineRef_t;45)
	
	$svgVertlineRef_t:=SVG_New_line ($CloseBox_groupRef_ID;$closeBox_centerX_l;$top_line_l;$closeBox_centerX_l;$bottom_line_l;"gray";$closeBoxBorder_l)
	SVG_ROTATION_CENTERED ($svgVertlineRef_t;45)
	
	
	
	Case of 
			
			
		: (Position("top";$tip_position_t)=1)
			
			$translateX_r:=$svgAreaX_l-$borderSize_l-($tip_cornerRadius_l/2)-($left_padding_l/2)-($closeBoxBorder_l/2)
			$translateY_r:=$borderSize_l+($top_padding_l/2)+($tip_cornerRadius_l/2)+($closeBoxBorder_l/2)
			
			
		: (Position("bottom";$tip_position_t)=1)
			
			$translateX_r:=$svgAreaX_l-$borderSize_l-($tip_cornerRadius_l/2)-($left_padding_l/2)-($closeBoxBorder_l/2)
			$translateY_r:=$svgAreaY_l-$borderSize_l-($tip_cornerRadius_l/2)-($left_padding_l/2)-($closeBoxBorder_l/2)
			
			
		: (Position("left";$tip_position_t)=1)
			
			$translateX_r:=$borderSize_l+($top_padding_l/2)+($tip_cornerRadius_l/2)+($closeBoxBorder_l/2)
			$translateY_r:=$borderSize_l+($top_padding_l/2)+($tip_cornerRadius_l/2)+($closeBoxBorder_l/2)
			
		: (Position("right";$tip_position_t)=1)
			
			$translateX_r:=$svgAreaX_l-$borderSize_l-($tip_cornerRadius_l/2)-($left_padding_l/2)-($closeBoxBorder_l/2)
			$translateY_r:=$borderSize_l+($top_padding_l/2)+($tip_cornerRadius_l/2)+($closeBoxBorder_l/2)
			
	End case 
	
	SVG_SET_TRANSFORM_TRANSLATE ($CloseBox_groupRef_ID;$translateX_r;$translateY_r)
	
	SVG_SET_OPACITY ($svgCircleCBRef_t;$svgBackgroundOpacity;$svgBackgroundOpacity)
	SVG_SET_OPACITY ($svgHorlineRef_t;$svgBackgroundOpacity;$svgBackgroundOpacity)
	SVG_SET_OPACITY ($svgVertlineRef_t;$svgBackgroundOpacity;$svgBackgroundOpacity)
	
End if 

  //activate viewer in debug
If ($tip_instance_obj.debug.showSVGViewer)
	SVGTool_SHOW_IN_VIEWER ($svgRef_t)
End if 


$pictContainerName_t:="AJUI_Tip_container_pict"

If ($tip_instance_obj.animation.fade.in | $tip_instance_obj.animation.fade.out)\
 & ($tip_instance_obj.pu.isPictureTip)
	$currentOpacity_l:=$tip_instance_obj.animation.fade.currentOpacity
	
	  //graphics
	If ($currentOpacity_l>=$svgBackgroundOpacity)
		If ($currentOpacity_l>=$svgBorderOpacity)
			SVG_SET_OPACITY ($svgTipGraphicRef_t;$svgBackgroundOpacity;$svgBorderOpacity)
		Else 
			SVG_SET_OPACITY ($svgTipGraphicRef_t;$svgBackgroundOpacity;$currentOpacity_l)
		End if 
	Else 
		If ($currentOpacity_l>=$svgBorderOpacity)
			SVG_SET_OPACITY ($svgTipGraphicRef_t;$currentOpacity_l;$svgBorderOpacity)
		Else 
			SVG_SET_OPACITY ($svgTipGraphicRef_t;$currentOpacity_l;$currentOpacity_l)
		End if 
	End if 
	
	  //text
	If ($currentOpacity_l>=$textOpacity)
		SVG_SET_OPACITY ($svgTextAreaRef_t;$textOpacity;$textOpacity)
	Else 
		SVG_SET_OPACITY ($svgTextAreaRef_t;$currentOpacity_l;$currentOpacity_l)
	End if 
	
	  //closebox
	If ($tip_instance_obj.closeBox.display)
		If ($currentOpacity_l>=$svgBackgroundOpacity)
			SVG_SET_OPACITY ($svgCircleCBRef_t;$svgBackgroundOpacity;$svgBackgroundOpacity)
			SVG_SET_OPACITY ($svgHorlineRef_t;$svgBackgroundOpacity;$svgBackgroundOpacity)
			SVG_SET_OPACITY ($svgVertlineRef_t;$svgBackgroundOpacity;$svgBackgroundOpacity)
			
		Else 
			SVG_SET_OPACITY ($svgCircleCBRef_t;$currentOpacity_l;$currentOpacity_l)
			SVG_SET_OPACITY ($svgHorlineRef_t;$currentOpacity_l;$currentOpacity_l)
			SVG_SET_OPACITY ($svgVertlineRef_t;$currentOpacity_l;$currentOpacity_l)
		End if 
	End if 
End if 

If ($svgPrevRelativeCoordinate_b)
	SVG_SET_OPTIONS (SVG_Get_options  ?+ 4)  //Change to absolute coordinates
End if 

  //export svg to picture
SVG EXPORT TO PICTURE($svgRef_t;$result_pict;Copy XML data source)

SVG_CLEAR ($svgRef_t)


$result:=$result_pict