//%attributes = {"invisible":true}
  // AJUI_Tip_calcDelayFade ( $duration ; $refresh ) -> return $result
  //
  // $duration : (longint) duration of the fade
  // $refresh : (longint) refresh rate
  // $result : (object) (return) Result contains the delay and the total number of steps
  //
  // This method will calculate the delay to use to animate a fade in/out and the total number of steps needed

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): gabriel inzirillo
	  // Date and time: 10.07.19, 13:06:32
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_calcDelayFade
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_LONGINT:C283($1;$duration)
C_LONGINT:C283($2;$refresh)
C_OBJECT:C1216($0;$result)

$duration:=$1
$refresh:=$2
$result:=New object:C1471("delay";0;"totalSteps";0)

$result.totalSteps:=Round:C94(($refresh/1000)*$duration;0)+1
$result.delay:=((60*$duration)/1000)/$result.totalSteps

$0:=$result