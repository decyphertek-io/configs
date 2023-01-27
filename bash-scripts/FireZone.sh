
$ sudo vim /opt/firezone/start.sh

sleep 20
sudo firezone-ctl reconfigure
sudo firezone-ctl restart

$ crontab -e
@reboot /usr/bin/sudo /usr/bin/bash /opt/firezone/start.sh


# at first login run
$ sudo firezone-ctl create-or-reset-admin

-------------
# Just install firezone and firewall rules, setup crontab, remove stubby and ufw. 
# This should fix all the issues that I am running into, it appears to work after shutdoen now, tunnels need to be recreated. 

version 0.6.5

Instructions:
* Note: Startup script takes a couple of minutes to configure the system , if https://ip-of-server is not available , please wait a few minutes. 
* SSH Into Server
$ ssh adminotaur@ip-of-server
* Generate a random password to login. 
$ sudo firezone-ctl create-or-reset-admin
* See terminal output
Email:  firezone@localhost
Password: see terminal output
* Login to firezone with the credentials generated. 
https://ip-of-server
* Recommended to create a new user, promote to admin, and delete the local admin. 
> Login > Users > Add User > add email and password > promote user > Logout
> Login > Users > click on firezone@localhost > delete user
* Add VPN Tunnel 
> Login >  Users > click on new user created > Add Device > change parameters if desired > generate configuration > download or scan QR code
* See Documentation regarding using Wireguard VPN. 
Client Instructions - https://docs.firezone.dev/user-guides/client-instructions/
Wireguard - https://www.wireguard.com/install/#installation
* Secure Your Admin Account with MFA
> Login > Account > Multifactor Authentication > Add MFA Method > use MFA APP ( Google Authenticator , Authy, Etc.)
* Optional: Enable SSO 
SSO Authentication - https://docs.firezone.dev/authenticate/
* Information: ports & protocols. 
Nginx 443/tcp - all Public HTTPS port for administering Firezone and facilitating authentication. 
Nginx 80/tcp - all Public HTTP port used for ACME. Disabled when ACME is disabled. ( Disabled )
WireGuard 51820/udp - all Public WireGuard port used for VPN sessions.
Postgresql 15432/tcp - 127.0.0.1 Local-only port used for bundled Postgresql server.
Phoenix 13000/tcp - 127.0.0.1 Local-only port used by upstream elixir app server.




