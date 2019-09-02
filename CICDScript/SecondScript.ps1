# Script created 11/11/2016 by Alex Yates of DLM Consultants
# Shared freely, but a beer would be appreciated if you find this useful and we are ever in the same pub
# Full documentation for Redgate SQL Change Automation PowerShell cmdlets at:
# https://documentation.red-gate.com/display/sca3/Cmdlet+reference
 
# Variables (fill these in)
 
   # Required - the location of your source code
   $scriptsFolder = "E:\.Net\GitHubDemoDatabase\TeamCityVersionControl\TeamcityCICD\TeamcityCICD"
   
   # Required - package name and version number (must not already exist in output directory)
   $packageID = "WidgetPackage"
   $packageVersion = 0.2
   
   # Required - An output directory in which to save your build artifacts (must already exist)
   $outputDir = "C:\JenkinsDrops"
   
   # Optional - If using an alternate SQL instance for schema validation provide details here. Also, uncomment this parameter from line 34 below.
   #$buildDb = "Data Source=.\SQL2014"
      
   # Required for sync step only - the database you wish to deploy to. Uncomment below and also lines 46-8 if running a sync step.
 #  $targetServerInstance = "DTC209\SQLEXPRESS2017"
  # $targetDatabaseName = "TestDB"
   
   # Optional - If using SQL Auth for target DB add a username and password. Also, uncomment these parameters from line 42 below.
   $username = "sa"
   $password = "sa@12345"
 
# Script to build DB (you can probably leave this as is)
   
   $errorActionPreference = "stop"
    
   # Validate the scripts folder
   $validatedScriptsFolder = Invoke-DatabaseBuild $scriptsFolder # -TemporaryDatabaseServer $buildDb
 
   # Export NuGet package
   $package = New-DatabaseBuildArtifact $validatedScriptsFolder -PackageId $packageID -PackageVersion $packageVersion
   Export-DatabaseBuildArtifact $package -Path $outputDir
 
# Script to run tests and/or deploy to an integration DB (uncomment as appropriate)
 
   # # Run tSQLt unit tests
    Invoke-DatabaseTests $package | Export-DatabaseTestResults -OutputFile "$outputDir\$packageID.$packageVersion.junit.xml"
 
   # # Sync a test database
  #  $targetDB = New-DatabaseConnection -ServerInstance $targetServerInstance -Database $targetDatabaseName # -Username $username -Password $password
   # Test-DatabaseConnection $targetDB
  #  Sync-DatabaseSchema -Source $package -Target $targetDB 