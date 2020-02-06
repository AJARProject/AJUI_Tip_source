//%attributes = {"invisible":true,"executedOnServer":true}
  // Tool_LaunchBuild (  ) 
  //
  //
  // Start the auto build of the component

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 22.02.19, 10:38:28
	  // ----------------------------------------------------
	  // Method: Tool_LaunchBuild
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


If (Application type:C494=4D Server:K5:6)
	
	$launch_flag_file_t:="launchbuildApp_started"
	
	TEXT TO DOCUMENT:C1237("buildAppFlagFile.txt";$launch_flag_file_t)
	
	$path_t:=Get 4D folder:C485(Database folder UNIX syntax:K5:15)
	  //$BuildApp_path_t:=Convert path POSIX to system($path_t+"buildApp.sh")
	
	C_LONGINT:C283($pid)
	C_TEXT:C284($stdin;$stdout;$stderr)
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS";"false")
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY";$path_t)
	$stdin:="/bin/sh"
	$cmd_t:="./buildApp.sh"
	LAUNCH EXTERNAL PROCESS:C811($cmd_t;$stdin;$stdout;$stderr;$pid)
	QUIT 4D:C291(1)  //quit 4d server after 5 sec
Else 
	
End if 