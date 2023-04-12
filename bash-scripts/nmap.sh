sudo nmap -sn 192.168.0.0/16 -oG - | awk '/Up$/{print $2}' > ips.txt
sudo nmap -O --osscan-limit -iL livehosts.txt -oX livehosts-OS.xml 
xsltproc livehosts-OS.xml -o livehosts-OS.html
