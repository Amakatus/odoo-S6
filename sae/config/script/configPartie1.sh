#!/bin/bash

#On modifie l'adresse IP du fichier interface par l'adresse IP en paramettre 
sed -i -e "s/192.168.194.xx/$2/g" /home/user/config/fichierBasique/interfaces

#Modification du nom de la machine dans le fichier hosts
sed -i -e "s/debian/$1/g" /home/user/config/fichierBasique/hosts

#Modification du nom de la machine dans le fichier hostname
sed -i -e "s/debian/$1/g" /etc/hostname

#On remplace l'ancien fichier interfaces par le nouveau avec la bonne ip
mv /home/user/config/fichierBasique/interfaces /etc/network/

#On remplace l'ancien fichier environment par le nouveau avec les proxy
mv /home/user/config/fichierBasique/environment /etc/

#On remplace l'ancien fichier timesyncd par le nouveau
mv /home/user/config/fichierBasique/timesyncd.conf /etc/systemd/

#On remplace l'ancien fichier hosts par le nouveau
mv /home/user/config/fichierBasique/hosts /etc/

#On annule l'affiche graphique lors des mises à jours
apt-mark hold grub-pc
