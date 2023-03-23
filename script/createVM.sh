#!/bin/bash
if [ -z "$3" ]
then
    vmiut creer $1 
else
    vmiut creer $1 -d $3
fi

vmiut demarrer $1

while [[ -z "$(vmiut info $1 | grep ip-possible= | cut -c 13- )" ]];
do
    sleep 1
done

ipMachine=$(vmiut info $1 | grep ip-possible= | cut -c 13- )

echo "Répondre yes et insérer le mot de passe utilisateur  afin de continuer l'installation lorsque le terminal vous le demandera"

ssh-copy-id user@$ipMachine

scp 