//%attributes = {"invisible":true,"shared":true,"lang":"en"}
// AJUI_Tip_info ( ) -> return
//
// return : (text) (return) version
//
// Show the version info of the component

#DECLARE() -> $result : Text

If (False)
	// ----------------------------------------------------
	// User name (OS): Gary Criblez
	// Date and time: 11.02.19, 15:24:13
	// ----------------------------------------------------
	// Method: AJUI_Tip_info
	// Description
	// 
	//
	// ----------------------------------------------------
End if 


var $version_t : Text

$version_t:="1.8.1"  // 22 Nov 2026 (4D 21 R4)

$result:="AJUI_Tip (v21 R4) : "+$version_t

