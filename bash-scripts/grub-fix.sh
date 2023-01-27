sudo apt-get purge grub\*
sudo apt-get install -y grub-efi grub-efi-amd64-bin
sudo apt-get autoremove -y
sudo update-grub
sudo apt update && sudo apt upgrade -y
sudo reboot