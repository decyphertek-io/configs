wget https://cdn.zabbix.com/zabbix/sources/stable/6.0/zabbix-6.0.12.tar.gz
tar -zxvf zabbix-6.0.0.tar.gz
sudo addgroup --system --quiet zabbix
sudo adduser --quiet --system --disabled-login --ingroup zabbix --home /var/lib/zabbix --no-create-home zabbix
sudo mkdir -m u=rwx,g=rwx,o= -p /var/lib/zabbix
sudo chown zabbix:zabbix /var/lib/zabbix
Stopped Here.....................................
