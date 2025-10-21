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

## Service Management

-   **List all services:**

    ```shell
    systemctl list-units --type=service
    ```

-   **Start/Stop/Restart a service:**

    Action      |Command
    :----------:|:-----------------------------------
    **Start**   |`sudo systemctl start "<SERVICE>"`
    **Stop**    |`sudo systemctl stop "<SERVICE>"`
    **Restart** |`sudo systemctl restart "<SERVICE>"`

-   **Check service status:**

    ```shell
    systemctl status "<SERVICE>"
    ```

-   **Enable/Disable a service on boot:**

    Action      |Command
    :----------:|:-----------------------------------
    **Enable**  |`sudo systemctl enable "<SERVICE>"`
    **Disable** |`sudo systemctl disable "<SERVICE>"`