sudo apt update 
sudo su -c "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - 
curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
wget http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_amd64.deb
sudo dpkg -i libssl1.1_1.1.1n-0+deb11u3_amd64.deb
sudo apt update && sudo apt install -y nodejs mongodb-org git vim 
sudo systemctl enable mongod
sudo systemctl start mongod
sudo systemctl status mongod
mkdir ~/.npm
npm config set prefix ~/.npm
export PATH="$PATH:$HOME/.npm/bin"
source ~/.bashrc
npm install -g npm@latest
npm install -g yarn
git clone https://github.com/Lissy93/dashy.git && cd dashy
yarn 
yarn build 
yarn start 