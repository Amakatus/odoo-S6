apt-get install -y rsync

systemctl start rsync

ssh-keygen 

ssh-copy-id user@$1

rsync -r -za user@$1:dbsave/ ./