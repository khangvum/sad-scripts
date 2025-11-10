# Linux Networking Scripts

## Interface Management

-   **Get IP Configuration:**

    ```shell
    ip a
    ```

-   **Test network connectivity:**

    ```shell
    ping "<TARGET>"
    ```

-   **Assign a static IP address to an interface:**

    ```shell
    sudo ip addr add "<IP_ADDRESS>"/24 dev "<INTERFACE>"

-   **Bring an interface up/down:**

    ```shell
    sudo ip link set "<INTERFACE>" up
    sudo ip link set "<INTERFACE>" down
    ```

## DNS Management

-   **Flush DNS cache:**

    ```shell
    sudo resolvectl flush-caches
    ```

-   **Edit static hostname resolution:**

    ```shell
    sudo nano /etc/hosts
    ```