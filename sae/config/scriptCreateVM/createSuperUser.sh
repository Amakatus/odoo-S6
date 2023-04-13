#!/bin/bash

echo Entrer le mot de passe du compte admin "(" Attention vous en aurez besoin un peu plus tard")"

su - postgres -c '\x' -c "createuser -P -s admin"
