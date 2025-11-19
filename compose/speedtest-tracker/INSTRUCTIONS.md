# Speedtest-tracker Setup Instructions

## 1. Overview
[Speedtest-tracker](https://docs.linuxserver.io/images/docker-speedtest-tracker/#usage) is a self-hosted internet performance tracking application that runs speedtest checks against Ookla's Speedtest service.

## 2. Prerequisites
- What must be installed or configured beforehand
- Generate app key using https://speedtest-tracker.dev
- 'SPEEDTEST_SERVERS=' A comma-separated list of server IDs to test against. Run docker run -it --rm --entrypoint /bin/bash lscr.io/linuxserver/speedtest-tracker:latest list-servers to get a list of nearby servers.