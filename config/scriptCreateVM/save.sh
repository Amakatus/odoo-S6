#!/bin/bash

touch .pgpass

chmod 0600 .pgpass

mv .pgpass /var/lib/postgresql/

if [ -a ./listeDB.txt ]
then
    echo localhost:5432:$nomDB:admin:$(cat .secret) >> /var/lib/postgresql/.pgpass
    dateDuJour=$(date +"Dates: %d-%m-%Y---%HH%MM%SS" | cut -b 8-)
    mkdir ./dbsave/$dateDuJour
    echo Mot de passe du compte Admin:
    for nomDB in $(cat listeDB.txt)
    do
        pg_dump -h localhost -U admin --format=custom --file $nomDB.dump $nomDB;
        mv ./$nomDB.dump ./dbsave/$dateDuJour
    done
fi

rm -f /var/lib/postgresql/.pgpass