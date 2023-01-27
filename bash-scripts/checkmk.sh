
sleep 60
ID=$(ec2metadata --instance-id)
sudo -u 'monitoring' htpasswd -mb /omd/sites/monitoring/etc/htpasswd cmkadmin $ID

-------------------------------------------------------------------
          
@reboot /usr/bin/sudo /usr/bin/bash /opt/omd/pass.sh 
@reboot /usr/bin/crontab -r


