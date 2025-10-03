# Active Directory (AD) Scripts

>   [!NOTE]  
>   These commands require the **_Active Directory PowerShell module_**:
>
>   OS                     | Installation  
>   :---------------------:|:-------------------------------------------
>   **Windows Server**     | `Install-WindowsFeature RSAT-AD-PowerShell`
>   **Windows 10/11**      | `Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0`

# Domain Management

-   **Retrieve domain information:**

    ```powershell
    Get-ADForest
    Get-ADDomain
    ```