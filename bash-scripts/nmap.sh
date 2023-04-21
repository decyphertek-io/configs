#!/bin/sh
echo -n " What is the IP or CIDR ?  "
read -r IP
sudo nmap -sn $IP | awk '/Nmap scan/{gsub(/[()]/,"",$NF); print $NF > "livehosts.txt"}'
sudo nmap -sT -sV -sC -R -O --osscan-guess -iL livehosts.txt -oX livehosts-OS.xml 
xsltproc livehosts-OS.xml -o livehosts-OS.html
lynx /home/$USER/livehosts-OS.html