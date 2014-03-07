#!/usr/bin/env bash

# Changing to working directory
cd $(dirname "$0")
. ../config.sh

# Temp paths and files
export SRC_PKG="http://sourceforge.net/projects/rescatux.berlios/files/rescatux_cdrom_usb_hybrid_i386_amd64-486_0.30_sg2d.iso/download"
export TRG_NME="rescatux"
export TRG_PKG=$TRG_NME".iso"

# Download and deploy it
. ./common/download.sh
echo "Mounting "$TMP/$TRG_NME
[ ! -d $TMP/$TRG_NME ] && mkdir $TMP/$TRG_NME -p
mount -t iso9660 -o loop $TMP/$TRG_PKG $TMP/$TRG_NME 

TRG_PATH=$TFTP_PATH/boot/$TRG_NME
[ ! -d $TRG_PATH ] && mkdir $TRG_PATH -p
rsync -avP $TMP/$TRG_NME/ $TFTP_PATH/boot/$TRG_NME --delete-after
umount $TMP/$TRG_NME

. ./common/clean.sh
