#!/bin/bash
PID=$(ps -ef |grep /etc/shadowsocks.json | awk '{print $2 }' | head -n1)
netstat -antlp |grep 50011 1>/dev/null 2>&1
if [ $? -eq 0 ] ; then
	echo "PID:$PID Shadowsocks was running"
else
	setsid ssserver -c /etc/shadowsocks.json &
fi
