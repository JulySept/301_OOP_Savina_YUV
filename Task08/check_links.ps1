$desktopPath = [Environment]::GetFolderPath("Desktop")
$badLinksPath = Join-Path $desktopPath "BadLinks"
$wshShell = New-Object -ComObject WScript.Shell

if (-not (Test-Path $badLinksPath)) {
    New-Item -Path $badLinksPath -ItemType Directory | Out-Null
}


$lnkFiles = Get-ChildItem -Path $desktopPath -Filter *.lnk

foreach ($lnk in $lnkFiles) {
    $shortcut = $wshShell.CreateShortcut($lnk.FullName)
    if (-not (Test-Path $shortcut.TargetPath)) {
        Move-Item -Path $lnk.FullName -Destination $badLinksPath
    }
}
