#!/bin/bash

for nom in $(cat ./config/nom/nomVM.txt)
do
    vmiut supprimer $nom
donec