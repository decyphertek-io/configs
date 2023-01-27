sudo apt update && sudo apt upgrade -y
sudo su -c "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - 
sudo apt-get install -y nodejs build-essential 
sudo npm install -g --unsafe-perm node-red
sudo npm install -g --unsafe-perm pm2
sudo npm install bcryptjs
pm2 start node-red
pm2 save 
pm2 startup
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u adminotaur --hp /home/adminotaur
sudo systemctl enable pm2-adminotaur.service
sudo ufw allow 1880
mkdir /home/$USER/.node-red/keys
openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /home/$USER/.node-red/keys/private-ssl.key -out /home/$USER/.node-red/keys/private-ssl.crt -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
curl 'https://raw.githubusercontent.com/decyphertek-io/configs/main/settings.js' >> /home/adminotaur/.node-red/settings.js
sudo systemctl daemon-reload