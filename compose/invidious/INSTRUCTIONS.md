# Invidious Setup Instructions

## 1. Overview
[Invidious](https://docs.immich.app/install/docker-compose)Invidious is an open source alternative front-end to YouTube.

## 2. Prerequisites
- Default Port: `2283`

## 3. Procedure

1. Execute these commands:
```bash
git clone https://github.com/iv-org/invidious.git
cd invidious
```

2. Generate two secret keys, one for Invidious (HMAC_KEY) and one for Invidious companion (invidious_companion_key)
```bash
pwgen 16 1 # for Invidious (HMAC_KEY)
pwgen 16 1 # for Invidious companion (invidious_companion_key)
```
3. Edit the docker-compose.yml

4. Run the docker composition:
```bash
docker compose up -d
```


