
# run crontab as adminotaur user , not root. 
# Set the script to run on reboot , then delete itself. 
@reboot /usr/bin/bash /home/adminotaur/pass.sh
@reboot /usr/bin/rm -rf /home/adminotaur/pass.sh
@reboot /usr/bin/crontab -r

----------------------------------

ID=$(ec2metadata --instance-id)
sed -i "s/decyphertek/$ID/g" /home/adminotaur/caldera/conf/default.yml
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/private-ssl.key -out /etc/ssl/certs/private-ssl.crt -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo cat /etc/ssl/certs/private-ssl.crt /etc/ssl/private/private-ssl.key > /home/adminotaur/caldera/plugins/ssl/conf/secured_certificate.pem


--------------------------

# Reverses the change / Test
ID=$(ec2metadata --instance-id)
sed -i "s/$ID/decyphertek/g" /home/adminotaur/caldera/conf/default.yml

-----------------------------

# Hash your pass, not readable or recoverable, how does this work?
openssl passwd -6 "plainpassword"

--------------

logo - https://raw.githubusercontent.com/decyphertek-io/configs/main/Logos/caldera-logo-aws.png

