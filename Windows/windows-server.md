# Windows Server Scripts

For **_core Windows commands_**, see **_[windows.md](windows.md)_**.

## Edition Upgrade

Upgrade from **_Evaluation_** to **_Standard_**:

```powershell
DISM /online /Set-Edition:ServerStandard /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula
```

## `Windows + R` Shortcuts

Shortcut        |Description
:--------------:|------------------------------------
`servermanager` |Server Manager
`virtmgmt.msc`  |Hyper-V Manager
`inetmgr`       |IIS Manager
`dnsmgmt.msc`   |DNS Manager
`dsa.msc`       |Active Directory Users and Computers