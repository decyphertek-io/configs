sudo apt-get update && sudo apt-get upgrade -y
curl -fsSL https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo su -c "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -" 
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt update
sudo apt-get install -y build-essential redis-server mongodb-org nodejs nginx python3 git
sudo npm install -g npm@latest
sudo systemctl enable mongod
sudo systemctl start mongod
sudo systemctl enable redis
sudo systemctl start redis
cd  /home/$USER/ 
git clone https://github.com/openhab/openhab-cloud.git
cd openhab-cloud
npm install bcrypt
npm install
redis-cli ping
config-production.json -> config.json
sudo node app.js


