$users = Import-Csv -Path ".\users.csv"
$tenant = "jackhd12outlook.onmicrosoft.com


foreach ($user in $users) {
    $upn = "$($user.username)@$tenant"

    try {
        $existing = Get-MgUser -UserId $upn -ErrorAction Stop

        Update-MgUser -UserId $upn `
            -AccountEnabled $false `
            -Department "Ex-Employees" `
            -JobTitle "Former Employee"

        Add-Content -Path logs\leaver_log.txt -Value "$(Get-Date) | LEAVER | Disabled and moved $upn to Ex-Employees"
    }
    catch {
        Add-Content -Path logs\leaver_log.txt -Value "$(Get-Date) | LEAVER | Error with $upn - $_"
    }
}
