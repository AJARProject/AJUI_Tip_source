//%attributes = {"invisible":true}
// AJUI_Tip_init_attributes ( $tip_instance ) 
//
// $tip_instance : (object) tip instance object to initialize the attributes
//
// Initialize the attributes of a tip instance

#DECLARE($param1 : Object)

If (False)
	// ----------------------------------------------------
	// User name (OS): gabriel inzirillo
	// Date and time: 22.01.19, 13:36:04
	// ----------------------------------------------------
	// Method: AJUI_Tip_init_attributes
	// Description
	// 
	//
	// ----------------------------------------------------
End if 

var $tip_instance_obj : Object
var $pict : Picture
var $UUID : Text
// Interprocess variable: 'var' cannot declare it (docs Concepts/variables), so the legacy
// directive is kept and its obsolescence warning (551.2) is disabled locally.
//%W-551.2
C_OBJECT(<>AJUI_Tip_Storage)
//%W+551.2
var AJUI_Tip_instances_uuid : Collection

$tip_instance_obj:=$param1
$pict:=$pict*0


// ----------------------
// Internal reference storage
// To sync the object when we loose the references by using external processes
// ----------------------
If (<>AJUI_Tip_Storage=Null)
	<>AJUI_Tip_Storage:=New object
End if 
$UUID:=Generate UUID
<>AJUI_Tip_Storage[$UUID]:=$tip_instance_obj
// Store all the tip instances UUID's of the current process
// This to be able to do a cleanup with the AJUI_Tip_clearCache
If (AJUI_Tip_instances_uuid=Null)
	AJUI_Tip_instances_uuid:=New collection
End if 
AJUI_Tip_instances_uuid.push($UUID)


// ----------------------
// Personal use
// ----------------------
If ($tip_instance_obj.pu=Null)
	$tip_instance_obj.pu:=New object
End if 
$tip_instance_obj.pu.displayed:=False
$tip_instance_obj.pu.toRebuild:=True
$tip_instance_obj.pu.subformContext:=False
$tip_instance_obj.pu.refWindow:=0
$tip_instance_obj.pu.event:=0
If ($tip_instance_obj.global.name=Null)
	$tip_instance_obj.pu.worker:=""
Else 
	If ($tip_instance_obj.global.name="")
		$tip_instance_obj.pu.worker:=""
	Else 
		$tip_instance_obj.pu.worker:="ajui_tip_"+$tip_instance_obj.global.name+"_wrk"
	End if 
End if 
$tip_instance_obj.pu.isPictureTip:=True  // Picture Tip or Subform Tip




// ----------------------
// Global
// ----------------------
If ($tip_instance_obj.global=Null)
	$tip_instance_obj.global:=New object
End if 
If ($tip_instance_obj.global.name=Null)
	$tip_instance_obj.global.name:=""
End if 
If ($tip_instance_obj.global.tipDuration=Null)
	$tip_instance_obj.global.tipDuration:=0  // millisecond(s)
End if 
$tip_instance_obj.global.autoRebuild:=False
$tip_instance_obj.global.tipDurationHandlerActive:=False
$tip_instance_obj.global.UUID:=$UUID


// ----------------------
// Text
// ----------------------
If ($tip_instance_obj.text=Null)
	$tip_instance_obj.text:=New object
End if 
If ($tip_instance_obj.text.value=Null)
	$tip_instance_obj.text.value:=""
End if 
If ($tip_instance_obj.text.rotation=Null)
	$tip_instance_obj.text.rotation:=""
End if 
If ($tip_instance_obj.text.fontSize=Null)
	$tip_instance_obj.text.fontSize:=11
End if 
If ($tip_instance_obj.text.fontName=Null)
	$tip_instance_obj.text.fontName:="Arial,Helvetica,MS Sans Serif"
End if 
If ($tip_instance_obj.text.fontColor=Null)
	$tip_instance_obj.text.fontColor:="gray"
End if 
If ($tip_instance_obj.text.opacity=Null)
	$tip_instance_obj.text.opacity:=100
