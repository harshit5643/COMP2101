#!/bin/bash

#Lab3.sh

#Stop ubuntu using lxc container
lxc stop ubuntu

#lxc container launching ubuntu
lxc launch ubuntu:20.04 COMP2101-S22
lxc exec COMP2101-S22 bash

#Show list
lxc show list
lxc list

#Adding port 80  and connecting tcp  
sudo lxc config device add COMP2101-S22 myport80 proxy listen=tcp:0.0.0.0:80 connect=tcp:127.0.0.1:80
curl http://127.0.0.1:80

#Using curl connecting apache server and stop lxc container
curl http://127.0.0.1:80 && echo "success" || echo "failed to connect apache"
lxc stop COMP2101-S22

#Starting lxc container and lauch apache server
curl http://127.0.0.1:80 && echo "success" || echo "failed to connect apache"
lxc start COMP2101-S22

#Launching lxc container to  get output
curl http://127.0.0.1:80 && echo "success" || echo "failed to connect apache"
lxc launch COMP2101-S22

#Starting lxc container
sudo lxc-start COMP2101-S22
lxc list

#Checking the command for output
curl http://127.0.0.1:80 && echo "success" || echo "failed to connect apache"
