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

## Process Management

-   **List running processes:**

    ```shell
    ps aux
    ```

-   **Monitor ongoing processes:**

    ```shell
    top    # Classic version
    htop   # More modern and interactive version
    ```

-   **Kill a process:**

    ```shell
    kill -9 "<PID>"