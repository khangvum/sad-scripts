# ESXi Scripts

## System Management

-   **Check ESXi version/build:**

    ```shell
    vmware -v
    esxcli system version get
    ```

-   **Shutdown host:**

    ```shell
    # Maintenance mode required (best practice)
    esxcli system shutdown poweroff -r <REASON>
    # No maintenance mode required (not recommended)
    poweroff
    ```

-   **Reboot host:**

    ```shell
    # Maintenance mode required (best practice)
    esxcli system shutdown reboot -r <REASON>
    # No maintenance mode required (not recommended)
    reboot
    ```

## Maintenance Mode

-   **Enter maintenance mode:**

    ```shell
    esxcli system maintenanceMode set --enable true
    ```

-   **Exit maintenance mode:**

    ```shell
    esxcli system maintenanceMode set --enable false
    ```

## Storage Management

-   **List all datastores:**

    ```shell
    esxcli storage filesystem list
    ```

-   **Rescan storage adapters:**

    ```shell
    esxcli storage core adapter rescan --all
    ```

## Networking Management

-   **List all network interfaces:**

    ```shell
    esxcli network nic list
    ```

-   **Check IP configuration:**

    ```shell
    esxcli network ip interface ipv4 get
    ```

## VM Management

These VM management commands work directly with standalone ESXi host if vCenter is not available.

-   **List all VMs:**

    ```shell
    vim-cmd vmsvc/getallvms
    ```

-   **Power on a VM:**

    ```shell
    vim-cmd vmsvc/power.on <VMID>
    ```

-   **Power off a VM:**

    ```shell
    vim-cmd vmsvc/power.off <VMID>
    ```

## ESXi Update/Patching

1.  **List the available image profiles:**

    ```shell
    esxcli software sources profile list -d /vmfs/volumes/<DATASTORE>/ISO/<OFFLINE_BUNDLE>.zip
    # esxcli software sources profile list -d /vmfs/volumes/datastore1/ISO/VMware-VMvisor-Installer-8.0.0.update03.zip
    ```

2.  **Update/Patch the host to the selected profile:**

    ```shell
    esxcli software profile update -p <PROFILE_NAME> -d /vmfs/volumes/<DATASTORE>/ISO/<OFFLINE_BUNDLE>.zip
    # esxcli software profile update -p DEL-ESXi_803.24280767-A02 -d /vmfs/volumes/67ac9bf2-47fe0c49-1cbe-043201db08e0/ISO/VMware-VMvisor-Installer-8.0.0.update03-24280767.x86_64-Dell_Customized-A02.zip
    ```