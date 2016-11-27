#!/bin/bash
#filename=bakcup_sql.sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

###     这里写入的备份需要的各种信息

Path=/var/backup/
user_test=root
passwd_test=xxx
sql_base="cube honor wiki wordpress"

###  结束--这里不应该再做任何修改--结束

if [ ! -x ${Path} ]; then
        mkdir ${Path}
        echo -e "\e[1;31m Folder Not Alive \e[0m"
        exit 1
else
        cd ${Path}
fi

function ntpserver() {
/usr/sbin/ntpdate -u time.windows.com 1>/dev/null 2>&1
}
function runfilename(){
year_month_minute=$(/bin/date +"%Y%m%d")
time_date=$(/bin/date |cut -d\  -f4 |/bin/cut -d\: -f1,2|/usr/bin/tr -d \:)
sqlname=${year_month_minute}_${time_date}
/usr/bin/mysqldump -u${user_test} -p${passwd_test} --databases ${sql_base} > ${Path}${sqlname}.sql 2>/dev/null
}
ntpserver && runfilename &
/bin/echo  -e "\e[1;31m MySQL Backup Completed \e[0m"  && exit 0
