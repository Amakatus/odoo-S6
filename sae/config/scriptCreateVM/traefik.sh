#!/bin/bash

docker network create net_traefik

mkdir traefik

cp /home/user/config/fichierTraefik/docker-compose.yml traefik/

cd traefik/

docker compose up -d