# Windows Scripts

## Serial Number Retrieval

```powershell
GWMI -Class Win32_Bios | select SerialNumber
```

## Hostname Update

```powershell
Rename-Computer -NewName <HOSTNAME> -restart
```