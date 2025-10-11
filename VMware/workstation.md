# VMware Workstation Scripts

>   [!NOTE]
>   If `vmrun` is **_not_** in the **_PATH_**, use the **_full path_**. The **_default_** is:
>   `C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe`

## General Management

-   **List all running VMs:**

    ```powershell
    vmrun -T ws list
    ```

-   **Check VMware Tools status:**

    ```powershell
    vmrun -T ws checkToolsState "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx"
    ```

## Power Management

-   **Start a VM:**

    ```powershell
    vmrun -T ws start "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx"
    ```

-   **Stop a VM:**

    ```powershell
    vmrun -T ws stop "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx" soft
    ```

-   **Reset a VM:**

    ```powershell
    vmrun -T ws reset "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx" soft
    ```

-   **Suspend a VM:**

    ```powershell
    vmrun -T ws suspend "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx" soft
    ```

## Snapshot Management

-   **List all snapshots:**

    ```powershell
    vmrun -T ws listSnapshots "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx"
    ```

-   **Create a snapshot:**

    ```powershell
    vmrun -T ws snapshot "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx" "<SNAPSHOT_NAME>"
    ```

-   **Revert to a snapshot:**

    ```powershell
    vmrun -T ws revertToSnapshot "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx" "<SNAPSHOT_NAME>"

    ```

-   **Delete a snapshot:**

    ```powershell
    vmrun -T ws deleteSnapshot "C:\VMware Virtual Machines\<HOSTNAME>\<HOSTNAME>.vmx" "<SNAPSHOT_NAME>"
    ```