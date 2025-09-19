# ESXi Scripts

## Maintenance Mode

-   **Enter maintenance mode:**

    ```shell
    esxcli system maintenanceMode set --enable true
    ```

-   **Exit maintenance mode:**

    ```shell
    esxcli system maintenanceMode set --enable false
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