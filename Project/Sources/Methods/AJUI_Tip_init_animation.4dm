//%attributes = {"invisible":true}
  // AJUI_Tip_init_animation ( $tip_instance_obj ) 
  //
  // $tip_instance_obj : (object) tip instance
  //
  // Initialize the animation settings of a tip instance

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 08.02.19, 09:00:41
	  // Modified by: Gary Criblez (08.02.19)
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_init_animation
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($1;$tip_instance_obj)
$tip_instance_obj:=$1

If (Storage:C1525.AJUI_Tip_Storage=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.AJUI_Tip_Storage:=New shared object:C1526
	End use 
End if 


If ($tip_instance_obj.animation=Null:C1517)
	$tip_instance_obj.animation:=New object:C1471()
End if 
If ($tip_instance_obj.animation.isActive=Null:C1517)
	$tip_instance_obj.animation.isActive:=True:C214
End if 
If ($tip_instance_obj.animation.refresh=Null:C1517)
	$tip_instance_obj.animation.refresh:=20  // number of display by second
End if 
If ($tip_instance_obj.animation.coordinate=Null:C1517)
	$tip_instance_obj.animation.coordinate:=New object:C1471()  // Will be extract of the tip dimension property
End if 
$tip_instance_obj.animation.isTerminated:=True:C214

  // ----------------------
  // Blink
  // ----------------------
If ($tip_instance_obj.animation.blink=Null:C1517)
	$tip_instance_obj.animation.blink:=New object:C1471()
End if 
If ($tip_instance_obj.animation.blink.number=Null:C1517)
	$tip_instance_obj.animation.blink.number:=0
End if 
If ($tip_instance_obj.animation.blink.duration=Null:C1517)
	$tip_instance_obj.animation.blink.duration:=1000  // millisecond(s) // Blink
End if 
If ($tip_instance_obj.animation.blink.on=Null:C1517)
	$tip_instance_obj.animation.blink.on:=50  // time percentage ON
End if 

  // ----------------------
  // Jump
  // ----------------------
If ($tip_instance_obj.animation.jump=Null:C1517)
	$tip_instance_obj.animation.jump:=New object:C1471()
End if 
If ($tip_instance_obj.animation.jump.number=Null:C1517)
	$tip_instance_obj.animation.jump.number:=0
End if 
If ($tip_instance_obj.animation.jump.on=Null:C1517)
	$tip_instance_obj.animation.jump.on:=50  // time percentage UP
End if 
If ($tip_instance_obj.animation.jump.duration=Null:C1517)
	$tip_instance_obj.animation.jump.duration:=1000  // millisecond(s) // Jump
End if 
If ($tip_instance_obj.animation.jump.offset=Null:C1517)
	$tip_instance_obj.animation.jump.offset:=20  // pixels
End if 
If ($tip_instance_obj.animation.jump.direction=Null:C1517)
	$tip_instance_obj.animation.jump.direction:=""  // linked to tip position
End if 


  // ----------------------
  // Fade effect
  // ----------------------
If ($tip_instance_obj.animation.fade=Null:C1517)
	$tip_instance_obj.animation.fade:=New object:C1471()
End if 
If ($tip_instance_obj.animation.fade.in=Null:C1517)
	$tip_instance_obj.animation.fade.in:=False:C215
End if 
If ($tip_instance_obj.animation.fade.out=Null:C1517)
	$tip_instance_obj.animation.fade.out:=False:C215
End if 
If ($tip_instance_obj.animation.fade.timer=Null:C1517)
	$tip_instance_obj.animation.fade.timer:=New object:C1471()
End if 
If ($tip_instance_obj.animation.fade.timer.in=Null:C1517)
	$tip_instance_obj.animation.fade.timer.in:=500  // milliseconds
End if 
If ($tip_instance_obj.animation.fade.timer.out=Null:C1517)
	$tip_instance_obj.animation.fade.timer.out:=500  // milliseconds
End if 

$tip_instance_obj.animation.fade.fadeInActive:=False:C215
$tip_instance_obj.animation.fade.fadeInTerminated:=True:C214
$tip_instance_obj.animation.fade.fadeOutActive:=False:C215
$tip_instance_obj.animation.fade.fadeOutTerminated:=True:C214
$tip_instance_obj.animation.fade.currentOpacity:=0

  // ----------------------
  // Pulse
  // ----------------------
  //If ($tip_instance_obj.animation.pulse=Null)
  //$tip_instance_obj.animation.pulse:=New object()
  //End if 
  //If ($tip_instance_obj.animation.pulse.number=Null)
  //$tip_instance_obj.animation.pulse.number:=0
  //End if 
  //If ($tip_instance_obj.animation.pulse.opacity=Null)
  //$tip_instance_obj.animation.pulse.opacity:=0  // percentage of opacity pulse out - pulse in is always 100
  //End if 
  //If ($tip_instance_obj.animation.pulse.duration=Null)
  //$tip_instance_obj.animation.pulse.duration:=1000  // millisecond(s) // 
  //End if 
  //If ($tip_instance_obj.animation.pulse.refresh=Null)
  //$tip_instance_obj.animation.pulse.refresh:=20  // number of display by second
  //End if 

  //  // ----------------------
  //  // Scale
  //  // ----------------------
  //If ($tip_instance_obj.animation.scale=Null)
  //$tip_instance_obj.animation.scale:=New object()
  //End if 
  //If ($tip_instance_obj.animation.scale.number=Null)
  //$tip_instance_obj.animation.scale.number:=0
  //End if 
  //If ($tip_instance_obj.animation.scale.duration=Null)
  //$tip_instance_obj.animation.scale.duration:=1000  // millisecond(s) // 
  //End if 
  //If ($tip_instance_obj.animation.scale.direction=Null)
  //$tip_instance_obj.animation.scale.direction:="up"  //up, down
  //End if 
  //If ($tip_instance_obj.animation.scale.factor=Null)
  //$tip_instance_obj.animation.scale.factor:=2  //
  //End if 
  //If ($tip_instance_obj.animation.scale.bounce=Null)
  //$tip_instance_obj.animation.scale.bounce:=True  // bounce x 1.2 at the end of the effect
  //End if 

  //  // ----------------------
  //  // Flip
  //  // ----------------------
  //If ($tip_instance_obj.animation.flip=Null)
  //$tip_instance_obj.animation.flip:=New object()
  //End if 
  //If ($tip_instance_obj.animation.flip.duration=Null)
  //$tip_instance_obj.animation.flip.duration:=1000  // millisecond(s) 
  //End if 
  //If ($tip_instance_obj.animation.flip.direction=Null)
  //$tip_instance_obj.animation.flip.direction:="up"  //top2bottom, bottom2top, right2left, left2right
  //End if 
  //If ($tip_instance_obj.animation.flip.bounce=Null)
  //$tip_instance_obj.animation.flip.bounce:=True  // bounce x 1.2 at the end of the effect
  //End if 



