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
    Add-Computer -DomainName "khangvum.lab" -Server <IP_ADDRESS> -Credential khangvum\<USERNAME> -Restart -Verbose
    ```

-   **Move a computer to an OU:**

    ```powershell
    Move-ADObject -Identity "CN=<HOSTNAME>,CN=Computers,DC=khangvum,DC=lab" -TargetPath "OU=<OU>,DC=khangvum,DC=lab"
    ```