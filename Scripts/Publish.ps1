using module ./Tools.psm1

if ($Release) { & "$PSScriptRoot/Default.ps1" }
else { Write-Error "The ""-Release"" switch must be set!"; exit 1 }

Write-Information "Tagging the repository..."
$version = Get-Version
git tag "v$version"
git push origin "v$version"

Write-Information "Publishing the package..."
Publish-NpmPackage
Publish-PSGalleryModule
