sudo apt update
sudo su -c "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - 
sudo apt-get install -y nodejs 
mkdir ~/.npm
npm config set prefix ~/.npm
export PATH="$PATH:$HOME/.npm/bin"
source ~/.bashrc
npm install -g npm@latest
sudo setcap cap_net_bind_service=+ep /usr/bin/node
mkdir meshcentral && cd meshcentral
npm install meshcentral
sudo npm install -g pm2
pm2 start /home/$USER/meshcentral/node_modules/meshcentral
pm2 save 
pm2 startup

# By default, MeshCentral will use TCP ports 80 (HTTP), 443 (HTTPS) and 4433 (Intel® AMTCIRA). 