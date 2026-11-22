//%attributes = {"invisible":true,"shared":true}
  // AJUI_Tip_loadTemplates ( $folderTargetPath_t ) -> return
  //
  // $folderTargetPath_t : (text) path of the target folder
  // $templates_col : (collection) (return) collection ot tip templates
  //
  // This method load all the tip templates from a folder into a collection of objects.

#DECLARE($param1 : Text) -> $result : Collection

If (False)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 12.02.19, 16:09:20
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_loadTemplates
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


var $templates_col : Collection
var $folderTargetPath; $filePath; $json_t : Text
var $file; $btn_instance_obj : Object
var $testPathName; $i : Real
ARRAY TEXT($_files;0)

$templates_col:=New collection
$json_t:=""

If (Count parameters=1)
	$folderTargetPath:=$param1
	If ($folderTargetPath="#@")
		$folderTargetPath:=Replace string($folderTargetPath;"#";Get 4D folder(Current resources folder;*))
	End if 
Else 
	$folderTargetPath:=Get 4D folder(Current resources folder;*)+"AJUI_Tip_Templates"+Folder separator
End if 


$testPathName:=Test path name($folderTargetPath)

If ($testPathName=0)  //check folder
	DOCUMENT LIST($folderTargetPath;$_files;Absolute path+Recursive parsing)
	
	For ($i;1;Size of array($_files))
		$filePath:=$_files{$i}
		
		If ($filePath="@.json")
			$json_t:=Document to text($filePath)
			If ($json_t="")
				  //do nothing
			Else 
				$btn_instance_obj:=New object
				$btn_instance_obj:=JSON Parse($json_t)
				$file:=File($filePath;fk platform path)
				$btn_instance_obj.templateName:=$file.name
				$btn_instance_obj.templatePath:=Replace string($file.platformPath;$file.name+".json";"")
				$btn_instance_obj:=New AJUI_Tip ($btn_instance_obj)  //add missing properties and reset calc properties
				$templates_col.push($btn_instance_obj)
			End if 
		End if 
	End for 
	
Else 
	ALERT("folder not found")
End if 

$result:=$templates_col