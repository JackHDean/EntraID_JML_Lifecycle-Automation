$users = Import-Csv -Path "users.csv"
$logPath = "logs/joiner_log.csv"

foreach ($user in $users) {
    $username = "$($user.first_name).$($user.last_name)"
    Write-Host "Creating user: $username in $($user.department)"

    $logLine = "$($user.user_id),$username,$($user.department),$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    Add-Content -Path $logPath -Value $logLine
}
