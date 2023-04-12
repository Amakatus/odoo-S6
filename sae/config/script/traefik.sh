#!/bin/bash

docker network create net_traefik

mv /home/user/config/fichierOdoo/docker-compose-reverse.yml ./

docker compose up -d