#!/bin/bash

mkdir /$1

mkdir /$1/config

mkdir /$1/odoo-data

cp /home/user/config/fichierOdoo/docker-compose.yml /$1/

cp /home/user/config/fichierOdoo/odoo.conf /$1/config/

