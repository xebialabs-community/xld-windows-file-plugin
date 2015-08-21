<#
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#>
cd $deployed.file
Write-Host "Target folder is $deployed.targetPath"

$targetPath = $deployed.targetPath
if ( (Test-Path $targetPath) -eq $false ) {
  Write-Host "Creating target path $targetPath"
  if ( $deployed.createTargetPath ) {
     if ( $deployed.createTargetPath ) {
         mkdir $targetPath
     }
     $res=$?
     if ( ! $res ) {
       Write-Host "Problem making directory $targetPath"
       exit $res
     }
   }
} else {
  Write-Host "Target path $targetPath already exists"
}

Write-Host "Creating folder $targetPath"
Copy-Item * $targetPath -force -recurse -verbose
$res=$?
if ( ! $res ) {
  exit $res
}

