#!/bin/bash
if [ -a ./listeDB.txt ]
then
    dateDuJour=$(date +"Dates: %d-%m-%Y---%HH%MM%SS" | cut -b 8-)
    mkdir ./dbsave/$dateDuJour
    echo Mot de passe du compte Admin:
    for nomDB in $(cat listeDB.txt)
    do
        pg_dump -h localhost -U admin --format=custom --file $nomDB.dump $nomDB;
        mv ./$nomDB.dump ./dbsave/$dateDuJour
    done
fi