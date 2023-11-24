$version = $env:GODOT_VERSION
$url = "https://github.com/godotengine/godot/releases/download/$version-stable/Godot_v$version-stable_linux.x86_64.zip"
$tmp = "$env:TEMP\godot.zip"
$dest = "/opt/godot"
Invoke-WebRequest -Uri $url -OutFile $dest
Expand-Archive -LiteralPath $tmp -DestinationPath $dest