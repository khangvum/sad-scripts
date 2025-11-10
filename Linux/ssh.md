# Secure Shell (SSH) Scripts

## Connection Management

-   **Connect to a remote host:**

    ```shell
    ssh "<USER>"@"<TARGET>"
    ```

-   **Test SSH connection with verbose output:**

    ```shell
    ssh -v "<USER>"@"<TARGET>"
    ```

-   **Execute a single command on the remote host:**

    ```shell
    ssh "<USER>"@"<TARGET>" "<COMMAND>"
    ```

## Key Generation & Authentication

1.  **Generate a new SSH key pair:**

    ```shell
    ssh-keygen -t rsa-sha2-512
    ```

2.  **Start the SSH agent and add your private key:**

    ```shell
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```

3.  **Retrieve the public key to add to Git or DevOps platforms:**

    ```shell
    cat ~/.ssh/id_rsa.pub
    ```

## File Transfer

-   **Copy files to a remote host:**

    ```shell
    scp "<LOCAL_FILE>" "<USER>"@"<TARGET>":"<REMOTE_PATH>"
    ```

-   **Copy files from a remote host:**

    ```shell
    scp "<USER>"@"<TARGET>":"<REMOTE_FILE>" "<LOCAL_PATH>"
    ```