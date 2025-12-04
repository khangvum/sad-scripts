# Windows Scripts

## Serial Number Retrieval

```powershell
Get-WmiObject -Class Win32_Bios | Select-Object SerialNumber
```

## Hostname Update

```powershell
Rename-Computer -NewName "<HOSTNAME>" -Restart
```

## Local Administrator Account

-   **Enable local administrator account:**

    ```powershell
    net user Administrator "<PASSWORD>"
    net user Administrator /active:yes
    ```

-   **Disable local administrator account:**

    ```powershell
    net user Administrator /active:no
    ``` 

## User Management

-   **Delete a user:**

    ```powershell
    net user "<USERNAME>" /delete
    ```

-   **Add a user to `Administrators` group:**

    ```powershell
    net localgroup Administrators "<USERNAME>" /add
    ```

-   **Remove a user from `Administrators` group:**

    ```powershell
    net localgroup Administrators "<USERNAME>" /delete
    ```

## Networking Management

-   **Get IP configuration:**

    ```powershell
    ipconfig /all
    ```

-   **Get MAC addresses:**

    ```powershell
    # PowerShell
    Get-NetAdapter | Select-Object Name, InterfaceDescription, MacAddress
    # Command Prompt
    getmac /v
    ```

-   **Test network connectivity:**

    ```powershell
    # PowerShell
    Test-NetConnection -ComputerName "<TARGET>" -Port "<PORT>"
    # Command Prompt
    ping "<TARGET>"
    telnet "<TARGET>" "<PORT>"
    ```

-   **Refresh network configuration**

    ```powershell
    # PowerShell
    Remove-NetIPAddress -InterfaceAlias "<INTERFACE>" -Confirm:$false
    Set-NetIPInterface -InterfaceAlias "<INTERFACE>" -Dhcp Enabled
    Clear-DnsClientCache
    
    # Command Prompt
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    ```

-   **Get routing table:**

    ```powershell
    route print
    ```

## System Repair

-   **System File Checker (SFC):**

    ```powershell
    sfc /scannow
    ```

-   **Deployment Image Servicing and Management (DISM):**

    ```powershell
    DISM /Online /Cleanup-Image /CheckHealth
    DISM /Online /Cleanup-Image /ScanHealth
    DISM /Online /Cleanup-Image /RestoreHealth
    ```

-   **Check disk for filesystem errors:**

    ```powershell
    chkdsk /f
    ```

## Password Expiration

```powershell
# Set all local users' passwords to never expire
Get-LocalUser | ForEach-Object { $_ | Set-LocalUser -PasswordNeverExpires $true }
# Set system-wide password policy to never expire
net accounts /maxpwage:unlimited
```

## `Windows + R` Shortcuts

Shortcut        |Description
:--------------:|------------------------------------------------
`msinfo32`      |System Information
`ncpa.cpl`      |Network Connections
`sysdm.cpl`     |System Properties
`devmgmt.msc`   |Device Manager
`diskmgmt.msc`  |Disk Management
`regedit`       |Registry Editor
`gpedit.msc`    |Local Group Policy Editor
`services.msc`  |Services
`wf.msc`        |Windows Defender Firewall with Advanced Security
`cmd`           |Command Prompt
`powershell`    |PowerShell