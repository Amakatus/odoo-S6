#!/bin/bash

docker network create net_traefik

mkdir traefik

cp /home/user/config/fichierOdoo/docker-compose-reverse.yml traefik/

cd traefik/

docker compose up -d