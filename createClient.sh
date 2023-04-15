#!/bin/bash

echo "Nom Client :" && read nomClient
echo "Mot de passe Client :" && read mdpClient
echo "Port :" && read port

adressIPbd=$(cat ./config/ip/ipBD.txt)
adressIPodoo=$(cat ./config/ip/ipODOO.txt)
virt=$(cat ./config/machinePhysique/virt.txt)

echo Attention, vous avez chnagé de mot de passe précèdement
echo Attention, vous avez chnagé de mot de passe précèdement
ssh -t user@$adressIPbd "su -c 'source ./config/scriptCreateClient/createClientPostgres.sh $nomClient $adressIPodoo'"

echo Attention, vous avez chnagé de mot de passe précèdement
echo Attention, vous avez chnagé de mot de passe précèdement
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/createClientOdoo.sh $nomClient $mdpClient $adressIPbd $port $virt'"

echo Attention, vous avez chnagé de mot de passe précèdement
echo Attention, vous avez chnagé de mot de passe précèdement
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/lancerClient.sh $nomClient'"

