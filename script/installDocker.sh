#!/bin/bash

ssh user@$1 "sudo -E apt-get update"

ssh user@$1 "sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"

ssh user@$1 "sudo -E mkdir -p /etc/systemd/system/docker.service.d"

scp ./config/http-proxy.conf root@$1:./etc/systemd/system/docker.service.d/

ssh user@$1 "sudo systemctl daemon-reload"

ssh user@$1 "sudo systemctl restart docker"

ssh user@$1 "mkdir ./etc/docker"

scp ./config/daemon.json root@$1:./etc/docker/

ssh user@$1 "mkdir .docker"

scp ./config/config.json root@$1:.docker/

