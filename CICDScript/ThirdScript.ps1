$scriptsFolder = $ENV:WORKSPACE
$packageID = "WidgetPackage"
$packageVersion = "0.$ENV:BUILD_NUMBER"
$outputDir = "C:\JenkinsDrops"
$nupkgpath= $outputDir+'\'+$packageID+'.'+$packageVersion+'.nupkg'
$validatedScriptsFolder = Invoke-DatabaseBuild $scriptsFolder
$package = New-DatabaseBuildArtifact $validatedScriptsFolder -PackageId $packageID -PackageVersion $packageVersion
Export-DatabaseBuildArtifact $package -Path $outputDir
