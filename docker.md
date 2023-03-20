---
title: Installation et configuration basique de docker
author: Sacha BOUTON surtout Sacha et Clément DELERUE
---
## Installation de docker
```
 user@vm $ sudo - E apt-get update

 user@vm $ sudo -E apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

user@vm $  sudo mkdir -m 0755 -p /etc/apt/keyrings 
user@vm $ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

user@vm $ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

user@vm $ sudo -E apt-get update  
user@vm $  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Configuration basique de docker

```
 sudo -E mkdir -p /etc/systemd/system/docker.service.d
sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf
sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://cache.univ-lille.fr:3128"
Environment="HTTPS_PROXY=http://cache.univ-lille.fr:3128"
Environment="http_proxy=http://cache.univ-lille.fr:3128"
Environment="https_proxy=http://cache.univ-lille.fr:3128"
Environment="NO_PROXY=localhost,192.168.194.0/24,172.18.48.0/22"
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl show --property=Environment docker
```


Pour ajouter le miroir de l'IUT et corriger la base de sous réseaux utilisés (pour ne pas entrer en conflit avec le réseau de l'IUT), créer (ou modifier) le fichier /etc/docker/daemon.json et ajouter les paramètres suivants (voir documentation officielle ici https://docs.docker.com/registry/recipes/mirror/)
{
"registry-mirrors": ["http://172.18.48.9:5000"],
"default-address-pools":
  [
    {"base":"172.20.0.0/16","size":24}
  ]
}
 dans le fichier .docker/config.json                  
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://cache.univ-lille.fr:3128",
     "httpsProxy": "http://cache.univ-lille.fr:3128",
     "noProxy": "localhost"
   }
 }
}
```