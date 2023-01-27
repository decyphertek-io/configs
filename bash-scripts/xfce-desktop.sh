sudo apt install -y task-xfce-desktop xrdp
sudo systemctl get-default
sudo systemctl set-default graphical.target
sudo reboot

-------------------
Alternatively: ( Issues here installs crapware, maybe the answer to ROS2 not working right)

sudo apt install -y xubuntu-desktop xrdp
sudo systemctl get-default
sudo systemctl set-default graphical.target
sudo reboot



---------------------------
Manage Password
# Set password 
$ sudo passwd adminotaur 
# Remove Password
$ sudo passwd -l adminotaur

###References###
https://linuxiac.com/how-to-change-remove-disable-user-password-in-linux/

--------------

ISSUES: ( Asks for password to manage color?)

$ sudo vim /etc/polkit-1/localauthority/50-local.d/allow-color.pkla
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
$ sudo vim /etc/polkit-1/localauthority/50-local.d/update-color.pkla
[Allow Package Management all Users]
Identity=unix-user:*
Action=org.freedesktop.packagekit.system-sources-refresh
ResultAny=yes
ResultInactive=yes
ResultActive=yes


###References###
https://askubuntu.com/questions/1157950/xrdp-ubuntu-problem#1177339