End if 


// ----------------------
// Target
// ----------------------
If ($tip_instance_obj.target=Null)
	$tip_instance_obj.target:=New object
End if 
If ($tip_instance_obj.target.name=Null)
	$tip_instance_obj.target.name:=""
End if 
If ($tip_instance_obj.target.tipPosition=Null)
	$tip_instance_obj.target.tipPosition:="right-middle"
End if 
If ($tip_instance_obj.target.offset=Null)
	$tip_instance_obj.target.offset:=0
End if 
If ($tip_instance_obj.target.width=Null)
	$tip_instance_obj.target.width:=0  // calculated
End if 
If ($tip_instance_obj.target.height=Null)
	$tip_instance_obj.target.height:=0  // calculated
End if 
If ($tip_instance_obj.target.coordinate=Null)
	$tip_instance_obj.target.coordinate:=New object
End if 
If ($tip_instance_obj.target.coordinate.left=Null)
	$tip_instance_obj.target.coordinate.left:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.coordinate.top=Null)
	$tip_instance_obj.target.coordinate.top:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.coordinate.right=Null)
	$tip_instance_obj.target.coordinate.right:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.coordinate.bottom=Null)
	$tip_instance_obj.target.coordinate.bottom:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.margin=Null)
	$tip_instance_obj.target.margin:=New object
End if 
If ($tip_instance_obj.target.margin.left=Null)
	$tip_instance_obj.target.margin.left:=0
End if 
If ($tip_instance_obj.target.margin.top=Null)
	$tip_instance_obj.target.margin.top:=0
End if 
If ($tip_instance_obj.target.margin.right=Null)
	$tip_instance_obj.target.margin.right:=0
End if 
If ($tip_instance_obj.target.margin.bottom=Null)
	$tip_instance_obj.target.margin.bottom:=0
End if 


// ----------------------
// Container
// ----------------------
If ($tip_instance_obj.container=Null)
	$tip_instance_obj.container:=New object
End if 
If ($tip_instance_obj.container.cornerRadius=Null)
	$tip_instance_obj.container.cornerRadius:=5
End if 
If ($tip_instance_obj.container.maxHeight=Null)
	$tip_instance_obj.container.maxHeight:=0
End if 
If ($tip_instance_obj.container.maxWidth=Null)
	$tip_instance_obj.container.maxWidth:=0
End if 
If ($tip_instance_obj.container.height=Null)
	$tip_instance_obj.container.height:=0  // calculated
End if 
If ($tip_instance_obj.container.width=Null)
	$tip_instance_obj.container.width:=0  // calculated
End if 
If ($tip_instance_obj.container.backgroundColor=Null)
	$tip_instance_obj.container.backgroundColor:="yellow"
End if 
If ($tip_instance_obj.container.backgroundOpacity=Null)
	$tip_instance_obj.container.backgroundOpacity:=50
End if 

// container border
If ($tip_instance_obj.container.borderColor=Null)
	$tip_instance_obj.container.borderColor:="gray"
End if 
If ($tip_instance_obj.container.borderOpacity=Null)
	$tip_instance_obj.container.borderOpacity:=100
End if 
If ($tip_instance_obj.container.borderSize=Null)
	$tip_instance_obj.container.borderSize:=1
End if 

// Container Coordinates
If ($tip_instance_obj.container.coordinate=Null)
	$tip_instance_obj.container.coordinate:=New object
End if 
If ($tip_instance_obj.container.coordinate.left=Null)
	$tip_instance_obj.container.coordinate.left:=0  // calculated
End if 
If ($tip_instance_obj.container.coordinate.top=Null)
	$tip_instance_obj.container.coordinate.top:=0  // calculated
End if 
If ($tip_instance_obj.container.coordinate.right=Null)
	$tip_instance_obj.container.coordinate.right:=0  // calculated
End if 
If ($tip_instance_obj.container.coordinate.bottom=Null)
	$tip_instance_obj.container.coordinate.bottom:=0  // calculated
