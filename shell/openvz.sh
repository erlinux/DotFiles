#!/bin/bash
#this shell can setup openvz    author:rabbit@nima.hk
echo -e "\e[1;34m check system is centos or not..\e[0m"
rpm -qa |grep release > /tmp/release.tmp &> /dev/snll
if [ -r /tmp/release.tmp ] ; then
        cut -n /tmp/release.tmp -c -16 > /tmp/release2.tmp
else
        echo -e "\e[1;31m your system isn't centos\e[0m" && rm -rf /tmp/release.tmp /tmp/release2.tmp
fi
##
cat /tmp/release2.tmp
if [ -r /tmp/release2.tmp ] ; then
        grep centos-release-6 /tmp/release2.tmp &> /dev/null
fi
if  [ $? -eq 1 ] ;then
        echo -e "\e[1;32m system confirm , next setup RPM \e[0m"
else
        echo -e "\e[1;31m check error setup down \e[0m" ; rm -rf /tmp/release2.tmp
fi
## up was confirm system , next is impossable
rpm -qa |grep wget &> /dev/null
if [ $? -eq 1 ] ; then 
	echo -e "\e[1;31m centos not setup wget ,setup now \e[0m" && yum install -y wget
else
	echo -e "\e[1;32m download openvz rpm now\e[0m"
fi
echo -e "\e[1;32m repo download... \e[0m"
wget http://download.openvz.org/openvz.repo -O /etc/yum.repos.d/openvz.repo &> /dev/null
echo -e "\e[1;32m REPO DWONLOAD! \e[0m"
echo -e "\e[1;32m rpm download... \e[0m"
cd /tmp ; rpm -ivh http://download.openvz.org/kernel/branches/rhel6-2.6.32/042stab106.4/vzkernel-2.6.32-042stab106.4.i686.rpm &> /dev/null
echo -e "\e[1;32m RPM DOWNLOAD! \e[0m"
echo -e "\e[1;34m Setup openvz............\e[0m"
if [ -x /vz/template/cache ] ; then
cd /vz/template/cache && wget http://download.openvz.org/template/precreated/centos-6-x86.tar.gz 2> /dev/null
else
mkdir -p /vz/template/cache && wget http://download.openvz.org/template/precreated/centos-6-x86.tar.gz 2> /dev/null
fi
yum install -y ploop && yum install -y vzkernel 1> /dev/null
yum install -y vzctl vzquota 1> /dev/null
rpm -qa |grep ploop vzkernel vzctl vzquota &> /dev/null
if  [ $? -eq 0 ] ; then
        echo -e "\e[1;31m error..............\e[0m"
else
		wget -N http://files.virtualizor.com/install.sh  && chmod 0755 install.sh && ./install.sh email=1006990314@qq.com
        echo -e "\e[1;34m setup over system reboot 15s \e[0m" && sleep 15s && reboot
exit
fi
