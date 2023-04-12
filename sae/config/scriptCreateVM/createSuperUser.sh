#!/bin/bash

su postgres

cd

echo Veuillez entrer le mot de passe du super utilisateur postgres "(" Attention cette utilisateur aura tous les droits sur les bases de données, donnez lui un mot de passe robuste")"

createuser -P -s admin