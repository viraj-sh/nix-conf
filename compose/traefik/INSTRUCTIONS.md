# Traefik Setup Instructions

## 1. Overview
[Traefik](https://doc.traefik.io/traefik/setup/docker/#create-a-docker-composeyaml) is a modern, open-source HTTP reverse proxy and load balancer that simplifies deploying microservices by integrating with tools like Docker and Kubernetes.


## 2. Prerequisites
- Default port: `80`
- Create a certificate using openssl

    ```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout certs/local.key -out certs/local.crt \
    -subj "/CN=*.docker.localhost"
    ```

- Create Traefik Dashboard creds and paste in docker-compose.yaml > labels section

    ```bash
    htpasswd -nb admin "P@ssw0rd" | sed -e 's/\$/\$\$/g'
    ```

- Make dynamic and certs folder in the same directory as docker-compose.yaml     