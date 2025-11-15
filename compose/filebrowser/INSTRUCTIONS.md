# File Browser Setup Instructions

## 1. Overview
[File Browser](https://filebrowser.org/index.html) provides a file managing interface within a specified directory and it can be used to upload, delete, preview and edit your files.

## 2. Prerequisites
- Default port: `8080`

## 3. First-Time Setup
1. Start the compose stack:
   ```bash
   docker compose up -d
   ```
2. Make sure you own the data dir by running
   ```bash
   sudo chown -R user_name:users data/
   ```
3. Default id pass will be displayed in the logs

- id: admin
- pass: `check logs`

4. Access dashboard at [https://localhost:8080](https://localhost:8080) login using default id pass for the first time and change password or add user.