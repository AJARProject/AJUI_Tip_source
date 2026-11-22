// Declared so the 21 R4 compiler accepts This.<property> (warning 550.26).
// https://developer.4d.com/docs/21-R4/Concepts/classes
property animation; arrow; closeBox; container; debug; global; pu; subForm; target; text : Object
property failImport : Boolean

Class constructor($param1 : Object)
	
	
	var $template_obj : Object
	This.failImport:=False
	If (Count parameters=1)
		If ($param1.templatePath=Null)
			$template_obj:=AJUI_Tip_templateImport($param1.templateName)
		Else 
			$template_obj:=AJUI_Tip_templateImport($param1.templateName;$param1.templatePath)
		End if 
		
		This.failImport:=$template_obj.failImport
		If (This.failImport)
			//nothing to do
		Else 
			This.animation:=$template_obj.animation
			This.arrow:=$template_obj.arrow
			This.closeBox:=$template_obj.closeBox
			This.container:=$template_obj.container
			This.debug:=$template_obj.debug
			This.global:=$template_obj.global
			This.pu:=$template_obj.pu
			This.subForm:=$template_obj.subForm
			This.target:=$template_obj.target
			This.text:=$template_obj.text
		End if 
	End if 
	
	
	AJUI_Tip_init_attributes(This)
	AJUI_Tip_init_animation(This)
	AJUI_Tip_init_methods(This)
	
Function checkRebuild
	// ----------------------
	// Personal Use
	// ----------------------
	// Put toRebuild to true and launch the show method if the tip is actually displayed
	
	AJUI_Tip_CheckRebuild
	
Function tipDuration($param1 : Real) -> $result : Real
	// ----------------------
	// Global
	// ----------------------
	// Setter/Getter of the tip duration
	
	// $1 : (real) (optional) duration
	// $0 : (real) (return) current duration
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTipDuration
	Else 
		AJUI_Tip_setTipDuration($param1)
	End if 
	
Function name($param1 : Text) -> $result : Text
	// ----------------------
	// Global
	// ----------------------
	// Setter/Getter of the name of the tip
	
	// $1 : (text) (optional) name
	// $0 : (text) (return) current name of the tip
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setName
	Else 
		AJUI_Tip_setName($param1)
	End if 
	
Function export($param1 : Text; $param2 : Text)
	// ----------------------
	// Function
	// ----------------------
	// Export the tip object into a json file in the folder "AJUI_Tip_Templates" located in the ressource folder
	
	// $1 : (text) template name
	// $2 : (text) (optional) folder path
	
	
	If (Count parameters=2)
		AJUI_Tip_templateExport($param1;$param2)
	Else 
		AJUI_Tip_templateExport($param1)
	End if 
	
Function hide($param1 : Object)
	// ----------------------
	// Function
	// ----------------------
	//  Hide the tip form object
	
	// $1 : (object) (optional) tip instance
	
	
	If (Count parameters=0)
		AJUI_Tip_hide
	Else 
		AJUI_Tip_hide($param1)
	End if 
	
Function show
	// ----------------------
	// Function
	// ----------------------
	// Show the tip and rebuild the tip if necessary
	
	AJUI_Tip_show
	
Function fontColor($param1 : Text) -> $result : Text
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the font color for the text
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current font color
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setFontColor
	Else 
		AJUI_Tip_setFontColor($param1)
	End if 
	
Function fontName($param1 : Text) -> $result : Text
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the font name for the text, you can ask one or more font e.g. "Arial,MS Sans Sherif,..." No space allowed between each font
	
	// $1 : (text) (optional) font name
	// $0 : (text) (return) current font name
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setFontName
	Else 
		AJUI_Tip_setFontName($param1)
	End if 
	
Function fontSize($param1 : Integer) -> $result : Integer
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the font size for the text
	
	// $1 : (longint) (optional) font size
	// $0 : (longint) (return) current font size
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setFontSize
	Else 
		AJUI_Tip_setFontSize($param1)
	End if 
	
