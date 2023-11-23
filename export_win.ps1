$version = $env:GODOT_EXPORT_VERSION
$buildDir = "$([System.IO.Path]::GetTempPath())godot-build"
Write-Output $buildDir
if (Test-Path $buildDir){
  Remove-Item -Recurse -Force $buildDir
}
New-Item -ItemType Directory $buildDir

godot --headless --export-release "Windows Desktop" "$buildDir\ferret-rescue.exe"
Compress-Archive -LiteralPath (Get-ChildItem $buildDir).FullName -DestinationPath ".\ferret-rescue-windows-$version.zip" -Force