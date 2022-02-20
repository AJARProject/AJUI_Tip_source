//%attributes = {"invisible":true,"shared":true,"lang":"en"}
// AJUI_Tip_info ( ) -> return
//
// return : (text) (return) version
//
// Show the version info of the component

If (False:C215)
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


C_TEXT:C284($0)

$version_t:="1.7.0+Build45"  // Sun, 20 Feb 2022 15:21:22 GMT

$0:="AJUI Tip (Builded on v19 R4): "+$version_t

