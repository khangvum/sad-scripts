param (
    [Parameter(Mandatory = $true)]
    [ValidateSet("present", "absent")]
    [string]$State,

    [Parameter(Mandatory = $true)]
    [string]$Username,

    [Parameter(Mandatory = $true)]
    [string]$FirstName,

    [Parameter(Mandatory = $true)]
    [string]$LastName,

    [Parameter(Mandatory = $false)]
    [string]$FullName = "",

    [Parameter(Mandatory = $false)]
    [string]$Domain = "khangvum.lab",

    [Parameter(Mandatory = $false)]
    [string]$OU = "CN=Users,DC=khangvum,DC=lab"

    # [Parameter(Mandatory = $false)]
    # [SecureString]$Password = $null,
)

# Initialize variables from the parameters
$changed = $false
$state = $State.ToLower()
$existingUser = Get-ADUser -Filter { SamAccountName -eq $Username } -ErrorAction SilentlyContinue   # Get-ADUser -Identity cannot suppress error if no user found

# Prompt for password if new user
if (-not $existingUser -and $State -eq "present") {
    $Password = Read-Host -AsSecureString "Enter Password"
}

# Set FullName if blank
if ([string]::IsNullOrWhiteSpace($FullName)) {
    $FullName = "$FirstName $LastName"
}

if ($state -eq "present") {
    # If the user does not exist, create it
    if (-not $existingUser) {
        New-ADUser -Name $FullName `
                   -GivenName $FirstName `
                   -Surname $LastName `
                   -DisplayName $FullName `
                   -SamAccountName $Username `
                   -UserPrincipalName "$Username@$Domain" `
                   -EmailAddress "$Username@$Domain" `
                   -Path $OU `
                   -AccountPassword $Password `
                   -Enabled $true

        $changed = $true
    }
    # If the user already exists, update the information
    else {
        $updatedParams = @{}

        $adUser = Get-ADUser -Identity $Username -ErrorAction SilentlyContinue

        # Update first name
        if ($adUser.GivenName -ne $FirstName -and $FirstName) {
            $updatedParams['GivenName'] = $FirstName
        }
        # Update last name
        if ($adUser.Surname -ne $LastName -and $LastName) {
            $updatedParams['Surname'] = $LastName
        }
        # Update display name
        if ($adUser.DisplayName -ne $FullName -and $FullName) {
            $updatedParams['DisplayName'] = $FullName
        }

        if ($updatedParams.Count -gt 0) {
            Set-ADUser -Identity $Username @updatedParams
            $changed = $true
        }

        # Ensure the account is enabled
        if ($adUser.Enabled -ne $true) {
            Enable-ADAccount -Identity $Username
            $changed = $true
        }
    }
}
elseif ($state -eq "absent") {
    if ($existingUser) {
        # Disable the account before deletion
        if ($existingUser.Enabled -eq $true) {
            Disable-ADAccount -Identity $Username -Confirm:$false
        }

        Remove-ADUser -Identity $Username -Confirm:$false
        $changed = $true
    }
}
else {
    Write-Error "Invalid state: $state. Use 'present' or 'absent'."
}