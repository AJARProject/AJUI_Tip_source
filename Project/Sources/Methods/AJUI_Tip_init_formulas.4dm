//%attributes = {"invisible":true}
// AJUI_Tip_init_formulas ( $tip_instance ) 
//
// $tip_instance : (object) tip instance object to initialize the formulas
//
// Initialize the formulas of a tip instance

#DECLARE($param1 : Object)

If (False)
	// ----------------------------------------------------
	// User name (OS): gabriel inzirillo
	// Date and time: 22.01.19, 14:49:48
	// ----------------------------------------------------
	// Method: AJUI_Tip_init_formulas
	// Description
	// 
	//
	// ----------------------------------------------------
End if 

var $tip_instance : Object

$tip_instance:=$param1

// ----------------------
// Personal Use
// ----------------------
$tip_instance.CheckRebuild:=Formula(AJUI_Tip_CheckRebuild)

// ----------------------
// Global
// ----------------------
$tip_instance.TipName:=Formula(AJUI_Tip_setName)
$tip_instance.TipDuration:=Formula(AJUI_Tip_setTipDuration)
$tip_instance.AutoRebuild:=Formula(AJUI_Tip_setAutoRebuild)


// ----------------------
// Function
// ----------------------
$tip_instance.Hide:=Formula(AJUI_Tip_hide)
$tip_instance.Show:=Formula(AJUI_Tip_show)
$tip_instance.Export:=Formula(AJUI_Tip_templateExport)



// ----------------------
// Text
// ----------------------
$tip_instance.TextLabel:=Formula(AJUI_Tip_setText)
$tip_instance.TextRotation:=Formula(AJUI_Tip_setTextRotation)
$tip_instance.TextFontSize:=Formula(AJUI_Tip_setFontSize)
$tip_instance.TextFontName:=Formula(AJUI_Tip_setFontName)
$tip_instance.TextFontColor:=Formula(AJUI_Tip_setFontColor)
$tip_instance.TextOpacity:=Formula(AJUI_Tip_setTextOpacity)



// ----------------------
// Target
// ----------------------
$tip_instance.TargetName:=Formula(AJUI_Tip_setTargetName)
$tip_instance.TipPosition:=Formula(AJUI_Tip_setTipPosition)
$tip_instance.TargetOffset:=Formula(AJUI_Tip_setTargetOffset)
$tip_instance.TargetCoordinates:=Formula(AJUI_Tip_setTargetCoordinates)
$tip_instance.TargetMargin:=Formula(AJUI_Tip_setMargin)

// ----------------------
// Container
// ----------------------
$tip_instance.CornerRadius:=Formula(AJUI_Tip_setCornerRadius)
$tip_instance.TipboxMaxWidth:=Formula(AJUI_Tip_setTipboxMaxWidth)
$tip_instance.TipboxMaxHeight:=Formula(AJUI_Tip_setTipboxMaxHeight)
$tip_instance.Padding:=Formula(AJUI_Tip_setPadding)
$tip_instance.BorderSize:=Formula(AJUI_Tip_setBorderSize)
$tip_instance.BorderColor:=Formula(AJUI_Tip_setBorderColor)
$tip_instance.BorderOpacity:=Formula(AJUI_Tip_setBorderOpacity)
$tip_instance.BackgroundColor:=Formula(AJUI_Tip_setBackgroundColor)
$tip_instance.BackgroundOpacity:=Formula(AJUI_Tip_setBackgroundOpacity)
$tip_instance.GlobalOpacity:=Formula(AJUI_Tip_setGlobalOpacity)
$tip_instance.ActivateShadow:=Formula(AJUI_Tip_activateShadow)
$tip_instance.ShadowOffset:=Formula(AJUI_Tip_setShadowOffset)



// ----------------------
// Arrow
// ----------------------
$tip_instance.ArrowWidth:=Formula(AJUI_Tip_setArrowWidth)
$tip_instance.ArrowHeight:=Formula(AJUI_Tip_setArrowHeight)
$tip_instance.ArrowPosition:=Formula(AJUI_Tip_setArrowPosition)
$tip_instance.ArrowOffset:=Formula(AJUI_Tip_setArrowOffset)
$tip_instance.Curved:=Formula(AJUI_Tip_getsetCurved)
$tip_instance.ArrowCurve:=Formula(AJUI_Tip_GetSetArrowCurve)
$tip_instance.CornerCurveStart:=Formula(AJUI_Tip_GetSetCornerCurveStart)
$tip_instance.CornerCurveEnd:=Formula(AJUI_Tip_GetSetCornerCurveEnd)

// ----------------------
// Close Box
// ----------------------
$tip_instance.CloseBoxDisplay:=Formula(AJUI_Tip_setCloseBoxDisplay)
$tip_instance.CloseBoxSize:=Formula(AJUI_Tip_setCloseBoxSize)

// ----------------------
// SubForm
// ----------------------
$tip_instance.SubformName:=Formula(AJUI_Tip_setSubformName)

// ----------------------
// Animation
// ----------------------
$tip_instance.ActivateAnimation:=Formula(AJUI_Tip_activeAnimation)
$tip_instance.AnimationRefresh:=Formula(AJUI_Tip_setAnimRefresh)
// ----------------------
// Blink
// ----------------------
$tip_instance.BlinkNumber:=Formula(AJUI_TIP_setBlinkNumber)
$tip_instance.BlinkDuration:=Formula(AJUI_Tip_setBlinkDuration)
$tip_instance.BlinkOn:=Formula(AJUI_TIp_setBlinkOn)

// ----------------------
// Jump
// ----------------------
$tip_instance.JumpNumber:=Formula(AJUI_Tip_setJumpNumber)
$tip_instance.JumpOn:=Formula(AJUI_Tip_setJumpOn)
$tip_instance.JumpDuration:=Formula(AJUI_Tip_setJumpDuration)
$tip_instance.JumpOffset:=Formula(AJUI_TIP_setJumpOffset)


// ----------------------
// Fade effect
// ----------------------
$tip_instance.ActivateFadeIn:=Formula(AJUI_Tip_activeFadeIn)
$tip_instance.ActivateFadeOut:=Formula(AJUI_Tip_activateFadeOut)
$tip_instance.TimerFadeIn:=Formula(AJUI_Tip_setTimerFadeIn)
$tip_instance.TimerFadeOut:=Formula(AJUI_Tip_setTimerFadeOut)


