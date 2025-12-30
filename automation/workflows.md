# Honeygain Lucky Pot Notifier (n8n) 🍯

An automated n8n workflow that periodically checks the Honeygain Lucky Pot status and sends notifications when the pot is ready to be claimed.

|                                                            Workflow Preview                                                            |
| :------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://raw.githubusercontent.com/viraj-sh/nix-conf/refs/heads/main/.github/assets/n8n_honeygain_workflow.png" width="500"/> |

---

## Overview

This workflow queries the Honeygain API every hour to track Lucky Pot progress and notifies you when the required traffic threshold has been reached.

It is compatible with both **n8n Cloud** and **self-hosted n8n** setups and avoids hardcoded secrets by default.

---

## Features

- Hourly Lucky Pot status checks
- ntfy notification when the pot is ready to claim
- Discord progress updates while accumulating
- No notification if the pot has already been collected
- Discord alerts on API or network errors
- Environment variable–based configuration
- Cloud and self-hosted n8n compatible

---

## How It Works

The workflow queries the following Honeygain API endpoint:

`https://dashboard.honeygain.com/api/v1/contest_winnings`

### API Response Fields

- `progress_bytes` — accumulated traffic
- `max_bytes` — required traffic to unlock the Lucky Pot
- `winning_credits` — `null` if the pot has not been collected

### Decision Logic

| Condition                                     | Action                        |
| --------------------------------------------- | ----------------------------- |
| `progress ≥ max` and `winning_credits = null` | Send ntfy notification        |
| `progress ≥ max` and `winning_credits ≠ null` | No action (already collected) |
| `progress < max`                              | Send Discord progress update  |

---

## Configuration

### Honeygain Token (Required)

The workflow expects the following environment variable:

```

HONEYGAIN_TOKEN

```

**Value format:**

```

Bearer eyJ0eXAiOi...

```

#### Obtaining the Token

1. Visit https://dashboard.honeygain.com
2. Log in to your account
3. Open browser Developer Tools → Network tab
4. Reload the dashboard
5. Select any API request (e.g. `contest_winnings`, `balances`)
6. Copy the full `Authorization` header value

#### Usage Options

**Option A — Environment Variable (Recommended)**

```bash
HONEYGAIN_TOKEN="Bearer eyJ0eXAiOi..."
```

The workflow will automatically use this value.

**Option B — Hardcoded Token (Not Recommended)**

In the **Initialize Configuration** node:

- Remove `{{ $env["HONEYGAIN_TOKEN"] }}`
- Paste the token directly

---

## ntfy Configuration

The ntfy notification endpoint can be configured via environment variable or directly in the node.

### Environment Variable

```
NTFY_HONEYGAIN_CHANNEL
```

### Example Values

```
https://ntfy.sh/my-topic
https://ntfy.example.com/honeygain
```

If environment variables are unavailable, paste the URL directly into the ntfy node.

---

## Notifications

### ntfy

- Triggered when the Lucky Pot becomes available to claim

### Discord

- Periodic progress updates while accumulating
- Error alerts for:

  - Invalid or expired token
  - API failures
  - Network issues

---

## Optional: Auto-Open Dashboard on Notification

Example Linux script using the `ntfy` CLI:

```bash
#!/usr/bin/env bash

ntfy sub https://ntfy.example.com/honeygain | while read -r line; do
  msg=$(echo "$line" | jq -r '.message // empty')
  if [[ -n "$msg" ]]; then
    notify-send "Honeygain" "$msg"
    xdg-open "https://dashboard.honeygain.com/" >/dev/null 2>&1
  fi
done
```

This script:

- Displays a desktop notification
- Automatically opens the Honeygain dashboard
- Reuses the existing browser session

---

## Token Lifetime

Honeygain bearer tokens are long-lived.
If the token expires or you log out:

- API errors will be reported via Discord
- Update the token using the steps above

---

## Importing the Workflow

1. Open n8n
2. Import the workflow JSON
3. Set `HONEYGAIN_TOKEN`
4. Configure ntfy and Discord
5. Activate the workflow

> For bug reports, feature requests, or suggestions, please open an issue on GitHub.
