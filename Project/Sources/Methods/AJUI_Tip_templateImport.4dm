//%attributes = {"invisible":true}
  // AJUI_Tip_templateImport ( $fileName_t ) -> return
  //
  // $fileName_t : (text) File name e.g. "MyTip.json"
  // $tip_instance_obj : (object) (return) return Instace of a tip object
  //
  // Import a tip template from the folder "AJUI_Tip_Templates" located in the ressource folder 

#DECLARE($param1 : Text; $param2 : Text) -> $result : Object

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 24.01.19, 09:33:35
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_templateImport
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

var $instance_obj; $folder : Object
var $fileName; $templateName; $pathName; $json : Text
var $testPathName : Real


$instance_obj:=New object
$json:=""
$templateName:=$param1

If ($templateName="@.json")
	$fileName:=$templateName
	$templateName:=Replace string($templateName;".json";"")
Else 
	$fileName:=$templateName+".json"
End if 

If (Count parameters=2)
	If ($param2="")
		$folder:=Folder(Get 4D folder(Current resources folder;*)+"AJUI_Tip_Templates"+Folder separator+$templateName+Folder separator;fk platform path)
		If ($folder.exists)
			$pathName:=$folder.platformPath+$fileName
		Else 
			$pathName:=Get 4D folder(Current resources folder;*)+"AJUI_Tip_Templates"+Folder separator+$fileName
		End if 
	Else 
		If ($param2="#@")
			$pathName:=Replace string($param2;"#";Get 4D folder(Current resources folder;*))
		Else 
			$pathName:=$param2
		End if 
		
		$folder:=Folder($pathName+$templateName+Folder separator;fk platform path)
		If ($folder.exists)
			$pathName:=$folder.platformPath+$fileName
		Else 
			$pathName:=$pathName+$fileName
		End if 
	End if 
Else 
	$folder:=Folder(Get 4D folder(Current resources folder;*)+"AJUI_Tip_Templates"+Folder separator+$templateName+Folder separator;fk platform path)
	If ($folder.exists)
		$pathName:=$folder.platformPath+$fileName
	Else 
		$pathName:=Get 4D folder(Current resources folder;*)+"AJUI_Tip_Templates"+Folder separator+$fileName
	End if 
End if 


$testPathName:=Test path name($pathName)

If ($testPathName=1)  //check file
	$json:=Document to text($pathName)
Else 
	ALERT("File not found"+"\r\r"+$pathName)
End if 


If ($json="")
	$instance_obj.failImport:=True
Else 
	$instance_obj:=JSON Parse($json)
	$instance_obj.failImport:=False
	
End if 

$result:=$instance_obj