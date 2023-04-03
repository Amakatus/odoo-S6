#!/bin/bash

apt-get update

apt-get install -y ca-certificates curl gnupg lsb-release

mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

mkdir -p /etc/systemd/system/docker.service.d

printf "[Service]\nEnvironment="HTTP_PROXY=http://cache.univ-lille.fr:3128"\nEnvironment="HTTPS_PROXY=http://cache.univ-lille.fr:3128"\nEnvironment="http_proxy=http://cache.univ-lille.fr:3128"\nEnvironment="https_proxy=http://cache.univ-lille.fr:3128"\nEnvironment="NO_PROXY=localhost,192.168.194.0/24,172.18.48.0/22"" > /etc/systemd/system/docker.service.d/http-proxy.conf

systemctl daemon-reload

systemctl restart docker

mv /home/user/config/fichierDocker/daemon.json /etc/docker/

mkdir .docker

mv /home/user/config/fichierDocker/config.json .docker/

systemctl daemon-reload

systemctl restart docker