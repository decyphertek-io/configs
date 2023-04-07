sudo nmap -sn -Pn 192.168.0.0/24 | awk '/Nmap scan/{gsub(/[()]/,"",$NF); print $NF > "livehosts.txt"}'
sudo nmap -O --osscan-limit -iL livehosts.txt -oX livehosts-OS.xml 
xsltproc livehosts-OS.xml -o livehosts-OS.html
