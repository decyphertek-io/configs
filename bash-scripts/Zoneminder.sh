sudo apt update
sudo apt-get install tasksel
sudo tasksel install lamp-server
sudo add-apt-repository ppa:iconnor/zoneminder-1.34
sudo apt update && sudo apt upgrade -y
sudo rm /etc/mysql/my.cnf 
sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
sudo su -c "echo 'sql_mode = NO_ENGINE_SUBSTITUTION' >> /etc/mysql/my.cnf"
sudo systemctl restart mysql
sudo apt-get install zoneminder
sudo chmod 740 /etc/zm/zm.conf 
sudo chown root:www-data /etc/zm/zm.conf 
sudo chown -R www-data:www-data /usr/share/zoneminder/
sudo a2enmod cgi
sudo a2enmod rewrite
sudo a2enconf zoneminder
sudo a2enmod expires
sudo a2enmod headers
sudo systemctl enable zoneminder
sudo systemctl start zoneminder


