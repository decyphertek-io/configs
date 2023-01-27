sudo apt update && sudo apt upgrade -y 
sudo apt install -y lsb-core cron
sudo systemctl enable cron
sudo hostnamectl set-hostname "decyphertek"
sudo su -c "echo '127.0.1.1 decyphertek' >> /etc/hosts"
# Debian
sudo vim /etc/cloud/templates/hosts.debian.tmpl
sudo rm -rf /etc/hostname
sudo su -c "echo 'decyphertek' >> /etc/hostname"
(sudo crontab -l ; echo "@reboot /usr/bin/hostnamectl set-hostname decyphertek")| sudo crontab -
# Debian 11 , need to check this as well.
sudo vim /etc/cloud/templates/hosts.debian.tmpl


