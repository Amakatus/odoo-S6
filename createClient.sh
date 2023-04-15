#!/bin/bash

echo "Nom Client :" && read nomClient
echo "Mot de passe Client:" && read mdpClient
echo "Port" && read port

adressIPbd=$(cat ./config/ip/ipBD.txt)
adressIPodoo=$(cat ./config/ip/ipODOO.txt)

ssh -t user@$adressIPbd "su -c 'source ./config/scriptCreateClient/createClientPostgres.sh $nomClient $mdpClient'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/createClientOdoo.sh $nomClient $mdpClient $adressIPbd $port'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/lancerClient.sh $nomClient'"

