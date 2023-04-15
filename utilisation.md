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

### 1) Utilisation du script `installVM.sh`

Ce script sert à créer les machines virtuelles nécéssaires à l'architecture finale.

```bash
./installVM.sh
```

Il faut ensuite renseigner :
 - Le `nom` et l'`ip` de la machine **base de données**.
 - Le `nom` et l'`ip` de la machine **de sauvegarde**.
 - Le `nom` et l'`ip` de la machine **Odoo** (Qui accueillera aussi le reverse proxy)

### 2) Utilisation du script `createClient.sh`

Ce script sert à créer un client il se lance de la manière suivante :

```bash
./createClient.sh
```

Il faut ensuite renseigner le `nom` et son `mot de passe` du client ainsi que le `port` utilisé.

### 3) Utilisation du script `reset.sh` 

Ce script permets de reset la configuration afin de repartir de zéro en cas d'erreur par exemple.
```bash
./reset.sh
```


Entrer le mot de passe du compte postgres admin:
admin
Saisir le mot de passe pour le nouveau rôle :
Saisir le mot de passe à nouveau :


Enter file in which to save the key (/root/.ssh/id_rsa):
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:

VBoxManage: error: The machine 'odooT' is already locked by a session (or being locked or unlocked)
VBoxManage: error: Details: code VBOX_E_INVALID_OBJECT_STATE (0x80bb0007), component MachineWrap, interface IMachine, callee nsISupports
VBoxManage: error: Context: "LaunchVMProcess(a->session, sessionType.raw(), ComSafeArrayAsInParam(aBstrEnv), progress.asOutParam())" at line 726 of file VBoxManageMisc.cpp
VBoxManage: error: The machine 'odooT' is already locked by a session (or being locked or unlocked)
VBoxManage: error: Details: code VBOX_E_INVALID_OBJECT_STATE (0x80bb0007), component MachineWrap, interface IMachine, callee nsISupports
VBoxManage: error: Context: "LaunchVMProcess(a->session, sessionType.raw(), ComSafeArrayAsInParam(aBstrEnv), progress.asOutParam())" at line 726 of file VBoxManageMisc.cpp

Il ne reste plus qu'à faire ssh tunnel

Puis d'aller sur internet