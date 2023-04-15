#!/bin/bash

echo Attention
echo Changement du mot de passe user de la machine $1

sudo passwd user

echo Attention
echo Changement du mot de passe root de la machine $1

sudo passwd