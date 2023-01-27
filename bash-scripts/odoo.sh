sudo apt update
sudo apt install -y python3-pip  
sudo -H python3 -m pip install  xlwt num2words wkhtmltopdf
sudo apt install postgresql -y
wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/16.0/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list
sudo apt-get update && sudo apt-get -y install odoo
sudo systemctl status odoo
sudo vim /etc/odoo/odoo.conf

--------------------------

$ crontab -e
@reboot /usr/bin/bash /home/adminotaur/.pass.sh
@reboot /usr/bin/crontab -r

-------------------------

$ vim .pass.sh
sleep 60
ID=$(ec2metadata --instance-id)
hash=$(openssl passwd -6 '$ID')
sudo sed -i "s/decyphertek/$hash/g" /etc/odoo/odoo.conf
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/ssl/private/self-signed-key.pem -out /etc/ssl/certs/self-signed-crt.pem -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl restart odoo
