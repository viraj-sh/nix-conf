# JupyterHub Setup Instructions

## 1. Overview
With [JupyterHub](https://jupyterhub.readthedocs.io/en/latest/tutorial/quickstart-docker.html) you can create a multi-user Hub that spawns, manages, and proxies multiple instances of the single-user Jupyter notebook server.

## 2. Prerequisites
- Default port: `27843`
- Configure `jupyterhub_config.py` from inside the container using docker exec 
   ```py
   c.Authenticator.allowed_users = {"virajs"}
   c.LocalAuthenticator.create_system_users = True
   ```
- Also make user and set password for the configured user