# Active Directory (AD) Scripts

>   [!NOTE]  
>   These commands require the **_Active Directory PowerShell module_**:
>
>   OS                     |Installation  
>   :---------------------:|:-------------------------------------------
>   **Windows Server**     |`Install-WindowsFeature RSAT-AD-PowerShell`
>   **Windows**            |`Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0`

## Domain Management

-   **Retrieve domain information:**

    ```powershell
    Get-ADForest
    Get-ADDomain
    ```

-   **List all domain controllers:**

    ```powershell
    Get-ADDomainController -Filter *
    ```

## Computer Management

-   **List all computers in the domain:**

    ```powershell
    Get-ADComputer -Filter * | Select-Object Name, Enabled, ObjectClass
    ```

-   **Join a computer to a domain:**

    ```powershell
    Add-Computer -DomainName "khangvum.lab" -Server "<IP_ADDRESS>" -Credential "khangvum\<USERNAME>" -Restart -Verbose
    ```

-   **Move a computer to an OU:**

    ```powershell
    Move-ADObject -Identity "CN=<HOSTNAME>,CN=Computers,DC=khangvum,DC=lab" -TargetPath "OU=<OU>,DC=khangvum,DC=lab"
    ```

## User Management

-   **Create a new user:**

    ```powershell
    New-ADUser -Name "<FULL_NAME>" `
        -GivenName "<FIRST_NAME>" `
        -Surname "<LAST_NAME>" `
        -DisplayName "<FULL_NAME>" `
        -SamAccountName "<USERNAME>" `
        -UserPrincipalName "<USERNAME>@<DOMAIN>" `
        -EmailAddress "<USERNAME>@<DOMAIN>" `
        -Path "CN=Users,DC=khangvum,DC=lab" `
        -AccountPassword (Read-Host -AsSecureString "Enter Password") `
        -Enabled $true
    ```

-   **Reset user password:**

    ```powershell
    Set-ADAccountPassword -Identity "<USERNAME>" -Reset -NewPassword (Read-Host -AsSecureString "Enter New Password")
    ```

-   **Enable/Disable a user:**

    ```powershell
    # Enable a user
    Enable-ADAccount -Identity "<USERNAME>"
    # Disable a user
    Disable-ADAccount -Identity "<USERNAME>"
    ```

-   **Unlock a user:**

    ```powershell
    Unlock-ADAccount -Identity "<USERNAME>"
    ```

## Password Management

-   **View current password policy:**

    ```powershell
    Get-ADDefaultDomainPasswordPolicy
    ```

-   **Modify domain password policy:**

    ```powershell
    Set-ADDefaultDomainPasswordPolicy -Identity (Get-ADDomain).DNSRoot `
        -MaxPasswordAge "00:00:00" `
        -MinPasswordAge "00:00:00" `
        -PasswordHistoryCount 5
    ```