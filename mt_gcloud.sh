#!/bin/bash
############## start of script ##############

YOUR_IP=$(curl https://ipinfo.io/ip)
sudo adduser  --gecos "" user3
sudo usermod -aG sudo user3
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service ssh restart
read -p "

## if you don't have SSH Keys - in client computer, run:

ssh-keygen -f ~/.ssh/id_rsa &&

## Then, copy the SSH Keys to your new GCloud Server:

ssh-copy-id -i ~/.ssh/id_rsa.pub user3@$YOUR_IP 

## if you have a mac, install ssh-copy-id:

curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh &&
sh

<press any key to continue...>

"

# restore sshd_config to original and restart service
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo service ssh restart
exit

############## end of script ############## 

