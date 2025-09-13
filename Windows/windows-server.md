# Windows Server Scripts

## Edition Upgrade

Upgrade from **_Evaluation_** to **_Standard_**:

```powershell
DISM /online /Set-Edition:ServerStandard /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula
```