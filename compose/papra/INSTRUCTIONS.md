# Papra Setup Instructions

## 1. Overview
[Papra](https://docs.papra.app/self-hosting/using-docker-compose/) is a minimalistic document management and archiving platform. It is designed to be simple to use and accessible to everyone. Papra is a platform for long-term document storage and management, like a digital archive for your documents.

## 2. Prerequisites
- Default port: `1221`
- Create working directory and persistent storage subdirectories:
    ```bash
    mkdir -p papra/app-data/{db,documents} && cd papra
    ```
