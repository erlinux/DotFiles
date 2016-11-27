#!/bin/bash 
#filename=bakcup_sql.sh 

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin 
export PATH 

###     ����д��ı�����Ҫ�ĸ�����Ϣ 
Path=/var/backup/ 

Math_num=5

###  ����--���ﲻӦ�������κ��޸�--����

if [ ! -x ${Path} ]; then
	mkdir ${Path}
	echo -e "\e[1;31m Folder Not Alive \e[0m"
	exit 1
else
	cd ${Path}
fi

function list_rm() {
bc_num="$(echo ${Math_num} +1 | bc)"
file_list="$(/bin/ls -t ${Path} | sort -u | xargs | cut -d\  -f${bc_num})"
#bad#grep_file=/bin/ls ${Path} | grep -v ${file_list}
file_num=$(ls -l |wc -l)

if [ ${file_num} -lt ${bc_num} ] ; then
	rm -rf ${file_list}
else
	exit 1
fi
}

# if they were ok , run it
list_rm && exit 0
