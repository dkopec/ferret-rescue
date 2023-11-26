$version = $env:GODOT_VERSION
$url = "https://github.com/godotengine/godot/releases/download/$version-stable/Godot_v$version-stable_linux.x86_64.zip"
$tmp = "$([System.IO.Path]::GetTempPath())godot.zip"
$dest = "/opt/godot"
Invoke-WebRequest -Uri $url -OutFile $dest
Expand-Archive -LiteralPath $tmp -DestinationPath $dest
chmod +x $dest