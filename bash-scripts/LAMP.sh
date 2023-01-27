# Cockpit
sudo apt update && sudo apt upgrade -y
sudo apt-get install -y cockpit
sudo systemctl enable --now cockpit.socket
sudo ufw allow 9090
sudo username passwd
# use those creds to login. 
# https://server-ip:9090

# Apache
sudo apt install apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo ufw allow in "Apache"

# MySQL
sudo apt install mysql-server
sudo mysql_secure_installation
sudo mysql

# PHP
sudo apt install -y php libapache2-mod-php php-mysql phpmyadmin 
# http:-ip-of-server-:

# Go Access
wget https://tar.goaccess.io/goaccess-1.6.4.tar.gz $ tar -xzvf goaccess-1.6.4.tar.gz $ cd goaccess-1.6.4/ $ ./configure --enable-utf8 --enable-geoip=mmdb 
make 
make install


# Configure Apache
sudo mkdir /var/www/your_domain
sudo chown -R $USER:$USER /var/www/your_domain
sudo nano /etc/apache2/sites-available/your_domain.conf
<VirtualHost *:80>
    ServerName your_domain
    ServerAlias www.your_domain 
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/your_domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

sudo a2ensite your_domain
sudo a2dissite 000-default
sudo apache2ctl configtest
sudo systemctl reload apache2
nano /var/www/your_domain/index.html
<html>
  <head>
    <title>your_domain website</title>
  </head>
  <body>
    <h1>Hello World!</h1>

    <p>This is the landing page of <strong>your_domain</strong>.</p>
  </body>
</html>

# Stopped - A Note About DirectoryIndex on Apache

### References ###
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-22-04