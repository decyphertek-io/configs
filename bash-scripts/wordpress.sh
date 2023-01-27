# This sets password cookies , need to delete exisitng one and test on reoot. 
sudo su -c "curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/wordpress/wp-config.php"
sudo sed -i "s/decyphertek/$ID/g" /var/www/wordpress/wp-config.php


# remove annoying ^M from VIM
:e ++ff=dos 



