//%attributes = {"invisible":true}
  // AJUI_Tip_templateExport ( $templateName ; {$exportPath} )
  //
  // $templateName : (text) template name
  // $exportPath : (text) (optional) folder path
  //
  // Export the tip object into a json file in the folder "AJUI_Tip_Templates" located in the ressource folder

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 09:08:20
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_templateExport
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$templateName)
C_TEXT:C284($2;$exportPath)
C_TEXT:C284($template_json)
C_TEXT:C284($mainPath;$filePath)
C_TIME:C306($docRef_h)

$templateName:=$1

If ($templateName="")
	ALERT:C41("You must enter a template name.")
Else 
	
	If ($templateName="@.json")
		$filePath:=$templateName
	Else 
		$filePath:=$templateName+".json"
	End if 
	
	If (Count parameters:C259=2)
		
		$exportPath:=$2
	Else 
		$mainPath:=Get 4D folder:C485(Current resources folder:K5:16;*)
		$exportPath:=$mainPath+"AJUI_Tip_Templates"+Folder separator:K24:12
		
	End if 
	This:C1470.templateName:=$templateName
	$template_json:=JSON Stringify:C1217(This:C1470;*)
	
	
	If ((Test path name:C476($exportPath)=Is a folder:K24:2)=False:C215)
		CREATE FOLDER:C475($exportPath)
	End if 
	
	
	$filePath:=$exportPath+$filePath
	$docRef_h:=Create document:C266($filePath)
	If (OK=1)
		CLOSE DOCUMENT:C267($docRef_h)
		TEXT TO DOCUMENT:C1237($filePath;$template_json)
		
	Else 
		ALERT:C41("The document could not be created, I/O error "+"\r\r"+$filePath)
	End if 
End if 
