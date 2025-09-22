# VMware Workstation Scripts

## General Management

-   **List all running VMs:**

    ```powershell
    vmrun -T ws list
    ```

-   **Check VMware Tools status:**

    ```powershell
    vmrun -T ws checkToolsState "C:\VMware Virtual Machines\<VM_NAME>\<VM_NAME>.vmx"
    ```

## Power Management

-   **Start a VM:**

    ```powershell
    vmrun -T ws start "C:\VMware Virtual Machines\<VM_NAME>\<VM_NAME>.vmx"
    ```

-   **Stop a VM:**

    ```powershell
    vmrun -T ws stop "C:\VMware Virtual Machines\<VM_NAME>\<VM_NAME>.vmx" soft
    ```

-   **Reset a VM:**

    ```powershell
    vmrun -T ws reset "C:\VMware Virtual Machines\<VM_NAME>\<VM_NAME>.vmx" soft
    ```

-   **Suspend a VM:**

    ```powershell
    vmrun -T ws suspend "C:\VMware Virtual Machines\<VM_NAME>\<VM_NAME>.vmx" soft
    ```