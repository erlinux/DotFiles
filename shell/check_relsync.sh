#!/bin/bash
check_rslsync(){
/usr/sbin/lsof -i :9452 1>/dev/null
if  [ $? -eq 1 ] ; then
        /usr/local/rslsync --webui.listen 0.0.0.0:9452 &>/dev/null &
        echo "rslsync is starting"
        exit 0
else
        echo "rslsync is running"
        exit 1
fi
}

###if above is ok , run it.
check_rslsync