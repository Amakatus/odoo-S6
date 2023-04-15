#!/bin/bash

cp ./config/scriptCreateVM/save.sh ./

touch /etc/cron.d/sauvegarde

echo "55 23 * * * user ./save.sh" >> /etc/cron.d/sauvegarde
echo "55 5 * * * user ./save.sh" >> /etc/cron.d/sauvegarde
echo "55 11 * * * user ./save.sh" >> /etc/cron.d/sauvegarde
echo "55 17 * * * user ./save.sh" >> /etc/cron.d/sauvegarde