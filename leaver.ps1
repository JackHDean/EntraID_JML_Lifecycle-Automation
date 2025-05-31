$userId = "u002"
$logPath = "logs/leaver_log.csv"

Write-Host "Deactivating user ID: $userId"

$logLine = "$userId,Deactivated,$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Add-Content -Path $logPath -Value $logLine
