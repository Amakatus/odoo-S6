#!/bin/bash

echo "Nom Client :" && read nomClient
echo "Mot de passe Client:" && read mdpClient
echo "Port" && read port

<<<<<<< HEAD:sae/createClientGeneral.sh
adressIPbd=$(cat ./config/ip/ipBD.txt)
adressIPodoo=$(cat ./config/ip/ipBD.txt)
=======
adressIPbd=$(cat /home/user/config/ip/ipBD.txt)
adressIPodoo=$(cat /home/user/config/ip/ipBD.txt)
>>>>>>> 8cd2735e04764bb00906355ebc77dc3595405e79:createClientGeneral.sh

ssh -t user@$adressIPbd "su -c 'source ./config/scriptCreateClient/createClientPostgres.sh $nomClient'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/createClientOdoo.sh $nomClient $mdpClient $adressIPbd $port'"
ssh -t user@$adressIPodoo "su -c 'source ./config/scriptCreateClient/lancerClient.sh $nomClient'"

