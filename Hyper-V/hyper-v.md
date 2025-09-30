# Hyper-V Scripts

## System Management

-   **List all VMs:**

    ```powershell
    Get-VM
    ```

-   **Retrieve Hyper-V host information:**

    ```powershell
    # Retrieve the host model
    Get-WmiObject -Class Win32_ComputerSystem | Select-Object Model
    # Retrieve host details (hostname, processor, memory, etc.)
    Get-VMHost
    ```

## VM Management

-   **Create a new VM:**

    ```powershell
    New-VM -Name <HOSTNAME> -MemoryStartupBytes <MEMORY>GB -BootDevice CD -NewVHDPath "C:\Hyper-V Virtual Machines\<HOSTNAME>.vhdx" -NewVHDSizeBytes <STORAGE>GB -Path "C:\Hyper-V Virtual Machines\<HOSTNAME>" -Generation <GENERATION>

    # Disable dynamic memory
    Set-VMMemory -VMName <HOSTNAME> -DynamicMemoryEnabled $false

    # Attach the ISO file
    Set-VMDvdDrive -VMName <HOSTNAME> -Path "C:\Hyper-V Virtual Machines\<ISO_PATH>" 

    # Set the CPU
    Set-VMProcessor -VMName <HOSTNAME> -Count <CPU>
    ```

-   **Start a VM:**

    ```powershell
    Start-VM -Name <HOSTNAME>
    ```

-   **Stop a VM:**

    ```powershell
    Stop-VM -Name <HOSTNAME>
    ```

-   **Restart a VM:**

    ```powershell
    Restart-VM -Name <HOSTNAME>
    ```

-   **Remove a VM:**

    ```powershell
    Remove-VM -Name <HOSTNAME>
    ```

## Checkpoint Management

-   **List all checkpoints:**

    ```powershell
    Get-VMSnapshot -VMName <HOSTNAME>
    ```

-   **Create a checkpoint:**

    ```powershell
    Checkpoint-VM -Name <HOSTNAME> -SnapshotName <SNAPSHOT_NAME>
    ```

-   **Restore a checkpoint:**

    ```powershell
    Restore-VMSnapshot -VMName <HOSTNAME> -Name <SNAPSHOT_NAME>
    ```

-   **Delete a checkpoint:**

    ```powershell
    Remove-VMSnapshot -VMName <HOSTNAME> -Name <SNAPSHOT_NAME>
    ```

## Storage Management

-   **Create a new virtual disk:**

    ```powershell
    New-VHD -Path "C:\Hyper-V Virtual Machines\<HOSTNAME>.vhdx" -SizeBytes <STORAGE>GB -Dynamic
    ```

-   **Resize a disk:**

    ```powershell
    Resize-VHD -Path "C:\Hyper-V Virtual Machines\<HOSTNAME>.vhdx" -SizeBytes <STORAGE>GB
    ```

-   **Compact a disk:**

    ```powershell
    Optimize-VHD -Path "C:\Hyper-V Virtual Machines\<HOSTNAME>.vhdx" -Mode Full
    ```

## Networking Management

-   **List all virtual switches:**

    ```powershell
    Get-VMSwitch
    ```

-   **Create a switch:**

    Type        |Command
    :----------:|----------------
    **External**|`New-VMSwitch -Name <SWITCH_NAME> -NetAdapterName <ADAPTER_NAME> -AllowManagementOS $true -EnableIov $true`
    **Internal**|`New-VMSwitch -Name <SWITCH_NAME> -SwitchType Internal`
    **Private** |`New-VMSwitch -Name <SWITCH_NAME> -SwitchType Private`

-   **Add a new NIC to a VM:**

    ```powershell
    Add-VMNetworkAdapter -VMName <HOSTNAME> -Name <ADAPTER_NAME> -SwitchName <SWITCH_NAME>
    ```

-   **Connect an existing NIC to a VM:**

    ```powershell
    Connect-VMNetworkAdapter -VMName <HOSTNAME> -Name <ADAPTER_NAME> -SwitchName <SWITCH_NAME>
    ```