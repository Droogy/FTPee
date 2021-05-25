#!/bin/bash

#below is our host, the initial ftp server that we wanna access, when you run this script how i have it it will NOT work.

#you need to replace our HOST= with the ip/ftp server that you're trying to access


HOST='10.10.163.213'


echo thank you for entering the host.

USER='Anonymous'

time sleep 2

echo thank you for entering your user.

PASSWD='Anonymous'

time sleep 2

echo thank you for entering your password.

ftp -n -v $HOST << EOT

ascii


ls -al



#now we are going to list all of the names of directorys/files that we want.

get note

get flag.txt

get user.txt

get note.txt

get root.txt

get root

get user


get flag


#then we exit our server because there is nothing else we need.

bye

echo  bye thank's for using ftpee!

time sleep 2


EOT

