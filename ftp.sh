#!/bin/bash

###########################
#                         #
# Discord: Evann2007      #
#                         #
#                         # 
# FTPee - a Hacking Tool  #
#                         #
#                         #
###########################

#below is our host, the initial ftp server that we wanna access, when you run this script how i have it it will NOT work.

#you need to replace our HOST= with the ip/ftp server that you're trying to access

# host is our first command line argument to create dynamic variable
# e.g. "./FTPee 10.10.10.10."

HOST=$1
USER='Anonymous'
PASS=' '
# store output of netcat banner grab in a variable
banner=$(echo "quit" | nc -v ${HOST} 21 2>&1)
echo "[*] Grabbing FTP banner"

# check for 220 FTP response code in our banner
if [[ "$banner" == *"220"* ]]; then
    echo "[*] FTP Banner was found, grabbing files"
    ftp -v -n >> /tmp/ftp.log << EOF
    open $HOST
    user $USER $PASS
    binary
    mget *
    quit
EOF
else
    echo "[X] No FTP Server running on port 21 for $HOST"
fi

echo 'Bye thanks for using FTPee!'

