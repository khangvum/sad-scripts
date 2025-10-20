# Linux Scripts

## System Management

-   **Retrieve system information:**

    Information             |Command
    :----------------------:|:--------------------
    **System information**  |`uname -a`
    **OS version**          |`cat /etc/os-release`
    **Hostname**            |`hostnamectl`

-   **Retrieve hardware details:**

    Information         |Command
    :------------------:|:------
    **CPU**             |`lscpu`
    **Memory (RAM)**    |`lsmem`
    **Storage (block)** |`lsblk`
    **PCI devices**     |`lspci`

## Power Management

-   **Reboot the system:**

    ```shell
    sudo reboot
    ```

-   **Shut down the system:**

    ```shell
    sudo poweroff
    ```