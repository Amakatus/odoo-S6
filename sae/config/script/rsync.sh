apt-get install -y rsync

systemctl start rsync

rsync -r -za user@192.168.194.16:dbsave/ ./