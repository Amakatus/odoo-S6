#!/bin/bash
apt-get install -y rsync

systemctl start rsync

apt-get install -y postgresql

#echo "host    all     all     $2/24       md5" >> /etc/postgresql/13/main/pg_hba.conf
#echo "host    all     all     $3/24       md5" >> /etc/postgresql/13/main/pg_hba.conf

sed -i -e "s/#listen_addresses.=.'localhost'/listen_addresses = 'localhost,$1,$2,$3'/g" /etc/postgresql/13/main/postgresql.conf

systemctl restart postgresql

mkdir /home/user/dbsave

touch .pgpass

chmod 0600 .pgpass

mv .pgpass /var/lib/postgresql/