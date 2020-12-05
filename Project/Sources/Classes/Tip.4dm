Class constructor
	
	C_OBJECT:C1216($1;$template_obj)
	
	If (Count parameters:C259=1)
		If ($1.templatePath=Null:C1517)
			$template_obj:=AJUI_Tip_templateImport($1.templateName)
		Else 
			$template_obj:=AJUI_Tip_templateImport($1.templateName;$1.templatePath)
		End if 
		
		If (This:C1470.failImport)
			//nothing to do
		Else 
			This:C1470.animation:=$template_obj.animation
			This:C1470.arrow:=$template_obj.arrow
			This:C1470.closeBox:=$template_obj.closeBox
			This:C1470.container:=$template_obj.container
			This:C1470.debug:=$template_obj.debug
			This:C1470.global:=$template_obj.global
			This:C1470.pu:=$template_obj.pu
			This:C1470.subForm:=$template_obj.subForm
			This:C1470.target:=$template_obj.target
			This:C1470.text:=$template_obj.text
		End if 
	End if 
	
	
	AJUI_Tip_init_attributes(This:C1470)
	AJUI_Tip_init_animation(This:C1470)
	AJUI_Tip_init_methods(This:C1470)
	
Function checkRebuild
	// ----------------------
	// Personal Use
	// ----------------------
	// Put toRebuild to true and launch the show method if the tip is actually displayed
	
	AJUI_Tip_CheckRebuild
	
