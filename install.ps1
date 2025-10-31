# install.ps1
$ErrorActionPreference = "Stop"

$version = "0.1.0"
$zipUrl = "https://github.com/bhus/editor_push/releases/download/v$version/kotlinforge-$version-x64.zip"
$installDir = "$env:USERPROFILE\KForge"
$zipPath = "$env:TEMP\kforge.zip"

Write-Host "Downloading KotlinForge v$version..."
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

Write-Host "Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $installDir -Force

Write-Host "Adding to PATH..."
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
$newPath = "$oldPath;$installDir"
[Environment]::SetEnvironmentVariable("Path", $newPath, "User")

Write-Host "Cleaning up..."
Remove-Item $zipPath

Write-Host "`n✅ KotlinForge installed successfully!"
Write-Host "Open a new terminal and run 'kforge' to start."
