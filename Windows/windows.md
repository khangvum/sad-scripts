# Windows Scripts

## Serial Number Retrieval

```powershell
Get-WmiObject -Class Win32_Bios | Select-Object SerialNumber
```

## Hostname Update

```powershell
Rename-Computer -NewName <HOSTNAME> -Restart
```

## Local Administrator Account

-   **Enable local administrator account:**

    ```powershell
    net user Administrator <PASSWORD>
    net user Administrator /active:yes
    ```

-   **Disable local administrator account:**

    ```powershell
    net user Administrator /active:no
    ``` 

## User Management

-   **Delete a user:**

    ```powershell
    net user <USERNAME> /delete
    ```

-   **Add a user to `Administrators` group:**

    ```powershell
    net localgroup Administrators <USERNAME> /add
    ```

-   **Remove a user from `Administrators` group:**

    ```powershell
    net localgroup Administrators <USERNAME> /delete
    ```