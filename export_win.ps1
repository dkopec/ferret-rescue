$version = $env:GODOT_EXPORT_VERSION
$exportDir = $env:GODOT_EXPORT_DIR
if (!$exportDir){
  $exportDir = Get-Location
}
$buildDir = "$([System.IO.Path]::GetTempPath())godot-build"
$exportPath = "$exportDir\ferret-rescue-windows-$version.zip"
Write-Information "Build Directory: $buildDir"
if (Test-Path $buildDir){
  Remove-Item -Recurse -Force $buildDir | Out-Host
}
New-Item -ItemType Directory $buildDir | Out-Host

godot --headless --export-release Web "$buildDir\ferret-rescue.exe"| Out-Host
Compress-Archive -LiteralPath (Get-ChildItem $buildDir).FullName -DestinationPath $exportPath  -Force
Write-Output $exportPath