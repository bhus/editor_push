# install.ps1
$ErrorActionPreference = "Stop"

$version = "0.1.0"
$zipUrl = "https://github.com/bhus/editor_push/releases/download/v$version/kahawi-$version-x64.zip"
$installDir = "$env:USERPROFILE\ka"
$zipPath = "$env:TEMP\kahawi.zip"

Write-Host "Downloading Kahawi v$version..."
Write-Host "DEBUG: Downloading from $zipUrl"
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

Write-Host "Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $installDir -Force

# --- ✅ Correct bin path inside the ZIP ---
$binPath = Join-Path $installDir "kahawi-mvp\bin"

Write-Host "Adding to PATH..."
$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
$newPath = "$oldPath;$binPath"
[Environment]::SetEnvironmentVariable("Path", $newPath, "User")

Write-Host "Cleaning up..."
Remove-Item $zipPath

Write-Host "`n✅ Kahawi installed successfully!"
Write-Host "Open a new terminal and run 'ka' to start."
