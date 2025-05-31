$userIdToUpdate = "u001"
$newDepartment = "Marketing"
$logPath = "logs/mover_log.csv"

Write-Host "Updating $userIdToUpdate's department to $newDepartment"

$logLine = "$userIdToUpdate,$newDepartment,$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Add-Content -Path $logPath -Value $logLine
