//%attributes = {"invisible":true}
  // GoInDesignMode ( )
  //
  //
  // Ask return in design mode

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 22.02.19, 10:13:28
	  // ----------------------------------------------------
	  // Method: GoInDesignMode
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_OBJECT:C1216($actionInfo)
C_BOOLEAN:C305($isEnabled)
$actionInfo:=Get action info:C1442(ak return to design mode:K76:62)

POST KEY:C465(Character code:C91("d");Command key mask:K16:1)

  //INVOKE ACTION(ak return to design mode)  // go in design mode
  //INVOKE ACTION(ak return to design mode)  // go in design mode
DELAY PROCESS:C323(Current process:C322;60*2)  // wait 1 sec