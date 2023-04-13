#!/bin/bash

echo Veuillez entrer le même mot de passe client que précèdement

sudo su - postgres -c "createuser -P $1"

echo Veuillez entrer le même mot de passe client que précèdement
createdb -O $1 db$1
