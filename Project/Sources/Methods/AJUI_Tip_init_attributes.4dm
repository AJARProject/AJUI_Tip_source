//%attributes = {"invisible":true}
// AJUI_Tip_init_attributes ( $tip_instance ) 
//
// $tip_instance : (object) tip instance object to initialize the attributes
//
// Initialize the attributes of a tip instance

If (False:C215)
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

C_OBJECT:C1216($1;$tip_instance_obj)
C_OBJECT:C1216(<>AJUI_Tip_Storage)
C_COLLECTION:C1488(AJUI_Tip_instances_uuid)
C_PICTURE:C286($pict)

$tip_instance_obj:=$1
$pict:=$pict*0


// ----------------------
// Internal reference storage
// To sync the object when we loose the references by using external processes
// ----------------------
If (<>AJUI_Tip_Storage=Null:C1517)
	<>AJUI_Tip_Storage:=New object:C1471
End if 
$UUID:=Generate UUID:C1066
<>AJUI_Tip_Storage[$UUID]:=$tip_instance_obj
// Store all the tip instances UUID's of the current process
// This to be able to do a cleanup with the AJUI_Tip_clearCache
If (AJUI_Tip_instances_uuid=Null:C1517)
	AJUI_Tip_instances_uuid:=New collection:C1472
End if 
AJUI_Tip_instances_uuid.push($UUID)


// ----------------------
// Personal use
// ----------------------
If ($tip_instance_obj.pu=Null:C1517)
	$tip_instance_obj.pu:=New object:C1471
End if 
$tip_instance_obj.pu.displayed:=False:C215
$tip_instance_obj.pu.toRebuild:=True:C214
$tip_instance_obj.pu.subformContext:=False:C215
$tip_instance_obj.pu.refWindow:=0
$tip_instance_obj.pu.event:=0
If ($tip_instance_obj.global.name=Null:C1517)
	$tip_instance_obj.pu.worker:=""
Else 
	If ($tip_instance_obj.global.name="")
		$tip_instance_obj.pu.worker:=""
	Else 
		$tip_instance_obj.pu.worker:="ajui_tip_"+$tip_instance_obj.global.name+"_wrk"
	End if 
End if 
$tip_instance_obj.pu.isPictureTip:=True:C214  // Picture Tip or Subform Tip




// ----------------------
// Global
// ----------------------
If ($tip_instance_obj.global=Null:C1517)
	$tip_instance_obj.global:=New object:C1471
End if 
If ($tip_instance_obj.global.name=Null:C1517)
	$tip_instance_obj.global.name:=""
End if 
If ($tip_instance_obj.global.tipDuration=Null:C1517)
	$tip_instance_obj.global.tipDuration:=0  // millisecond(s)
End if 
$tip_instance_obj.global.autoRebuild:=False:C215
$tip_instance_obj.global.tipDurationHandlerActive:=False:C215
$tip_instance_obj.global.UUID:=$UUID


// ----------------------
// Text
// ----------------------
If ($tip_instance_obj.text=Null:C1517)
	$tip_instance_obj.text:=New object:C1471
End if 
If ($tip_instance_obj.text.value=Null:C1517)
	$tip_instance_obj.text.value:=""
End if 
If ($tip_instance_obj.text.rotation=Null:C1517)
	$tip_instance_obj.text.rotation:=""
End if 
If ($tip_instance_obj.text.fontSize=Null:C1517)
	$tip_instance_obj.text.fontSize:=11
End if 
If ($tip_instance_obj.text.fontName=Null:C1517)
	$tip_instance_obj.text.fontName:="Arial,Helvetica,MS Sans Serif"
End if 
If ($tip_instance_obj.text.fontColor=Null:C1517)
	$tip_instance_obj.text.fontColor:="gray"
End if 
If ($tip_instance_obj.text.opacity=Null:C1517)
	$tip_instance_obj.text.opacity:=100
End if 


// ----------------------
// Target
// ----------------------
If ($tip_instance_obj.target=Null:C1517)
	$tip_instance_obj.target:=New object:C1471
End if 
If ($tip_instance_obj.target.name=Null:C1517)
	$tip_instance_obj.target.name:=""
End if 
If ($tip_instance_obj.target.tipPosition=Null:C1517)
	$tip_instance_obj.target.tipPosition:="right-middle"