Function label($param1 : Text) -> $result : Text
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the label in the tip
	
	// $1 : (text) (optional) label
	// $0 : (text) (return) current label
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setText
	Else 
		AJUI_Tip_setText($param1)
	End if 
	
Function textOpacity($param1 : Integer) -> $result : Integer
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter to fix the opacity of the text
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current text opacity
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTextOpacity
	Else 
		AJUI_Tip_setTextOpacity($param1)
	End if 
	
Function textRotation($param1 : Text) -> $result : Text
	// ----------------------
	// Text
	// ----------------------
	// Setter/Getter of the rotation of the text in the tip, the value available are right, left and ""
	
	// $1 : (text) (optional) rotation
	// $0 : (text) (return) current rotation
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTextRotation
	Else 
		AJUI_Tip_setTextRotation($param1)
	End if 
	
Function targetCoordinates($param1 : Integer; $param2 : Integer; $param3 : Integer; $param4 : Integer) -> $result : Object
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter to defined the coordinates of the target
	
	// $1 : (longint) left or all coordinates
	// $2 : (longint) (optional) top coordinate
	// $3 : (longint) (optional) right coordinate
	// $4 : (longint) (optional) bottom coordinate
	// $0 : (object) (return) current target coordinates
	
	
	Case of 
		: (Count parameters=0)
			$result:=AJUI_Tip_setTargetCoordinates
		: (Count parameters=1)
			AJUI_Tip_setTargetCoordinates($param1)
		: (Count parameters=2)
			AJUI_Tip_setTargetCoordinates($param1;$param2)
		: (Count parameters=4)
			AJUI_Tip_setTargetCoordinates($param1;$param2;$param3;$param4)
	End case 
	
Function targetMargin($param1 : Integer; $param2 : Integer; $param3 : Integer; $param4 : Integer) -> $result : Object
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter to defined the size of the margin of the space between the external tipbox area and the target.
	
	// $1 : (longint) left or all margin size
	// $2 : (longint) (optional) top margin size
	// $3 : (longint) (optional) right margin size
	// $4 : (longint) (optional) bottom margin size
	// $0 : (object) (return) current margins
	
	
	Case of 
		: (Count parameters=0)
			$result:=AJUI_Tip_setMargin
		: (Count parameters=1)
			AJUI_Tip_setMargin($param1)
		: (Count parameters=2)
			AJUI_Tip_setMargin($param1;$param2)
		: (Count parameters=4)
			AJUI_Tip_setMargin($param1;$param2;$param3;$param4)
	End case 
	
Function targetName($param1 : Text) -> $result : Text
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter of the name of the target
	
	// $1 : (text) (optional) name
	// $0 : (text) (return) current target name
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTargetName
	Else 
		AJUI_Tip_setTargetName($param1)
	End if 
	
Function targetOffset($param1 : Integer) -> $result : Integer
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter to the offset between the target and the border of the tipbox
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current offset
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTargetOffset
	Else 
		AJUI_Tip_setTargetOffset($param1)
	End if 
	
Function position($param1 : Text; $param2 : Boolean) -> $result : Text
	// ----------------------
	// Target
	// ----------------------
	// Setter/Getter of the position of the tipbox, will also set the arrow position accordind to the tip position
	
	// $1 : (text) (optional) position
	// $2 : (boolean) (optional) default arrow position ?
	// $0 : (text) (return) current target current position
	
	
	Case of 
		: (Count parameters=0)
			$result:=AJUI_Tip_setTipPosition
		: (Count parameters=1)
			AJUI_Tip_setTipPosition($param1)
		: (Count parameters=2)
			AJUI_Tip_setTipPosition($param1;$param2)
	End case 
	
Function shadow($param1 : Boolean) -> $result : Boolean
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to activate the shadow effect with the tipbox
	
	// $1 : (boolean) (optional) activate/inactivate
	// $0 : (boolean) (return) shadow ?
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_activateShadow
	Else 
		AJUI_Tip_activateShadow($param1)
	End if 
	
