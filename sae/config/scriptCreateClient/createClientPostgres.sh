#!/bin/bash

echo Veuillez entrer le même mot de passe client que précèdement
echo Veuilles entrer les commandes suivante manuellement et de mettre le même mot de passe client inséré précèdement
echo "cd"
echo "createuser -P $1"
echo Faites de même après avoir inséré la commande précèdente
echo "createdb -O $1 db$1"
echo Puis presser CTRL+D afin de quitter

su - postgres


