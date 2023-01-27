sudo apt update && sudo apt upgrade -y 
sudo hostnamectl set-hostname "decyphertek"
sudo su -c "echo '127.0.1.1 decyphertek' >> /etc/hosts"
sudo su -c "echo 'decyphertek' >> /etc/hostname"
sudo useradd -m adminotaur
#echo 'adminotaur:Decyphertek84!' | sudo chpasswd
sudo usermod -aG sudo adminotaur
sudo chsh -s /bin/bash adminotaur
echo 'adminotaur ALL=(ALL) NOPASSWD:ALL' | (sudo su -c 'EDITOR="tee" visudo -f /etc/sudoers.d/sudo-user')
sudo su - adminotaur
mkdir /home/adminotaur/.ssh
sudo cat /home/ubuntu/.ssh/authorized_keys
vim /home/adminotaur/.ssh/authorized_keys
# sudo chown -R adminotaur:adminotaur /home/adminotaur/.ssh/authorized_keys
(sudo crontab -l ; echo "@reboot /usr/bin/hostnamectl set-hostname decyphertek")| sudo crontab -

to fix the open ssl that is being reusued
# Not tested - Do not use yet.
(sudo crontab -l ; echo "@reboot /usr/bin/openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache.key -out /etc/ssl/certs/apache.crt")| sudo crontab -

           





