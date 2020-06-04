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

$version_t:="1.6.0-Build39"  // Thu, 04 Jun 2020 12:17:07 GMT


$0:="AJUI Tip (v18) : "+$version_t

