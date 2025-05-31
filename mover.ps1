$users = Import-Csv -Path ".\users.csv"

$tenant = "jackhd12outlook.onmicrosoft.com

foreach ($user in $users) {
    $upn = "$($user.username)@$tenant"

    try {
        $existing = Get-MgUser -UserId $upn -ErrorAction Stop

        Update-MgUser -UserId $upn `
            -Department $user.department `
            

        Add-Content -Path logs\mover_log.txt -Value "$(Get-Date) | MOVER | Updated $upn to $($user.department)"
    }
    catch {
        Add-Content -Path logs\mover_log.txt -Value "$(Get-Date) | MOVER | Error with $upn - $_"
    }
}
