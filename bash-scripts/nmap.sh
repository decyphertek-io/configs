#!/bin/sh

# IP variable
echo -n " What is the IP or CIDR ?  "
read -r IP

# General Nmap Scan
sudo nmap -sT -sV -sC -O -R $IP -oX general-scan.xml

# Windows - SMB
sudo nmap -sS -p 139,45 --script smb-os-discovery $IP -oX smb-discovery.xml

# Switches - SNMP
sudo nmap -sU -p 161 --script snmp-info $IP -oX snmp-info.xml

# Firewall Bypass
sudo nmap --script firewall-bypass $IP -oX firewall-bypass.xml

# Vulnerability Scan
sudo nmap --script vuln $IP -oX vuln-info.xml

# merge 1 xml
xmlstarlet sel -t -c "//node()"  smb-discovery.xml snmp-info.xml > nmap-merge-01.xml

# merge 2 xml
xmlstarlet sel -t -c "//node()"  firewall-bypass.xml vuln-info.xml > nmap-merge-02.xml

# Merge the merge
xmlstarlet sel -t -c "//node()" nmap-merge-01.xml nmap-merge-02.xml > nmap-merged.xml

# Final merge
xmlstarlet sel -t -c "//node()"  nmap-merged.xml general-scan.xml > nmap-merged-results.xml

# Convert to html 
xsltproc nmap-merged-results.xml -o nmap-merged-results.html

# View the results in the terminal
lynx nmap-merged-results.thml