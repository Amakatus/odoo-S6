	Tâches à faire SAE 

 1 - Machine Reverse proxy:
Configuration minimale (voir sae précédente)
installation est configuration de traefik
192.168.194.15/24

 2 - Machine base de données :
Configuration minimale (voir sae précédente)
Installation de postgres
192.168.194.16/24


3 - Machine Odoo :
Configuration minimale (voir sae précédente)
Installation de docker compose
Installation de odoo
192.168.194.17/24




Machine sauvegarde : 
Config minimale
copie les données de la base de données (dump des bases)
se renseigner sur rsync
192.168.194.18/24

Scripts d’automatisation



Dans Odoo
modifier le fichier ./config:/etc/odoo

[options]
admin_passwd = admin
db_host = 192.168.194.16
db_port = 5432
db_user = admin
db_password = admin

vmiut create odoo -d /home/public/vm/disque-bullseye-11.1-20go.vdi 


```bash
services:
  change-volume-owner:
    image: odoo:14.0
    user: root
    volumes:
      - ./odoo-data:/var/lib/odoo
    command: chown -R odoo:odoo /var/lib/odoo

  web:
    image: odoo:14.0
    ports:
      - "PORT:8069"
    volumes:
      - ./odoo-data:/var/lib/odoo  #odoo-data est un répertoire qui stockera les données
      - ./config:/etc/odoo #config contient un fichier odoo.conf avec la config
    environment:
      - PASSWORD_FILE=/run/secrets/postgresql_password
    secrets:
      - postgresql_password
    depends_on:
      change-volume-owner:
        condition: service_completed_successfully

secrets:
  postgresql_password:
    file: PASS_FILE #chemin vers le fichier mdp
```

docker compose run web -i base test

```bash
services:
  change-volume-owner:
    image: odoo:14.0
    user: root
    volumes:
      - ./odoo-data:/var/lib/odoo
    command: chown -R odoo:odoo /var/lib/odoo

  web:
    image: odoo:14.0
    ports:
      - "8069:8069"
    volumes:
      - ./odoo-data:/var/lib/odoo
      - ./config:/etc/odoo
    environment:
      - PASSWORD_FILE=/run/secrets/postgresql_password
    secrets:
      - postgresql_password
    depends_on:
      change-volume-owner:
        condition: service_completed_successfully

secrets:
  postgresql_password:
    file: ./mdp
```

```bash
services:
  change-volume-owner:
    image: odoo:14.0
    user: root
    volumes:
      - ./odoo-data:/var/lib/odoo
    command: chown -R odoo:odoo /var/lib/odoo

  web:
    image: odoo:14.0
    ports:
      - "8069:8069"
    volumes:
      - ./odoo-data:/var/lib/odoo
      - ./config:/etc/odoo
    depends_on:
      change-volume-owner:
        condition: service_completed_successfully
```




Script:
-Script lancement (créé 4 machines)
-script créé machine
-script odoo
-script docker
-script save
-script traefik



-----------------------------------------------------------------------

Créé un super utilisateur postgres admin

crée l'utilisateur et la base avant de lancer le client

faire les tunnels 

modifier save.sh
faire un pg dump all

