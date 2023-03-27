#!/bin/bash

#Argument: nom ip type disque

#On crée une machine virtuel avec la bonne taille de disque
if [ -z "$4" ]
then
    vmiut creer $1 
else
    vmiut creer $1 -d $4
fi

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


if [ $3=="odoo" ]
then
    scp -r ./config user@$ipMachine:./
    ssh user@$ipMachine "su -c 'source ./config/script/configPartie1.sh $1 $2'"
    ssh user@$ipMachine "su -c 'source ./config/script/configPartie2.sh'"
    ssh user@$ipMachine "su -c 'source ./config/script/installDocker.sh'"
    vmiut restart $1
    #sleep 30
    #ssh root@$2 "su -c source installOdoo.sh"
fi

echo "fin"