//%attributes = {"invisible":true}
// AJUI_Tip_init_formulas ( $tip_instance ) 
//
// $tip_instance : (object) tip instance object to initialize the formulas
//
// Initialize the formulas of a tip instance

If (False:C215)
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

C_OBJECT:C1216($1;$tip_instance)

$tip_instance:=$1

// ----------------------
// Personal Use
// ----------------------
$tip_instance.CheckRebuild:=Formula:C1597(AJUI_Tip_CheckRebuild)

// ----------------------
// Global
// ----------------------
$tip_instance.TipName:=Formula:C1597(AJUI_Tip_setName)
$tip_instance.TipDuration:=Formula:C1597(AJUI_Tip_setTipDuration)
$tip_instance.AutoRebuild:=Formula:C1597(AJUI_Tip_setAutoRebuild)


// ----------------------
// Function
// ----------------------
$tip_instance.Hide:=Formula:C1597(AJUI_Tip_hide)
$tip_instance.Show:=Formula:C1597(AJUI_Tip_show)
$tip_instance.Export:=Formula:C1597(AJUI_Tip_templateExport)



// ----------------------
// Text
// ----------------------
$tip_instance.TextLabel:=Formula:C1597(AJUI_Tip_setText)
$tip_instance.TextRotation:=Formula:C1597(AJUI_Tip_setTextRotation)
$tip_instance.TextFontSize:=Formula:C1597(AJUI_Tip_setFontSize)
$tip_instance.TextFontName:=Formula:C1597(AJUI_Tip_setFontName)
$tip_instance.TextFontColor:=Formula:C1597(AJUI_Tip_setFontColor)
$tip_instance.TextOpacity:=Formula:C1597(AJUI_Tip_setTextOpacity)



// ----------------------
// Target
// ----------------------
$tip_instance.TargetName:=Formula:C1597(AJUI_Tip_setTargetName)
$tip_instance.TipPosition:=Formula:C1597(AJUI_Tip_setTipPosition)
$tip_instance.TargetOffset:=Formula:C1597(AJUI_Tip_setTargetOffset)
$tip_instance.TargetCoordinates:=Formula:C1597(AJUI_Tip_setTargetCoordinates)
$tip_instance.TargetMargin:=Formula:C1597(AJUI_Tip_setMargin)

// ----------------------
// Container
// ----------------------
$tip_instance.CornerRadius:=Formula:C1597(AJUI_Tip_setCornerRadius)
$tip_instance.TipboxMaxWidth:=Formula:C1597(AJUI_Tip_setTipboxMaxWidth)
$tip_instance.TipboxMaxHeight:=Formula:C1597(AJUI_Tip_setTipboxMaxHeight)
$tip_instance.Padding:=Formula:C1597(AJUI_Tip_setPadding)
$tip_instance.BorderSize:=Formula:C1597(AJUI_Tip_setBorderSize)
$tip_instance.BorderColor:=Formula:C1597(AJUI_Tip_setBorderColor)
$tip_instance.BorderOpacity:=Formula:C1597(AJUI_Tip_setBorderOpacity)
$tip_instance.BackgroundColor:=Formula:C1597(AJUI_Tip_setBackgroundColor)
$tip_instance.BackgroundOpacity:=Formula:C1597(AJUI_Tip_setBackgroundOpacity)
$tip_instance.GlobalOpacity:=Formula:C1597(AJUI_Tip_setGlobalOpacity)
$tip_instance.ActivateShadow:=Formula:C1597(AJUI_Tip_activateShadow)
$tip_instance.ShadowOffset:=Formula:C1597(AJUI_Tip_setShadowOffset)



// ----------------------
// Arrow
// ----------------------
$tip_instance.ArrowWidth:=Formula:C1597(AJUI_Tip_setArrowWidth)
$tip_instance.ArrowHeight:=Formula:C1597(AJUI_Tip_setArrowHeight)
$tip_instance.ArrowPosition:=Formula:C1597(AJUI_Tip_setArrowPosition)
$tip_instance.ArrowOffset:=Formula:C1597(AJUI_Tip_setArrowOffset)
$tip_instance.Curved:=Formula:C1597(AJUI_Tip_getsetCurved)
$tip_instance.ArrowCurve:=Formula:C1597(AJUI_Tip_GetSetArrowCurve)
$tip_instance.CornerCurveStart:=Formula:C1597(AJUI_Tip_GetSetCornerCurveStart)
$tip_instance.CornerCurveEnd:=Formula:C1597(AJUI_Tip_GetSetCornerCurveEnd)

// ----------------------
// Close Box
// ----------------------
$tip_instance.CloseBoxDisplay:=Formula:C1597(AJUI_Tip_setCloseBoxDisplay)
$tip_instance.CloseBoxSize:=Formula:C1597(AJUI_Tip_setCloseBoxSize)

// ----------------------
// SubForm
// ----------------------
$tip_instance.SubformName:=Formula:C1597(AJUI_Tip_setSubformName)

// ----------------------
// Animation
// ----------------------
$tip_instance.ActivateAnimation:=Formula:C1597(AJUI_Tip_activeAnimation)
$tip_instance.AnimationRefresh:=Formula:C1597(AJUI_Tip_setAnimRefresh)
// ----------------------
// Blink
// ----------------------
$tip_instance.BlinkNumber:=Formula:C1597(AJUI_TIP_setBlinkNumber)
$tip_instance.BlinkDuration:=Formula:C1597(AJUI_Tip_setBlinkDuration)
$tip_instance.BlinkOn:=Formula:C1597(AJUI_TIp_setBlinkOn)

// ----------------------
// Jump
// ----------------------
$tip_instance.JumpNumber:=Formula:C1597(AJUI_Tip_setJumpNumber)
$tip_instance.JumpOn:=Formula:C1597(AJUI_Tip_setJumpOn)
$tip_instance.JumpDuration:=Formula:C1597(AJUI_Tip_setJumpDuration)
$tip_instance.JumpOffset:=Formula:C1597(AJUI_TIP_setJumpOffset)


// ----------------------
// Fade effect
// ----------------------
$tip_instance.ActivateFadeIn:=Formula:C1597(AJUI_Tip_activeFadeIn)
$tip_instance.ActivateFadeOut:=Formula:C1597(AJUI_Tip_activateFadeOut)
$tip_instance.TimerFadeIn:=Formula:C1597(AJUI_Tip_setTimerFadeIn)
$tip_instance.TimerFadeOut:=Formula:C1597(AJUI_Tip_setTimerFadeOut)


