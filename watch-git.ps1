$path = "." # The folder to watch
$filter = "*.*" # Watch all files

Write-Host "Monitoring $path for changes... Press Ctrl+C to stop." -ForegroundColor Cyan

while ($true) {
    # Check if there are any changes in git
    $status = git status --porcelain
    if ($status) {
        Write-Host "Changes detected! Pushing now..." -ForegroundColor Yellow
        git add .
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        git commit -m "Auto-save: $timestamp"
        git push
        Write-Host "Done. Waiting for next change..." -ForegroundColor Green
    }
    Start-Sleep -Seconds 5 # Checks every 5 seconds
}