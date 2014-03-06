#!/usr/bin/env bash

echo "+------------------------------------+"
echo "|          PXE SETUP WIZARD          |"
echo "+------------------------------------+"

cd $(dirname "$0") 
. ./config.sh

DEF_IP=$(ip addr list eth0 | grep "inet " | cut -d' ' -f6 | cut -d/ -f1)
echo "TFTP Server IP address: [$DEF_IP]"
read IP
[ -z "$IP" ] && IP=$DEF_IP

cd ../conf
BLD_PATH=$(pwd)
for FILE in $(ls src/)
do
	cat $BLD_PATH/src/$FILE | sed -s 's/{ip}/'$IP'/g' > $BLD_PATH/available/$FILE
done

cd ../scripts
. ./enable-all.sh

DOWNLOAD=""
echo "Do you want to run scripts? [N/y]"
read DOWNLOAD

[ ! -z "$DOWNLOAD" ] && {
	for SCRIPT in $(find $SCRIPT_PATH -executable -type f | sort)
	do
		$SCRIPT
	done
}
