sudo apt update && sudo apt upgrade -y
sudo apt-get install -y python3 python3-dev python3-venv python3-pip bluez libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0-dev tzdata
sudo useradd -rm homeassistant
sudo mkdir /srv/homeassistant
sudo chown homeassistant:homeassistant /srv/homeassistant
sudo -u homeassistant -H -s 

# have to run this once you change users
cd /srv/homeassistant
python3 -m venv . 
source bin/activate
python3 -m pip install wheel
pip3 install homeassistant
hass