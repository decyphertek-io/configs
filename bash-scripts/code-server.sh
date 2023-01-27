sudo apt-get install -y build-essential pkg-config python3
sudo su -c "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - 
sudo apt-get install -y nodejs 
mkdir ~/.npm
npm config set prefix ~/.npm
export PATH="$PATH:$HOME/.npm/bin"
source ~/.bashrc
npm install -g npm@latest
npm install --global code-server --unsafe-perm
npm install -g pm2@latest
npm install -g minimist@latest
npm install -g yazl@latest
npm install -g yauzl@latest
npm install -g @microsoft/1ds-core-js@latest
pm2 start code-server  -- --port 8081
pm2 save 
pm2 startup