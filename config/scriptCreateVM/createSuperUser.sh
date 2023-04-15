#!/bin/bash

touch .secret

chmod 700 .secret

echo Entrer le mot de passe du compte postgres admin "(" Il faudra l'entrer 3 fois d'affilées ")"
echo Entrer le mot de passe du compte postgres admin "(" Il faudra l'entrer 3 fois d'affilées ")"
echo Entrer le mot de passe du compte postgres admin "(" Il faudra l'entrer 3 fois d'affilées ")"

echo "Entrer le mot de passe du compte postgres admin:" && read mdpAdmin

echo $mdpAdmin > .secret

su - postgres -c '\x' -c "createuser -P -s admin"
