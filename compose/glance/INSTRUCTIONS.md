# Glance Setup Instructions

## 1. Overview
[Glance](https://github.com/glanceapp/glance?tab=readme-ov-file#installation) is a lightweight, highly customizable dashboard that displays
your feeds in a beautiful, streamlined interface

## 2. Prerequisites
- Create a new directory called glance as well as the template files within it by running:
    ```bash
    mkdir glance && cd glance && curl -sL https://github.com/glanceapp/docker-compose-template/archive/refs/heads/main.tar.gz | tar -xzf - --strip-components 2
    ```
- Then, edit the following files as desired:
    - docker-compose.yml to configure the port, volumes and other containery things
    - config/home.yml to configure the widgets or layout of the home page
    - config/glance.yml if you want to change the theme or add more pages

- Other files you may want to edit
    - .env to configure environment variables that will be available inside configuration files
    - assets/user.css to add custom CSS