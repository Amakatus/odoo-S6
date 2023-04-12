#!/bin/bash

mkdir $1

mkdir $1/config

mkdir $1/odoo-data

cp /home/user/config/fichierOdoo/docker-compose-odoo.yml $1/

cp /home/user/config/fichierOdoo/odoo.conf $1/config/

sed -i -e "s/IPHOST/$3/g" $1/config/odoo.conf
sed -i -e "s/NOMUSER/$1/g" $1/config/odoo.conf
sed -i -e "s/MDPUSER/$2/g" $1/config/odoo.conf
sed -i -e "s/NOMDB/db$1/g" $1/config/odoo.conf
