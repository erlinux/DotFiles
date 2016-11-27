#!/bin/bash
#FileName：AuthServiceSTART

#-------
MYSTART="service mysqld restart"
#-------
         
AGA="$MYSTART 1>/dev/null 2>&1"
test_exit() {
if [ $? -eq 0 ];then
        wall successful
		exit 0
else         
        echo fail >/dev/tty
		continue
fi
}
    
#------- 
while [ ! $? -eq 0 ]
#until [ $? -eq 0 ]
do  
	eval $AGA
	test_exit
done
