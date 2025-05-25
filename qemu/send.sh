#!/bin/sh

cp ../libarmalloc.so ./share
cp ../test ./share
scp -r -P 5555 ./share/. root@localhost:/root

# SETUP:
# sed -i 's/^root:[^:]*:/root::/' /etc/shadow 
# dhclient eth0
# sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
# apt update && apt full-upgrade
# DONT FORGET TO UPDATE QEMU's vmlinux / initrd
# reboot
# apt install gdb
