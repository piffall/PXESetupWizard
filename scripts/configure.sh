#!/usr/bin/env bash

echo "Please Enter the TFTP Server IP address:"
read IP
cd $(dirname "$0")
cd ../conf
BLD_PATH=$(pwd)
for FILE in $(ls src/)
do
	cat $BLD_PATH/src/$FILE | sed -s 's/{ip}/'$IP'/g' > $BLD_PATH/$FILE
done
