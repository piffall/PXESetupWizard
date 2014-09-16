#!/usr/bin/env bash

echo "+------------------------------------+"
echo "|          PXE SETUP WIZARD          |"
echo "+------------------------------------+"

cd $(dirname "$0") 
export TFTP_PATH=$(pwd)
export SCRIPT_PATH=$TFTP_PATH/scripts/exec

DEF_IP=$(ip addr list eth0 | grep "inet " | cut -d' ' -f6 | cut -d/ -f1)
echo "TFTP Server IP address: [$DEF_IP]"
read IP
[ -z "$IP" ] && IP=$DEF_IP

cd conf
BLD_PATH=$(pwd)
for FILE in $(ls src/)
do
	cat $BLD_PATH/src/$FILE | sed -s 's/{ip}/'$IP'/g' > $BLD_PATH/available/$FILE
done

. $TFTP_PATH/scripts/enable-all.sh

DOWNLOAD="N"
echo "Do you want to run scripts? [N/y]"
read DOWNLOAD
DOWNLOAD=$(echo $DOWNLOAD | tr '[:upper:]' '[:lower:]')

cd $TFTP_PATH
if [ "$DOWNLOAD" = "y" ]; then
	for SCRIPT in $(find $SCRIPT_PATH -executable -type f | grep -v "sudo" | sort)
	do
		echo -e "\x1b[30;01m""Running script "$SCRIPT"\x1b[39;49;00m"
		$SCRIPT
	done
	for SCRIPT in $(find $SCRIPT_PATH -executable -type f | grep "sudo" | sort)
	do
		echo -e "\x1b[31;01m""Running script "$SCRIPT "as root \x1b[39;49;00m"
		sudo $SCRIPT
	done
fi
