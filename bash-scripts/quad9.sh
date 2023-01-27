sudo add-apt-repository universe && sudo apt update
sudo apt install -y stubby resolvconf network-manager lynx
sudo mv /etc/stubby/stubby.yml /etc/stubby/stubby.backup.yml && sudo wget -O /etc/stubby/stubby.yml https://support.quad9.net/hc/en-us/article_attachments/4411087149453/stubby.yml
sudo systemctl enable --now resolvconf.service
sudo su -c "echo 'nameserver 127.0.0.1' >> /etc/resolvconf/resolv.conf.d/head"
sudo resolvconf -u
sudo systemctl restart systemd-resolved.service && sudo systemctl restart network-manager
sudo service stubby restart