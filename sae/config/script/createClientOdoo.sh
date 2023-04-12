#!/bin/bash

echo "Nom Client :" && read nomClient

mkdir ./$nomClient

mkdir ./$nomClient/config

mkdir ./$nomClient/odoo-data

cp /home/user/config/fichierOdoo/docker-compose-odoo.yml ./$nomClient/

cp /home/user/config/fichierOdoo/odoo.conf ./$nomClient/config/

sed xxxxx->nomClient