Function tipDuration
	// ----------------------
	// Global
	// ----------------------
	// Setter/Getter of the tip duration
	
	// $1 : (real) (optional) duration
	// $0 : (real) (return) current duration
	
	C_REAL:C285($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTipDuration
	Else 
		AJUI_Tip_setTipDuration($1)
	End if 
	
Function name
	// ----------------------
	// Global
	// ----------------------
	// Setter/Getter of the name of the tip
	
	// $1 : (text) (optional) name
	// $0 : (text) (return) current name of the tip
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setName
	Else 
		AJUI_Tip_setName($1)
	End if 
	
Function export
	// ----------------------
	// Function
	// ----------------------
	// Export the tip object into a json file in the folder "AJUI_Tip_Templates" located in the ressource folder
	
	// $1 : (text) template name
	// $2 : (text) (optional) folder path
	
	C_TEXT:C284($1;$2)
	
	If (Count parameters:C259=2)
		AJUI_Tip_templateExport($1;$2)
	Else 
		AJUI_Tip_templateExport($1)
	End if 
	
Function hide
	// ----------------------
	// Function
	// ----------------------
	//  Hide the tip form object
	
	// $1 : (object) (optional) tip instance
	
	C_OBJECT:C1216($1)
	
	If (Count parameters:C259=0)
		AJUI_Tip_hide
	Else 
		AJUI_Tip_hide($1)
	End if 
	
Function show
	// ----------------------
	// Function
	// ----------------------
	// Show the tip and rebuild the tip if necessary
	
	AJUI_Tip_show
	
Function fontColor
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the font color for the text
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current font color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setFontColor
	Else 
		AJUI_Tip_setFontColor($1)
	End if 
	
Function fontName
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the font name for the text, you can ask one or more font e.g. "Arial,MS Sans Sherif,..." No space allowed between each font
	
	// $1 : (text) (optional) font name
	// $0 : (text) (return) current font name
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setFontName
	Else 
		AJUI_Tip_setFontName($1)
	End if 
	
Function fontSize
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the font size for the text
	
	// $1 : (longint) (optional) font size
	// $0 : (longint) (return) current font size
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setFontSize
	Else 
		AJUI_Tip_setFontSize($1)
	End if 
	
Function label
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the label in the tip
	
	// $1 : (text) (optional) label
	// $0 : (text) (return) current label
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setText
	Else 
		AJUI_Tip_setText($1)
	End if 
	
Function textOpacity
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter to fix the opacity of the text
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current text opacity
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTextOpacity
	Else 
		AJUI_Tip_setTextOpacity($1)
	End if 
	
Function textRotation
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the rotation of the text in the tip, the value available are right, left and ""
	
	// $1 : (text) (optional) rotation
	// $0 : (text) (return) current rotation
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTextRotation
	Else 
		AJUI_Tip_setTextRotation($1)
	End if 
	
Function targetCoordinates
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter to defined the coordinates of the target
	
	// $1 : (longint) left or all coordinates
	// $2 : (longint) (optional) top coordinate
	// $3 : (longint) (optional) right coordinate
	// $4 : (longint) (optional) bottom coordinate
	// $0 : (object) (return) current target coordinates
	
	C_LONGINT:C283($1;$2;$3;$4)
	C_OBJECT:C1216($0)
	
	Case of 
		: (Count parameters:C259=0)
			$0:=AJUI_Tip_setTargetCoordinates
		: (Count parameters:C259=1)
			AJUI_Tip_setTargetCoordinates($1)
		: (Count parameters:C259=2)
			AJUI_Tip_setTargetCoordinates($1;$2)
		: (Count parameters:C259=4)
			AJUI_Tip_setTargetCoordinates($1;$2;$3;$4)
	End case 
	
Function targetMargin
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter to defined the size of the margin of the space between the external tipbox area and the target.
	
	// $1 : (longint) left or all margin size
	// $2 : (longint) (optional) top margin size
	// $3 : (longint) (optional) right margin size
	// $4 : (longint) (optional) bottom margin size
	// $0 : (object) (return) current margins
	
	C_LONGINT:C283($1;$2;$3;$4)
	C_OBJECT:C1216($0)
	
	Case of 
		: (Count parameters:C259=0)
			$0:=AJUI_Tip_setMargin
		: (Count parameters:C259=1)
			AJUI_Tip_setMargin($1)
		: (Count parameters:C259=2)
			AJUI_Tip_setMargin($1;$2)
		: (Count parameters:C259=4)
			AJUI_Tip_setMargin($1;$2;$3;$4)
	End case 
	
Function targetName
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter of the name of the target
	
	// $1 : (text) (optional) name
	// $0 : (text) (return) current target name
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTargetName
	Else 
		AJUI_Tip_setTargetName($1)
	End if 
	
Function targetOffset
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter to the offset between the target and the border of the tipbox
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current offset
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTargetOffset
	Else 
		AJUI_Tip_setTargetOffset($1)
	End if 
	
Function position
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter of the position of the tipbox, will also set the arrow position accordind to the tip position
	
	// $1 : (text) (optional) position
	// $2 : (boolean) (optional) default arrow position ?
	// $0 : (text) (return) current target current position
	
	C_TEXT:C284($0;$1)
	C_BOOLEAN:C305($2)
	
	Case of 
		: (Count parameters:C259=0)
			$0:=AJUI_Tip_setTipPosition
		: (Count parameters:C259=1)
			AJUI_Tip_setTipPosition($1)
		: (Count parameters:C259=2)
			AJUI_Tip_setTipPosition($1;$2)
	End case 
	
Function shadow
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to activate the shadow effect with the tipbox
	
	// $1 : (boolean) (optional) activate/inactivate
	// $0 : (boolean) (return) shadow ?
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_activateShadow
	Else 
		AJUI_Tip_activateShadow($1)
	End if 
	
Function backgroundColor
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the background color
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current BG color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBackgroundColor
	Else 
		AJUI_Tip_setBackgroundColor($1)
	End if 
Function bgColor
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the background color
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current BG color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBackgroundColor
	Else 
		AJUI_Tip_setBackgroundColor($1)
	End if 
	
Function backgroundOpacity
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to fix the opacity of the container background
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current BG opacity
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBackgroundOpacity
	Else 
		AJUI_Tip_setBackgroundOpacity($1)
	End if 
	
Function bgOpacity
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to fix the opacity of the container background
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current BG opacity
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBackgroundOpacity
	Else 
		AJUI_Tip_setBackgroundOpacity($1)
	End if 
	
Function borderColor
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the border color
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current border color
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBorderColor
	Else 
		AJUI_Tip_setBorderColor($1)
	End if 
	
Function borderOpacity
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to fix the opacity of the container border
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current Border opacity
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBorderOpacity
	Else 
		AJUI_Tip_setBorderOpacity($1)
	End if 
	
Function borderSize
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the border size. No border if you pass zero
	
	// $1 : (longint) (optional) size
	// $0 : (longint) (return) current Border size
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBorderSize
	Else 
		AJUI_Tip_setBorderSize($1)
	End if 
	
Function cornerRadius
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the radius for the rouding of the tip's corners
	
	// $1 : (longint) (optional) corner radius
	// $0 : (longint) (return) current corner radius
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setCornerRadius
	Else 
		AJUI_Tip_setCornerRadius($1)
	End if 
	
Function globalOpacity
	// ----------------------
	// Container
	// ----------------------
	// Global setter to fix all opacity properties in the same value
	
	// $1 : (longint) % of opacity
	
	C_LONGINT:C283($1)
	
	AJUI_Tip_setGlobalOpacity($1)
	
Function padding
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to defined the size of the padding, it will be applied to each side
	
	// $1 : (longint) (optional) padding
	// $0 : (longint) (return) current padding
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setPadding
	Else 
		AJUI_Tip_setPadding($1)
	End if 
	
Function shadowOffset
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter for the offset of the shadow
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current offset
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setShadowOffset
	Else 
		AJUI_Tip_setShadowOffset($1)
	End if 
	
Function maxHeight
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the max height of the tipbox (text container)
	
	// $1 : (longint) (optional) max height
	// $0 : (longint) (return) current max height
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTipboxMaxHeight
	Else 
		AJUI_Tip_setTipboxMaxHeight($1)
	End if 
	
Function maxWidth
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the max width of the tipbox (text container)
	
	// $1 : (longint) (optional) max width
	// $0 : (longint) (return) current max width
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTipboxMaxWidth
	Else 
		AJUI_Tip_setTipboxMaxWidth($1)
	End if 
	
Function arrowCurve
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the arrow curve
	
	// $1 : (real) (optional) curve
	// $0 : (real) (return) current curve
	
	C_REAL:C285($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_GetSetArrowCurve
	Else 
		AJUI_Tip_GetSetArrowCurve($1)
	End if 
	
Function arrowHeight
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the height size of the arrow
	
	// $1 : (longint) (optional) height
	// $0 : (longint) (return) current arrow height
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setArrowHeight
	Else 
		AJUI_Tip_setArrowHeight($1)
	End if 
	
Function arrowOffset
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter to the offset between the arrow and the border of the tipbox
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current arrow offset
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setArrowOffset
	Else 
		AJUI_Tip_setArrowOffset($1)
	End if 
	
Function arrowPosition
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter to the offset between the arrow and the border of the tipbox
	
	// $1 : (text) (optional) position
	// $0 : (text) (return) current arrow position
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setArrowPosition
	Else 
		AJUI_Tip_setArrowPosition($1)
	End if 
	
Function arrowWidth
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the width size of the arrow
	
	// $1 : (longint) (optional) width
	// $0 : (longint) (return) current arrow width
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setArrowWidth
	Else 
		AJUI_Tip_setArrowWidth($1)
	End if 
	
Function cornerCurveEnd
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the end curve
	
	// $1 : (real) (optional) end curve
	// $0 : (real) (return) current end curve
	
	C_REAL:C285($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_GetSetCornerCurveEnd
	Else 
		AJUI_Tip_GetSetCornerCurveEnd($1)
	End if 
	
Function cornerCurveStart
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the start curve
	
	// $1 : (real) (optional) start curve
	// $0 : (real) (return) current start curve
	
	C_REAL:C285($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_GetSetCornerCurveStart
	Else 
		AJUI_Tip_GetSetCornerCurveStart($1)
	End if 
	
Function curved
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter to activate/inactivate the curved arrow
	
	// $1 : (boolean) (optional) Activate/inactivate curve
	// $0 : (boolean) (return) curved arrow ?
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_getsetCurved
	Else 
		AJUI_Tip_getsetCurved($1)
	End if 
	
Function closeBoxDisplay
	// ----------------------
	// Close box
	// ----------------------
	// Setter/Getter to define is the closeBox will be displayed
	
	// $1 : (boolean) (optional) show/hide closebox
	// $0 : (boolean) (return) closebox displayed ?
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setCloseBoxDisplay
	Else 
		AJUI_Tip_setCloseBoxDisplay($1)
	End if 
	
Function closeBoxSize
	// ----------------------
	// Close box
	// ----------------------
	// Setter/Getter of the size of the closeBox
	
	// $1 : (longint) (optional) size
	// $0 : (longint) (return) current size
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setCloseBoxSize
	Else 
		AJUI_Tip_setCloseBoxSize($1)
	End if 
	
Function subformName
	// ----------------------
	// Subform
	// ----------------------
	// Setter/Getter of name of the subform object
	
	// $1 : (text) (optional) name
	// $0 : (text) (return) current subform name
	
	C_TEXT:C284($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setSubformName
	Else 
		AJUI_Tip_setSubformName($1)
	End if 
	
Function animated
	// ----------------------
	// Animation
	// ----------------------
	// Setter/Getter to activate animations
	
	// $1 : (boolean) (optional) activate/inactive
	// $0 : (boolean) (return) animation activated ?
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_activeAnimation
	Else 
		AJUI_Tip_activeAnimation($1)
	End if 
	
Function animationFrameRate
	// ----------------------
	// Animation
	// ----------------------
	// Setter/Getter of the number of display by seconde for a jump
	
	// $1 : (longint) (optional) number of refresh
	// $0 : (longint) (return) current number of refresh
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setAnimRefresh
	Else 
		AJUI_Tip_setAnimRefresh($1)
	End if 
	
Function blinkDuration
	// ----------------------
	// Blink
	// ----------------------
	// Setter/Getter to enter the duration between each blink
	
	// $1 : (longint) (optional) duration
	// $0 : (longint) (return) current duration
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setBlinkDuration
	Else 
		AJUI_Tip_setBlinkDuration($1)
	End if 
	
Function blinkNumber
	// ----------------------
	// Blink
	// ----------------------
	// Setter/Getter to enter the number of time the tip must blink
	
	// $1 : (longint) (optional) number
	// $0 : (longint) (return) current number of blink
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_TIP_setBlinkNumber
	Else 
		AJUI_TIP_setBlinkNumber($1)
	End if 
	
Function blinkOn
	// ----------------------
	// Blink
	// ----------------------
	// Setter/Getter of the percentage of visible time compared to invisible time during each blink
	
	// $1 : (longint) (optional) percentage
	// $0 : (longint) (return) current percentage
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_TIp_setBlinkOn
	Else 
		AJUI_TIp_setBlinkOn($1)
	End if 
	
Function jumpDuration
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter to enter the duration between each jump
	
	// $1 : (longint) (optional) duration
	// $0 : (longint) (return) current duration
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setJumpDuration
	Else 
		AJUI_Tip_setJumpDuration($1)
	End if 
	
Function jumpNumber
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter to enter the number of time the tip must jump
	
	// $1 : (longint) (optional) number
	// $0 : (longint) (return) current number of jump
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setJumpNumber
	Else 
		AJUI_Tip_setJumpNumber($1)
	End if 
	
Function jumpOffset
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter to enter the offset of the jump
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current offset
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_TIP_setJumpOffset
	Else 
		AJUI_TIP_setJumpOffset($1)
	End if 
	
Function jumpOn
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter of the percentage related to the duration for the time the arrow reaches its highest point
	
	// $1 : (longint) (optional) percentage
	// $0 : (longint) (return) current percentage
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setJumpOn
	Else 
		AJUI_Tip_setJumpOn($1)
	End if 
	
Function fadeIn
	// ----------------------
	// Fade effect
	// ----------------------
	// Setter/Getter to activate fade in animation
	
	// $1 : (boolean) (optional) activate/inactivate
	// $0 : (boolean) (return) Fade In activated ?
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_activeFadeIn
	Else 
		AJUI_Tip_activeFadeIn($1)
	End if 
	
Function fadeOut
	// ----------------------
	// Fade effect
	// ----------------------
	// Setter/Getter to activate fade out animation
	
	// $1 : (boolean) (optional) activate/inactivate
	// $0 : (boolean) (return) Fade Out activated ?
	
	C_BOOLEAN:C305($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_activateFadeOut
	Else 
		AJUI_Tip_activateFadeOut($1)
	End if 
	
Function timerFadeIn
	// ----------------------
	// Fade effect
	// ----------------------
	// setter/Getter for the fade in timer
	
	// $1 : (longint) (optional) timer (ms)
	// $0 : (longint) (return) current timer
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTimerFadeIn
	Else 
		AJUI_Tip_setTimerFadeIn($1)
	End if 
	
Function timerFadeOut
	// ----------------------
	// Fade effect
	// ----------------------
	// setter/Getter for the fade out timer
	
	// $1 : (longint) (optional) timer (ms)
	// $0 : (longint) (return) current timer
	
	C_LONGINT:C283($0;$1)
	
	If (Count parameters:C259=0)
		$0:=AJUI_Tip_setTimerFadeOut
	Else 
		AJUI_Tip_setTimerFadeOut($1)
	End if 