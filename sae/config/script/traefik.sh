#!/bin/bash

docker network create net_traefik

mkdir ./traefik

mv /home/user/config/fichierOdoo/docker-compose-reverse.yml ./traefik/

docker compose up -d