#!/bin/bash -x
ip=muji.iterlinux.com
#mail=1006990314@qq.com
#mail=15901939343@139.com
##
nc -w 10 -z $ip 21 &>/ dev/null
if [ $? -eq 0 ]
	then
		echo ok
	else
		read -p "Enter mail head:" head
		read -p "Enter mail body:" body
		read -p "Enter mail file:" file
		echo $body | mail -s $head -a $file $mail
		echo Send Mail
fi
