# Beszel Setup Instructions

## 1. Overview
[Beszel](https://beszel.dev/guide/getting-started) is a lightweight server monitoring platform that provides Docker statistics, historical data, and alert functions.

## 2. Prerequisites
- Default port: `8090`
- `.env` file for environment variables:
  - `BESZEL_AGENT_KEY`
  - `BESZEL_HUB_URL` (default: `http://localhost:8090`)

## 3. First-Time Setup
1. Start the compose stack:
   ```bash
   docker compose up -d
   ```

2. Open the Beszel dashboard at `$BESZEL_HUB_URL`.
3. Create a new system:

   * Name: your choice
   * Host/IP: `/beszel_socket/beszel.sock`
   * Port: leave empty
4. Copy the public key generated for the system.
5. Add the key to your `.env` file under `BESZEL_AGENT_KEY`:

   ```dotenv
   BESZEL_AGENT_KEY=<paste-key-here>
   ```
6. Restart the compose stack to apply changes:

   ```bash
   docker compose restart
   ```
