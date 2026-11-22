//%attributes = {"invisible":true}
  // AJUI_Tip_templateExport ( $templateName ; {$exportPath} )
  //
  // $templateName : (text) template name
  // $exportPath : (text) (optional) folder path
  //
  // Export the tip object into a json file in the folder "AJUI_Tip_Templates" located in the ressource folder

#DECLARE($param1 : Text; $param2 : Text)

If (False)
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

var $templateName; $exportPath; $template_json; $mainPath; $filePath : Text
var $docRef_h : Time

$templateName:=$param1

If ($templateName="")
	ALERT("You must enter a template name.")
Else 
	
	If ($templateName="@.json")
		$filePath:=$templateName
	Else 
		$filePath:=$templateName+".json"
	End if 
	
	If (Count parameters=2)
		
		$exportPath:=$param2
	Else 
		$mainPath:=Get 4D folder(Current resources folder;*)
		$exportPath:=$mainPath+"AJUI_Tip_Templates"+Folder separator
		
	End if 
	This.templateName:=$templateName
	$template_json:=JSON Stringify(This;*)
	
	
	If ((Test path name($exportPath)=Is a folder)=False)
		CREATE FOLDER($exportPath)
	End if 
	
	
	$filePath:=$exportPath+$filePath
	$docRef_h:=Create document($filePath)
	If (OK=1)
		CLOSE DOCUMENT($docRef_h)
		TEXT TO DOCUMENT($filePath;$template_json)
		
	Else 
		ALERT("The document could not be created, I/O error "+"\r\r"+$filePath)
	End if 
End if 