End if 
If ($tip_instance_obj.container.autoPosition=Null)
	$tip_instance_obj.container.autoPosition:=False
End if 
// Container Padding
If ($tip_instance_obj.container.padding=Null)
	$tip_instance_obj.container.padding:=New object
End if 
If ($tip_instance_obj.container.padding.left=Null)
	$tip_instance_obj.container.padding.left:=10
End if 
If ($tip_instance_obj.container.padding.top=Null)
	$tip_instance_obj.container.padding.top:=10
End if 
If ($tip_instance_obj.container.padding.right=Null)
	$tip_instance_obj.container.padding.right:=10
End if 
If ($tip_instance_obj.container.padding.bottom=Null)
	$tip_instance_obj.container.padding.bottom:=10
End if 
// Container Shadow
If ($tip_instance_obj.container.shadowOn=Null)
	$tip_instance_obj.container.shadowOn:=False
End if 
If ($tip_instance_obj.container.shadowOffset=Null)
	$tip_instance_obj.container.shadowOffset:=2
End if 


// ----------------------
// Arrow
// ----------------------
If ($tip_instance_obj.arrow=Null)
	$tip_instance_obj.arrow:=New object
End if 
If ($tip_instance_obj.arrow.width=Null)
	$tip_instance_obj.arrow.width:=20
End if 
If ($tip_instance_obj.arrow.height=Null)
	$tip_instance_obj.arrow.height:=10
End if 
If ($tip_instance_obj.arrow.asymFactor=Null)
	$tip_instance_obj.arrow.asymFactor:=0  // Not used now
End if 
If ($tip_instance_obj.arrow.position=Null)
	$tip_instance_obj.arrow.position:="middle"
End if 
If ($tip_instance_obj.arrow.offset=Null)
	$tip_instance_obj.arrow.offset:=10
End if 
If ($tip_instance_obj.arrow.curved=Null)
	$tip_instance_obj.arrow.curved:=False
End if 
If ($tip_instance_obj.arrow.cornerCurveStart=Null)
	$tip_instance_obj.arrow.cornerCurveStart:=0.5  //ratio
End if 
If ($tip_instance_obj.arrow.cornerCurveEnd=Null)
	$tip_instance_obj.arrow.cornerCurveEnd:=0.15  //ratio
End if 
If ($tip_instance_obj.arrow.arrowCurve=Null)
	$tip_instance_obj.arrow.arrowCurve:=0.9  //ratio
End if 



// ----------------------
// Close Box
// ----------------------
If ($tip_instance_obj.closeBox=Null)
	$tip_instance_obj.closeBox:=New object
End if 
If ($tip_instance_obj.closeBox.display=Null)
	$tip_instance_obj.closeBox.display:=False
End if 
If ($tip_instance_obj.closeBox.size=Null)
	$tip_instance_obj.closeBox.size:=5
End if 


// ----------------------
// SubForm
// ----------------------
If ($tip_instance_obj.subForm=Null)
	$tip_instance_obj.subForm:=New object
End if 
If ($tip_instance_obj.subForm.name=Null)
	$tip_instance_obj.subForm.name:=""
End if 
If ($tip_instance_obj.subForm.width=Null)
	$tip_instance_obj.subForm.width:=0  // calculated
End if 
If ($tip_instance_obj.subForm.height=Null)
	$tip_instance_obj.subForm.height:=0  // calculated
End if 
If ($tip_instance_obj.subForm.methodGetFormSize=Null)
	$tip_instance_obj.subForm.methodGetFormSize:=0  // no method "AJUI_Tip_getSubFormSize" exists 
End if 

// ----------------------
// debug
// ----------------------
If ($tip_instance_obj.debug=Null)
	$tip_instance_obj.debug:=New object
End if 
If ($tip_instance_obj.debug.showSvgArea=Null)
	$tip_instance_obj.debug.showSvgArea:=False
End if 
If ($tip_instance_obj.debug.showSVGViewer=Null)
	$tip_instance_obj.debug.showSVGViewer:=False
End if 