End if 
If ($tip_instance_obj.target.offset=Null:C1517)
	$tip_instance_obj.target.offset:=0
End if 
If ($tip_instance_obj.target.width=Null:C1517)
	$tip_instance_obj.target.width:=0  // calculated
End if 
If ($tip_instance_obj.target.height=Null:C1517)
	$tip_instance_obj.target.height:=0  // calculated
End if 
If ($tip_instance_obj.target.coordinate=Null:C1517)
	$tip_instance_obj.target.coordinate:=New object:C1471
End if 
If ($tip_instance_obj.target.coordinate.left=Null:C1517)
	$tip_instance_obj.target.coordinate.left:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.coordinate.top=Null:C1517)
	$tip_instance_obj.target.coordinate.top:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.coordinate.right=Null:C1517)
	$tip_instance_obj.target.coordinate.right:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.coordinate.bottom=Null:C1517)
	$tip_instance_obj.target.coordinate.bottom:=0  // calculated based on target name OR manually set
End if 
If ($tip_instance_obj.target.margin=Null:C1517)
	$tip_instance_obj.target.margin:=New object:C1471
End if 
If ($tip_instance_obj.target.margin.left=Null:C1517)
	$tip_instance_obj.target.margin.left:=0
End if 
If ($tip_instance_obj.target.margin.top=Null:C1517)
	$tip_instance_obj.target.margin.top:=0
End if 
If ($tip_instance_obj.target.margin.right=Null:C1517)
	$tip_instance_obj.target.margin.right:=0
End if 
If ($tip_instance_obj.target.margin.bottom=Null:C1517)
	$tip_instance_obj.target.margin.bottom:=0
End if 


// ----------------------
// Container
// ----------------------
If ($tip_instance_obj.container=Null:C1517)
	$tip_instance_obj.container:=New object:C1471
End if 
If ($tip_instance_obj.container.cornerRadius=Null:C1517)
	$tip_instance_obj.container.cornerRadius:=5
End if 
If ($tip_instance_obj.container.maxHeight=Null:C1517)
	$tip_instance_obj.container.maxHeight:=0
End if 
If ($tip_instance_obj.container.maxWidth=Null:C1517)
	$tip_instance_obj.container.maxWidth:=0
End if 
If ($tip_instance_obj.container.height=Null:C1517)
	$tip_instance_obj.container.height:=0  // calculated
End if 
If ($tip_instance_obj.container.width=Null:C1517)
	$tip_instance_obj.container.width:=0  // calculated
End if 
If ($tip_instance_obj.container.backgroundColor=Null:C1517)
	$tip_instance_obj.container.backgroundColor:="yellow"
End if 
If ($tip_instance_obj.container.backgroundOpacity=Null:C1517)
	$tip_instance_obj.container.backgroundOpacity:=50
End if 

// container border
If ($tip_instance_obj.container.borderColor=Null:C1517)
	$tip_instance_obj.container.borderColor:="gray"
End if 
If ($tip_instance_obj.container.borderOpacity=Null:C1517)
	$tip_instance_obj.container.borderOpacity:=100
End if 
If ($tip_instance_obj.container.borderSize=Null:C1517)
	$tip_instance_obj.container.borderSize:=1
End if 

// Container Coordinates
If ($tip_instance_obj.container.coordinate=Null:C1517)
	$tip_instance_obj.container.coordinate:=New object:C1471
End if 
If ($tip_instance_obj.container.coordinate.left=Null:C1517)
	$tip_instance_obj.container.coordinate.left:=0  // calculated
End if 
If ($tip_instance_obj.container.coordinate.top=Null:C1517)
	$tip_instance_obj.container.coordinate.top:=0  // calculated
End if 
If ($tip_instance_obj.container.coordinate.right=Null:C1517)
	$tip_instance_obj.container.coordinate.right:=0  // calculated
End if 
If ($tip_instance_obj.container.coordinate.bottom=Null:C1517)
	$tip_instance_obj.container.coordinate.bottom:=0  // calculated
End if 
If ($tip_instance_obj.container.autoPosition=Null:C1517)
	$tip_instance_obj.container.autoPosition:=False:C215
