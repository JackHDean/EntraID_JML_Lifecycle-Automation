$users = Import-Csv -Path ".\users.csv"
$tenant = "jackhd12outlook.onmicrosoft.com"

foreach ($user in $users) {
    $upn = "$($user.username)@$tenant"

    # Check if user already exists
    $existing = Get-MgUser -Filter "userPrincipalName eq '$upn'" -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Host "⚠️ $upn already exists"
        continue
    }

    $passwordProfile = @{
        ForceChangePasswordNextSignIn = $true
        Password = "P@ssw0rd123!"
    }

    $userParams = @{
        AccountEnabled    = $true
        DisplayName       = $user.display_name
        MailNickname      = $user.username
        UserPrincipalName = $upn
        PasswordProfile   = $passwordProfile
    }

    try {
        New-MgUser @userParams
        Add-Content -Path "logs\joiner_log.txt" -Value "$(Get-Date) | JOINER | Created $upn in $($user.department)"
        Write-Host "Created user $upn"
    }
    catch {
        Write-Host "Error creating user $($upn): $_"


        Add-Content -Path "logs\joiner_log.txt" -Value "$(Get-Date) | JOINER | Error with $upn - $_"
    }
}
