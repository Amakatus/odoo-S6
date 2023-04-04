#!/bin/bash

#Argument: nom ip type disque

#On crée une machine virtuel avec la bonne taille de disque
vmiut creer $1 -d /home/public/vm/disque-bullseye-11.1-5go.vdi
vmiut demarrer $1

#Tant que l'adresse ip n'est pas affecté, on attend
while [[ -z "$(vmiut info $1 | grep ip-possible= | cut -c 13- )" ]];
do
    sleep 1
done

#On récupére l'adresse ip de la machine
ipMachine=$(vmiut info $1 | grep ip-possible= | cut -c 13- )

echo "Répondre yes et insérer le mot de passe utilisateur  afin de continuer l'installation lorsque le terminal vous le demandera"

ssh-copy-id user@$ipMachine

scp -r ./config user@$ipMachine:./
ssh user@$ipMachine "su -c 'source ./config/script/configPartie1.sh $1 $2'"
ssh user@$ipMachine "su -c 'source ./config/script/configPartie2.sh'"
vmiut restart $1

until ssh user@$2 "su -c 'echo salut'"
do
    sleep 1
done

if [[ "$3"=="odoo" ]]
then
    ssh user@$2 "su -c 'source ./config/script/installDocker.sh'"
    vmiut restart $1
    #sleep 30
    #ssh root@$2 "su -c source installOdoo.sh"
fi

if [[ "$3"=="postgres" ]]
then
    ssh user@$2 "su -c 'source ./config/script/installPostgres.sh'"
    echo "POSTGRES"
    echo "POSTGRES"
    echo "POSTGRES"
    echo "POSTGRES"
fi

if [[ "$3"=="save" ]]
then
    ssh user@$2 "su -c 'source ./config/script/installSave.sh'"
fi
echo "fin"

#modifier le mot de passe root et user