#!/bin/bash

touch listeDB.txt

echo db$1 >> ./listeDB.txt

echo "host    postgres     $1     $2/24       md5" >> /etc/postgresql/13/main/pg_hba.conf
echo "host    db$1     $1     $2/24       md5" >> /etc/postgresql/13/main/pg_hba.conf

systemctl restart postgresql
systemctl restart postgresql.service

echo localhost:5432:db$1:admin:$(cat .secret) >> /var/lib/postgresql/.pgpass

echo Veuillez entrer le même mot de passe client que précèdement

su - postgres -c '\x' -c "createuser -P $1"

echo Veuillez entrer le même mot de passe client que précèdement
su - postgres -c '\x' -c "createdb -O $1 db$1"
