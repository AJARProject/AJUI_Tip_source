//%attributes = {"invisible":true}
  // Tool_autoLaunchBuild (  ) 
  //
  // param1 : (boolean) description
  //
  // Execute the build automatically

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 22.02.19, 10:13:57
	  // ----------------------------------------------------
	  // Method: Tool_autoLaunchBuild
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_BOOLEAN:C305($1)

If (Count parameters:C259=0)
	
	$process_ref:=New process:C317(Current method name:C684;0;Current method name:C684;True:C214;*)
	
Else 
	
	
	$path_t:=Get 4D folder:C485(Data folder:K5:33)
	$BuildXml_path_t:=$path_t+"Preferences"+Folder separator:K24:12+"BuildApp"+Folder separator:K24:12+"BuildApp.xml"
	
	If (Application type:C494=4D Local mode:K5:1)
		
		If (Test path name:C476($BuildXml_path_t)=Is a document:K24:1)
			  //BUILD APPLICATION($BuildXml_path_t)
			AJUI_Tip_buildComponent 
			If (ok=1)
				$path_t:=Get 4D folder:C485(Database folder UNIX syntax:K5:15)
				$buildAppFlagFile_path_t:=Convert path POSIX to system:C1107($path_t+"buildAppFlagFile.txt")
				If (Test path name:C476($buildAppFlagFile_path_t)=Is a document:K24:1)
					DELETE DOCUMENT:C159("buildAppFlagFile.txt")
				End if 
			Else 
				  //
			End if 
			
			$path_t:=Get 4D folder:C485(Database folder UNIX syntax:K5:15)
			$BuildApp_path_t:=$path_t+"LaunchServer.sh"
			$BuildApp_path_sys_t:=Convert path POSIX to system:C1107($BuildApp_path_t)
			
			
			If (Test path name:C476($BuildApp_path_sys_t)=Is a document:K24:1)
				C_LONGINT:C283($pid)
				C_TEXT:C284($stdin;$stdout;$stderr)
				SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS";"false")
				SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY";$path_t)
				
				$cmd_t:="./LaunchServer.sh"
				If (Is Windows:C1573)
					  // TODO
					  //$stdin:="cmd.exe"
					  //LAUNCH EXTERNAL PROCESS("cmd.exe "+$BuildApp_path_sys_t;$stdin;$stdout;$stderr;$pid)
				Else 
					$stdin:="/bin/sh"
					$cmd_t:="./LaunchServer.sh"
					LAUNCH EXTERNAL PROCESS:C811($cmd_t;$stdin;$stdout;$stderr;$pid)
				End if 
				If (OK=1)
					QUIT 4D:C291
				End if 
			End if 
			
		End if 
		
	Else 
		
		  // can't launch the buildApp process from an
		
	End if 
	
End if 