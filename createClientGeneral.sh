#!/bin/bash

echo "Nom Client :" && read nomClient
echo "Mot de passe Client:" && read mdpClient
echo "Port" && read port

adressIPbd=$(cat /home/user/config/ip/ipBD.txt)
adressIPodoo=$(cat /home/user/config/ip/ipBD.txt)

ssh -t user@$adressIPbd "su -c 'source ./config/scriptCreateClient/createClientPostgres.sh $nomClient'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/createClientOdoo.sh $nomClient $mdpClient $adressIPbd $port'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/lancerClient.sh $nomClient'"

