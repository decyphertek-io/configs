sudo apt update && sudo apt upgrade 
sudo su -c "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - 
sudo apt-get install -y nodejs 
sudo npm install -g configurable-http-proxy
sudo apt install -y python3-pip  
sudo -H python3 -m pip install numpy scipy matplotlib pandas
sudo -H python3 -m pip install importlib-metadata zipp -U
sudo -H python3 -m pip install jupyterhub jupyterlab notebook PyJWT oauthenticator 
sudo mkdir /etc/jupyterhub/
cd /etc/jupyterhub/
sudo jupyterhub --generate-config
sudo su -c "curl 'https://raw.githubusercontent.com/decyphertek-io/configs/main/jupyterhub_config.py' >> /etc/jupyterhub/jupyterhub_config.py"
sudo chmod 700 /etc/ssl/private
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/private-ssl.key -out /etc/ssl/certs/private-ssl.crt -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo su -c "curl 'https://raw.githubusercontent.com/decyphertek-io/configs/main/jupyterhub.service' >> /etc/systemd/system/jupyterhub.service"
sudo systemctl enable jupyterhub
sudo systemctl start jupyterhub
sudo systemctl status jupyterhub
http://13lrwqpebzya.users.rport.io:80