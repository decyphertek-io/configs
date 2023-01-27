# use nginx Build 
sudo apt install -y mysql-server php-mysql php-fpm php-curl php-gd php-mbstring php-xml php-xmlrpc php-cli
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'installer-checksum') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
php composer.phar
composer