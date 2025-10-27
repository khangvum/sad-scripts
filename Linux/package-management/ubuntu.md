# Ubuntu Package Management Scripts

## `apt` Management

-   **Update all packages:**

    ```shell
    sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
    ```

-   **Search for a package:**

    ```shell
    apt search "<PACKAGE>"
    ```

-   **Fix broken dependencies:**

    ```shell
    sudo apt install -f
    ```

-   **Remove/Purge a package:**

    ```shell
    # Remove package binaries only, keep configuration files
    sudo apt remove -y "<PACKAGE>"
    # Remove all, including configuration files
    sudo apt purge -y "<PACKAGE>"
    ```

## `dpkg` Management

-   **Check if a specific package is installed:**

    ```shell
    dpkg -l | grep "<PACKAGE>"
    ```

-   **Remove/Purge a package:**

    ```shell
    # Remove package binaries only, keep configuration files
    sudo dpkg -r "<PACKAGE>"
    # Remove all, including configuration files
    sudo dpkg -P "<PACKAGE>"
    ```