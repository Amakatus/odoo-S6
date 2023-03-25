#!/bin/bash

sudo -E apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo -E mkdir -p /etc/systemd/system/docker.service.d

cp ~/fichierDocker/http-proxy.conf ~/etc/systemd/system/docker.service.d/

sudo systemctl daemon-reload

sudo systemctl restart docker

mkdir ./etc/docker

cp ~/fichierDocker/daemon.json ~/etc/docker/

mkdir .docker

cp ~/fichierDocker/config.json .docker/

