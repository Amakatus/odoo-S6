#!/bin/bash

#Argument: nom ip type disque

#On crée une machine virtuel avec la bonne taille de disque
vmiut creer $1 -d /home/public/vm/disque-bullseye-11.1-20go.vdi
vmiut demarrer $1

#Tant que l'adresse ip n'est pas affecté, on attend
while [[ -z "$(vmiut info $1 | grep ip-possible= | cut -c 13- )" ]];
do
    sleep 1
done

#On récupére l'adresse ip de la machine
ipMachine=$(vmiut info $1 | grep ip-possible= | cut -c 13- )

type=$3

echo "Répondre yes et insérer le mot de passe utilisateur  afin de continuer l'installation lorsque le terminal vous le demandera"

ssh-copy-id user@$ipMachine

<<<<<<< HEAD:createVM.sh
scp -r ./config user@$ipMachine:./
ssh -t user@$ipMachine "su -c 'source ./config/scriptCreateVM/configPartie1.sh $1 $2'"
ssh -t user@$ipMachine "su -c 'source ./config/scriptCreateVM/configPartie2.sh'"
=======
<<<<<<< HEAD:sae/createVM.sh
scp -r ./config user@$ipMachine:./
ssh -t user@$ipMachine "su -c 'source ./config/scriptCreateVM/configPartie1.sh $1 $2'"
ssh -t user@$ipMachine "su -c 'source ./config/scriptCreateVM/configPartie2.sh'"
vmiut stop $1
vmiut demarrer $1

=======
scp -r ../../config user@$ipMachine:./
ssh -t user@$ipMachine "su -c 'source ./configPartie1.sh $1 $2'"
ssh -t user@$ipMachine "su -c 'source ./configPartie2.sh'"
>>>>>>> 311239d9a93594571d3d8c9d7d850dc4e0f71755:config/scriptCreateVM/createVM.sh
vmiut restart $1
>>>>>>> 8cd2735e04764bb00906355ebc77dc3595405e79:config/scriptCreateVM/createVM.sh

until ssh user@$2 "su -c 'echo Nouvelle IP ajouté'"
do
    sleep 10
done

if [[ "$type" = "odoo" ]]
then
    ssh -t user@$2 "su -c 'source ./config/scriptCreateVM/installDocker.sh'"
    ssh -t user@$2 "su -c 'source ./config/scriptCreateVM/traefik.sh'"
elif [[ "$type" = "postgres" ]]
then
    ssh -t user@$2 "su -c 'source ./config/scriptCreateVM/installPostgres.sh $2 $4 $5'"
    ssh -t user@$2 "su -c 'source ./config/scriptCreateVM/createSuperUser.sh'"
    ssh -t user@$2 "su -c 'source ./config/scriptCreateVM/installSave.sh'"
elif [[ "$type" = "save" ]]
then
    ssh -t user@$2 "su -c 'source ./config/scriptCreateVM/rsync.sh $4'"
else
    echo "probleme"
fi
echo "fin"

#modifier le mot de passe root et user