Function backgroundColor($param1 : Text) -> $result : Text
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the background color
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current BG color
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBackgroundColor
	Else 
		AJUI_Tip_setBackgroundColor($param1)
	End if 
Function bgColor($param1 : Text) -> $result : Text
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the background color
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current BG color
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBackgroundColor
	Else 
		AJUI_Tip_setBackgroundColor($param1)
	End if 
	
Function backgroundOpacity($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to fix the opacity of the container background
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current BG opacity
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBackgroundOpacity
	Else 
		AJUI_Tip_setBackgroundOpacity($param1)
	End if 
	
Function bgOpacity($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to fix the opacity of the container background
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current BG opacity
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBackgroundOpacity
	Else 
		AJUI_Tip_setBackgroundOpacity($param1)
	End if 
	
Function borderColor($param1 : Text) -> $result : Text
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the border color
	
	// $1 : (text) (optional) color
	// $0 : (text) (return) current border color
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBorderColor
	Else 
		AJUI_Tip_setBorderColor($param1)
	End if 
	
Function borderOpacity($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to fix the opacity of the container border
	
	// $1 : (longint) (optional) opacity
	// $0 : (longint) (return) current Border opacity
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBorderOpacity
	Else 
		AJUI_Tip_setBorderOpacity($param1)
	End if 
	
Function borderSize($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the border size. No border if you pass zero
	
	// $1 : (longint) (optional) size
	// $0 : (longint) (return) current Border size
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBorderSize
	Else 
		AJUI_Tip_setBorderSize($param1)
	End if 
	
Function cornerRadius($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the radius for the rouding of the tip's corners
	
	// $1 : (longint) (optional) corner radius
	// $0 : (longint) (return) current corner radius
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setCornerRadius
	Else 
		AJUI_Tip_setCornerRadius($param1)
	End if 
	
Function globalOpacity($param1 : Integer)
	// ----------------------
	// Container
	// ----------------------
	// Global setter to fix all opacity properties in the same value
	
	// $1 : (longint) % of opacity
	
	
	AJUI_Tip_setGlobalOpacity($param1)
	
Function padding($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter to defined the size of the padding, it will be applied to each side
	
	// $1 : (longint) (optional) padding
	// $0 : (longint) (return) current padding
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setPadding
	Else 
		AJUI_Tip_setPadding($param1)
	End if 
	
Function shadowOffset($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter for the offset of the shadow
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current offset
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setShadowOffset
	Else 
		AJUI_Tip_setShadowOffset($param1)
	End if 
	
Function maxHeight($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the max height of the tipbox (text container)
	
	// $1 : (longint) (optional) max height
	// $0 : (longint) (return) current max height
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTipboxMaxHeight
	Else 
		AJUI_Tip_setTipboxMaxHeight($param1)
	End if 
	
Function maxWidth($param1 : Integer) -> $result : Integer
	// ----------------------
	// Container
	// ----------------------
	// Setter/Getter of the max width of the tipbox (text container)
	
	// $1 : (longint) (optional) max width
	// $0 : (longint) (return) current max width
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTipboxMaxWidth
	Else 
		AJUI_Tip_setTipboxMaxWidth($param1)
	End if 
	
Function arrowCurve($param1 : Real) -> $result : Real
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the arrow curve
	
	// $1 : (real) (optional) curve
	// $0 : (real) (return) current curve
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_GetSetArrowCurve
	Else 
		AJUI_Tip_GetSetArrowCurve($param1)
	End if 
	
Function arrowHeight($param1 : Integer) -> $result : Integer
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the height size of the arrow
	
	// $1 : (longint) (optional) height
	// $0 : (longint) (return) current arrow height
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setArrowHeight
	Else 
		AJUI_Tip_setArrowHeight($param1)
	End if 
	
Function arrowOffset($param1 : Integer) -> $result : Integer
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter to the offset between the arrow and the border of the tipbox
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current arrow offset
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setArrowOffset
	Else 
		AJUI_Tip_setArrowOffset($param1)
	End if 
	
Function arrowPosition($param1 : Text) -> $result : Text
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter to the offset between the arrow and the border of the tipbox
	
	// $1 : (text) (optional) position
	// $0 : (text) (return) current arrow position
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setArrowPosition
	Else 
		AJUI_Tip_setArrowPosition($param1)
	End if 
	
Function arrowWidth($param1 : Integer) -> $result : Integer
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the width size of the arrow
	
	// $1 : (longint) (optional) width
	// $0 : (longint) (return) current arrow width
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setArrowWidth
	Else 
		AJUI_Tip_setArrowWidth($param1)
	End if 
	
Function cornerCurveEnd($param1 : Real) -> $result : Real
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the end curve
	
	// $1 : (real) (optional) end curve
	// $0 : (real) (return) current end curve
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_GetSetCornerCurveEnd
	Else 
		AJUI_Tip_GetSetCornerCurveEnd($param1)
	End if 
	
Function cornerCurveStart($param1 : Real) -> $result : Real
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter of the start curve
	
	// $1 : (real) (optional) start curve
	// $0 : (real) (return) current start curve
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_GetSetCornerCurveStart
	Else 
		AJUI_Tip_GetSetCornerCurveStart($param1)
	End if 
	
Function curved($param1 : Boolean) -> $result : Boolean
	// ----------------------
	// Arrow
	// ----------------------
	// Setter/Getter to activate/inactivate the curved arrow
	
	// $1 : (boolean) (optional) Activate/inactivate curve
	// $0 : (boolean) (return) curved arrow ?
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_getsetCurved
	Else 
		AJUI_Tip_getsetCurved($param1)
	End if 
	
Function closeBoxDisplay($param1 : Boolean) -> $result : Boolean
	// ----------------------
	// Close box
	// ----------------------
	// Setter/Getter to define is the closeBox will be displayed
	
	// $1 : (boolean) (optional) show/hide closebox
	// $0 : (boolean) (return) closebox displayed ?
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setCloseBoxDisplay
	Else 
		AJUI_Tip_setCloseBoxDisplay($param1)
	End if 
	
Function closeBoxSize($param1 : Integer) -> $result : Integer
	// ----------------------
	// Close box
	// ----------------------
	// Setter/Getter of the size of the closeBox
	
	// $1 : (longint) (optional) size
	// $0 : (longint) (return) current size
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setCloseBoxSize
	Else 
		AJUI_Tip_setCloseBoxSize($param1)
	End if 
	
Function subformName($param1 : Text) -> $result : Text
	// ----------------------
	// Subform
	// ----------------------
	// Setter/Getter of name of the subform object
	
	// $1 : (text) (optional) name
	// $0 : (text) (return) current subform name
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setSubformName
	Else 
		AJUI_Tip_setSubformName($param1)
	End if 
	
Function animated($param1 : Boolean) -> $result : Boolean
	// ----------------------
	// Animation
	// ----------------------
	// Setter/Getter to activate animations
	
	// $1 : (boolean) (optional) activate/inactive
	// $0 : (boolean) (return) animation activated ?
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_activeAnimation
	Else 
		AJUI_Tip_activeAnimation($param1)
	End if 
	
Function animationFrameRate($param1 : Integer) -> $result : Integer
	// ----------------------
	// Animation
	// ----------------------
	// Setter/Getter of the number of display by seconde for a jump
	
	// $1 : (longint) (optional) number of refresh
	// $0 : (longint) (return) current number of refresh
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setAnimRefresh
	Else 
		AJUI_Tip_setAnimRefresh($param1)
	End if 
	
Function blinkDuration($param1 : Integer) -> $result : Integer
	// ----------------------
	// Blink
	// ----------------------
	// Setter/Getter to enter the duration between each blink
	
	// $1 : (longint) (optional) duration
	// $0 : (longint) (return) current duration
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setBlinkDuration
	Else 
		AJUI_Tip_setBlinkDuration($param1)
	End if 
	
Function blinkNumber($param1 : Integer) -> $result : Integer
	// ----------------------
	// Blink
	// ----------------------
	// Setter/Getter to enter the number of time the tip must blink
	
	// $1 : (longint) (optional) number
	// $0 : (longint) (return) current number of blink
	
	
	If (Count parameters=0)
		$result:=AJUI_TIP_setBlinkNumber
	Else 
		AJUI_TIP_setBlinkNumber($param1)
	End if 
	
Function blinkOn($param1 : Integer) -> $result : Integer
	// ----------------------
	// Blink
	// ----------------------
	// Setter/Getter of the percentage of visible time compared to invisible time during each blink
	
	// $1 : (longint) (optional) percentage
	// $0 : (longint) (return) current percentage
	
	
	If (Count parameters=0)
		$result:=AJUI_TIp_setBlinkOn
	Else 
		AJUI_TIp_setBlinkOn($param1)
	End if 
	
Function jumpDuration($param1 : Integer) -> $result : Integer
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter to enter the duration between each jump
	
	// $1 : (longint) (optional) duration
	// $0 : (longint) (return) current duration
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setJumpDuration
	Else 
		AJUI_Tip_setJumpDuration($param1)
	End if 
	
Function jumpNumber($param1 : Integer) -> $result : Integer
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter to enter the number of time the tip must jump
	
	// $1 : (longint) (optional) number
	// $0 : (longint) (return) current number of jump
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setJumpNumber
	Else 
		AJUI_Tip_setJumpNumber($param1)
	End if 
	
Function jumpOffset($param1 : Integer) -> $result : Integer
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter to enter the offset of the jump
	
	// $1 : (longint) (optional) offset
	// $0 : (longint) (return) current offset
	
	
	If (Count parameters=0)
		$result:=AJUI_TIP_setJumpOffset
	Else 
		AJUI_TIP_setJumpOffset($param1)
	End if 
	
Function jumpOn($param1 : Integer) -> $result : Integer
	// ----------------------
	// Jump
	// ----------------------
	// Setter/Getter of the percentage related to the duration for the time the arrow reaches its highest point
	
	// $1 : (longint) (optional) percentage
	// $0 : (longint) (return) current percentage
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setJumpOn
	Else 
		AJUI_Tip_setJumpOn($param1)
	End if 
	
Function fadeIn($param1 : Boolean) -> $result : Boolean
	// ----------------------
	// Fade effect
	// ----------------------
	// Setter/Getter to activate fade in animation
	
	// $1 : (boolean) (optional) activate/inactivate
	// $0 : (boolean) (return) Fade In activated ?
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_activeFadeIn
	Else 
		AJUI_Tip_activeFadeIn($param1)
	End if 
	
Function fadeOut($param1 : Boolean) -> $result : Boolean
	// ----------------------
	// Fade effect
	// ----------------------
	// Setter/Getter to activate fade out animation
	
	// $1 : (boolean) (optional) activate/inactivate
	// $0 : (boolean) (return) Fade Out activated ?
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_activateFadeOut
	Else 
		AJUI_Tip_activateFadeOut($param1)
	End if 
	
Function timerFadeIn($param1 : Integer) -> $result : Integer
	// ----------------------
	// Fade effect
	// ----------------------
	// setter/Getter for the fade in timer
	
	// $1 : (longint) (optional) timer (ms)
	// $0 : (longint) (return) current timer
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTimerFadeIn
	Else 
		AJUI_Tip_setTimerFadeIn($param1)
	End if 
	
Function timerFadeOut($param1 : Integer) -> $result : Integer
	// ----------------------
	// Fade effect
	// ----------------------
	// setter/Getter for the fade out timer
	
	// $1 : (longint) (optional) timer (ms)
	// $0 : (longint) (return) current timer
	
	
	If (Count parameters=0)
		$result:=AJUI_Tip_setTimerFadeOut
	Else 
		AJUI_Tip_setTimerFadeOut($param1)
	End if 