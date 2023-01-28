

lxd init --minimal
lxc launch images:ubuntu/22.04 lxd-dashboard
# If you are using UFW , make sure LXD can pass through the firewall. 
# need to troubleshoot firewall to allow traffic to pass
lxc exec lxd-dashboard /bin/bash


$ vim lxd.sh
apt update && apt install -y nginx wget php-fpm php-curl sqlite3 php-sqlite3 
wget https://github.com/lxdware/lxd-dashboard/archive/v3.4.0.tar.gz
tar -xzf v3.4.0.tar.gz
cp -a lxd-dashboard-3.4.0/default /etc/nginx/sites-available/
cp -a lxd-dashboard-3.4.0/lxd-dashboard /var/www/html/
mkdir -p /var/lxdware/data/sqlite
mkdir -p /var/lxdware/data/lxd
mkdir -p /var/lxdware/backups
chown -R www-data:www-data /var/lxdware/
chown -R www-data:www-data /var/www/html
systemctl restart nginx
$ exit

lxc profile create proxy-port-80
lxc profile device add proxy-port-80 hostport80 proxy connect="tcp:127.0.0.1:8080" listen="tcp:0.0.0.0:80"
lxc profile add lxd-dashboard proxy-port-80

# Optional: Allow public access
# lxc config set core.https_address :8443