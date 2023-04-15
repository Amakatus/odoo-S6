#!/bin/bash

apt-get install -y rsync

systemctl start rsync

echo Attention génération du paire de clé ssh
echo Attention génération du paire de clé ssh
echo Attention génération du paire de clé ssh
echo Attention génération du paire de clé ssh

ssh-keygen 

ssh-copy-id user@$1

cp ./config/scriptCreateVM/rsync.sh ./

touch /etc/cron.d/syncro

echo "0 0 * * * user ./rsync.sh" >> /etc/cron.d/syncro
echo "0 6 * * * user ./rsync.sh" >> /etc/cron.d/syncro
echo "0 12 * * * user ./rsync.sh" >> /etc/cron.d/syncro
echo "0 18 * * * user ./rsync.sh" >> /etc/cron.d/syncro
