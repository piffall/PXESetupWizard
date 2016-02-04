#!/usr/bin/env bash

# ...
echo "+------------------------------------+"
echo "|          PXE SETUP WIZARD          |"
echo "+------------------------------------+"
echo ""

cd $(dirname "$0") 
export TFTP_PATH=$(pwd)
export SCRIPT_PATH=$TFTP_PATH/scripts/exec

# Parse IPs, set default and calc length
IPS=($(ip addr | grep 'inet ' | cut -d' ' -f6 | cut -d '/' -f1))
DEF_IP_INDEX=1
IPS_LEN=${#IPS[*]}

# Header of IP choice 
echo "Select an IP address to bind TFTP service"
echo "-----------------------------------------"
echo ""

for (( i=0; i<=$(( $IPS_LEN -1 )); i++ ))
do
    if [ $i -eq $DEF_IP_INDEX ]; then
        echo -n " * "
    else
        echo -n "   "
    fi
    echo "$i. ${IPS[$i]}"
done

# Ask user to choose one of the IP addresses
echo ""
echo -n "Press enter to keep the current choice[*], or type selection number: "
read IP_INDEX

if [ "x$IP_INDEX" == "x" ]; then
    IP=${IPS[$DEF_IP_INDEX]}
else
    IP=${IPS[$IP_INDEX]}
fi

# Inject IP address
cd conf
BLD_PATH=$(pwd)
for FILE in $(ls src/)
do
    cat $BLD_PATH/src/$FILE | sed -s 's/{ip}/'$IP'/g' > $BLD_PATH/available/$FILE
done

# Create all symlinks
. $TFTP_PATH/scripts/enable-all.sh

# Ask to run scripts
DOWNLOAD="y"
echo -n "Do you want to run scripts? [Y/n]: "
read DOWNLOAD
DOWNLOAD=$(echo $DOWNLOAD | tr '[:upper:]' '[:lower:]')
echo ""

# Enter path and run each installation script
cd $TFTP_PATH
if [ "$DOWNLOAD" = "y" ]; then
    for SCRIPT in $(find $SCRIPT_PATH -executable -type f | sort)
    do
        echo -e "\x1b[30;01m""Running script "$SCRIPT"\x1b[39;49;00m"
        $SCRIPT
    done
fi

# Fix bad vesamenu files
. ./fix_vesamenu.sh
