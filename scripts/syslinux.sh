#!/bin/bash

# Changing to working directory
cd $(dirname "$0")

# Temp paths and files
SCRIPT_PATH=$(pwd)
TFTP_PATH=$(dirname "$SCRIPT_PATH")
TMP="/tmp/"$(date +"%Y%m%d%H%I%s%N" | md5sum | awk '{print $1}')
SRC_PKG="http://ftp.us.debian.org/debian/pool/main/s/syslinux/syslinux-common_4.05+dfsg-6+deb8u1_all.deb"
TRG_NME="syslinux"
TRG_PKG=$TRG_NME".deb"

# Create tmp path
mkdir $TMP

# Download syslinux and deploy it
wget $SRC_PKG -O $TMP/$TRG_PKG
dpkg-deb --extract $TMP/$TRG_PKG $TMP/$TRG_NME
rsync -azP --exclude=".*" $TMP/$TRG_NME/usr/lib/syslinux/ $TFTP_PATH/$TRG_NME --delete-after

# Remove existing symlinks
[ -L $TFTP_PATH/pxelinux.0 ] && rm $TFTP_PATH/pxelinux.0
[ -L $TFTP_PATH/pxelinux ] && rm $TFTP_PATH/pxelinux

# Creating new ones
ln -s $TFTP_PATH/$TRG_NME/pxelinux.0 $TFTP_PATH/pxelinux.0
ln -s $TFTP_PATH/pxelinux.0 $TFTP_PATH/pxelinux

# Remove tmp path
rm -rf $TMP
