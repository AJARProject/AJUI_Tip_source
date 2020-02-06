If (Application type:C494=4D Local mode:K5:1)
	  // Test if buildAppFlagFile.txt exists
	$path_t:=Get 4D folder:C485(Database folder UNIX syntax:K5:15)
	$buildAppFlagFile_path_t:=Convert path POSIX to system:C1107($path_t+"buildAppFlagFile.txt")
	
	If (Test path name:C476($buildAppFlagFile_path_t)=Is a document:K24:1)
		  //Switch to the design mode to be able to launch the build command
		GoInDesignMode 
		Tool_autoLaunchBuild 
		
	Else 
		CHANGE CURRENT USER:C289
	End if 
	
Else 
	CHANGE CURRENT USER:C289
	While (Current user:C182="maurice")
		CHANGE CURRENT USER:C289
	End while 
	
End if 