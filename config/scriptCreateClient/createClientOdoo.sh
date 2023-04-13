#!/bin/bash

mkdir $1

mkdir $1/config

mkdir $1/odoo-data

cp /home/user/config/fichierOdoo/docker-compose.yml $1/

cp /home/user/config/fichierOdoo/odoo.conf $1/config/

sed -i -e "s/IPHOST/$3/g" $1/config/odoo.conf
sed -i -e "s/NOMUSER/$1/g" $1/config/odoo.conf
sed -i -e "s/MDPUSER/$2/g" $1/config/odoo.conf
sed -i -e "s/NOMDB/db$1/g" $1/config/odoo.conf

sed -i -e "s/PORT/$4/g" $1/docker-compose.yml
sed -i -e "s/EPAL/$1/g" $1/docker-compose.yml

cd $1

echo Lorsque le chargement des addons seront fini faire : CTRL+C
echo Lorsque le chargement des addons seront fini faire : CTRL+C
echo Lorsque le chargement des addons seront fini faire : CTRL+C
echo Lorsque le chargement des addons seront fini faire : CTRL+C
echo Attention de ne pas le faire après les modules

sleep 10

docker compose run web -i db$1

docker compose run -d
