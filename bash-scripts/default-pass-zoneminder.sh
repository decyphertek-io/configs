
x - 1. Change DB names to decyphertek, update script here to run @reboot
x - 2. Disable auth login GUI, have instructions to have user do it. 
x - 3. Instructions, list DB names and password.

# Alternatively - programactly change gui password, not sure if possible from bash script? 

------------------------------------------------------------------

export ID=$(ec2metadata --instance-id)
#ID=$(ec2metadata --instance-id)
sudo mysqladmin -u root -p'decyphertek' password ${ID}
sudo mysqladmin -u debian-sys-maint -p'decyphertek' password ${ID}
sudo mysqladmin -u zmuser -p'decyphertek' password ${ID}
sudo sed -i -r "s#^(ZM_DB_PASS=).*#\1$ID#" /etc/zm/zm.conf
sudo sed -i -r "s#^(password =).*#\1 $ID#" /etc/mysql/debian.cnf
sudo systemctl restart mysql
sudo systemctl restart zoneminder
# Update Gui Password
mysql -u root -p 
MySql> show databases;
MySql> use zm;
MySql> select * from Users;
MySql> update Users set Password="password" where Username="admin";
mysql> FLUSH PRIVILEGES;
mysql> exit

----------------------

# Zoneminder Login:
https:://ip-of-server/zm
no password set

# Set user password
Login > Options > Users
select admin > set new password
save
# Enable password authentication 
Login > Options > System >
OPT_USE_AUTH = Enable
save

# mysql Db Passwords
# how to find your instance ID
$ ec2metadata --instance-id
user: root pass: instance id
user: zmuser pass: instance id
user: debian-sys-maint pass: instance id

# find public IP via AWS Console or can run the following from terminal
$ dig +short myip.opendns.com @resolver1.opendns.com

# Docs that can help.
https://zoneminder.readthedocs.io/en/stable/userguide/gettingstarted.html
https://decyphertek.readthedocs.io/en/latest/#Zoneminder/

-----------------

@reboot /usr/bin/bash /home/adminotaur/pass.sh
@reboot /usr/bin/rm -rf /home/adminotaur/pass.sh
@reboot /usr/bin/crontab -r

------------------

ID=$(ec2metadata --instance-id)
sudo systemctl start mysql
sleep 30 
sudo mysqladmin -u root -p'decyphertek' password ${ID}
sudo mysqladmin -u debian-sys-maint -p'decyphertek' password ${ID}
sudo mysqladmin -u zmuser -p'decyphertek' password ${ID}
sudo sed -i -r "s#^(ZM_DB_PASS=).*#\1$ID#" /etc/zm/zm.conf
#sudo sed -i -r "s#^(password =).*#\1 $ID#" /etc/mysql/debian.cnf
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/private-ssl.key -out /etc/ssl/certs/private-ssl.crt -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo systemctl restart mysql
sudo systemctl restart zoneminder

---------------------

Reverse Copy

ID=$(ec2metadata --instance-id)
sudo systemctl start mysql
sleep 30 
sudo mysqladmin -u root -p${ID} password 'decyphertek'
sudo mysqladmin -u debian-sys-maint -p${ID} password 'decyphertek'
sudo mysqladmin -u zmuser -p${ID} password 'decyphertek'
sudo sed -i -r "s#^(ZM_DB_PASS=).*#\1decyphertek#" /etc/zm/zm.conf
#sudo sed -i -r "s#^(password =).*#\1 $ID#" /etc/mysql/debian.cnf
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/private-ssl.key -out /etc/ssl/certs/private-ssl.crt -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo systemctl restart mysql
sudo systemctl restart zoneminder

------------
 

 Test Cert AutoChange:

 cwR8s+nOR2Dsw3mbLFCzraIT8qYCHqbmJ0eBXUF77o0JsWH0k5vemaPXBD9pJmgg
UnwGJi1hlhU/3wbVuFHhSnQ1ulu4wwQneipy
-----END CERTIFICATE-----
