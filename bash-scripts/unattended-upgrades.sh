sudo apt update
sudo apt install  -y unattended-upgrades apt-listchanges
sudo systemctl enable unattended-upgrades
sudo systemctl start unattended-upgrades
sudo systemctl status unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades | echo "yes"
sudo su -c "curl 'https://raw.githubusercontent.com/decyphertek-io/configs/main/50unattended-upgrades' >> /etc/apt/apt.conf.d/50unattended-upgrades"
sudo apt install -y cron
sudo systemctl enable cron
sudo systemctl start cron
sudo systemctl status cron
(sudo crontab -l ; echo "30 3 * * * /usr/bin/unattended-upgrades -v")| sudo crontab -
