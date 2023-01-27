sudo apt install auditd audispd-plugins
sudo su -c "curl 'https://raw.githubusercontent.com/Neo23x0/auditd/master/audit.rules' >> /etc/audit/rules.d/audit.rules"
sudo su -c "curl 'https://raw.githubusercontent.com/Neo23x0/auditd/master/audit.rules' >> /etc/audit/audit.rules"
sudo systemctl enable auditd
sudo systemctl restart auditd
sudo systemctl status auditd