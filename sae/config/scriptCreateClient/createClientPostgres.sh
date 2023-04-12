#!/bin/bash

su postgres

cd

echo Veuillez entrer le même mot de passe client que précèdement

createuser -P -s $1

echo Entrez le mot de passe client
createdb -O $1 db$1