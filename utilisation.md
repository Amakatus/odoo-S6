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

- Si le terminal affiche :
```bash
[yes/no/fingerprint]
```
Il faudra rentrer la lettre `yes` afin d'accepter la copie de la clé ssh.

- Information:

Le message si dessous va s'afficher plusieurs fois lors de l'instalation: ne stoppez pas l'installation

```bash
VBoxManage: error: The machine 'odooT' is already locked by a session (or being locked or unlocked)
VBoxManage: error: Details: code VBOX_E_INVALID_OBJECT_STATE (0x80bb0007), component MachineWrap, interface IMachine, callee nsISupports
VBoxManage: error: Context: "LaunchVMProcess(a->session, sessionType.raw(), ComSafeArrayAsInParam(aBstrEnv), progress.asOutParam())" at line 726 of file VBoxManageMisc.cpp
```

- Attention:

Il est possible que lors de l'installation vboxmanage n'arrive pas à attribuer une adresse IP. Il faudra alors lancer le script `reset.sh` afin de tout supprimer et ensuite `installVM.sh`  pour recommencer l'installation.
Le même problème peut survenir après le changement d'ip. Le redémarrage effectué par vbox est trop long et/ou ne s'effectue pas correctement donc la connexion ssh n'arrive pas à se faire. Il faudra alors réaliser les mêmes étapes précèdement cités.

### 1) Utilisation du script `installVM.sh`

Ce script sert à créer les machines virtuelles nécéssaires à l'architecture finale.

```bash
./installVM.sh
```

Il faut ensuite renseigner :
 - Le `nom` de votre machine **Physique**
 - Le `nom` et l'`ip` de la machine **base de données**.
 - Le `nom` et l'`ip` de la machine **de sauvegarde**.
 - Le `nom` et l'`ip` de la machine **Odoo** (Qui accueillera aussi le reverse proxy)

Lors de la création de la 2e machiné, une clé SSH sera généré. Les messages suivant vont s'afficher:

```bash
Enter file in which to save the key (/root/.ssh/id_rsa):        --> `Presser Entrer`
Enter passphrase (empty for no passphrase):                     --> `Entrer la passphrase de votre choix`
Enter same passphrase again:                                    --> `Réécrire cette passphrase`
```

### 2) Utilisation du script `createClient.sh`

Ce script sert à créer un client il se lance de la manière suivante :

```bash
./createClient.sh
```

Il faut ensuite renseigner le `nom` et son `mot de passe` du client ainsi que le `port` utilisé.

### 3) Connexion à odoo

Pour pouvoir se connecter aux différentes instances de odoo précèdement créé, lancez la commande suivante dans le terminal:

```bash
ssh tunnel
```

 - Dans un navigateur internet, vous pouvez désormais accèder aux différentes instances d'odoo.

nomClient.nomMachinePhysique.iutinfo.fr:9091

`nomClient` est le nom du client renseigné lors de la création de ce dernier

`nomMachinePhysique` est le nom de votre machine physique (ou virtuelle) renseigné au début de l'installation

 - Vous pouvez égalament accéder au dashboard traefik à l'adresse suivante:

 nomMachinePhysique.iutinfo.fr:9090

`nomMachinePhysique` est le nom de votre machine physique (ou virtuelle) renseigné au début de l'installation




### 4) Utilisation du script `reset.sh` 

Ce script permets de reset la configuration afin de repartir de zéro en cas d'erreur par exemple.
```bash
./reset.sh
```