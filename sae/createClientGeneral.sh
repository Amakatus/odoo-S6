#!/bin/bash

echo "Nom Client :" && read nomClient
echo "Mot de passe Client:" && read mdpClient

adressIPbd=192.168.194.45     #$(cat /home/user/config/ipBD.txt)
adressIPodoo=192.168.194.47   #$(cat /home/user/config/ipBD.txt)

ssh -t user@$adressIPbd "su -c 'source ./config/scriptCreateClient/createClientPostgres.sh $nomClient'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/createClientOdoo.sh $nomClient $mdpClient $adressIPbd'"
