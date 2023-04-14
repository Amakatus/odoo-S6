#!/bin/bash

touch listeDB.txt

echo db$1 >> ./listeDB.txt

echo "host    db$1     $1     $2/24       md5" >> /etc/postgresql/13/main/pg_hba.conf

systemctl restart postgresql

echo Veuillez entrer le même mot de passe client que précèdement

#psql -h localhost -U admin -c "-c '\x' -c
su - postgres -c '\x' -c "createuser -P $1"

echo Veuillez entrer le même mot de passe client que précèdement
su - postgres -c '\x' -c "createdb -O $1 db$1"
