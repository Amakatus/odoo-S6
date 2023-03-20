## Créer odoo et BD

Regarder procèdure SAE précedente

## Postgres

```bash
(vm)root@matrix:~# apt-get install postgresql
```

```bash
(vm)root@matrix:~# systemctl status postgresql.service
```    
    
```bash
(vm)root@matrix:~# sudo -u postgres -i
```

```bash
(vm)postgres@matrix:~# createuser -d -r -l -P NOMUSER
Saisir le mot de passe pour le nouveau rôle : MDPUSER
Saisir le mot de passe à nouveau : MDPUSER
```

```bash
(vm)postgres@matrix:~# createdb -O NOMUSER NOMDB
```

```bash
(vm)user@matrix:~# psql -h localhost -U NOMUSER -d NOMDB
matrix => \d
```

!!! note Modifier les fichier pg_hba.conf et postgresql.conf

```bash
root@db:~# nano /etc/postgresql/13/main/pg_hba.conf 
```

Ajouter cette ligne à la fin :

```conf
    host    all     all     192.168.194.17/24        md5
```

 ```bash
root@db:~# nano /etc/postgresql/13/main/postgresql.conf 
```

# A MODIFIER PLUS TARD
Modifier la ligne listen_addresses :
```conf
listen_addresses = '0.0.0.0'          # what IP address(es) to listen on;
```
    

```bash
root@db:~# systemctl restart postgres
```

## Odoo

Allez à la racine /

```bash
root@odoo:~/# mkdir docker-compose
root@odoo:~/# cd docker-compose
root@odoo:/docker-compose# touch docker-compose.yml
root@odoo:/docker-compose# touch mdp
root@odoo:/docker-compose# mkdir config
root@odoo:/docker-compose# mkdir odoo-data
```

Dans docker-compose.yml mettre:
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

Allez dans config:
```bash
root@odoo:~/# cd config
root@odoo:/docker-compose/config# touch odoo.conf
root@odoo:/docker-compose/config# nano odoo.conf
```

```bash
[options]
admin_passwd = MDPADMIN
db_host = 192.168.194.16
db_port = 5432
db_user = NOMUSER
db_password = MDPUSER
db_name = NOMDB
```

revenir dans docker-compose

```bash
docker compose run web -i NOMDB
```
