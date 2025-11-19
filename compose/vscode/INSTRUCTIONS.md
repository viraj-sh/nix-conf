# Openvscode-server Setup Instructions

## 1. Overview
[Openvscode-server](https://docs.linuxserver.io/images/docker-openvscode-server/) provides a version of VS Code that runs a server on a remote machine and allows access through a modern web browser.

## 2. Prerequisites
- Default port: `3000`
- Generate hashed password using 
    ```
    bash openssl passwd -6 -salt SOME_SALT "your_sudo_password"
    ```

