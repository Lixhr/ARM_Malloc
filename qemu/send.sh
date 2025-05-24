#!/bin/sh

cp ../libarmalloc.so ./share
cp ../test ./share
scp -r -P 2221 ./share/. root@localhost:/root

# SETUP:
# sed -i 's/^root:[^:]*:/root::/' /etc/shadow 
# echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# apk update
# apk add gcompat gdb
