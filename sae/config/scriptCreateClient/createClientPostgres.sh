#!/bin/bash

echo Veuillez entrer le même mot de passe client que précèdement

#psql -h localhost -U admin -c "-c '\x' -c
su - postgres -c '\x' -c "createuser -P $1"

echo Veuillez entrer le même mot de passe client que précèdement
su - postgres -c "createdb -O $1 db$1"
