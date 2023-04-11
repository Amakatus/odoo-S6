#!/bin/bash

apt-get install -y postgresql

echo "host    all     all     192.168.194.17/24        md5" >> /etc/postgresql/13/main/pg_hba.conf

sed -i -e "s/#listen_addresses.=.'localhost'/listen_addresses = '0.0.0.0'/g" /etc/postgresql/13/main/postgresql.conf

systemctl restart postgresql

mkdir /home/user/dbsave