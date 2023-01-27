$ crontab -e
@reboot /usr/bin/bash /home/adminotaur/.refresh.sh
@reboot /usr/bin/crontab -r


---------------------------------------------------

$ vim .refresh.sh
sleep 60
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/self-signed-key.pem -out /etc/ssl/certs/self-signed-crt.pem -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo systemctl daemon-reload
sudo systemctl restart nginx




