
$ crontab -e
@reboot /usr/bin/bash /home/adminotaur/.pass.sh
@reboot /usr/bin/crontab -r

---------------------
Example: PBKDF2$sha512$100000$4u3hL8krvlMIS0KnCYXeMw==$G7c7tuUYq2zSJaUeruvNL/KF30d3TVDORVD56wzvJYmc3muWjoaozH8bHJ7r8zY8dW6Pts2bWyhFfkb/ubQZsA==
"PBKDF2$" + "sha512$" + "1000$" + "base64.salt" + "$" + "base64.hash"
	
algo="PBKDF2$" 
hashed="sha512$"  
int="1000$"  
money="$"
ID=$(ec2metadata --instance-id)
hash=$(openssl passwd -6 "$ID")
salt=$(openssl passwd -6 "chirpstack")
b64hash=$(echo -n "$hash" | openssl enc -base64)
b64salt=$(echo -n "$salt" | openssl enc -base64)
pass="$algo$hashed$int$b64salt$money$b64hash"
sudo -u postgres psql -d chirpstack_as -c "UPDATE public."user" SET password_hash= '$pass' WHERE email='admin'"

---------------------------------------------------
algo="PBKDF2$" 
hashed="sha512$"  
int="1000$"  
money="$"
ID=$(ec2metadata --instance-id)
salt="4u3hL8krvlMIS0KnCYXeMw==$"
hash=$(openssl passwd -6 '$ID')
b64hash=$(echo -n "$hash" | openssl enc -base64)
pass="$algo$hashed$int$salt$b64hash"
sudo -u postgres psql -d chirpstack_as -c "UPDATE public."user" SET password_hash= '$pass' WHERE email='adminotaur@decyphertek.io'"
-----------------------

$ vim .pass.sh
sleep 60
export ID=$(ec2metadata --instance-id)
sudo -u postgres psql -c "ALTER ROLE chirpstack_as WITH password '$ID'"
sudo -u postgres psql -c "ALTER ROLE chirpstack_ns WITH password '$ID'"
sudo sed -i "s/dbpassword/$ID/g" /etc/chirpstack-application-server/chirpstack-application-server.toml
sudo sed -i "s/decyphertek/$ID/g" /etc/chirpstack-application-server/chirpstack-application-server.toml
sudo sed -i "s/dbpassword/$ID/g" /etc/chirpstack-network-server/chirpstack-network-server.toml
sudo openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/chirpstack-application-server/certs/http-key.pem -out /etc/chirpstack-application-server/certs/http.pem -subj "/C=US/ST=Any/L=Anytown/O=decyphertek-io/OU=adminotaur/CN=decyphertek"
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl restart chirpstack-application-server
sudo systemctl restart chirpstack-network-server

----------------
export ID=$(ec2metadata --instance-id)
export pass=$(openssl passwd -6 "$ID")
sudo -u postgres psql -d chirpstack_as -c "UPDATE public."user" SET password_hash='$pass' WHERE email='admin'"
sudo -u postgres psql -d chirpstack_as -c "UPDATE public."user" SET password_hash='$pass' WHERE email='adminotaur@decyphertek.io'"
adminotaur@decyphertek.io
-------------------------------------------------------------------

https://drihu.com/blog/how-to-connect-to-postgresql-with-psql
https://quickref.me/postgres
sudo su - postgres -c psql -c "SELECT 1"

sudo su - postgres -c psql -d chirpstack_as -c "UPDATE "user" SET password_hash= 'right' WHERE email='admin'"

sudo -u postgres psql -d chirpstack_as -c "UPDATE "user" SET password_hash= 'right' WHERE email='admin'"

sudo -u postgres psql -c "ALTER TABLE user ALTER COLUMN password_hash SET DEFAULT 'test'"
sudo -u postgres psql -c "ALTER TABLE user MODIFY password_hash datatype 'test'";

ALTER TABLE links 
ALTER COLUMN target
SET DEFAULT '_blank';

ALTER USER { role_specification | ALL } [ IN DATABASE database_name ] SET configuration_parameter { TO | = } { value | DEFAULT }

 psql -h localhost -U loraserver_as -W loraserver_as
Password for user loraserver_as:
loraserver_as=> select * from user;
current_user

loraserver_as

UPDATE "user" SET password_hash= 'test' WHERE username='admin';


---------------------------

$ vim reverse.sh
export ID=$(ec2metadata --instance-id)
sudo -u postgres psql -c "ALTER ROLE chirpstack_as WITH password 'dbpassword'"
sudo -u postgres psql -c "ALTER ROLE chirpstack_ns WITH password 'dbpassword'"
sudo sed -i "s/$ID/dbpassword/g" /etc/chirpstack-application-server/chirpstack-application-server.toml
sudo sed -i "s/$ID/decyphertek/g" /etc/chirpstack-application-server/chirpstack-application-server.toml
sudo sed -i "s/$ID/dbpassword/g" /etc/chirpstack-network-server/chirpstack-network-server.toml
sudo systemctl daemon-reload
sudo systemctl restart chirpstack-application-server
sudo systemctl restart chirpstack-network-server