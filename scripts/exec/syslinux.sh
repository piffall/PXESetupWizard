#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
source ../config.sh

# Temp paths and files
export SRC_PKG="http://ftp.us.debian.org/debian/pool/main/s/syslinux/syslinux-common_4.05+dfsg-6+deb7u1_all.deb"
export TRG_NME="syslinux"
export TRG_PKG=$TRG_NME".deb"

# Download syslinux and deploy it
. ./common/download.sh
dpkg-deb --extract $TMP/$TRG_PKG $TMP/$TRG_NME
rsync -azP --exclude=".*" $TMP/$TRG_NME/usr/lib/syslinux/ $TFTP_PATH/$TRG_NME --delete-after

# Remove existing symlinks
[ -L $TFTP_PATH/pxelinux.0 ] && rm $TFTP_PATH/pxelinux.0
[ -L $TFTP_PATH/pxelinux ] && rm $TFTP_PATH/pxelinux

# Creating new ones
ln -s $TFTP_PATH/$TRG_NME/pxelinux.0 $TFTP_PATH/pxelinux.0
ln -s $TFTP_PATH/pxelinux.0 $TFTP_PATH/pxelinux

. ./common/clean.sh
