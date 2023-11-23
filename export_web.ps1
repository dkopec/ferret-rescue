$version = $env:GODOT_EXPORT_VERSION
$buildDir = "$([System.IO.Path]::GetTempPath())godot-build"
Write-Output $buildDir
if (Test-Path $buildDir){
  Remove-Item -Recurse -Force $buildDir
}
New-Item -ItemType Directory $buildDir

godot --headless --export-release Web "$buildDir\index.html"
Compress-Archive -LiteralPath (Get-ChildItem $buildDir).FullName -DestinationPath ".\ferret-rescue-web-$version.zip" -Force