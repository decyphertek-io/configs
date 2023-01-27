sudo apt install ufw
sudo ufw limit 22/tcp
sudo ufw allow https
sudo ufw enable
sudo ufw status verbose
