---
title: Utilisation des divers scripts
author: Sacha BOUTON et Clement DELERUE
---

## Préambule)

Pour tous les procédures, il y aura des intéractions utilisateurs : 
- Si le terminal affiche :
```bash
user@ip password :
``` 
Il faudra rentrer le mot de passe `user`.
- Si le terminal affiche :
```bash
Password:
```
Il faudra rentrer le mot de passe `root`.
- Si le terminal affiche :
```bash
[Y/n]
```
Il faudra rentrer la lettre `Y` afin d'accepter l'installation.

### 1) Utilisation du script `createClient.sh`

Ce script sert à créer un client il se lance de la manière suivante :

```bash
./createClient.sh
```

Il faut ensuite renseigner le `nom` et son `mot de passe` du client ainsi que le `port` utilisé.

### 2) Utilisation du script `installVM.sh`

Ce script sert à créer les machines virtuelles nécéssaires à l'architecture finale.

```bash
./installVM.sh
```

Il faut ensuite renseigner :
 - Le `nom` et l'`ip` de la machine **base de données**.
 - Le `nom` et l'`ip` de la machine **de sauvegarde**.
 - Le `nom` et l'`ip` de la machine **Odoo** (Qui accueillera aussi le reverse proxy)

### 3) Utilisation du script `reset.sh` 

Ce script permets de reset la configuration afin de repartir de zéro en cas d'erreur par exemple.
```bash
./reset.sh
```