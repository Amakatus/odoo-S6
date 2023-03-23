## - Machine virtuelle db -

### Creation de la machine virtuelle db 

```bash
(virtu)utilisateur@acajou12:~$ vmiut creer db
```

### Configuration de db

!!! note Interface réseau : Modification de l'adresse ip

    ```bash
    root@vm#  ifdown enp0s3
    ```

    ```bash
    root@vm# nano /etc/network/interfaces
    ```
        iface enp0s3 inet static
            address 192.168.194.5/24
            gateway 192.168.194.2
    
    ```bash
    root@vm# ifup enp0s3
    root@vm# reboot
    ```


```bash
(virtu)utilisateur@acajou12:~$ ssh user@192.168.194.5
```

```bash
(vm)user@vm# su -l
```

!!! note Proxy : Configuration du proxy

    ```bash
    (vm)root@debian : nano /etc/environment
    ```
        HTTP_PROXY=http://cache.univ-lille.fr:3128
        HTTPS_PROXY=http://cache.univ-lille.fr:3128
        http_proxy=http://cache.univ-lille.fr:3128
        https_proxy=http://cache.univ-lille.fr:3128
        NO_PROXY=localhost,192.168.194.3

```bash
(vm)root@debian: reboot
(vm)root@debian: apt update && apt full-upgrade
```

!!! note Installation de sudo + permissions sudo à user
    ```bash
    (vm)root@debian:~# apt-get install sudo
    ```

    ```bash
    (vm)root@debian:~# usermod -aG sudo user
    ```

    ```bash
    (vm)root@debian:~# reboot
    ```

!!! note NTP : Configuration et mise à jour de la date
    
    ```bash
    (vm)root@debian:~# nano /etc/systemd/timesyncd.conf
    ```
        [Time]
        NTP=ntp.univ-lille.fr
        FallbackNTP=0.debian.pool.ntp.org 1.debian.pool.ntp.org 2.debian.pool.ntp.org 3>
        RootDistanceMaxSec=5
        PollIntervalMinSec=32
        PollIntervalMaxSec=2048
    
    ```bash
    (vm)root@debian:~# systemctl restart systemd-timesyncd.service
    ```

!!! note Nom hôte et fichier de résolution : Modification des fichiers hostname et hosts (debian -> db)

    ```bash
    (vm)root@debian:~# nano /etc/hostname
    ```
    
    ```bash
    (vm)root@debian:~# nano /etc/hosts 
    
    ```                         
        127.0.0.1       localhost
        127.0.1.1       db
        192.168.194.3   matrix
        192.168.194.4   rproxy
        192.168.194.6   element
    ```     