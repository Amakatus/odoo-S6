#!/bin/bash
echo ETAPE MANUELLE: entrer les commandes présentes dans la procèdure ou ci après
echo Veuillez entrer le mot de passe du super utilisateur postgres "(" Attention cette utilisateur aura tous les droits sur les bases de données, donnez lui un mot de passe robuste")"
echo createuser -P -s admin
echo Apr'ès avoir entré le mot de passe appuyé sur "CTRL+D"
su - postgres 