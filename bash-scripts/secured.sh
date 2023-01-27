# Crowdsec install
curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh | sudo bash
sudo apt install -y crowdsec crowdsec-firewall-bouncer-iptables
sudo systemctl enable crowdsec
sudo systemctl start crowdsec
sudo systemctl reload crowdsec
sudo systemctl status crowdsec
# UFW Install
sudo apt install -y ufw
sudo ufw limit 22/tcp
sudo ufw enable
sudo ufw status verbose
# Unattended upgrades Install
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
# Quad9 Install
sudo add-apt-repository -y universe && sudo apt update 
sudo apt install -y stubby resolvconf network-manager lynx
sudo mv /etc/stubby/stubby.yml /etc/stubby/stubby.backup.yml && sudo wget -O /etc/stubby/stubby.yml https://support.quad9.net/hc/en-us/article_attachments/4411087149453/stubby.yml
sudo systemctl enable --now resolvconf.service
sudo su -c "echo 'nameserver 127.0.0.1' >> /etc/resolvconf/resolv.conf.d/head"
sudo resolvconf -u
sudo systemctl restart systemd-resolved.service && sudo systemctl restart network-manager
sudo service stubby restart
# Auditd Install
sudo apt install -y auditd audispd-plugins
sudo su -c "curl 'https://raw.githubusercontent.com/Neo23x0/auditd/master/audit.rules' >> /etc/audit/rules.d/audit.rules"
sudo su -c "curl 'https://raw.githubusercontent.com/Neo23x0/auditd/master/audit.rules' >> /etc/audit/audit.rules"
sudo systemctl enable auditd
sudo systemctl restart auditd
sudo systemctl status auditd