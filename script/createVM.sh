#!/bin/bash

#On crée une machine virtuel avec la bonne taille de disque
if [ -z "$3" ]
then
    vmiut creer $1 
else
    vmiut creer $1 -d $3
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

#On copie dans tmp les fichier de config on les modifie afin de les insérer directement sur la machine
cp ./config/hosts ~/tmp/
cp ./config/interfaces ~/tmp/

#On les modifie afin de les insérer directement sur la machine
sed -i -e "s/$2/192.168.194.1/g" ~/tmp/interfaces

scp ./config/environment root@$ipMachine:./etc/
scp ./config/timesyncd.conf root@$ipMachine:./etc/systemd/
scp ~/tmp/hosts root@$ipMachine:./etc/

ssh root@$2 "ifdown enp0s3"
scp ~/tmp/interfaces root@$ipMachine:./etc/network/
ssh root@$2 "ifup enp0s3"

rm ~/tmp/hosts
rm ~/tmp/interfaces

ssh root@$2 "echo $1 > ./etc/hostname"

sleep 10

vmiut restart $1

sleep 20

echo "Une interface graphique va s'afficher, veuillez appuyer sur 'espace' puis 'entrer' à ce moment là"

ssh root@$2 "apt update && apt full-upgrade"

vmiut restart $1

sleep 20

ssh root@$2 "apt-get install sudo"
ssh root@$2 "usermod -aG sudo user"

vmiut restart $1

sleep 20

chmod u