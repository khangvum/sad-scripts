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

## Replication Management

-   **Force synchronization between all domain controllers:**

    ```powershell
    repadmin /syncall /AeP
    ```

-   **Verify replication health with no replication latencies:**

    ```powershell
    repadmin /replsummary
    ```

>   [!TIP]
>   In case a **_secondary DC_** (_e.g.,_ KVM-DC02) has been **_offline_** for **_too long_** (typically **_more than a week_**) and encounters **_authentication issues during sync_**, follow these steps to restore the connection:
>   
>   1.  On the **_secondary DC_**, open **_Registry Editor_**.
>   2.  **_Navigate_** to: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters`.
>   3.  Create a new **_DWORD (32-bit) Value_**:
>
>       Field       |Value  
>       :----------:|:-------------------------------------------
>       **Name**    |`Replication Authenticator Compatibility`
>       **Value**   |`1`
>
>   4.  Attempt the **_replication command_** again: `repadmin /syncall /AeP`.
>   5.  Once **_successful_**, **_delete the registry key_** to return to standard security protocols.

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