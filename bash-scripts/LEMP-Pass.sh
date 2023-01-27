export ID=$(ec2metadata --instance-id)
sleep 60
sudo mysqladmin -u root -p'decyphertek' password ${ID}
sudo mysqladmin -u debian-sys-maint -p'decyphertek' password ${ID}
sudo mv /etc/mysql/debian.bak /etc/mysql/debian.cnf
sudo sed -i -r "s#^(password =).*#\1 $ID#" /etc/mysql/debian.cnf
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/self-signed-key.pem -out /etc/ssl/certs/self-signed-crt.pem -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo systemctl restart mysql

----------------------

$ crontab -e
@reboot /usr/bin/bash /home/adminotaur/.pass.sh
@reboot /usr/bin/crontab -r

-----------------------

reverse:

export ID=$(ec2metadata --instance-id)
sleep 60
sudo mysqladmin -u root -p${ID} password 'decyphertek'
sudo mysqladmin -u debian-sys-maint -p${ID} password 'decyphertek'
sudo mv /etc/mysql/debian.cnf /etc/mysql/debian.bak 
sudo sed -i -r "s#^(password =).*#\1 decyphertek#" /etc/mysql/debian.cnf
sudo systemctl restart mysql

------

$ crontab -e
@reboot /usr/bin/bash /home/adminotaur/.reverse.sh
@reboot /usr/bin/crontab -r