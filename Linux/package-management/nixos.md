# NixOS Package Management Scripts

>   [!NOTE]  
>   These commands are **_flakes enabled_**, which manages the system **_declaratively_**, rather than using legacy `nix-channel` or `nix-env` commands.

## System Management

-   **Apply system configuration:**

    ```shell
    sudo nixos-rebuild switch --flake /etc/nixos/.dotfiles
    ```

-   **Test the configuration (reset to previous generation after reboot):**

    ```shell
    sudo nixos-rebuild test --flake /etc/nixos/.dotfiles
    ```

-   **List system generations:**

    ```shell
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
    ```

-   **Rollback to the previous system generation:**

    ```shell
    sudo nixos-rebuild switch --rollback
    ```

## User Management

**_User-specific configuration_** is managed using **_Home Manager_**.

-   **Apply user configuration:**

    ```shell
    home-manager switch --flake /etc/nixos/.dotfiles
    ```

-   **List user generations:**

    ```shell
    home-manager generations
    ```

-   **Rollback to the previous user generation:**

    ```shell
    home-manager rollback
    ```