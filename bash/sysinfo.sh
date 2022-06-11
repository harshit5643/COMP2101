#!/bin/bash

#Output with blankline
echo "========================="

#Using cat command with embedded variables
cat sysinfo.sh | echo '{print$2}'

#displaying the hostname and router information in separate line
cat /proc/sys/kernel/hostname
hostname --fqdn

#displaying operating system name and version 
lsb_release -d

#displaying the IP address
ip route | grep default

#displaying the root storage information
df -h /

echo "=========================="