End if 
// Container Padding
If ($tip_instance_obj.container.padding=Null:C1517)
	$tip_instance_obj.container.padding:=New object:C1471
End if 
If ($tip_instance_obj.container.padding.left=Null:C1517)
	$tip_instance_obj.container.padding.left:=10
End if 
If ($tip_instance_obj.container.padding.top=Null:C1517)
	$tip_instance_obj.container.padding.top:=10
End if 
If ($tip_instance_obj.container.padding.right=Null:C1517)
	$tip_instance_obj.container.padding.right:=10
End if 
If ($tip_instance_obj.container.padding.bottom=Null:C1517)
	$tip_instance_obj.container.padding.bottom:=10
End if 
// Container Shadow
If ($tip_instance_obj.container.shadowOn=Null:C1517)
	$tip_instance_obj.container.shadowOn:=False:C215
End if 
If ($tip_instance_obj.container.shadowOffset=Null:C1517)
	$tip_instance_obj.container.shadowOffset:=2
End if 


// ----------------------
// Arrow
// ----------------------
If ($tip_instance_obj.arrow=Null:C1517)
	$tip_instance_obj.arrow:=New object:C1471
End if 
If ($tip_instance_obj.arrow.width=Null:C1517)
	$tip_instance_obj.arrow.width:=20
End if 
If ($tip_instance_obj.arrow.height=Null:C1517)
	$tip_instance_obj.arrow.height:=10
End if 
If ($tip_instance_obj.arrow.asymFactor=Null:C1517)
	$tip_instance_obj.arrow.asymFactor:=0  // Not used now
End if 
If ($tip_instance_obj.arrow.position=Null:C1517)
	$tip_instance_obj.arrow.position:="middle"
End if 
If ($tip_instance_obj.arrow.offset=Null:C1517)
	$tip_instance_obj.arrow.offset:=10
End if 
If ($tip_instance_obj.arrow.curved=Null:C1517)
	$tip_instance_obj.arrow.curved:=False:C215
End if 
If ($tip_instance_obj.arrow.cornerCurveStart=Null:C1517)
	$tip_instance_obj.arrow.cornerCurveStart:=0.5  //ratio
End if 
If ($tip_instance_obj.arrow.cornerCurveEnd=Null:C1517)
	$tip_instance_obj.arrow.cornerCurveEnd:=0.15  //ratio
End if 
If ($tip_instance_obj.arrow.arrowCurve=Null:C1517)
	$tip_instance_obj.arrow.arrowCurve:=0.9  //ratio
End if 



// ----------------------
// Close Box
// ----------------------
If ($tip_instance_obj.closeBox=Null:C1517)
	$tip_instance_obj.closeBox:=New object:C1471
End if 
If ($tip_instance_obj.closeBox.display=Null:C1517)
	$tip_instance_obj.closeBox.display:=False:C215
End if 
If ($tip_instance_obj.closeBox.size=Null:C1517)
	$tip_instance_obj.closeBox.size:=5
End if 


// ----------------------
// SubForm
// ----------------------
If ($tip_instance_obj.subForm=Null:C1517)
	$tip_instance_obj.subForm:=New object:C1471
End if 
If ($tip_instance_obj.subForm.name=Null:C1517)
	$tip_instance_obj.subForm.name:=""
End if 
If ($tip_instance_obj.subForm.width=Null:C1517)
	$tip_instance_obj.subForm.width:=0  // calculated
End if 
If ($tip_instance_obj.subForm.height=Null:C1517)
	$tip_instance_obj.subForm.height:=0  // calculated
End if 
If ($tip_instance_obj.subForm.methodGetFormSize=Null:C1517)
	$tip_instance_obj.subForm.methodGetFormSize:=0  // no method "AJUI_Tip_getSubFormSize" exists 
End if 

// ----------------------
// debug
// ----------------------
If ($tip_instance_obj.debug=Null:C1517)
	$tip_instance_obj.debug:=New object:C1471
End if 
If ($tip_instance_obj.debug.showSvgArea=Null:C1517)
	$tip_instance_obj.debug.showSvgArea:=False:C215
End if 
If ($tip_instance_obj.debug.showSVGViewer=Null:C1517)
	$tip_instance_obj.debug.showSVGViewer:=False:C215
End if 
