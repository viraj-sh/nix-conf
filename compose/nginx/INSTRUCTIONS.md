# Nginx Proxy Manager Setup Instructions

## 1. Overview
[Nginx Proxy Manager](https://nginxproxymanager.com/setup/) (NPM) is a graphical interface (GUI) tool that simplifies the configuration of Nginx, which acts as a reverse proxy and web server. 



## 2. Prerequisites

- Refer [nginx docs](https://nginxproxymanager.com/setup/)

- Auto Initial User Creation:

    Setting these environment variables will create the default user on startup, skipping the UI first user setup screen:

    ```txt
    environment:
    INITIAL_ADMIN_EMAIL: my@example.com
    INITIAL_ADMIN_PASSWORD: mypassword1
    ```