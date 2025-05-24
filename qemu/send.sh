#!/bin/sh

cp ../libarmalloc.so ./share
cp ../test ./share
scp -r -P 5555 ./share/. root@localhost:/root

# SETUP:
# sed -i 's/^root:[^:]*:/root::/' /etc/shadow 
# dhclient eth0
# apt update && apt install gdb
